//
//  MGEStyle.m
//  MGEStyles
//
//  Created by Manu on 8/2/15.
//  Copyright (c) 2015 manuege. All rights reserved.
//

#import "MGEStyle.h"

@implementation MGEStyle
- (instancetype)initWithParent:(MGEStyle *)parent configuration:(MGEStyleConfigurationBlock)block
{
    NSAssert(block, @"A configuration block is mandatory");
    if (self = [super init]) {
        _parentStyle = parent;
        _configurationBlock = block;
    }
    
    return self;
}

+ (instancetype)styleWithConfigurationBlock:(MGEStyleConfigurationBlock)block
{
    return [MGEStyle styleWithParent:nil configuration:block];
}

+ (instancetype) styleWithParent:(MGEStyle *)parent configuration:(MGEStyleConfigurationBlock)block
{
    return [[MGEStyle alloc] initWithParent:parent configuration:block];
}
@end
