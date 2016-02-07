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

-(RGSEuro*) times:(NSInteger) multiplier{
    
    RGSEuro *newEuro = [[RGSEuro alloc] initWithAmount:self.amount * multiplier];
    
    return newEuro;
}


#pragma mark - Overwritten
-(BOOL) isEqual:(id)object{
    return [self amount] == [object amount];
}

-(NSUInteger) hash{
    return (NSUInteger) self.amount;
}
@end
