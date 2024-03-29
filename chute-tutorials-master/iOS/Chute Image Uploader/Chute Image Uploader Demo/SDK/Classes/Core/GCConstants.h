//
//  GCConstants.h
//
//  Copyright 2011 Chute Corporation. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////////////////////////////
// Set which service is to be used
// 0 - Facebook
// 1 - Evernote
// 2 - Chute
// 3 - Twitter
// 4 - Foursquare

#define kSERVICE 3

////////////////////////////////////////////////////////////////////////////////////////////////////////

#define API_URL @"http://api.getchute.com/v1/"
#define SERVER_URL @"http://getchute.com"

////////////////////////////////////////////////////////////////////////////////////////////////////////

#define kUDID               [[UIDevice currentDevice] uniqueIdentifier]
#define kDEVICE_NAME        [[UIDevice currentDevice] name]
#define kDEVICE_OS          [[UIDevice currentDevice] systemName]
#define kDEVICE_VERSION     [[UIDevice currentDevice] systemVersion]

//replace the following setting with your own client info
#define kOAuthRedirectURL               @"http://getchute.com/oauth/callback"
#define kOAuthRedirectRelativeURL       @"/oauth/callback"
#define kOAuthClientID                  @"50a9aed0018d165a800002fd"
#define kOAuthClientSecret              @"f4ad590d2a2599eb0a6643e719e1e951fe8246752204403c1d0431270d02df3d"

#define kOAuthPermissions               @"all_resources manage_resources profile resources"

#define kOAuthTokenURL                  @"http://getchute.com/oauth/access_token"