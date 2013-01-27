//
//  BaseTrackObject.m
//  FPRTest
//
//  Created by Toshko on 1/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BaseTrackObject.h"


@implementation BaseTrackObject

- (void)setSpriteWithName:(NSString *)spriteFrameName
{
    [self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:spriteFrameName]];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        _isVisible = YES;
    }
    return self;
}

@end
