//
//  TrackObjectsManagerLayer.m
//  FPRTest
//
//  Created by Toshko on 1/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TrackObjectsManagerLayer.h"
#import "TrackObjectsQueue.h"


@interface TrackObjectsManagerLayer ()

@property (nonatomic, retain) TrackObjectsQueue *objectsQueue;

@property (nonatomic, retain) NSArray *obstacleNamesArray;
@property (nonatomic, retain) CCSpriteBatchNode *obstaclesBatchNode;
@property (nonatomic, assign) CCSprite *lastObject;

@end

@implementation TrackObjectsManagerLayer

#pragma mark - Track objects adding

- (void)addTrackObjectOfType:(TrackObjectType)objectType
{
    TrackObject *trObject = [_objectsQueue dequeueTrackObject];
    if (nil == trObject)
    {
        trObject = [[TrackObject alloc] init];
        [_objectsQueue startTrackingTrackObject:trObject];
    }
    [trObject setType:objectType];
    
    [self assignSpriteToTrackObject:trObject];
    [self assignPositionOnTrackObject:trObject];
    _lastObject = trObject;
    [self addChild:trObject];
    [trObject release];
}

- (void)assignPositionOnTrackObject:(TrackObject *)trObject
{
    
}

- (void)assignSpriteToTrackObject:(TrackObject *)trObject
{
    switch (trObject.objectType) {
        case TrackObjectTypeObstacle:
        {
            NSUInteger spriteIndex = arc4random() % [_obstacleNamesArray count];
            NSString *spriteName = [_obstacleNamesArray[spriteIndex] objectForKey:@"name"];
            [trObject setSpriteWithName:spriteName];
        }
            break;
            
        case TrackObjectTypeMysteryCrate:
            // Not yet
            break;
            
        case TrackObjectTypeCoin:
            // Not yet
            break;
            
        default:
            break;
    }
}

#pragma mark - Memory management

- (void)dealloc
{
    self.obstaclesBatchNode = nil;
    self.objectsQueue = nil;
    self.obstacleNamesArray = nil;
    [super dealloc];
}

- (id)initWithSpriteSheetName:(NSString *)spriteSheetName
{
    self = [super init];
    if (self)
    {
        self.objectsQueue = [[[TrackObjectsQueue alloc] init] autorelease];
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"%@.plist", spriteSheetName]];
        self.obstaclesBatchNode = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"%@.png", spriteSheetName]];
        [self addChild:_obstaclesBatchNode];
        
        NSString *defFileName = [NSString stringWithFormat:@"%@-def", spriteSheetName];
        NSString *obstaclesDefFilePath = [[NSBundle mainBundle] pathForResource:defFileName ofType:@"plist"];
        self.obstacleNamesArray = [NSArray arrayWithContentsOfFile:obstaclesDefFilePath];
    }
    return self;
}

@end
