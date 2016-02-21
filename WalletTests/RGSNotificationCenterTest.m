//
//  RGSNotificationCenterTest.m
//  Wallet
//
//  Created by Ramiro García Salazar on 21/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RGSFakeNotificationCenter.h"
#import "RGSWallet.h"

@interface RGSNotificationCenterTest : XCTestCase

@end

@implementation RGSNotificationCenterTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void) testThatSubscribesToMemoryWarning{
    RGSFakeNotificationCenter *fake = [RGSFakeNotificationCenter new];
    
    RGSWallet *w = [RGSWallet new];
    
    [w subscribeToMemoryWarning:(NSNotificationCenter*)fake];
    
    NSDictionary *obs = [fake observers];
    id observer = [obs objectForKey:UIApplicationDidReceiveMemoryWarningNotification];
    
    XCTAssertEqualObjects(observer, w, @"Wallet object must subscribe to UIApplicationDidReceiveMemoryWarningNotification");
}

@end
