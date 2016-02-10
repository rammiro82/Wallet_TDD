//
//  RGSWalletTests.m
//  Wallet
//
//  Created by Ramiro García Salazar on 10/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RGSMoney.h"
#import "RGSBroker.h"
#import "RGSWallet.h"

@interface RGSWalletTests : XCTestCase

@end

@implementation RGSWalletTests

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

// €40 + $20 = $100 2:1
-(void) testAdditionWithReduction{
    RGSBroker *broker = [RGSBroker new];
    [broker addRate:2
       fromCurrency:@"USD"
         toCurrency:@"EUR"];
    
    RGSWallet *wallet = [[RGSWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus:[RGSMoney dollarWithAmount:20]];
    
    RGSMoney *reduced = [broker reduce:wallet
                            toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [RGSMoney dollarWithAmount:100], @"€40 + $20 = $100 2:1");
}
@end
