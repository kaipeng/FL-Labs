GCGalleryListing
================

This class only depends on the Chute SDK and the SDWebImage class which is included with the SDK.

Description
------------

This class displays a list of chutes in a table view.  It provides methods to perform an action when a chute is tapped and to customize how the chute at an indexPath in the tableview is displayed.

Screenshots
-----------
![screen1](https://github.com/chute/chute-ios-components/raw/master/components/GCGalleryListing/screenshots/screen1.png)

Subclassing
------------

When subclass you will likely want to override the `viewForIndexPath:` method and the `chuteSelected:` method.  `viewForIndexPath:` is used to adjust how each chute is displayed.  You can leave it unmodified if you just want the name of the chute and a thumbnail or you can ovverride it for a custom UI.  The `chuteSelected:` method is there to perform an action when the user selects a chute.  By default this only displays an NSLog message saying what chute was selected.  You need to override this to perform whatever action you'd like when a chute is selected.

Initialization
---------------

* cellHeight (optional) - int - The height of each row in the table.
* chutes - NSArray - The array of GCChute objects

Implementation
---------------

```objective-c
    GCGalleryListing *temp = [[GCGalleryListing alloc] init];
    [GCChute allInBackgroundWithCompletion:^(GCResponse *response){
        if([response isSuccessful]){
            NSArray *chutes = [response object];
            [temp setChutes:chutes];
            [temp setCellHeight:45];
        }
        [self presentModalViewController:temp animated:YES];
        [temp release];
    }];
```