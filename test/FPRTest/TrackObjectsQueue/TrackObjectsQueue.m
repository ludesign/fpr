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

@property (nonatomic, retain) NSMutableArray *visibleTrackObjects;
@property (nonatomic, retain) NSMutableSet *reusableTrackObjects;

@end

@implementation TrackObjectsQueue

- (void)checkTrackObjectsVisibility
{
    NSUInteger count = [_visibleTrackObjects count];
    
    // Not using fast enumeration in order to be able to modify the contents of the array
    for (unsigned i = 0; i < count; i++)
    {
        TrackObject *trObject = _visibleTrackObjects[i];
        if (trObject.position.y < -(trObject.contentSize.height / 2.0f))
        {
            [_reusableTrackObjects addObject:trObject];
            [_visibleTrackObjects removeObjectAtIndex:i];
        }
    }
}

- (void)startTrackingTrackObject:(TrackObject *)trackObject
{
    [_visibleTrackObjects addObject:trackObject];
    if (1 == [_visibleTrackObjects count])
    {   // This is the first object added - start checking for non-visible objects
        [[[CCDirector sharedDirector] scheduler] scheduleSelector:@selector(checkTrackObjectsVisibility) forTarget:self interval:UPDATE_INTERVAL paused:NO];
    }
}

- (TrackObject *)dequeueTrackObject
{
    if (0 == [_reusableTrackObjects count])
    {
        return nil;
    }
    
    TrackObject *trObject = [[_reusableTrackObjects anyObject] retain];
    [_reusableTrackObjects removeObject:trObject];
    return [trObject autorelease];
}

- (id)init
{
    self = [super init];
    if (self)
    {
        self.visibleTrackObjects = [NSMutableArray arrayWithCapacity:INITIAL_CAPACITY];
        self.reusableTrackObjects = [NSMutableSet setWithCapacity:INITIAL_CAPACITY];
    }
    return self;
}

- (void)dealloc
{
    self.visibleTrackObjects = nil;
    self.reusableTrackObjects = nil;
    [super dealloc];
}

@end
