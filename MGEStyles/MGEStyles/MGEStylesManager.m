//
//  MGEStylesManager.m
//  MGEStyles
//
//  Created by Manu on 8/2/15.
//  Copyright (c) 2015 manuege. All rights reserved.
//

#import "MGEStylesManager.h"

@interface MGEStylesManager ()
{
    NSMutableDictionary *_registeredStyles;
}
@end

@implementation MGEStylesManager

+ (id)sharedManager {
    static MGEStylesManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (id)init {
    if (self = [super init]) {
        _registeredStyles = [NSMutableDictionary new];
    }
    return self;
}

#pragma mark - Register and unregister
- (NSDictionary *) registeredStyles
{
    return _registeredStyles.copy;
}

- (MGEStyle *)registeredStyleWithKey:(NSString *)key
{
    return _registeredStyles[key];
}

- (void) registerStyle:(MGEStyle *)style withKey:(NSString *)key
{
    if (style) {
        _registeredStyles[key] = style;
    }
    
    else {
        [self unregisterStyleWithKey:key];
    }
}

- (void) unregisterStyleWithKey:(NSString *)key
{
    [_registeredStyles removeObjectForKey:key];
}

@end
