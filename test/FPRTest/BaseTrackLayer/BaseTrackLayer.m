//
//  BaseTrackLayer.m
//  FPRTest
//
//  Created by Toshko on 1/5/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "BaseTrackLayer.h"


@implementation BaseTrackLayer

- (void)addObstacle
{
    [self doesNotRecognizeSelector:_cmd];
}

- (void)addMysteryCrate
{
    [self doesNotRecognizeSelector:_cmd];
}

- (void)addCoin
{
    [self doesNotRecognizeSelector:_cmd];
}

- (void)startMoving
{
    [self doesNotRecognizeSelector:_cmd];
}

- (void)stopMoving
{
    [self doesNotRecognizeSelector:_cmd];
}

- (void)dealloc
{
    self.trackObjectsLayer = nil;
    [super dealloc];
}

@end
