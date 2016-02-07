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
    RGSDollar *five = [[RGSDollar alloc] initWithAmount: 5];
    RGSDollar *total = [five times:2];
    RGSDollar *ten = [[RGSDollar alloc] initWithAmount: 10];
    
    XCTAssertEqualObjects(ten, total, @"$5 * 2 = $10");
}



-(void) testEquality{
    RGSDollar *five = [[RGSDollar alloc] initWithAmount:5];
    RGSDollar *ten = [[RGSDollar alloc] initWithAmount:10];
    RGSDollar *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"equivalent objects should be equals");
    XCTAssertFalse([total isEqual:five], @"Non equivalent objects shoul not be equal");
}


-(void) testHash{
    RGSDollar *a = [[RGSDollar alloc] initWithAmount:2];
    RGSDollar *b = [[RGSDollar alloc] initWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
}

-(void) testAmountStorage{
    RGSDollar *dolar = [[RGSDollar alloc] initWithAmount:2];
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[dolar performSelector:@selector(amount)]integerValue], @"The value retrivied should be same as the stored");
#pragma clang diagnostic pop
}
@end
