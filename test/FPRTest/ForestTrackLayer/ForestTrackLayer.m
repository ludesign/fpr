//
//  ForestTrackLayer.m
//  FPRTest
//
//  Created by Toshko on 1/5/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "ForestTrackLayer.h"

#import "TileGraphHandler.h"
#import "BaseTrackTile.h"

//  Sprite sheet base name for this track
//  Append with:
//  .png to get the texture atlas
//  .plist to get the atlas definitions
//  -def.plist to get the join definitions for each tile
#define SS_NAME                     @"track_elements"


@interface ForestTrackLayer ()

@property (nonatomic, retain) CCSpriteBatchNode *tilesBatchNode;
@property (nonatomic, retain) TileGraphHandler *tileGraphHandler;

@property (nonatomic, assign) CCSprite *lastSprite;
@property (nonatomic, retain) NSArray *trackSpritesArray;           // Containing the sprites being moved around in this layer

@end

@implementation ForestTrackLayer

#pragma mark - Obstacles

- (void)addObstacle
{
    
}

#pragma mark - Mystery crates

- (void)addMysteryCrate
{
    
}

#pragma mark - Movement

- (void)updateBackground:(ccTime)dTime
{
    if (self.bgSpeed <= 1.0f)
    {
        [self stopMoving];
        return;
    }
    
    for (CCSprite *sprite in _trackSpritesArray)
    {
        CGPoint position = sprite.position;
        if (position.y + (sprite.contentSize.height / 2.0f) < 0.0f)
        {
            [sprite setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[_tileGraphHandler nextTile].name]];
            position.y = _lastSprite.position.y + (_lastSprite.contentSize.height / 2.0f) + (sprite.boundingBox.size.height / 2.0f);
            _lastSprite = sprite;
        }
        position.y -= dTime * self.bgSpeed;
        sprite.position = position;
    }
}

- (void)startMoving
{
    if (1.0f > self.bgSpeed)
    {
        return;
    }
    
    [self schedule:@selector(updateBackground:)];
}

- (void)stopMoving
{
    [self unschedule:@selector(updateBackground:)];
}

#pragma mark - Memory management

- (void)dealloc
{
    self.tilesBatchNode = nil;
    self.tileGraphHandler = nil;
    self.trackSpritesArray = nil;
    [super dealloc];
}

- (void)loadTrackTileSprites
{
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"%@.plist", SS_NAME]];
    self.tilesBatchNode = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"%@.png", SS_NAME]];
    [self addChild:_tilesBatchNode];
    
    float xCoord = self.contentSize.width / 2.0f;
    float yCoord = 0.0f;
    NSMutableArray * mTrackSpritesArray = [NSMutableArray arrayWithCapacity:trackSpritesCount];
    for (unsigned i = 0; i < trackSpritesCount; i++)
    {
        CCSprite *tileSprite = [CCSprite spriteWithSpriteFrameName:[_tileGraphHandler nextTile].name];
        tileSprite.position = ccp(xCoord, yCoord + (tileSprite.contentSize.height / 2.0f));
        yCoord += tileSprite.contentSize.height;
        [_tilesBatchNode addChild:tileSprite];
        [mTrackSpritesArray addObject:tileSprite];
        _lastSprite = tileSprite;
    }
    self.trackSpritesArray = [NSMutableArray arrayWithArray:mTrackSpritesArray];
}

- (id)init
{
    self = [super init];
    if (self)
    {   // Custom initialization
        self.tileGraphHandler = [[[TileGraphHandler alloc] initWithDefFileBaseName:SS_NAME] autorelease];
        [self loadTrackTileSprites];
    }
    return self;
}

@end
