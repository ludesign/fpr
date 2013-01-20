//
//  TrackScene.m
//  FPRTest
//
//  Created by Toshko on 12/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "TrackScene.h"
#import "ForestTrackLayer.h"

#define TRACKS_COUNT                    1
#define TRACK_NAME1                     @"Forest"


@interface TrackScene ()

@property (nonatomic, assign) NSUInteger trackIndex;

@property (nonatomic, retain) BaseTrackLayer <TrackLayerInterface> *trackLayer;

@end

@implementation TrackScene

static NSString *trackNames[] = {TRACK_NAME1};

- (void)setTrackWithIndex:(NSUInteger)trackIndex
{
    NSAssert(trackIndex < TRACKS_COUNT, @"INVALID TRACK INDEX");
    
    self.trackIndex = trackIndex;
    
    if (nil != _trackLayer)
    {
        [self removeChild:_trackLayer cleanup:YES];
    }
    
    Class TrackLayerClass = NSClassFromString([NSString stringWithFormat:@"%@TrackLayer", trackNames[trackIndex]]);
    self.trackLayer = [[[TrackLayerClass alloc] init] autorelease];
    [self addChild:_trackLayer];
    [_trackLayer startMovingWithSpeed:350.0f];
}

#pragma mark - Memory management

- (void)dealloc
{
    self.trackLayer = nil;
    [super dealloc];
}

- (id)init
{
    self = [super init];
    if (self)
    {   // Custom initialization
        
    }
    return self;
}

@end
