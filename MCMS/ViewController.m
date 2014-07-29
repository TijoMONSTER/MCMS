//
//  ViewController.m
//  MCMS
//
//  Created by Iván Mervich on 7/29/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    MagicalCreature *fairy = [[MagicalCreature alloc] init];
    fairy.name = @"Fairy";
    fairy.description = @"It's a super powerful fairy!";
    MagicalCreature *unicorn = [[MagicalCreature alloc] init];
    unicorn.name = @"Unicorn";
    unicorn.description = @"Talking about unicorns, they were very tough creatures!";
    MagicalCreature *kraken = [[MagicalCreature alloc] init];
    kraken.name = @"Kraken";
    kraken.description = @"It's a kraken, 'nuff said";

    self.creatures = [NSMutableArray arrayWithObjects:fairy, unicorn, kraken, nil];
}

@end
