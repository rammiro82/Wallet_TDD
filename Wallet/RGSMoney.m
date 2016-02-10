//
//  RGSMoney.m
//  Wallet
//
//  Created by Ramiro García Salazar on 4/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSMoney.h"
#import "NSObject+GNUStepAddons.h"
#import "RGSBroker.h"

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

-(id<RGSMoney>) times:(NSInteger) multiplier{
    
    RGSMoney *newMoney = [[RGSMoney alloc] initWithAmount:[self.amount integerValue] * multiplier currency:self.currency];
    
    return newMoney;
}

-(id<RGSMoney>) plus:(RGSMoney *) other{
    NSInteger totalAmount = [self.amount integerValue] + [other.amount integerValue];
    
    RGSMoney *total = [[RGSMoney alloc] initWithAmount:totalAmount
                                              currency:self.currency];
    
    return total;
}


-(id<RGSMoney>) reduceToCurrency:(NSString*) currency
                      withBroker:(RGSBroker*) broker{
    
    RGSMoney *result;
    double rate = [[broker.rates
                    objectForKey:[broker keyFromCurrency:self.currency
                                            toCurrency:currency]] doubleValue];
    
    // comprobar que divisa origen y destino, sean las mismas
    if ([self.currency isEqual:currency]) {
        result = self;
    }else if (rate == 0){
        // no hay tasa de conversión --> exception
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversión from %@ to %@", self.currency, currency];
    }else{
        
        NSInteger newAmount = [self.amount integerValue] * rate;
        
        result = [[RGSMoney alloc] initWithAmount:newAmount
                                         currency:currency];
        
    }
    return result;
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
