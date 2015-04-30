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
NSString const *StyleKey = @"com.manuege.uiresponderstylekey";

@implementation UIResponder (Styles)

#pragma mark - apply styles
- (void)mge_applyRegisteredStyleWithKey:(NSString *)key
{
    MGEStyle *style = [[MGEStylesManager sharedManager] registeredStyleWithKey:key];
    
    NSAssert(style, @"There is not a registered style with the key: %@", key);
    
    [self mge_applyStyle:style];
	[self mge_setStyleName:key];
}

- (void) mge_applyStyle:(MGEStyle *)style
{
    NSAssert(style, @"Style can not be nil");
    
    if (style.parentStyle) {
        [self mge_applyStyle:style.parentStyle];
    }
    
    style.configurationBlock(self);
	[self mge_setStyleName:nil];
	[self mge_setStyle:style];
	
}

#pragma mark - getters and setters

- (void) mge_setStyleName:(NSString *) styleName
{
	objc_setAssociatedObject(self, &StyleNameKey, styleName, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *) mge_styleName
{
	return objc_getAssociatedObject(self, &StyleNameKey);
}

- (void) mge_setStyle:(MGEStyle *) stlye
{
	objc_setAssociatedObject(self, &StyleKey, stlye, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (MGEStyle *) mge_style
{
	return objc_getAssociatedObject(self, &StyleKey);
}

#pragma mark - Interface builder methods
- (void) setMgeStyle:(NSString *) styleName
{
	if (styleName.length > 0) {
		[self mge_applyRegisteredStyleWithKey:styleName];
	}
}

- (NSString *) mgeStyle
{
	return [self mge_styleName];
}

@end
