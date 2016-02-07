//
//  RGSMoneyTest.m
//  Wallet
//
//  Created by Ramiro García Salazar on 7/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RGSMoney.h"

@interface RGSMoneyTest : XCTestCase

@end

@implementation RGSMoneyTest

-(void) testThatTimesRaisesException{
    RGSMoney *money = [[RGSMoney alloc] initWithAmount: 1];
    XCTAssertThrows([money times:2], @"Should raise an exception");
}

@end
