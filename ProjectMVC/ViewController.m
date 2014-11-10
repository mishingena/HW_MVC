//
//  ViewController.m
//  ProjectMVC
//
//  Created by itisioslab on 10.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize butt, switcher, text, slider, segmentControl;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSData *colorData = [[NSUserDefaults standardUserDefaults] objectForKey:@"color"];
    butt.backgroundColor = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"switch"]);
    //[switcher setOn:YES animated:YES];
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"switch"] isEqualToString:@"YES"]) [switcher setOn:YES animated:YES]; else [switcher setOn:NO animated:YES];
	// Do any additional setup after loading the view, typically from a nib.
    text.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"text"];
    slider.value = [[[NSUserDefaults standardUserDefaults] objectForKey:@"slider"] floatValue];
    segmentControl.selectedSegmentIndex = [[[NSUserDefaults standardUserDefaults] objectForKey:@"segment"] integerValue];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIColor *)randColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    return color;
}

- (IBAction)switchToggled:(UISwitch *)sender {
    //UISwitch *mySwitch = (UISwitch *)sender;
    NSString *value;
    value = [switcher isOn] ? @"YES" : @"NO";
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:@"switch"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)sliderTouched:(id)sender {
    NSString *value = [NSString stringWithFormat:@"%f", slider.value ];
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:@"slider"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (IBAction)segmentControlPressed:(id)sender {
    NSString *value;
    value = [NSString stringWithFormat:@"%li", (long)segmentControl.selectedSegmentIndex];
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:@"segment"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (IBAction)pressedButton:(UIButton *)sender {
    UIColor *color = [self randColor];
    [[NSUserDefaults standardUserDefaults] setObject:text.text forKey:@"text"];
    butt.backgroundColor = color;
    
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:color];
    [[NSUserDefaults standardUserDefaults] setObject:colorData forKey:@"color"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
