//
//  RWTAppDelegate.m
//  ForgetMeNot
//
//  Created by Henry Dinhofer on 6/28/16.
//  Copyright (c) 2014 Ray Wenderlich Tutorial Team. All rights reserved.
//

#import "RWTAppDelegate.h"

@import CoreLocation; //to detect in the background

@interface RWTAppDelegate () <CLLocationManagerDelegate>  //"conforms to CLLocationManagerDelegate" protocol <>

@property (strong, nonatomic) CLLocationManager *locationManager;


@end

@implementation RWTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Initialize the location manager
    //  and set the delegate accordingly
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    
    if([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestAlwaysAuthorization];
    }

   // [[UIApplication sharedApplication] registerForRemoteNotifications];
    //This code will work in iOS 8.0 xcode 6.0 or later
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    if ([region isKindOfClass:[CLBeaconRegion class]]) {  //CLBeaconRegion is for iBeacon monitoring. Otherwise it might be CLCircularRegion which is geolocation monitoring
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        notification.alertBody = @"Are you forgetting something?";
//        notification.soundName = @"Default";
        notification.soundName = @"VaderRWT.caf";
        [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    }
}

@end
