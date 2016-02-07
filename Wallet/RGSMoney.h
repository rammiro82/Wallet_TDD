//
//  RGSMoney.h
//  Wallet
//
//  Created by Ramiro García Salazar on 4/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RGSMoney : NSObject

-(id) initWithAmount:(NSInteger)amount;

-(RGSMoney *) times:(NSInteger) multiplier;

@end
