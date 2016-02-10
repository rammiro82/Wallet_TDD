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

-(RGSMoney *) plus:(RGSMoney *) other{
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    RGSMoney *total = [[RGSMoney alloc] initWithAmount:totalAmount
                                              currency:self.currency];
    
    return total;
}


#pragma mark - Overwritten

-(NSString *) description{
    return [NSString stringWithFormat:@"<%@: %@ %@>",
            [self class], self.currency, self.amount];
}

-(BOOL) isEqual:(id)object{
    if ([self.currency isEqual:[object currency]]) {
        return [self amount] == [object amount];
    }else{
        return NO;
    }
}

-(NSUInteger) hash{
    return [self.amount integerValue];
}

@end
