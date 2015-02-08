//
//  UIResponder+Styles.m
//  MGEStyles
//
//  Created by Manu on 8/2/15.
//  Copyright (c) 2015 manuege. All rights reserved.
//

#import "UIResponder+Styles.h"
#import "MGEStyles.h"
#import <objc/runtime.h>

NSString const *StyleNameKey = @"com.manuege.uiresponderstylenamekey";

@implementation UIResponder (Styles)

- (void)mge_applyRegisteredStyleWithKey:(NSString *)key
{
    MGEStyle *style = [[MGEStylesManager sharedManager] registeredStyleWithKey:key];
    
    NSAssert(style, @"There is not a registered style with the key: %@", key);
    
    [self mge_applyStyle:style];
    objc_setAssociatedObject(self, &StyleNameKey, key, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void) mge_applyStyle:(MGEStyle *)style
{
    NSAssert(style, @"Style can not be nil");
    
    if (style.parentStyle) {
        [self mge_applyStyle:style.parentStyle];
    }
    
    style.configurationBlock(self);
    objc_setAssociatedObject(self, &StyleNameKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void) setStyleName:(NSString *)styleName
{
    if (styleName.length > 0) {
       [self mge_applyRegisteredStyleWithKey:styleName];
    }
}

- (NSString *) styleName
{
    return objc_getAssociatedObject(self, &StyleNameKey);
}

@end
