//
//  RGSMoney.h
//  Wallet
//
//  Created by Ramiro García Salazar on 4/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGSBroker.h"
@class RGSMoney;

@protocol RGSMoney <NSObject>

-(id) initWithAmount:(NSInteger)amount
            currency:(NSString *) currency;

-(id<RGSMoney>) times:(NSInteger) multiplier;

-(id<RGSMoney>) plus:(RGSMoney *) other;

-(id<RGSMoney>) reduceToCurrency:(NSString*) currency
                      withBroker:(RGSBroker*) broker;

@end

@interface RGSMoney : NSObject<RGSMoney>

@property (nonatomic, strong, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

@end
