//
//  TrackObjectsQueue.h
//  FPRTest
//
//  Created by Toshko on 1/21/13.
//
//

#import <Foundation/Foundation.h>


@class TrackObject;

@interface TrackObjectsQueue : NSObject

- (void)queueTrackObject:(TrackObject *)trackObject;
- (TrackObject *)dequeueTrackObject;

@end
