//
//  MagicalCreature.h
//  MCMS
//
//  Created by Iván Mervich on 7/29/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject

@property NSString *name;
@property NSString *description;
@property UIImage *picture;

- (instancetype) initWithName:(NSString *)name description:(NSString *)description picture:(UIImage *)picture;

@end
