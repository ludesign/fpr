//
//  TrackObject.h
//  FPRTest
//
//  Created by Toshko on 1/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

typedef enum {
    TrackObjectTypeObstacle = 0,
    TrackObjectTypeMysteryCrate,
    TrackObjectTypeCoin
} TrackObjectType;

typedef enum {
    TrackObstacleTypeSlow = 0,
    TrackObstacleTypeStop
} TrackObstacleType;

@interface TrackObject : CCSprite

@property (nonatomic, assign) BOOL isVisible;
@property (nonatomic, readonly) TrackObjectType objectType;

// Track objects will be reused
- (void)setType:(TrackObjectType)type;
- (void)setSpriteWithName:(NSString *)spriteFrameName;

@end
