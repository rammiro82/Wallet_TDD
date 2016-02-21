//
//  AppDelegate.m
//  Wallet
//
//  Created by Ramiro García Salazar on 1/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "AppDelegate.h"
#import "RGSWalletTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    RGSWallet *wallet = [[RGSWallet alloc] initWithAmount:2 currency:@"EUR"];
    [wallet addMoney:[[RGSMoney alloc] initWithAmount:3
                                             currency:@"USD"]];
    [wallet addMoney:[[RGSMoney alloc] initWithAmount:7
                                             currency:@"USD"]];
    [wallet addMoney:[[RGSMoney alloc] initWithAmount:5
                                             currency:@"USD"]];
    
    RGSBroker *broker = [RGSBroker new];
    [broker addRate:2
       fromCurrency:@"EUR"
         toCurrency:@"USD"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    RGSWalletTableViewController *vc = [[RGSWalletTableViewController alloc] initWithModel:wallet
                                                                                    broker:broker];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window setRootViewController:vc];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
