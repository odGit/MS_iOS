//
//  AppDelegate.m
//  AwesomeCamera
//
//  Created by Casper Storm Larsen on 28/06/16.
//  Copyright © 2016 Rise Digital. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    HomeViewController *cameraViewController = [HomeViewController new];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    [self.window setRootViewController:cameraViewController];

    return YES;
}

@end
