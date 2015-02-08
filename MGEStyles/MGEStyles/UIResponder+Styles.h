//
//  UIResponder+Styles.h
//  MGEStyles
//
//  Created by Manu on 8/2/15.
//  Copyright (c) 2015 manuege. All rights reserved.
//

#define IS_IB_INSPECTABLE

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

#ifdef IS_IB_INSPECTABLE
/**
 This property is needed for the *IBInspectable* feature.
 It is always better to use the `mge_applyRegisteredStyleWithKey` instead of this one.
*/
@property (nonatomic) IBInspectable NSString *styleName;
#endif

@end
