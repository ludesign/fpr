//
//  TrackObstacle.m
//  FPRTest
//
//  Created by Toshko on 1/20/13.
//
//

#import "TrackObstacle.h"

@implementation TrackObstacle

- (id)initWithTrackObjectType:(TrackObjectType)objectType spriteFrameName:(NSString *)spriteFrameName
{
    self = [super initWithSpriteFrameName:spriteFrameName];
    if (self)
    {
        _objectType = objectType;
    }
    return self;
}

@end
