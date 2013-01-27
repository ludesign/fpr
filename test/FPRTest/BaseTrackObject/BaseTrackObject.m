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

- (void)dealloc
{
    CCLOG(@"DEALLOCATING TRACK OBJECT");
    [super dealloc];
}

@end
