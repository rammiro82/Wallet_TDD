//
//  RGSFakeNotificationCenter.m
//  Wallet
//
//  Created by Ramiro García Salazar on 21/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "RGSFakeNotificationCenter.h"
@import UIKit;

@implementation RGSFakeNotificationCenter

-(id) init{
    if (self = [super init]) {
        _observers = [NSMutableDictionary dictionary];
    }
    
    return self;
}

- (void)addObserver:(id)notificationObserver
           selector:(SEL)notificationSelector
               name:(NSString *)notificationName
             object:(id)notificationSender{
    
    [self.observers setValue:notificationObserver
                      forKey:notificationName];
}


@end
