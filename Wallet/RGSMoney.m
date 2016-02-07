//
//  RGSMoney.m
//  Wallet
//
//  Created by Ramiro García Salazar on 4/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSMoney.h"
#import "NSObject+GNUStepAddons.h"

@interface RGSMoney()

@property (nonatomic) NSInteger amount;

@end
@implementation RGSMoney

-(id) initWithAmount:(NSInteger)amount{
    if (self = [super init]) {
        _amount = amount;
    }
    return self;
}

-(RGSMoney *) times:(NSInteger) multiplier{
    // no se debería llamar, sino que se deberia user el de la subclase
    return [self subclassResponsibility:_cmd];
}


#pragma mark - Overwritten

-(NSString *) description{
    return [NSString stringWithFormat:@"<%@ %ld",
            [self class], (long)[self amount]];
}

-(BOOL) isEqual:(id)object{
    return [self amount] == [object amount];
}

-(NSUInteger) hash{
    return (NSUInteger) self.amount;
}

@end
