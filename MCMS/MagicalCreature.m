//
//  MagicalCreature.m
//  MCMS
//
//  Created by Iván Mervich on 7/29/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

- (instancetype) initWithName:(NSString *)name description:(NSString *)description picture:(UIImage *)picture
{
    self = [super init];
    self.name = name;
    self.description = description;
    self.picture = picture;

    return self;
}

@end
