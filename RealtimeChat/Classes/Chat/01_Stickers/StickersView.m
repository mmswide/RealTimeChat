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

#import "StickersView.h"
#import "StickersCell.h"

//-------------------------------------------------------------------------------------------------------------------------------------------------
@interface StickersView()
{
	NSMutableArray *stickers1;
	NSMutableArray *stickers2;
}

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
//-------------------------------------------------------------------------------------------------------------------------------------------------

@implementation StickersView

@synthesize delegate;

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)viewDidLoad
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[super viewDidLoad];
	self.title = @"Stickers";
	//---------------------------------------------------------------------------------------------------------------------------------------------
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self
																						  action:@selector(actionCancel)];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	[self.collectionView registerNib:[UINib nibWithNibName:@"StickersCell" bundle:nil] forCellWithReuseIdentifier:@"StickersCell"];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	stickers1 = [[NSMutableArray alloc] init];
	stickers2 = [[NSMutableArray alloc] init];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	[self loadStickers];
}

#pragma mark - Load stickers

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)loadStickers
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	for (NSString *file in [[NSFileManager defaultManager] contentsOfDirectoryAtPath:Applications(nil) error:nil])
	{
		if ([file containsString:@"stickerlocal"])	[stickers1 addObject:file];
		if ([file containsString:@"stickersend"])	[stickers2 addObject:file];
	}
}

#pragma mark - User actions

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)actionCancel
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UICollectionViewDataSource

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	return 1;
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	return [stickers1 count];
}

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	StickersCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"StickersCell" forIndexPath:indexPath];
	[cell bindData:stickers1[indexPath.item]];
	return cell;
}

#pragma mark - UICollectionViewDelegate

//-------------------------------------------------------------------------------------------------------------------------------------------------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//-------------------------------------------------------------------------------------------------------------------------------------------------
{
	[collectionView deselectItemAtIndexPath:indexPath animated:YES];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	NSString *file = stickers2[indexPath.item];
	NSString *sticker = [file stringByReplacingOccurrencesOfString:@"@2x.png" withString:@""];
	//---------------------------------------------------------------------------------------------------------------------------------------------
	if (delegate != nil) [delegate didSelectSticker:sticker];
	[self dismissViewControllerAnimated:YES completion:nil];
}

@end

