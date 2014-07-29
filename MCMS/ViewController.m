//
//  ViewController.m
//  MCMS
//
//  Created by Iván Mervich on 7/29/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITableView *creatureTableView;
@property (weak, nonatomic) IBOutlet UITextField *addCreatureTextField;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    MagicalCreature *fairy = [[MagicalCreature alloc] initWithName:@"Fairy" description:@"It's a super powerful fairy!"];
    MagicalCreature *unicorn = [[MagicalCreature alloc] initWithName:@"Unicorn" description:@"Talking about unicorns, they were very tough creatures!"];
    MagicalCreature *kraken = [[MagicalCreature alloc] initWithName:@"Kraken" description:@"It's a kraken, 'nuff said"];

    self.creatures = [NSMutableArray arrayWithObjects:fairy, unicorn, kraken, nil];
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.creatures count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];

    cell.textLabel.text = creature.name;

    return cell;
}

#pragma mark UITextFieldDelegate

#pragma mark IBActions

- (IBAction)onAddCreatureButtonPressed:(UIBarButtonItem *)sender
{
    if ([self.addCreatureTextField.text length] > 0) {

        MagicalCreature *newCreature = [[MagicalCreature alloc] init];
        newCreature.name = self.addCreatureTextField.text;
        newCreature.description = @"No description... yet.";
        [self.creatures addObject:newCreature];

        [self.creatureTableView reloadData];

        self.addCreatureTextField.text = @"";
    }

    [self.addCreatureTextField resignFirstResponder];
}


@end
