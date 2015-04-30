//
//  UIResponder+Styles.h
//  MGEStyles
//
//  Created by Manu on 8/2/15.
//  Copyright (c) 2015 manuege. All rights reserved.
//


#import <UIKit/UIKit.h>

@class MGEStyle;

@interface UIResponder (Styles)

/**
 Apply the given style to the receiver. 
 \param style the style to apply
 */
- (void) mge_applyStyle:(MGEStyle *) style;

/**
 Apply the registered style under the given key to the receiver.
 \param key the key of the registered style
 */
- (void) mge_applyRegisteredStyleWithKey:(NSString *) key;

/**
 \return the current `MGEStyle` of the responder (if any)
 */
- (MGEStyle *) mge_style;

/**
 \return the registered name for the current `MGEStyle` of the responder (if any). 
 It will return nil if the style were applied using `mge_applyStyle:`
 */
- (NSString *) mge_styleName;

@end
