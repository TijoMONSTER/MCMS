//
//  BattleViewController.m
//  MCMS
//
//  Created by Iván Mervich on 7/29/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "BattleViewController.h"
#import "ViewController.h"
#import "BattleAccessory.h"

@interface BattleViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *opponentCreatures;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *winnerImageView;


@end

@implementation BattleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    ViewController *rootViewController = self.navigationController.viewControllers[0];

    self.opponentCreatures = [NSMutableArray arrayWithArray:rootViewController.creatures];
    // remove the current creature from the oponents
    [self.opponentCreatures removeObject:self.creatureThatWillFight];

}

#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    MagicalCreature *creature = [self.opponentCreatures objectAtIndex:indexPath.row];

    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.description;

    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.opponentCreatures count];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // fight!
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [self doBattleWithOpponent: [self.opponentCreatures objectAtIndex:indexPath.row]];
}

#pragma mark Helper methods

- (void)doBattleWithOpponent:(MagicalCreature *)opponent
{
    MagicalCreature *winner;

    float creaturePoints = 0.0f;
    float opponentPoints = 0.0f;

    BattleAccessory *battleAccessory;

    // add the battle points
    for (battleAccessory in self.creatureThatWillFight.accessories) {
        creaturePoints += [self calculateBattleAccessoryPoints:battleAccessory];
    }
    for (battleAccessory in opponent.accessories) {
        opponentPoints += [self calculateBattleAccessoryPoints:battleAccessory];
    }

    // set the winner based on the highest score
    winner = creaturePoints > opponentPoints ? self.creatureThatWillFight : opponent;

    self.winnerLabel.hidden = NO;
    self.winnerLabel.text = [NSString stringWithFormat:@"The winner is: \n%@!", winner.name];
    self.winnerImageView.image = winner.picture;
}

- (float)calculateBattleAccessoryPoints:(BattleAccessory *)accessory
{
    float points = 0.0;
    float randomNumber = arc4random() % 100;

    if ([accessory.name isEqualToString:@"Rock"]) {
        // if randomNumber between 0 and 100 is lower than 25
        if (randomNumber < 25) {
            points += (arc4random() % 25) * randomNumber;
        }
    }
    else if ([accessory.name isEqualToString:@"Scissors"]) {
        // if randomNumber between 0 and 100 is lower than 45
        if (randomNumber < 45) {
            points += (arc4random() % 45) * randomNumber;
        }
    }
    else if ([accessory.name isEqualToString:@"Paper"]) {
        // if randomNumber between 0 and 100 is lower than 65
        if (randomNumber < 65) {
            points += (arc4random() % 65) * randomNumber;
        }
    }

    return points;
}

@end
