//
//  NSObject+GNUStepAddons.m
//  Wallet
//
//  Created by Ramiro García Salazar on 7/2/16.
//  Copyright © 2016 Ramiro García Salazar. All rights reserved.
//

#import "NSObject+GNUStepAddons.h"
#import <objc/runtime.h>


@implementation NSObject (GNUStepAddons)

-(id) subclassResponsibility: (SEL)aSel{
    char prefix = class_isMetaClass(object_getClass(self)) ? '+' : '-';
    
    [NSException raise:NSInvalidArgumentException
                format:@"%@%c%@ sould be overriden by its subclass",
     NSStringFromClass([self class]), prefix, NSStringFromSelector(aSel)];
    
    return self;
}

@end
