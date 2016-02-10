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

@property (nonatomic, strong) RGSBroker *emptyBroker;
@property (nonatomic, strong) RGSMoney *oneDollar;

@end

@implementation RGSBrokerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.emptyBroker = [RGSBroker new];
    self.oneDollar = [RGSMoney dollarWithAmount:1];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.emptyBroker = nil;
    self.oneDollar = nil;
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void) testSimpleReduction{
    
    RGSMoney *sum = [[RGSMoney dollarWithAmount:5] plus:[RGSMoney dollarWithAmount:5]];
    RGSMoney *reduced = [self.emptyBroker reduce: sum toCurrency:@"USD"];
    
    XCTAssertEqualObjects(sum, reduced, @"Conversion to same currency should be a NOP");
}

// $10 == €5 2:1
-(void) testReduction{
    [self.emptyBroker addRate:2 fromCurrency:@"EUR" toCurrency:@"USD"];
    
    RGSMoney *dollars = [RGSMoney dollarWithAmount:10];
    RGSMoney *euros = [RGSMoney euroWithAmount:5];
    
    RGSMoney *converted = [self.emptyBroker reduce:dollars
                              toCurrency:@"EUR"];
    
    XCTAssertEqualObjects(converted, euros, @"$10 == €5 2:1");
}

-(void) testThatNoRateRaisesException{
    XCTAssertThrows([self.emptyBroker reduce:self.oneDollar toCurrency:@"EUR"], @"No rates should cause exception");
}

-(void) testThatNilConversionDoesNotChangeMoney{
    
    XCTAssertEqualObjects(self.oneDollar, [self.emptyBroker reduce:self.oneDollar toCurrency:@"USD"], @"A nil conversion should hafe no effect");
}

@end
