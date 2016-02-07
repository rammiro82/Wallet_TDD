//
//  RGSDollar.m
//  Wallet
//
//  Created by Ramiro García Salazar on 4/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSDollar.h"
#import "RGSMoney-Private.h"

@interface RGSDollar ()


@end

@implementation RGSDollar

-(RGSDollar*) times:(NSInteger) multiplier{
    
    RGSDollar *newDollar = [[RGSDollar alloc] initWithAmount:[self.amount integerValue] * multiplier];
    
    return newDollar;
}


#pragma mark - Overwritten

@end
