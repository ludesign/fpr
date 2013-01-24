//
//  TrackObject.m
//  FPRTest
//
//  Created by Toshko on 1/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TrackObject.h"


@interface TrackObject ()

@property (nonatomic, assign) TrackObjectType objectType;

@end

@implementation TrackObject

- (void)setType:(TrackObjectType)type
{
    _objectType = type;
}

- (void)setSpriteWithName:(NSString *)spriteFrameName
{
    [self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:spriteFrameName]];
}

@end
