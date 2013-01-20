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

@interface TrackObject : CCSprite

@property (nonatomic, readonly) TrackObjectType objectType;

- (id)initWithType:(TrackObjectType)type spriteFrameName:(NSString *)spriteFrameName;

- (void)reassignType:(TrackObjectType)type spriteFrameName:(NSString *)spriteFrameName;

@end
