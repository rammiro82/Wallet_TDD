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
    RGSEuro *ten = [[RGSEuro alloc] initWithAmount:10];
    RGSEuro *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2 should be €10");
}


-(void) testEquality{
    RGSEuro *five = [[RGSEuro alloc] initWithAmount:5];
    RGSEuro *ten = [[RGSEuro alloc] initWithAmount:10];
    RGSEuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"equivalent objects should be equals");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
