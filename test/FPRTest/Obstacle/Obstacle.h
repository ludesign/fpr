//
//  Obstacle.h
//  FPRTest
//
//  Created by Toshko on 1/27/13.
//
//

#import "BaseTrackObject.h"

@interface Obstacle : BaseTrackObject

- (id)initWithSubtype:(TrackObjectSubtype)subtype;

+ (id)obstacle;
+ (id)slowObstacle;
+ (id)stopObstacle;

@end
