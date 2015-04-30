//
//  UIResponder+StylesPrivate.h
//  MGEStyles
//
//  Created by Manue on 21/4/15.
//  Copyright (c) 2015 manuege. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIResponder (StylesPrivate)
/**
 This property is needed for the *IBInspectable* feature, but shouldn't be called directly.
 It is always better to use the `mge_applyRegisteredStyleWithKey` instead of this one.
 */
@property (nonatomic) IBInspectable NSString * mgeStyle;
@end
