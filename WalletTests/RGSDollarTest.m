//
//  RGSDollarTest.m
//  Wallet
//
//  Created by Ramiro García Salazar on 4/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RGSDollar.h"

@interface RGSDollarTest : XCTestCase

@end

@implementation RGSDollarTest

-(void) testMultiplication{
    RGSDollar *five = [RGSMoney dollarWithAmount: 5];
    RGSDollar *total = [five times:2];
    RGSDollar *ten = [RGSMoney euroWithAmount: 10];
    
    XCTAssertEqualObjects(ten, total, @"$5 * 2 = $10");
}



-(void) testEquality{
    RGSDollar *five = [RGSMoney euroWithAmount:5];
    RGSDollar *ten = [RGSMoney euroWithAmount:10];
    RGSDollar *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"equivalent objects should be equals");
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects shoul not be equal");
}


-(void) testHash{
    RGSDollar *a = [RGSMoney euroWithAmount:2];
    RGSDollar *b = [RGSMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
}

-(void) testAmountStorage{
    RGSDollar *dolar = [RGSMoney euroWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[dolar performSelector:@selector(amount)]integerValue], @"The value retrivied should be same as the stored");
#pragma clang diagnostic pop
}
@end
