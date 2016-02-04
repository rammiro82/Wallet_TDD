//
//  RGSDollar.h
//  Wallet
//
//  Created by Ramiro García Salazar on 4/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RGSDollar : NSObject

-(id) initWithAmount:(NSInteger) amount;

-(RGSDollar*) times:(NSInteger) multiplier;
@end
