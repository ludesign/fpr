//
//  Obstacle.m
//  FPRTest
//
//  Created by Toshko on 1/27/13.
//
//

#import "Obstacle.h"

@implementation Obstacle

+ (id)obstacle
{
    return [[[self alloc] init] autorelease];
}

+ (id)slowObstacle
{
    return [[[self alloc] initWithSubtype:TrackObstacleTypeSlow] autorelease];
}

+ (id)stopObstacle
{
    return [[[self alloc] initWithSubtype:TrackObstacleTypeStop] autorelease];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.objectType = TrackObjectTypeObstacle;
        self.objectSubtype = TrackObjectSubtypeInvalid;
    }
    return self;
}

- (id)initWithSubtype:(TrackObjectSubtype)subtype
{
    self = [super init];
    if (self)
    {
        self.objectType = TrackObjectTypeObstacle;
        self.objectSubtype = subtype;
    }
    return self;
}

@end
