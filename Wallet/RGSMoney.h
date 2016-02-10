//
//  RGSMoney.h
//  Wallet
//
//  Created by Ramiro García Salazar on 4/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RGSMoney : NSObject

@property (nonatomic, strong, readonly) NSNumber *amount;
@property (nonatomic, readonly) NSString *currency;

+(id) euroWithAmount:(NSInteger) amount;
+(id) dollarWithAmount:(NSInteger) amount;

-(RGSMoney *) plus:(RGSMoney *) other;

-(id) initWithAmount:(NSInteger)amount
            currency:(NSString *) currency;

-(id) times:(NSInteger) multiplier;

@end
