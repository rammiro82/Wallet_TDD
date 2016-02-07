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

-(id) initWithAmount:(NSInteger) amount{
    if (self = [super init]) {
        _amount = amount;
    }
    
    return self;
}

-(RGSDollar*) times:(NSInteger) multiplier{
    
    RGSDollar *newDollar = [[RGSDollar alloc] initWithAmount:self.amount * multiplier];
    
    return newDollar;
}


#pragma mark - Overwritten
-(BOOL) isEqual:(id)object{
    return [self amount] == [object amount];
}
-(NSUInteger) hash{
    return (NSUInteger) self.amount;
}
@end
