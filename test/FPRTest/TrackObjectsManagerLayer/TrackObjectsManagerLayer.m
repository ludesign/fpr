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

@property (nonatomic, retain) NSMutableArray *objectsArray;
@property (nonatomic, retain) CCSpriteBatchNode *obstaclesBatchNode;
@property (nonatomic, assign) CCSprite *lastObject;

@end

@implementation TrackObjectsManagerLayer

#pragma mark - Update

- (void)updatePositions:(CGFloat)offset
{
    for (BaseTrackObject *trObject in _objectsArray)
    {
        if (trObject.position.y <= -(trObject.contentSize.height / 2.0f))
        {
            trObject.isVisible = NO;
            [_objectsQueue queueTrackObject:trObject];
            [self removeChild:trObject cleanup:NO];
            
            continue;
        }
        
        if ([trObject isVisible])
        {
            CGPoint position = trObject.position;
            position.y -= offset;
            trObject.position = position;
        }
    }
}

#pragma mark - Track objects adding

- (void)addTrackObjectOfType:(TrackObjectType)objectType
{
    BaseTrackObject *trObject = [_objectsQueue dequeueTrackObject];
    if (nil == trObject)
    {
        trObject = [[[BaseTrackObject alloc] init] autorelease];
        [_objectsArray addObject:trObject];
    }
    
    [trObject setType:objectType];
    [self assignSpriteToTrackObject:trObject];
    [self assignPositionOnTrackObject:trObject];
    [self addChild:trObject];
    _lastObject = trObject;
}

- (void)assignPositionOnTrackObject:(BaseTrackObject *)trObject
{
    CGPoint objectPosition = ccp(0.0f, (trObject.contentSize.height / 2.0f) + self.contentSize.height);
    CGFloat centerOffset = _radius - (trObject.contentSize.width / 2.0f);
    centerOffset = arc4random() % (int)centerOffset;
    
    if (_lastObject)
    {
        NSInteger direction = (NSInteger)(_centerX - _lastObject.position.x);
        direction += (direction == 0 ? 1 : 0); // To avoid division by zero
        direction /= abs(direction);
        centerOffset *= direction;
    }
    else
    {
        centerOffset = arc4random() % 2 ? centerOffset : -centerOffset;
    }
    
    objectPosition.x = _centerX + centerOffset;
    trObject.position = objectPosition;
}

- (void)assignSpriteToTrackObject:(BaseTrackObject *)trObject
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
    self.objectsArray = nil;
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
        
        self.objectsArray = [NSMutableArray array];
    }
    return self;
}

@end
