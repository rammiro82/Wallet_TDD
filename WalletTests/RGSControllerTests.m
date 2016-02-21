//
//  RGSControllerTests.m
//  Wallet
//
//  Created by Ramiro García Salazar on 21/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RGSSimpleViewController.h"
#import "RGSWalletTableViewController.h"
#import "RGSWallet.h"

@interface RGSControllerTests : XCTestCase

@property (nonatomic, strong) RGSSimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel  *label;

@property (nonatomic, strong) RGSWalletTableViewController *walletVC;
@property (nonatomic, strong) RGSWallet *wallet;

@end

@implementation RGSControllerTests

- (void)setUp {
    [super setUp];
    
    self.simpleVC = [[RGSSimpleViewController alloc] initWithNibName:nil
                                                              bundle:nil];
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button setTitle:@"Hola" forState:UIControlStateNormal];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectZero];
    
    self.simpleVC.displayLabel = self.label;
    
    self.wallet = [[RGSWallet alloc] initWithAmount:1 currency:@"USD"];
    [self.wallet plus:[RGSMoney euroWithAmount:1]];
    self.walletVC = [[RGSWalletTableViewController alloc] initWithModel:self.wallet];
}

- (void)tearDown {
    
    [super tearDown];
    self.simpleVC = nil;
    self.button = nil;
    self.label = nil;
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

-(void) testThatTextOnLabelIsEqualToTextOnBotton{
    //mandamos el mensaje
    [self.simpleVC displayText:self.button];
    
    //comprobamos que tienen el mismo texto
    XCTAssertEqualObjects(self.button.titleLabel.text, self.label.text, @"Button and label should have the same text");
}

-(void) testThatTableHasOneSection{
    NSUInteger sections = [self.walletVC numberOfSectionsInTableView:nil];
    
    XCTAssertEqual(sections, 1, @"There can only be one seciton");
}

-(void) testThatNumberOfCellsIsNumberOfMoneyPlusOne{
    
    XCTAssertEqual(self.wallet.count + 1, [self.walletVC tableView:nil numberOfRowsInSection:0], @"Number of cells is the number of moneys plus 1");
}

@end
