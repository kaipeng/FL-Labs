GCCommentsView
==============

This class only depends on the Chute SDK and the SDWebImage class which is included with the SDK.

Description
------------

This class allows you to view all the comments posted to an asset in a given chute and add comments to it.

Screenshots
-----------
![screen1](https://github.com/chute/chute-ios-components/raw/master/components/GCCommentsView/screenshots/screen1.png)![screen2](https://github.com/chute/chute-ios-components/raw/master/components/GCCommentsView/screenshots/screen2.png)

Subclassing
------------

The only method that you may want to overwrite if subclassing this component is the viewForCommentAtIndex method.  This method returns the view for a comment in the commentsTable.  If you want some sort of custom behavior when posting comments or loading comments you could also overwrite the postComment or reloadComments methods, however you should call the superclass version of them or copy the functionality to insure that the class works correctly.  It should also be noted that the comment area moves to just above the keyboard when it appears and moves back to it's original position when the keyboard disappears.

Initialization
---------------

* asset - GCAsset - This is the asset that you are viewing comments for and commenting on
* chute - GCChute - The chute the asset is located in.  Since an asset can be in multiple chutes this must be set so that the SDK knows which one the comments are associated with.

Implementation
---------------

```objective-c
    GCChute *chute = [[GCChute findById:@"59"] object];
	[chute assetsInBackgroundWithCompletion:^(GCResponse *response){
        if([response isSuccessful]){
            GCCommentsView *temp = [[GCCommentsView alloc] init];
            GCAsset *asset = [[response object] objectAtIndex:0];
            [temp setAsset:asset];
            [temp setChute:chute];
            [temp setAsset:asset];
            [self presentModalViewController:temp animated:YES];
    		[temp release];
        }
    }];
```