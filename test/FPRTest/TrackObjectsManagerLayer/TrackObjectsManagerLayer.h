//
//  TrackObjectsManagerLayer.h
//  FPRTest
//
//  Created by Toshko on 1/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "BaseTrackObject.h"

@interface TrackObjectsManagerLayer : CCLayer

@property (nonatomic, assign) CGFloat centerX;      // Point around which the objects will be placed
@property (nonatomic, assign) CGFloat radius;       // The horizontal radius around the center point within which an object can be placed

- (id)initWithSpriteSheetName:(NSString *)spriteSheetName;

- (void)addTrackObjectOfType:(TrackObjectType)objectType;

- (void)updatePositions:(CGFloat)offset;

@end
