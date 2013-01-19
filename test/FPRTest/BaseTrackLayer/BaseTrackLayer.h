//
//  BaseTrackLayer.h
//  FPRTest
//
//  Created by Toshko on 1/5/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

//  Number of sprites being moved around in the layer to simulate endless background
#define TRACK_SPRITES_COUNT             5


/**
 *  TrackLayerInterface protocol -------------------------------------
 *  Protocol serving the purpose of providing a unified interface to
 *  all classes extending the BaseTrackLayer class. All methods
 *  declared here are implemented in the BaseTrackLayer class to call
 *  the - (void)doesNotRecogniseSelector:(SEL)aSelector method to make
 *  sure they are implemented in the child classes. Due to that, be
 *  careful not to call the super implementation when implementing
 *  these methods in the child classes.
 */

@protocol TrackLayerInterface <NSObject>

- (void)startMovingWithSpeed:(float)speed;
- (void)stopMoving;

@end


/**
 *  BaseTrackLayer class ---------------------------------------------
 *  Empty class serving the purpose of being extended by all the track
 *  layer classes representing each track in the game. Interface is
 *  provided by the TrackLayerInterface protocol.
 */

@interface BaseTrackLayer : CCLayer <TrackLayerInterface>

@end
