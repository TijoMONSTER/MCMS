//
//  BattleAccessory.m
//  MCMS
//
//  Created by Iván Mervich on 7/29/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "BattleAccessory.h"

@implementation BattleAccessory

- (id)initWithName:(NSString *)name points:(int)points
{
    self = [super init];
    self.name = name;
    self.points = points;

    return self;
}

- (NSString *)description
{
    return self.name;
}

@end
