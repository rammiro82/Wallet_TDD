//
//  RGSWallet.h
//  Wallet
//
//  Created by Ramiro García Salazar on 10/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RGSMoney.h"

@interface RGSWallet : NSObject<RGSMoney>

@property (nonatomic, readonly) NSUInteger count;

-(void) subscribeToMemoryWarning:(NSNotificationCenter *)nc;
@end
