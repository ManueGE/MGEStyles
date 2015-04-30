//
//  MGEStyle.h
//  MGEStyles
//
//  Created by Manu on 8/2/15.
//  Copyright (c) 2015 manuege. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^MGEStyleConfigurationBlock)(id responder);

@interface MGEStyle : NSObject

///If set, instances will call the `configurationBlock`of it parents before call its own block
@property (nonatomic, strong, readonly) MGEStyle * parentStyle;

///the block used to configure the items when the style is applied
@property (nonatomic, copy, readonly) MGEStyleConfigurationBlock configurationBlock;

- (instancetype) initWithParent:(MGEStyle *) parent configuration:(MGEStyleConfigurationBlock) block;

+ (instancetype) styleWithConfigurationBlock:(MGEStyleConfigurationBlock) block;
+ (instancetype) styleWithParent:(MGEStyle *) parent configuration:(MGEStyleConfigurationBlock) block;

@end
