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

-(void) testMultiplication{
    RGSMoney *euro = [RGSMoney euroWithAmount:5];
    RGSMoney *ten = [RGSMoney euroWithAmount:10];
    RGSMoney *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2 should be €10");
}


-(void) testEquality{
    RGSMoney *five = [RGSMoney euroWithAmount:5];
    RGSMoney *ten = [RGSMoney euroWithAmount:10];
    RGSMoney *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"equivalent objects should be equals");
    XCTAssertEqualObjects([RGSMoney dollarWithAmount:4], [[RGSMoney dollarWithAmount:2] times:2]);
}

-(void) testHash{
    RGSMoney *a = [RGSMoney euroWithAmount:2];
    RGSMoney *b = [RGSMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
    XCTAssertEqual([[RGSMoney dollarWithAmount:1 ] hash],
                   [[RGSMoney dollarWithAmount:1] hash], @"Equal objects must have same hash");
}

-(void) testAmountStorage{
    RGSMoney *euro = [RGSMoney euroWithAmount:2];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"The value retrivied should be same as the stored");
    
    XCTAssertEqual(2, [[[RGSMoney dollarWithAmount:2]
                        performSelector:@selector(amount)]integerValue],
                   @"he value retrivied should be same as the stored");
#pragma clang diagnostic pop
}

-(void) testCurrencies{
    XCTAssertEqualObjects(@"EUR", [[RGSMoney euroWithAmount:1] currency], @"The currency of euros should be eur.");
    
    XCTAssertEqualObjects(@"USD", [[RGSMoney dollarWithAmount:1] currency], @"The currency of $1 should be USD.");
    
}

@end
