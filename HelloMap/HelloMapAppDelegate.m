/*
 * Copyright © 2011-2016 HERE Global B.V. and its affiliate(s).
 * All rights reserved.
 * The use of this software is conditional upon having a separate agreement
 * with a HERE company for the use or utilization of this software. In the
 * absence of such agreement, the use of the software is not allowed.
 */

#import "HelloMapAppDelegate.h"
#import <NMAKit/NMAKit.h>

#define kHelloMapAppID @""
#define kHelloMapAppCode @""
#define kHelloMapLicenseKey @""

@implementation HelloMapAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // TODO: ENTER YOUR APPLICATION CREDENTIALS HERE!
    [NMAApplicationContext setAppId:kHelloMapAppID appCode:kHelloMapAppCode licenseKey:kHelloMapLicenseKey];
        
    return YES;
}

@end
