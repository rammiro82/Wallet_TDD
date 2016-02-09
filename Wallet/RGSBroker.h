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

-(RGSMoney *) reduce:(RGSMoney*) money toCurrency:(NSString *) currency;

@end
