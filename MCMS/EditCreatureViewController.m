//
//  EditCreatureViewController.m
//  MCMS
//
//  Created by Iván Mervich on 7/29/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "EditCreatureViewController.h"

@interface EditCreatureViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation EditCreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.nameLabel.text = self.creature.name;
    self.descriptionLabel.text = self.creature.description;
    self.imageView.image = self.creature.picture;
}

- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender
{
    // click on edit
    if ([sender.title isEqualToString:@"Edit"]) {
        sender.title = @"Done";

        // set and show the textfield and textview
        self.nameTextField.hidden = NO;
        self.nameTextField.text = self.creature.name;

        self.descriptionTextView.hidden = NO;
        self.descriptionTextView.text = self.creature.description;
    }
    // click on done
    else {
        sender.title = @"Edit";

        // set the name
        self.creature.name = self.nameTextField.text;
        self.nameLabel.text = self.creature.name;

        // set the description
        self.creature.description = self.descriptionTextView.text;
        self.descriptionLabel.text = self.creature.description;

        // hide the textField and textview
        self.nameTextField.hidden = YES;
        self.descriptionTextView.hidden = YES;
        [self.nameTextField resignFirstResponder];
        [self.descriptionTextView resignFirstResponder];
    }
}

@end
