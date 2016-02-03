//
//  RGSEuro.h
//  Wallet
//
//  Created by Ramiro García Salazar on 3/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RGSEuro : NSObject

-(id) initWithAmount:(NSInteger) amount;

-(RGSEuro*) times:(NSInteger) multiplier;
@end
