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

#import "WelcomeView.h"
#import "LoginPhoneView1.h"
#import "LoginTwitterView.h"
#import "LoginFacebookView.h"
#import "LoginEmailView.h"
#import "RegisterEmailView.h"

@implementation WelcomeView

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)viewDidLoad
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[super viewDidLoad];
	self.title = @"Welcome";
	//---------------------------------------------------------------------------------------------------------------------------------------------
	UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:nil action:nil];
	[self.navigationItem setBackBarButtonItem:backButton];
}

#pragma mark - User actions

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (IBAction)actionLoginPhone:(id)sender
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	ActionPremium(self);
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (IBAction)actionLoginTwitter:(id)sender
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	LoginTwitterView *loginTwitterView = [[LoginTwitterView alloc] init];
	[self.navigationController pushViewController:loginTwitterView animated:YES];
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (IBAction)actionLoginFacebook:(id)sender
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	LoginFacebookView *loginFacebookView = [[LoginFacebookView alloc] init];
	[self.navigationController pushViewController:loginFacebookView animated:YES];
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (IBAction)actionLoginEmail:(id)sender
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	LoginEmailView *loginEmailView = [[LoginEmailView alloc] init];
	[self.navigationController pushViewController:loginEmailView animated:YES];
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (IBAction)actionRegisterEmail:(id)sender
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	RegisterEmailView *registerEmailView = [[RegisterEmailView alloc] init];
	[self.navigationController pushViewController:registerEmailView animated:YES];
}

@end

