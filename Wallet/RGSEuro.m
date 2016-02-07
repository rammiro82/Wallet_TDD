//
//  RGSEuro.m
//  Wallet
//
//  Created by Ramiro García Salazar on 3/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSEuro.h"
#import "RGSMoney-Private.h"

@interface RGSEuro ()

@end

@implementation RGSEuro


-(RGSEuro*) times:(NSInteger) multiplier{
    
    RGSEuro *newEuro = [[RGSEuro alloc] initWithAmount:[self.amount integerValue] * multiplier];
    
    return newEuro;
}


#pragma mark - Overwritten
@end
