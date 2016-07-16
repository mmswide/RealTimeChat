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

#import "LoginTwitterView.h"

@implementation LoginTwitterView

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)viewDidLoad
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[super viewDidLoad];
	self.title = @"Twitter login";
	//---------------------------------------------------------------------------------------------------------------------------------------------
	[self actionTwitter];
}

#pragma mark - Twitter login methods

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)actionTwitter
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[ProgressHUD show:@"Signing in..." Interaction:NO];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	[PFTwitterUtils logInWithBlock:^(PFUser *user, NSError *error)
	{
		if (user != nil)
		{
			if (user[PF_USER_TWITTERID] != nil)
			{
				[self userLoggedIn:user];
			}
			else [self processTwitter:user];
		}
		else [self loginCancelled];
	}];
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)processTwitter:(PFUser *)user
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	PF_Twitter *twitter = [PFTwitterUtils twitter];
	user[PF_USER_FULLNAME] = twitter.screenName;
	user[PF_USER_FULLNAMELOWER] = [twitter.screenName lowercaseString];
	user[PF_USER_TWITTERID] = twitter.userId;
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
- (void)loginCancelled
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[ProgressHUD dismiss];
	[self.navigationController popViewControllerAnimated:YES];
}

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

