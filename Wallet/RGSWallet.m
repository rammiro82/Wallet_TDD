//
//  RGSWallet.m
//  Wallet
//
//  Created by Ramiro García Salazar on 10/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

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
@end
