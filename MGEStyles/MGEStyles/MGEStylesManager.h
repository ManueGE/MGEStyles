//
//  MGEStylesManager.h
//  MGEStyles
//
//  Created by Manu on 8/2/15.
//  Copyright (c) 2015 manuege. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MGEStyle;

/**
 Used to store the registered styles and keys
 */
@interface MGEStylesManager : NSObject

/**
 \return the shared manager
 */
+ (id)sharedManager;

/**
 Regiter a new style under the given key. If a style with that key already exists, it will
 be overriden. If style is nil, the style with the key will be unregistered.
 \param style the style to register.
 \param key the key used to store the style
 */
- (void) registerStyle:(MGEStyle *) style withKey:(NSString *) key;

/**
 Unregister the style aunder the given key.
 \param key the key that will be removed
 */
- (void) unregisterStyleWithKey:(NSString *) key;

/**
 \return a dictionary with all the regitered styles and its keys
 */
- (NSDictionary *) registeredStyles;

/**
 Find the registered style for a given key
 \param key the key 
 \return the style registered under the given key, nil if a there is no such style
 */
- (MGEStyle *) registeredStyleWithKey:(NSString *) key;


@end
