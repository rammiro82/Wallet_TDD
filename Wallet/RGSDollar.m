//
//  RGSDollar.m
//  Wallet
//
//  Created by Ramiro García Salazar on 4/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSDollar.h"
@interface RGSDollar ()

@property (nonatomic) NSInteger amount;

@end

@implementation RGSDollar

-(RGSDollar*) times:(NSInteger) multiplier{
    
    RGSDollar *newDollar = [[RGSDollar alloc] initWithAmount:self.amount * multiplier];
    
    return newDollar;
}


#pragma mark - Overwritten

@end
