//
//  GCGalleryListing.h
//  ChuteSDKDevProject
//
//  Created by Brandon Coston on 10/26/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetChute.h"

@interface GCGalleryListing : GCUIBaseViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, readonly) IBOutlet UITableView *chutesTable;
@property (nonatomic, retain) NSArray *chutes;
@property (nonatomic) int cellHeight;

-(void)chuteSelected:(GCChute*)chute;

@end
