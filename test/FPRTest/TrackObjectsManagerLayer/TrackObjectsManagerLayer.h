//
//  TrackObjectsManagerLayer.h
//  FPRTest
//
//  Created by Toshko on 1/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface TrackObjectsManagerLayer : CCLayer

@property (nonatomic, assign) CGPoint centerPoint;  // Point around which the objects will be placed
@property (nonatomic, assign) CGFloat radius;       // The horizontal radius around the center point within which an object can be placed

@property (nonatomic, assign) CGFloat minDistance;  // Minimum distance to be established between the last object on screen and the next one

- (id)initWithSpriteSheetName:(NSString *)spriteSheetName;

@end
