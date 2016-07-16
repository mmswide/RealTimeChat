//
// Copyright (c) 2015 Related Code - http://relatedcode.com
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "LoginFacebookView.h"

@implementation LoginFacebookView

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)viewDidLoad
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[super viewDidLoad];
	self.title = @"Facebook login";
	//---------------------------------------------------------------------------------------------------------------------------------------------
	[self actionFacebook];
}

#pragma mark - Facebook login methods

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)actionFacebook
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	NSArray *permissions = @[@"public_profile", @"email", @"user_friends"];
	[PFFacebookUtils logInInBackgroundWithReadPermissions:permissions block:^(PFUser *user, NSError *error)
	{
		if (user != nil)
		{
			if (user[PF_USER_FACEBOOKID] != nil)
			{
				[self userLoggedIn:user];
			}
			else [self requestFacebookUser:user];
		}
		else [self.navigationController popViewControllerAnimated:YES];
	}];
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)requestFacebookUser:(PFUser *)user
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[ProgressHUD show:@"Signing in..." Interaction:NO];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"id, name, email"}];
	[request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error)
	{
		if (error == nil)
		{
			[self requestFacebookPicture:user Result:result];
		}
		else [self loginFailed:@"Failed to fetch Facebook user data."];
	}];
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)requestFacebookPicture:(PFUser *)user Result:(NSDictionary *)result
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	NSString *link = [NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large", result[@"id"]];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	SDWebImageManager *manager = [SDWebImageManager sharedManager];
	[manager downloadImageWithURL:[NSURL URLWithString:link] options:0 progress:nil
	completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL)
	{
		if (image != nil)
		{
			[self saveFacebookPicture:user Result:result Image:image];
		}
		else [self loginFailed:@"Failed to fetch Facebook profile picture."];
	}];
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)saveFacebookPicture:(PFUser *)user Result:(NSDictionary *)result Image:(UIImage *)image
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	UIImage *picture = ResizeImage(image, 140, 140, 1);
	UIImage *thumbnail = ResizeImage(image, 60, 60, 1);
	//---------------------------------------------------------------------------------------------------------------------------------------------
	PFFile *fileThumbnail = [PFFile fileWithName:@"thumbnail.jpg" data:UIImageJPEGRepresentation(thumbnail, 0.6)];
	[fileThumbnail saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
	{
		if (error == nil)
		{
			PFFile *filePicture = [PFFile fileWithName:@"picture.jpg" data:UIImageJPEGRepresentation(picture, 0.6)];
			[filePicture saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
			{
				if (error == nil)
				{
					[self saveFacebookUser:user Result:result Picture:filePicture.url Thumbnail:fileThumbnail.url];
				}
				else [self loginFailed:@"Failed to save profile picture."];
			}];
		}
		else [self loginFailed:@"Failed to save profile thumbnail."];
	}];
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)saveFacebookUser:(PFUser *)user Result:(NSDictionary *)result Picture:(NSString *)pictureUrl Thumbnail:(NSString *)thumbnailUrl
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	user[PF_USER_FACEBOOKID] = result[@"id"];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	if (result[@"email"] != nil) user[PF_USER_EMAILCOPY] = result[@"email"];
	if (result[@"name"] != nil) user[PF_USER_FULLNAME] = result[@"name"];
	if (result[@"name"] != nil) user[PF_USER_FULLNAMELOWER] = [result[@"name"] lowercaseString];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	user[PF_USER_PICTURE] = pictureUrl;
	user[PF_USER_THUMBNAIL] = thumbnailUrl;
	[user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
	{
		if (error == nil)
		{
			[self userLoggedIn:user];
		}
		else [self loginFailed:@"Failed to save user data."];
	}];
}

#pragma mark - Helper methods

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)loginFailed:(NSString *)message
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[PFUser logOut];
	[ProgressHUD showError:message];
	[self.navigationController popViewControllerAnimated:YES];
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)userLoggedIn:(PFUser *)user
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	ParsePushUserAssign();
	[ProgressHUD showSuccess:[NSString stringWithFormat:@"Welcome %@!", user[PF_USER_FULLNAME]]];
	[self dismissViewControllerAnimated:YES completion:^{
		PostNotification(NOTIFICATION_USER_LOGGED_IN);
	}];
}

@end

