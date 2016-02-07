//
//  RGSEuroTests.m
//  Wallet
//
//  Created by Ramiro García Salazar on 3/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RGSEuro.h"
#import "RGSMoney.h"

@interface RGSEuroTests : XCTestCase

@end

@implementation RGSEuroTests

-(void) testMultiplication{
    RGSEuro *euro = [RGSMoney euroWithAmount:5];
    RGSEuro *ten = [RGSMoney euroWithAmount:10];
    RGSEuro *total = [euro times:2];
    
    XCTAssertEqualObjects(total, ten, @"€5 * 2 should be €10");
}


-(void) testEquality{
    RGSEuro *five = [RGSMoney euroWithAmount:5];
    RGSEuro *ten = [RGSMoney euroWithAmount:10];
    RGSEuro *total = [five times:2];
    
    XCTAssertEqualObjects(ten, total, @"equivalent objects should be equals");
}

-(void) testHash{
    RGSEuro *a = [RGSMoney euroWithAmount:2];
    RGSEuro *b = [RGSMoney euroWithAmount:2];
    
    XCTAssertEqual([a hash], [b hash], @"Equal objects must have same hash");
}

-(void) testAmountStorage{
    RGSEuro *euro = [RGSMoney euroWithAmount:2];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    XCTAssertEqual(2, [[euro performSelector:@selector(amount)]integerValue], @"The value retrivied should be same as the stored");
#pragma clang diagnostic pop
}

@end
