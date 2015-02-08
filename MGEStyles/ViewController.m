//
//  ViewController.m
//  MGEStyles
//
//  Created by Manu on 8/2/15.
//  Copyright (c) 2015 manuege. All rights reserved.
//

#import "ViewController.h"
#import "MGEStyles.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)toggleStyle:(UIButton *)sender {
    
    NSString * key = nil;
    if (sender.selected) {
        key = @"DefaultText";
    }
    
    else {
        key = @"SecondaryText";
    }
    
    [self.label mge_applyRegisteredStyleWithKey:key];
    NSLog(@"%@", self.label.styleName);
    
    sender.selected = !sender.selected;
    
    
}
@end
