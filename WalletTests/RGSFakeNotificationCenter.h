//
//  RGSFakeNotificationCenter.h
//  Wallet
//
//  Created by Ramiro García Salazar on 21/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RGSFakeNotificationCenter : NSObject

@property (nonatomic, strong) NSDictionary *observers;

- (void)addObserver:(id)notificationObserver
           selector:(SEL)notificationSelector
               name:(NSString *)notificationName
             object:(id)notificationSender;

@end
