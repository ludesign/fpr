//
//  TrackObjectsQueue.m
//  FPRTest
//
//  Created by Toshko on 1/21/13.
//
//

#import "TrackObjectsQueue.h"
#import "TrackObject.h"


#define INITIAL_CAPACITY                5               // Initial capacity for both the set and the array
#define UPDATE_INTERVAL                 0.2f            // Interval between consequent checks for object visibility

@interface TrackObjectsQueue ()

@property (nonatomic, retain) NSMutableSet *reusableTrackObjects;

@end

@implementation TrackObjectsQueue

- (void)queueTrackObject:(TrackObject *)trackObject
{
    if (nil == trackObject)
    {
        return;
    }
    
    [_reusableTrackObjects addObject:trackObject];
}

- (TrackObject *)dequeueTrackObject
{
    if (0 == [_reusableTrackObjects count])
    {
        return nil;
    }
    
    TrackObject *trObject = [[_reusableTrackObjects anyObject] retain];
    [_reusableTrackObjects removeObject:trObject];
    trObject.isVisible = YES;
    return [trObject autorelease];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.reusableTrackObjects = [NSMutableSet setWithCapacity:INITIAL_CAPACITY];
    }
    return self;
}

- (void)dealloc
{
    self.reusableTrackObjects = nil;
    [super dealloc];
}

@end
