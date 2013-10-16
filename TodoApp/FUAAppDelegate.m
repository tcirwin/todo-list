//
//  FUAAppDelegate.m
//  TodoApp
//
//  Created by Therin Irwin on 10/15/13.
//  Copyright (c) 2013 Therin Irwin. All rights reserved.
//

#import "FUAAppDelegate.h"
#import "FUATableViewController.h"

@interface FUAAppDelegate()
{
    UINavigationController *navController;
    FUATableViewController *tableController;
}
@end

@implementation FUAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle: nil];
    navController = [mainStoryboard instantiateViewControllerWithIdentifier:@"NavController"];
    tableController = (FUATableViewController *) [navController topViewController];

    self.window.rootViewController = navController;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [tableController saveTodoItems];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [tableController saveTodoItems];
}

- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    return YES;
}

@end
