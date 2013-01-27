//
//  TrackObjectsManagerLayer.m
//  FPRTest
//
//  Created by Toshko on 1/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TrackObjectsManagerLayer.h"
#import "TrackObjectsQueue.h"
#import "Obstacle.h"
#import "Coin.h"


@interface TrackObjectsManagerLayer ()

@property (nonatomic, retain) TrackObjectsQueue *objectsQueue;

@property (nonatomic, retain) NSArray *obstacleNamesArray;

@property (nonatomic, retain) CCSpriteBatchNode *obstaclesBatchNode;
@property (nonatomic, assign) CCSprite *lastObject;

@end

@implementation TrackObjectsManagerLayer

#pragma mark - Update

- (void)updatePositions:(CGFloat)offset
{
    NSUInteger objectsCount = [_obstaclesBatchNode.children count];
    for (unsigned i = 0; i < objectsCount; i++)
    {   // Using iteration instead of fast enumeration in order to be able to remove children from the batch node which is a big performace boost
        BaseTrackObject *trObject = [_obstaclesBatchNode.children objectAtIndex:i];
        if (trObject.position.y <= -(trObject.contentSize.height / 2.0f))
        {
            [_objectsQueue queueTrackObject:trObject];
            [_obstaclesBatchNode removeChild:trObject cleanup:NO];
            
            i--;
            objectsCount--;
            
            continue;
        }
        
        CGPoint position = trObject.position;
        position.y -= offset;
        trObject.position = position;
    }
}

#pragma mark - Track objects adding

- (void)addTrackObjectOfType:(TrackObjectType)objectType
{
    BaseTrackObject *trObject = [self trackObjectOfType:objectType];
    [self assignSpriteToTrackObject:trObject];
    [self assignPositionToTrackObject:trObject];
    [_obstaclesBatchNode addChild:trObject];
    _lastObject = trObject;
}

- (void)assignPositionToTrackObject:(BaseTrackObject *)trObject
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
    switch (trObject.objectType)
    {
        case TrackObjectTypeObstacle:
        {
            trObject.objectSubtype = arc4random() % kTrackObstacleSubtypesCount;
            NSUInteger spriteIndex = arc4random() % [_obstacleNamesArray[trObject.objectSubtype] count];
            NSString *spriteName = _obstacleNamesArray[trObject.objectSubtype][spriteIndex];
            [trObject setSpriteWithName:spriteName];
        }
            break;
            
        case TrackObjectTypeCoin:
        {
            trObject.objectSubtype = arc4random() % kTrackCoinSubtypesCount;
        }
            break;
            
        case TrackObjectTypeMysteryCrate:
            // Not yet
            break;
            
        default:
            break;
    }
}

- (BaseTrackObject *)trackObjectOfType:(TrackObjectType)objectType
{
    BaseTrackObject *trackObject = [_objectsQueue dequeueTrackObject];
    if (nil == trackObject)
    {
        switch (objectType)
        {
            case TrackObjectTypeObstacle:
                trackObject = [Obstacle obstacle];
                break;
                
            case TrackObjectTypeCoin:
                trackObject = [Coin coin];
                break;
                
            case TrackObjectTypeMysteryCrate:
                // Not yet
                break;
                
            default:
                break;
        }
    }
    
    return trackObject;
}

#pragma mark - Memory management

- (void)dealloc
{
    self.obstaclesBatchNode = nil;
    self.objectsQueue = nil;
    self.obstacleNamesArray = nil;
    [super dealloc];
}

- (void)loadObstacleNamesFromBaseSpriteSheetName:(NSString *)spriteSheetName
{
    NSString *defFileName = [NSString stringWithFormat:@"%@-def", spriteSheetName];
    NSString *obstacleDefsFilePath = [[NSBundle mainBundle] pathForResource:defFileName ofType:@"plist"];
    NSArray *obstacleDefinitions = [NSArray arrayWithContentsOfFile:obstacleDefsFilePath];
    
    NSMutableArray *obstaclesTypeSlow = [NSMutableArray array];
    NSMutableArray *obstaclesTypeStop = [NSMutableArray array];
    
    for (NSDictionary *obstacleDef in obstacleDefinitions)
    {
        TrackObjectSubtype type = [[obstacleDef objectForKey:@"type"] integerValue];
        if (TrackObstacleTypeSlow == type)
        {
            [obstaclesTypeSlow addObject:[obstacleDef objectForKey:@"name"]];
        }
        else if (TrackObstacleTypeStop == type)
        {
            [obstaclesTypeStop addObject:[obstacleDef objectForKey:@"name"]];
        }
    }
    
    // Order must be the same as the corresponding subtypes are declared
    self.obstacleNamesArray = @[[NSArray arrayWithArray:obstaclesTypeSlow], [NSArray arrayWithArray:obstaclesTypeStop]];
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
        
        [self loadObstacleNamesFromBaseSpriteSheetName:spriteSheetName];
    }
    return self;
}

@end
