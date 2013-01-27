//
//  TrackObjectsQueue.h
//  FPRTest
//
//  Created by Toshko on 1/21/13.
//
//

#import <Foundation/Foundation.h>


@class BaseTrackObject;

@interface TrackObjectsQueue : NSObject

- (void)queueTrackObject:(BaseTrackObject *)trackObject;
- (BaseTrackObject *)dequeueTrackObject;

@end
