//
//  RGSBrokerTest.m
//  Wallet
//
//  Created by Ramiro García Salazar on 9/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RGSMoney.h"
#import "RGSBroker.h"

@interface RGSBrokerTest : XCTestCase

@end

@implementation RGSBrokerTest

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

-(void) testSimpleReduction{
    RGSBroker *brokcer = [[RGSBroker alloc] init];
    
    RGSMoney *sum = [[RGSMoney dollarWithAmount:5] plus:[RGSMoney dollarWithAmount:5]];
    RGSMoney *reduced = [broker reduced: sum toCurrency:@"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

@end
