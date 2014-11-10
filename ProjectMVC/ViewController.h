//
//  ViewController.h
//  ProjectMVC
//
//  Created by itisioslab on 10.11.14.
//  Copyright (c) 2014 itisioslab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>

- (IBAction)pressedButton:(UIButton *)sender;
- (IBAction)switchToggled:(UISwitch *)sender;
- (IBAction)sliderTouched:(id)sender;
- (IBAction)segmentControlPressed:(id)sender;

@property IBOutlet UIButton *butt;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property IBOutlet UISwitch *switcher;
@property (weak, nonatomic) IBOutlet UITextField *text;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;


@end
