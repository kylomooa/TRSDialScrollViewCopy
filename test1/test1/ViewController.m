//
//  ViewController.m
//  test
//
//  Created by 毛强 on 2016/11/3.
//  Copyright © 2016年 maoqiang. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self addObserver:self forKeyPath:@"self.view.backgroundColor" options:NSKeyValueObservingOptionNew context:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"self.view.backgroundColor"]) {
        NSLog(@"--->%@", self.view.backgroundColor);
        if ([self isEqualToNavColor:self.view.backgroundColor redValue:10 greenValue:20 blueValue:30 alphaValue:1]) {
            NSLog(@"ok");
        }else{
            self.view.backgroundColor = [UIColor colorWithRed:10 green:20 blue:30 alpha:1];
        }
    }
}

-(void)dealloc{
    [self removeObserver:self forKeyPath:@"self.view.backgroundColor"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0 green:0 blue:30 alpha:1];
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    
}

-(BOOL)isEqualToNavColor:(UIColor *)color redValue:(CGFloat)rValue greenValue:(CGFloat)gValue blueValue:(CGFloat)bValue alphaValue:(CGFloat)aValue{
    
    CGFloat redValue; CGFloat greenValue; CGFloat blueValue; CGFloat alphaValue;
    
    if ([color getRed:&redValue green:&greenValue blue:&blueValue alpha:&alphaValue]) {
        if (redValue == rValue && greenValue == gValue && blueValue == bValue && alphaValue == aValue) {
            return YES;
        }
    }
    return NO;
}

@end
