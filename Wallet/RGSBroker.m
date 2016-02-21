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

@end

@implementation RGSBroker

-(id) init{
    if (self = [super init]) {
        _rates = [@{}mutableCopy];
    }
    return self;
}

-(id<RGSMoney>) reduce:(id<RGSMoney>) money
          toCurrency:(NSString*) currency{
    
    // double dispacth
    
    return [money reduceToCurrency:currency
                        withBroker:self];

    
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
