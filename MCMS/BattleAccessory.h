//
//  BattleAccessory.h
//  MCMS
//
//  Created by Iván Mervich on 7/29/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BattleAccessory : NSObject

@property NSString *name;
@property int points;

- (id)initWithName:(NSString *)name points:(int)points;

@end
