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

//-------------------------------------------------------------------------------------------------------------------------------------------------
#define		HEXCOLOR(c) [UIColor colorWithRed:((c>>24)&0xFF)/255.0 green:((c>>16)&0xFF)/255.0 blue:((c>>8)&0xFF)/255.0 alpha:((c)&0xFF)/255.0]

//-------------------------------------------------------------------------------------------------------------------------------------------------
#define		NSERROR(text, number)				[NSError errorWithDomain:text code:number userInfo:nil]

//-------------------------------------------------------------------------------------------------------------------------------------------------
//#define		VERSION_PREMIUM

//-------------------------------------------------------------------------------------------------------------------------------------------------
#define		FIREBASE							@"https://realtime71.firebaseio.com"

#define		PARSE_APPLICATION_ID				@"TvEXnWnPnxDcBMluLQZi7dl94FHTuOBaVR9CzENj"
#define		PARSE_CLIENT_KEY					@"YFq8MlF0PwiAdHgERu7DdOXALSXxy2yruHmyvPLv"

#define		TWITTER_CONSUMER_KEY				@"kS83MvJltZwmfoWVoyE1R6xko"
#define		TWITTER_CONSUMER_SECRET				@"YXSupp9hC2m1rugTfoSyqricST9214TwYapQErBcXlP1BrSfND"

//-------------------------------------------------------------------------------------------------------------------------------------------------
#define		DEFAULT_TAB							0
#define		VIDEO_LENGTH						5
#define		AFDOWNLOAD_TIMEOUT					300
#define		DEFAULT_COUNTRY						84
#define		INSERT_MESSAGES						10

//-------------------------------------------------------------------------------------------------------------------------------------------------
#define		STATUS_LOADING						1
#define		STATUS_FAILED						2
#define		STATUS_SUCCEED						3

//-------------------------------------------------------------------------------------------------------------------------------------------------
#define		COLOR_OUTGOING						HEXCOLOR(0x007AFFFF)
#define		COLOR_INCOMING						HEXCOLOR(0xE6E5EAFF)

//-------------------------------------------------------------------------------------------------------------------------------------------------
#define		TEXT_DELIVERED						@"Delivered"
#define		TEXT_READ							@"Read"

//-------------------------------------------------------------------------------------------------------------------------------------------------
#define		SCREEN_WIDTH						[UIScreen mainScreen].bounds.size.width
#define		SCREEN_HEIGHT						[UIScreen mainScreen].bounds.size.height

//-------------------------------------------------------------------------------------------------------------------------------------------------
#define		LINK_PREMIUM						@"http://www.relatedcode.com/premium"
#define		LINK_PARSE							@"https://files.parsetfss.com"

//-------------------------------------------------------------------------------------------------------------------------------------------------
#define		MESSAGE_INVITE						@"Check out chatexamples.com"

//-------------------------------------------------------------------------------------------------------------------------------------------------
#define		PF_INSTALLATION_CLASS_NAME			@"_Installation"		//	Class name
#define		PF_INSTALLATION_OBJECTID			@"objectId"				//	String
#define		PF_INSTALLATION_USER				@"user"					//	Pointer to User Class
//-----------------------------------------------------------------------
#define		PF_USER_CLASS_NAME					@"_User"				//	Class name
#define		PF_USER_OBJECTID					@"objectId"				//	String
#define		PF_USER_USERNAME					@"username"				//	String
#define		PF_USER_PASSWORD					@"password"				//	String
#define		PF_USER_EMAIL						@"email"				//	String
#define		PF_USER_EMAILCOPY					@"emailCopy"			//	String
#define		PF_USER_FULLNAME					@"fullname"				//	String
#define		PF_USER_FULLNAMELOWER				@"fullnameLower"		//	String
#define		PF_USER_TWITTERID					@"twitterId"			//	String
#define		PF_USER_FACEBOOKID					@"facebookId"			//	String
#define		PF_USER_PHONENUMBER					@"phoneNumber"			//	String
#define		PF_USER_PICTURE						@"picture"				//	String
#define		PF_USER_THUMBNAIL					@"thumbnail"			//	String
#define		PF_USER_LOCATION					@"location"				//	GeoPoint
//-----------------------------------------------------------------------
#define		PF_BLOCKED_CLASS_NAME				@"Blocked"				//	Class name
#define		PF_BLOCKED_USER						@"user"					//	Pointer to User Class
#define		PF_BLOCKED_USER1					@"user1"				//	Pointer to User Class
#define		PF_BLOCKED_USER2					@"user2"				//	Pointer to User Class
#define		PF_BLOCKED_USERID2					@"userId2"				//	String
//-----------------------------------------------------------------------
#define		PF_GROUP_CLASS_NAME					@"Group"				//	Class name
#define		PF_GROUP_USER						@"user"					//	Pointer to User Class
#define		PF_GROUP_NAME						@"name"					//	String
#define		PF_GROUP_MEMBERS					@"members"				//	Array
//-----------------------------------------------------------------------
#define		PF_PEOPLE_CLASS_NAME				@"People"				//	Class name
#define		PF_PEOPLE_USER1						@"user1"				//	Pointer to User Class
#define		PF_PEOPLE_USER2						@"user2"				//	Pointer to User Class
//-----------------------------------------------------------------------
#define		PF_REPORT_CLASS_NAME				@"Report"				//	Class name
#define		PF_REPORT_USER1						@"user1"				//	Pointer to User Class
#define		PF_REPORT_USER2						@"user2"				//	Pointer to User Class
//-------------------------------------------------------------------------------------------------------------------------------------------------
#define		NOTIFICATION_APP_STARTED			@"NCAppStarted"
#define		NOTIFICATION_USER_LOGGED_IN			@"NCUserLoggedIn"
#define		NOTIFICATION_USER_LOGGED_OUT		@"NCUserLoggedOut"

