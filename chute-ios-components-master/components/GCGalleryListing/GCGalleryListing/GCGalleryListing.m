//
//  GCGalleryListing.m
//  ChuteSDKDevProject
//
//  Created by Brandon Coston on 10/26/11.
//  Copyright (c) 2011 Chute Corporation. All rights reserved.
//

#import "GCGalleryListing.h"
#import "UIImageView+WebCache.h"

@implementation GCGalleryListing
@synthesize chutes, chutesTable, cellHeight;

-(void)chuteSelected:(GCChute *)chute{
    NSLog(@"%@ was selected",[chute name]);
}

-(void)reloadWithArray:(NSArray*)_chutes{
    [self setChutes:_chutes];
    [chutesTable reloadData];
}

-(id)init{
    self = [super init];
    if (self) {
        self.cellHeight = -1;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.cellHeight = -1;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - Table View Data Source and Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if(![self chutes])
        return 0;
    return [[self chutes] count];
}

- (UIView*) viewForIndexPath:(NSIndexPath*)indexPath{
    GCChute *chute = [self.chutes objectAtIndex:indexPath.row];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(2, 2, chutesTable.frame.size.width-4, [self tableView:chutesTable heightForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]]-4)];
    [v setClipsToBounds:YES];
    [v setBackgroundColor:[UIColor whiteColor]];
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, v.frame.size.height-4, v.frame.size.height-4)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(iv.frame.size.width+7, 0, v.frame.size.width-iv.frame.size.width-11, v.frame.size.height)];
    [label setNumberOfLines:3];
    [label setFont:[UIFont systemFontOfSize:15]];
    NSString *thumbString = [chute recentThumbnailUrl];
    NSLog(@"%@",chute);
    if(thumbString && thumbString.length > 0){
        if(![[[thumbString componentsSeparatedByString:@"/"] lastObject] isEqualToString:@"100x100"])
            thumbString = [thumbString stringByAppendingString:@"/100x100"];
    }
    NSLog(@"%@",thumbString);
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        [iv setImageWithURL:[NSURL URLWithString:thumbString]];
        [label setText:[chute name]];
        [v addSubview:label];
        [v addSubview:iv];
        [iv release];
        [label release];
    });
    return [v autorelease];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    for(UIView *v in cell.contentView.subviews){
        [v removeFromSuperview];
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^(void) {
        UIView *v = [self viewForIndexPath:indexPath];
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            [cell.contentView addSubview:v];
        });
    });
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.cellHeight > 0)
        return self.cellHeight;
	return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    GCChute *chute = [chutes objectAtIndex:indexPath.row];
    [self chuteSelected:chute];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void)dealloc{
    [chutes release];
    [super dealloc];
}

@end