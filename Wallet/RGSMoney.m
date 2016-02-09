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

@property (nonatomic, strong) NSNumber *amount;

@end
@implementation RGSMoney


+(id) euroWithAmount:(NSInteger) amount{
    return [[RGSMoney alloc] initWithAmount:amount currency:@"EUR"];
}

+(id) dollarWithAmount:(NSInteger) amount{
    return [[RGSMoney alloc] initWithAmount:amount currency:@"USD"];
}

-(id) initWithAmount:(NSInteger)amount
            currency:(NSString *) currency{
    if (self = [super init]) {
        _amount = @(amount);
        _currency = currency;
    }
    return self;
}

-(id) times:(NSInteger) multiplier{
    
    RGSMoney *newMoney = [[RGSMoney alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
    
    return newMoney;
}


#pragma mark - Overwritten

-(NSString *) description{
    return [NSString stringWithFormat:@"<%@ %ld",
            [self class], (long)[self amount]];
}

-(BOOL) isEqual:(id)object{
    if ([self.currency isEqual:[object currency]]) {
        return [self amount] == [object amount];
    }else{
        return NO;
    }
}

-(NSUInteger) hash{
    return (NSUInteger) self.amount;
}

@end
