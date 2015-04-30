//
//  StyleRegister.m
//  MGEStyles
//
//  Created by Manu on 8/2/15.
//  Copyright (c) 2015 manuege. All rights reserved.
//

#import "StyleRegister.h"
#import "MGEStyles.h"

@implementation StyleRegister
+ (void)registerStyles {
    
    MGEStylesManager * manager = [MGEStylesManager sharedManager];
    
    //Create a parent label style
    MGEStyle * baseStyle = [MGEStyle styleWithConfigurationBlock:^(UILabel *responder) {
        responder.font = [UIFont boldSystemFontOfSize:56];
        responder.numberOfLines = 0;
    }];
    
    MGEStyle * defaultStyle = [MGEStyle styleWithParent:baseStyle
                                          configuration:^(UILabel *label) {
                                              label.textColor = [UIColor redColor];
                                              label.textAlignment = NSTextAlignmentCenter;
                                          }];
    
    
    [manager registerStyle:defaultStyle withKey:@"DefaultText"];
    
    //Create a secondary label style
    MGEStyle * secondaryStyle = [MGEStyle styleWithConfigurationBlock:^(UILabel *responder) {
        responder.textColor = [UIColor blueColor];
        responder.textAlignment = NSTextAlignmentRight;
        responder.font = [UIFont italicSystemFontOfSize:30];
        responder.numberOfLines = 0;
    }];
    
    [manager registerStyle:secondaryStyle withKey:@"SecondaryText"];
    
    //Create a button style
    MGEStyle * buttonStyle = [MGEStyle styleWithConfigurationBlock:^(UIButton *responder) {
       
        responder.tintColor = [UIColor purpleColor];
        responder.titleLabel.font = [UIFont boldSystemFontOfSize:22];
        
    }];
    
    [manager registerStyle:buttonStyle withKey:@"ButtonStyle"];
    
}
@end
