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

@property (nonatomic, readonly) NSUInteger countCurrencyTypes;

-(void) subscribeToMemoryWarning:(NSNotificationCenter *)nc;

-(void) addMoney: (RGSMoney *) money;
-(void) takeMoney:(RGSMoney *) money;

-(NSInteger) countMoneysForCurrencyType:(NSInteger) currencyType;
-(RGSMoney *) moneyForCurrency:(NSInteger) currency withIndex:(NSInteger) index;
-(NSNumber *) sumAmountForCurrencyType:(NSInteger) currencyType;
-(NSMutableArray *) currencyTypesArray;
@end
