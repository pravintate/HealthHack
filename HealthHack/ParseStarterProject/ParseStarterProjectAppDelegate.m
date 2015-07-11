//
//  ParseStarterProjectAppDelegate.m
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

#import <Parse/Parse.h>

#import "ParseStarterProjectAppDelegate.h"

@implementation ParseStarterProjectAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Enable storing and querying data from Local Datastore. Remove this line if you don't want to
    // use Local Datastore features or want to use cachePolicy.
    [Parse enableLocalDatastore];

    [Parse setApplicationId:@"YfQXku6Gfn4vd3RQaJpZDzOjy1ZUc7uv0P41qc9U"
                  clientKey:@"qBUNht7IFrDsp1OTQxJDHYvsKvElHcmiohuKaYWA"];
    return YES;
}


@end
