//
//  RGSBroker.m
//  Wallet
//
//  Created by Ramiro García Salazar on 9/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSBroker.h"
#import "RGSMoney.h"

@interface RGSBroker()
@property (nonatomic, strong) NSMutableDictionary *rates;
@end

@implementation RGSBroker

-(id) init{
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    return self;
}

-(RGSMoney *) reduce:(RGSMoney*) money
          toCurrency:(NSString*) currency{
    
    RGSMoney *result;
    double rate = [[self.rates
                    objectForKey:[self keyFromCurrency:money.currency
                                            toCurrency:currency]] doubleValue];
    
    // comprobar que divisa origen y destino, sean las mismas
    if ([money.currency isEqual:currency]) {
        result = money;
    }else if (rate == 0){
        // no hay tasa de conversión --> exception
        [NSException raise:@"NoConversionRateException"
                    format:@"Must have a conversión from %@ to %@", money.currency, currency];
    }else{
        double rate = [[self.rates objectForKey:[self keyFromCurrency:money.currency
                                                           toCurrency:currency]] doubleValue];
        NSInteger newAmount = [money.amount integerValue] * rate;
        
        result = [[RGSMoney alloc] initWithAmount:newAmount
                                         currency:currency];

    }
    return result;
    
}

-(void) addRate:(NSInteger)rate
   fromCurrency:(NSString *)fromCurrency
     toCurrency:(NSString*)toCurrency{
    
    [self.rates setObject:@(rate)
                   forKey:[self keyFromCurrency:fromCurrency
                                     toCurrency:toCurrency]];
    
    NSNumber *invRate = @(1.0/rate);
    [self.rates setObject:invRate
                   forKey:[self keyFromCurrency:toCurrency
                                     toCurrency:fromCurrency]];
}

#pragma mark - utils
-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency{
    return [NSString stringWithFormat:@"%@-%@", fromCurrency, toCurrency];
}
@end
