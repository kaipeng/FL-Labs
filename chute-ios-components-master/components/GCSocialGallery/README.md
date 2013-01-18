GCSocialGallery
==============

This class depends on the Chute SDK as well as the GCCommentsView class, the GCCloudGallery class, and the GCShareView class.  You must add each of these to your project for this component to work.

Description
-----------

This class is essentially an expanded version of the GCCloudGallery component.  In addition to allowing you to view a sliding gallery of assets, it allows you to heart/unheart the asset you are viewing, add/view comments for that asset and share it via twitter, facebook, and email.

Screenshots
-----------
![screen1](https://github.com/chute/chute-ios-components/raw/master/components/GCSocialGallery/screenshots/screen1.png)![screen2](https://github.com/chute/chute-ios-components/raw/master/components/GCSocialGallery/screenshots/screen2.png)![screen3](https://github.com/chute/chute-ios-components/raw/master/components/GCSocialGallery/screenshots/screen3.png)![screen4](https://github.com/chute/chute-ios-components/raw/master/components/GCSocialGallery/screenshots/screen4.png)![screen5](https://github.com/chute/chute-ios-components/raw/master/components/GCSocialGallery/screenshots/screen5.png)![screen6](https://github.com/chute/chute-ios-components/raw/master/components/GCSocialGallery/screenshots/screen6.png)![screen7](https://github.com/chute/chute-ios-components/raw/master/components/GCSocialGallery/screenshots/screen7.png)

Subclassing
-----------

When subclassing this class there are some considerations to keep in mind.  To modify the appearance of the share views and the comment view you may want to subclass those components as well.  If you do then you need to overwrite the showShareView and showCommentView methods to initialize your custom class instead of the default classes.  You may also want to overwrite the hideCommentsView method to have custom behavior when going back to the gallery from the comments view.  Hiding the share view happens from within that class so custom behavior would need to be handled there.  You could add a delegate or callback to that class to allow custom behavior in this class when returning from the share view.  Another thing to consider is the default behavior is for heartedButton to be selected when the current asset is hearted and unselected when it's not hearted.  So you should create a separate look for the default and selected view of this button if you want to have hearting in your app and have it clear which assets are hearted with this class's default behavior.

Initialization
--------------

*   objects - NSArray of GCAssets - The GCAssets that the gallery will display.
*	chute - GCChute - The GCChute that the assets belong to.

Implementation
--------------

loading it with assets from a chute.

```objective-c
    GCSocialGallery *temp = [[GCSocialGallery alloc] init];
    GCChute *chute = [[GCChute findById:@"59"] object];
	[[[GCChute findById:@"59"] object] assetsInBackgroundWithCompletion:^(GCResponse *response){
        if([response isSuccessful]){
            NSArray *assets = [response object];
    		[temp setChute:chute];
            [temp setObjects:assets];
        	[self presentModalViewController:temp animated:YES];
        	[temp release];
		}
    }];
```
