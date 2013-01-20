//
//  TrackObstacle.h
//  FPRTest
//
//  Created by Toshko on 1/20/13.
//
//

#import "cocos2d.h"

typedef enum {
    TrackObjectTypeSlow = 0,
    TrackObjectTypeStop
} TrackObjectType;

@interface TrackObstacle : CCSprite

@property (nonatomic, assign) TrackObjectType objectType;

- (id)initWithTrackObjectType:(TrackObjectType)objectType spriteFrameName:(NSString *)spriteFrameName;

@end
