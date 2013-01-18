/*
 * This file is part of the JTRevealSidebar package.
 * (c) James Tang <mystcolor@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import <UIKit/UIKit.h>


@protocol JTNavigationBarDelegate <NSObject, UINavigationBarDelegate>
@optional
- (void)willPopNavigationItemAnimated:(BOOL)animated;
@end


@interface JTNavigationBar : UINavigationBar

@property (nonatomic, assign) id <JTNavigationBarDelegate> delegate;

@end