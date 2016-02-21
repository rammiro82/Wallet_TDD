//
//  RGSBroker.h
//  Wallet
//
//  Created by Ramiro García Salazar on 9/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGSMoney.h"

@interface RGSBroker : NSObject

@property (nonatomic, strong) NSMutableDictionary *rates;

-(RGSMoney*) reduce:(id<RGSMoney>) money toCurrency:(NSString *) currency;
-(void) addRate:(NSInteger) rate
   fromCurrency:(NSString*) fromCurrency
     toCurrency:(NSString*) toCurrency;

-(NSString *) keyFromCurrency:(NSString *) fromCurrency
                   toCurrency:(NSString *) toCurrency;
@end
