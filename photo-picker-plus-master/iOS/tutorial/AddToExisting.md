Adding Photo Picker+ To A Project
=================================

Photo Picker Plus is a drop-in component that replaces the default photo picker in your app.  It allows you to take a photo as well as choose a photo from the device or from several online sources.  This tutorial will show you how to replace the default UIImagePicker in your application with Photo Picker Plus.  This tutorial was written using version 5.0 of the iOS SDK and version 4.2 of Xcode.  Uses Chute SDK version 1.0.4 or newer (the version number can be found in the GCConstants.h file).  Some changes may need to be made for other software versions.

![image1](https://github.com/chute/photo-picker-plus/raw/master/iOS/tutorial/screenshots/1.png)
![image2](https://github.com/chute/photo-picker-plus/raw/master/iOS/tutorial/screenshots/2.png)
![image3](https://github.com/chute/photo-picker-plus/raw/master/iOS/tutorial/screenshots/3.png)

Preparation
-----------
1.  Download the PhotoPickerPlus component and Chute SDK from https://github.com/chute/photo-picker-plus/tree/master/iOS/PhotoPickerPlus
2.  If you don't have a Chute developer account or an app created on chute for this project then create a Chute developer account and make a new app in Chute at http://apps.getchute.com/
	*  For the URL you can enter http://getchute.com/ if you don't have a site for your app
	*  For the Callback URL you can use http://getchute.com/oauth/callback if you don't need callbacks for another purpose.

![image5](https://github.com/chute/photo-picker-plus/raw/master/iOS/tutorial/screenshots/5.png)
![image6](https://github.com/chute/photo-picker-plus/raw/master/iOS/tutorial/screenshots/6.png)

Add The SDK And Component And Link Dependancies
-----------------------------------------------
1. Add the Chute SDK to the project
2. Add the Photo Picker Plus component
3. Link the required libraries
     *  AssetsLibrary
     *  CFNetwork
     *  EventKit
     *  libz.dylib
     *  MessageUI
     *  MobileCoreServices
     *  Security
     *  SystemConfiguration

![image7](https://github.com/chute/photo-picker-plus/raw/master/iOS/tutorial/screenshots/7.png)

Edit Your App ID And Secret
---------------------------
The next step is to enter your chute app information in the GCConstants.h file.  This file can be found at the root of the Chute SDK directory.  You will need to fill in your APP ID and APP secret from the summary tab of your admin panel.  If you used a custom Redirect URL when setting up your app on Chute you will also need to adjust the `kOauthCallbackURL` to match the callback url you set.  Then set the `kOauthCallbackRelativeURL` to everything after the base in the callback url.  If you used `http://getchute.com/oauth/callback` then you can leave these as they are.

![image8](https://github.com/chute/photo-picker-plus/raw/master/iOS/tutorial/screenshots/8.png)

At this point you may want to try running the project to make sure that everything is added ok.  If it builds then everything should be correctly added and linked.

Change your delegate
--------------------
In the header for the controller that will be using the component `#import "PhotoPickerPlus.h"` and inherit the `PhotoPickerPlusDelegate` instead of the `UIImagePickerDelegate` protocol.

```objective-c
	#import <UIKit/UIKit.h>
	#import "PhotoPickerPlus.h"

	@interface ViewController : UIViewController <PhotoPickerPlusDelegate>
	
	//existing code for your class

	@end
```

Change The Delegate Methods
---------------------------
In your class change `imagePickerControllerDidCancel:` to `PhotoPickerPlusControllerDidCancel:` and change `imagePickerController:didFinishPickingMediaWithInfo:` to `PhotoPickerPlusController:didFinishPickingMediaWithInfo:`.  You can leave the code in these methods exactly the same as you had before because the return values are the same format.  If you need to know which source the info came from you can call `sourceType` on the picker.

```objective-c
	-(void) PhotoPickerPlusControllerDidCancel:(PhotoPickerPlus *)picker{
	    //cancel code
	}
	-(void) PhotoPickerPlusController:(PhotoPickerPlus *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
	    //image picked code
	}
```

Displaying The Image Picker
---------------------------
Finally replace the code to display the image picker.  Photo Picker Plus lets the user select a source for the image so you don't need to set it ahead of time.  You should also set the picker's `ModalPresentationStyle` to Whatever display format you would like.  I'm setting it to `UIModalPresentationCurrentContext` in this example, however you may want to present it different depending on your needs (especially in an iPad app).

```objective-c
	PhotoPickerPlus *temp = [[PhotoPickerPlus alloc] init];
	[temp setDelegate:self];
	[temp setModalPresentationStyle:UIModalPresentationCurrentContext];
	[self presentViewController:temp animated:YES completion:^(void){
	    [temp release];
	}];
```

Conclusion
----------
You now have a multi-service photo picker in your app instead of Apple's UIImagePickerController.  Most of your existing code for the imagePicker should still work because the info dictionary returned is designed to match the info dictionary returned by the UIImagePicker.