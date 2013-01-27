//
//  BaseTrackObject.h
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
    TrackObjectSubtypeInvalid = -1,
    TrackObstacleTypeSlow,  // Applies only to objects of type TrackObjectTypeObstacle
    TrackObstacleTypeStop,
    TrackCoinTypeCopper,    // Applies only to objects of type TrackObjectTypeCoin
    TrackCoinTypeSilver,
    TrackCoinTypeGold
} TrackObjectSubtype;


@interface BaseTrackObject : CCSprite

@property (nonatomic, assign) BOOL isVisible;
@property (nonatomic, assign) TrackObjectType objectType;
@property (nonatomic, assign) TrackObjectSubtype objectSubtype;

// Objects will be reused
- (void)setSpriteWithName:(NSString *)spriteFrameName;

@end
