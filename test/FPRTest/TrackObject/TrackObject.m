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

- (void)reassignType:(TrackObjectType)type spriteFrameName:(NSString *)spriteFrameName
{
    _objectType = type;
    [self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:spriteFrameName]];
}

- (id)initWithType:(TrackObjectType)type spriteFrameName:(NSString *)spriteFrameName
{
    self = [super initWithSpriteFrameName:spriteFrameName];
    if (self)
    {
        _objectType = type;
    }
    return self;
}

@end
