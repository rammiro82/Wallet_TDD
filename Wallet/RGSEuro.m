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

-(id) initWithAmount:(NSInteger) amount{
    if (self = [super init]) {
        _amount = amount;
    }
    
    return self;
}

-(void) times:(NSInteger) multiplier{
    self.amount *= multiplier;
}
@end
