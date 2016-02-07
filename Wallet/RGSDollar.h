//
//  RGSDollar.h
//  Wallet
//
//  Created by Ramiro García Salazar on 4/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGSMoney.h"

@interface RGSDollar : RGSMoney

-(id) initWithAmount:(NSInteger) amount;

-(RGSDollar*) times:(NSInteger) multiplier;
@end
