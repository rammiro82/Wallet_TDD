//
//  RGSControllerTests.m
//  Wallet
//
//  Created by Ramiro García Salazar on 21/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "RGSSimpleViewController.h"

@interface RGSControllerTests : XCTestCase

@property (nonatomic, strong) RGSSimpleViewController *simpleVC;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UILabel  *label;

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

@end
