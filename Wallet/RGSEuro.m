//
//  RGSEuro.m
//  Wallet
//
//  Created by Ramiro García Salazar on 3/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSEuro.h"

@interface RGSEuro ()

@property (nonatomic) NSInteger amount;

@end

@implementation RGSEuro


-(RGSEuro*) times:(NSInteger) multiplier{
    
    RGSEuro *newEuro = [[RGSEuro alloc] initWithAmount:self.amount * multiplier];
    
    return newEuro;
}


#pragma mark - Overwritten
@end
