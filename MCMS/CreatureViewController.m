//
//  EditCreatureViewController.m
//  MCMS
//
//  Created by Iván Mervich on 7/29/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "CreatureViewController.h"
#import "BattleAccessory.h"
#import "BattleViewController.h"

@interface CreatureViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITableView *accessoriesTableView;


@end

@implementation CreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];


    self.nameLabel.text = self.creature.name;
    self.descriptionLabel.text = self.creature.description;
    self.imageView.image = self.creature.picture;

    // allow multiple selection
    self.accessoriesTableView.allowsMultipleSelection = YES;

    NSLog(@"self creature accessories %@", self.creature.accessories);
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.availableBattleAccessories count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    BattleAccessory *battleAccessory = [self.availableBattleAccessories objectAtIndex:indexPath.row];

    cell.textLabel.text = battleAccessory.name;

    if ([self.creature.accessories containsObject:battleAccessory]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    BattleAccessory *selectedAccessory = [self.availableBattleAccessories objectAtIndex:indexPath.row];

    // if the creature has the selected accessory, remove it, otherwise add it
    if (![self.creature.accessories containsObject:selectedAccessory]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [self.creature.accessories addObject:selectedAccessory];
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [self.creature.accessories removeObject:selectedAccessory];
    }

    // deselect row
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma mark IBActions

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

#pragma mark Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ShowBattleSegue"]) {

        BattleViewController *battleVC = (BattleViewController *) segue.destinationViewController;
        battleVC.creatureThatWillFight = self.creature;
    }
}


@end
