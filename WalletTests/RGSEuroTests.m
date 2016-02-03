//
//  RGSEuroTests.m
//  Wallet
//
//  Created by Ramiro García Salazar on 3/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RGSEuro.h"

@interface RGSEuroTests : XCTestCase

@end

@implementation RGSEuroTests

-(void) testMultiplication{
    RGSEuro *euro = [[RGSEuro alloc] initWithAmount:5];
    [euro times:2];
    
    XCTAssertEqual(euro.amount, 10, @"5*2 should be 10");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
