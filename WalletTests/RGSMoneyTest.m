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

-(void) testCurrencies{
    XCTAssertEqualObjects(@"EUR", [[RGSMoney euroWithAmount:1] currency], @"The currency of euros should be eur.");
    
    XCTAssertEqualObjects(@"USD", [[RGSMoney dollarWithAmount:1] currency], @"The currency of $1 should be USD.");
    
}

@end
