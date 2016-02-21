//
//  RGSWallet.m
//  Wallet
//
//  Created by Ramiro García Salazar on 10/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RGSWallet.h"

@interface RGSWallet()

@property (nonatomic, strong) NSMutableArray *moneys;

@end

@implementation RGSWallet

-(id) initWithAmount:(NSInteger)amount currency:(NSString *)currency{
    if (self = [super init]) {
        RGSMoney *money = [[RGSMoney alloc] initWithAmount:amount currency:currency];
        _moneys = [NSMutableArray array];
        [_moneys addObject:money];
    }
    return self;
}

-(NSUInteger) countCurrencyTypes{
    return [self.currecyTypesArray count];
}

-(NSMutableArray *) currecyTypesArray{
    NSMutableArray *currencyTypes = [NSMutableArray array];
    
    for (RGSMoney *each in self.moneys) {
        // para cada importe en monedas, comprobamos si el tipo, la hemos introducido en el resultado.
        if (![currencyTypes containsObject:each.currency]) {
            [currencyTypes addObject:each.currency];
        }
    }
    
    return currencyTypes;
}

-(NSInteger) moneysForCurrencyType:(NSInteger) currencyType{
    NSString *currency = [self.currecyTypesArray objectAtIndex:currencyType];
    NSMutableArray *moneysForCurrency = [NSMutableArray array];
    
    for (RGSMoney *each in self.moneys) {
        // contamos la cantidad de moneys que hay de una currency determinada.
        if ([each.currency isEqualToString:currency]) {
            [moneysForCurrency addObject:each];
        }
    }
    
    return moneysForCurrency.count;
}

-(id<RGSMoney>) plus:(RGSMoney*) money{
    [self.moneys addObject:money];
    return self;
}

-(id<RGSMoney>) times:(NSInteger)multiplier{
    NSMutableArray *newMoneys = [NSMutableArray arrayWithCapacity:self.moneys.count];
    
    for (RGSMoney *each in self.moneys) {
        RGSMoney *newMoney = [each times:multiplier];
        [newMoneys addObject:newMoney];
         
    }
    self.moneys = newMoneys;
    return self;
}

-(id<RGSMoney>) reduceToCurrency:(NSString *)currency
                      withBroker:(RGSBroker *)broker{
    RGSMoney *result = [[RGSMoney alloc] initWithAmount:0 currency:currency];
    
    for (RGSMoney *each in self.moneys) {
        result = [result plus:[each reduceToCurrency:currency withBroker:broker]];
    }
    
    return result;
}


-(void) addMoney: (RGSMoney *) money{
    [self.moneys addObject:money];
}

-(void) takeMoney:(RGSMoney *) money{
    
}

#pragma mark - Notifications
-(void) subscribeToMemoryWarning:(NSNotificationCenter *)nc{
    [nc addObserver:self
           selector:@selector(dumpToDisk:)
               name:UIApplicationDidReceiveMemoryWarningNotification
             object:nil];
}

-(void) dumpToDisk:(NSNotification *)notification{
    //guarda las cosas en disco.
}
@end
