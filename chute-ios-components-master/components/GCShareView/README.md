GCShareView
==============

This class depends on the Chute SDK and Apple's messageUI framework.

Description
------------

This class facilitates sharing an object with Facebook, twitter,or via email. You are currently able to share GCAssets, GCChutes, GCParcels, and NSURLs. The default behavior is for the choice dialog to slide up from the bottom when the view appears. Clicking anywhere outside of the dialog results in the view being dismissed by sliding back down off screen. Selecting email brings up a standard email sheet with a preset message and subject that are editable. Selecting twitter or Facebook brings up a web view for sharing to those services with a preset message.

Screenshots
-----------
![screen1](https://github.com/chute/chute-ios-components/raw/master/components/GCShareView/screenshots/screen1.png)![screen2](https://github.com/chute/chute-ios-components/raw/master/components/GCShareView/screenshots/screen2.png)![screen3](https://github.com/chute/chute-ios-components/raw/master/components/GCShareView/screenshots/screen3.png)![screen4](https://github.com/chute/chute-ios-components/raw/master/components/GCShareView/screenshots/screen4.png)

Subclassing
------------

For ease of subclassing this class provides a message function for each type of object and the service it's being shared to.  You should change the text of these functions to whatever default message you would like to use when sharing a particular object.  You only need to overwrite the methods pertaining to the type of object you plan on sharing.  You can also overwrite the show/hide methods if you want custom behavior or animation when showing or hiding any particular view.

Initialization
---------------

* sharedItem - id - This is the object to be shared.  The objects supported by default are GCAsset, GCChute, GCParcel, and NSURL.  Passing in another object type by default will result in no action being taken when a service is selected.

Implementation
---------------

```objective-c
    GCShareView *temp = [[GCShareView alloc] init];
    [self setShareView:temp];
    [temp release];
    GCAsset *asset = [[GCAsset findById:@"1013"] object];
    [self.shareView setSharedItem:asset];
    [self.shareView showView];
```