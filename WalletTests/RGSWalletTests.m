//
//  RGSWalletTests.m
//  Wallet
//
//  Created by Ramiro García Salazar on 10/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RGSBroker.h"
#import "RGSWallet.h"
#import "RGSMoney.h"

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

// €40 + $20 = $100 2:1
-(void) testAdditionWithReduction{
    RGSBroker *broker = [RGSBroker new];
    [broker addRate:2
       fromCurrency:@"EUR"
         toCurrency:@"USD"];
    
    RGSWallet *wallet = [[RGSWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus:[RGSMoney dollarWithAmount:20]];
    
    RGSMoney *reduced = [broker reduce:wallet
                            toCurrency:@"USD"];
    XCTAssertEqualObjects(reduced, [RGSMoney dollarWithAmount:100], @"€40 + $20 = $100 2:1");
}

-(void) testCountCurrencyTypes{
    //contamos el número de monedas que hay, para pintar las secciones de la tabla
    RGSWallet *wallet = [[RGSWallet alloc] initWithAmount:1 currency:@"EUR"];
    [wallet plus:[RGSMoney dollarWithAmount:10]];
    
    XCTAssertEqual(2, [wallet countCurrencyTypes], @"Two different currency tipes (EUR and USD)");
}

-(void) testCountMoneysForCurrencyType{
    // contamos la cantidad de monedas, para un tipo determinado.
    RGSWallet *wallet = [[RGSWallet alloc] initWithAmount:1 currency:@"EUR"];
    
    XCTAssertEqual(1, [wallet  countMoneysForCurrencyType:0], @"Two different currency types (EUR and USD)");
}

-(void) testSumAmountForCurrencyType{
    RGSWallet *wallet = [[RGSWallet alloc] initWithAmount:40 currency:@"EUR"];
    [wallet plus:[RGSMoney euroWithAmount:20]];
    
    XCTAssertEqualObjects([[NSNumber alloc] initWithInt:60], [wallet sumAmountForCurrencyType:0], @"Sum for 40 + 20 should be 60.");
}

-(void) testMoneyForCurrencyAtIndex:(NSInteger) currency index:(NSInteger) index{
    
}
@end
