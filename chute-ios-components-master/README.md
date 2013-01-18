Components
==========
These are add on components to the chute SDK.  They are designed to be able to be dropped in to perform specific common tasks.  They are also written to be highly customizable so they can suit the needs of most developers.

GCCloudGallery
--------------
This class allows for a gallery style view of a collection of GCAssets. You can swipe back and forth to access the assets in order. It also provides methods to jump to specific assets in the gallery and can switch to them in an animated (sliding to them) or inanimate (reloads at the new position) manner.

![screen1](https://github.com/chute/chute-ios-components/raw/master/components/GCCloudGallery/screenshots/screen1.png)![screen2](https://github.com/chute/chute-ios-components/raw/master/components/GCCloudGallery/screenshots/screen2.png)

GCCommentsView
--------------
This class allows you to view all the comments posted to an asset in a given chute and add comments to it.  It has a table view for the comments at the top and an area at the bottom for entering new comments.  When the keyboard appears the comment area slides to just above the keyboard.

![screen1](https://github.com/chute/chute-ios-components/raw/master/components/GCCommentsView/screenshots/screen1.png)![screen2](https://github.com/chute/chute-ios-components/raw/master/components/GCCommentsView/screenshots/screen2.png)

GCGalleryListing
--------------
This class displays a list of chutes in a table view.  It provides methods to perform an action when a chute is tapped and to customize how the chute at an indexPath in the tableview is displayed.

![screen1](https://github.com/chute/chute-ios-components/raw/master/components/GCGalleryListing/screenshots/screen1.png)

GCImageGrid
-----------
This class displays a wall of thumbnail images. The size and spacing of the thumbnails is adjustable. The class provides a method to perform an action when an asset is tapped.  The default behavior for this method is to display the asset full screen.

![screen1](https://github.com/chute/chute-ios-components/raw/master/components/GCImageGrid/screenshots/screen1.png)![screen2](https://github.com/chute/chute-ios-components/raw/master/components/GCImageGrid/screenshots/screen2.png)![screen3](https://github.com/chute/chute-ios-components/raw/master/components/GCImageGrid/screenshots/screen3.png)

GCMultiImagePicker
------------------
This class also displays a wall of thumbnail images but allows for the selection of multiple images.  You can provide an array of GCAssets for it to use, or it will use all the images on the device if no array is provided.  It creates an overlay selection view for the selected images that can be overwritten either programmatically or in interface builder with any UIImage.  It also has adjustable size and spacing for the thumbnails.  It provides a method to retrieve an array of all the selected assets.

![screen1](https://github.com/chute/chute-ios-components/raw/master/components/GCMultiImagePicker/screenshots/screen1.png)![screen2](https://github.com/chute/chute-ios-components/raw/master/components/GCMultiImagePicker/screenshots/screen2.png)

GCShareView
-----------
This class facilitates sharing an object with Facebook, twitter,or via email. You are currently able to share GCAssets, GCChutes, GCParcels, and NSURLs. The default behavior is for the choice dialog to slide up from the bottom when the view appears. Clicking anywhere outside of the dialog results in the view being dismissed by sliding back down off screen. Selecting email brings up a standard email sheet with a preset message and subject that are editable. Selecting twitter or Facebook brings up a web view for sharing to those services with a preset message.  There are methods that can be edited or overwritten to set specific messages for each of the objects and services.

![screen1](https://github.com/chute/chute-ios-components/raw/master/components/GCShareView/screenshots/screen1.png)![screen2](https://github.com/chute/chute-ios-components/raw/master/components/GCShareView/screenshots/screen2.png)![screen3](https://github.com/chute/chute-ios-components/raw/master/components/GCShareView/screenshots/screen3.png)

GCSocialGallery
---------------
This class is essentially an expanded version of the GCCloudGallery component. In addition to allowing you to view a sliding gallery of assets, it allows you to heart/unheart the asset you are viewing, add/view comments for that asset and share it via twitter, facebook, and email.

![screen2](https://github.com/chute/chute-ios-components/raw/master/components/GCSocialGallery/screenshots/screen2.png)![screen5](https://github.com/chute/chute-ios-components/raw/master/components/GCSocialGallery/screenshots/screen5.png)![screen7](https://github.com/chute/chute-ios-components/raw/master/components/GCSocialGallery/screenshots/screen7.png)