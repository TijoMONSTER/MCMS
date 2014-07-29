//
//  EditCreatureViewController.m
//  MCMS
//
//  Created by Iván Mervich on 7/29/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "EditCreatureViewController.h"

@interface EditCreatureViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation EditCreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.nameLabel.text = self.creature.name;
    self.descriptionLabel.text = self.creature.description;
}

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender
{
    // click on edit
    if ([sender.title isEqualToString:@"Edit"]) {
        sender.title = @"Done";

        self.nameTextField.hidden = NO;
        self.nameTextField.selected = YES;
        self.nameTextField.text = self.creature.name;
    }
    // click on done
    else {
        sender.title = @"Edit";

        // set the name
        self.creature.name = self.nameTextField.text;
        self.nameLabel.text = self.creature.name;

        // hide the textField
        self.nameTextField.hidden = YES;
        [self.nameTextField resignFirstResponder];
    }
}

@end
