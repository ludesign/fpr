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

@property (nonatomic, retain) CCSpriteBatchNode *objectsBatchNode;
@property (nonatomic, assign) CCSprite *lastObject;

@end

@implementation TrackObjectsManagerLayer

- (void)dealloc
{
    self.objectsBatchNode = nil;
    self.objectsQueue = nil;
    [super dealloc];
}

- (id)initWithSpriteSheetName:(NSString *)spriteSheetName
{
    self = [super init];
    if (self)
    {
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:[NSString stringWithFormat:@"%@.plist", spriteSheetName]];
        self.objectsBatchNode = [CCSpriteBatchNode batchNodeWithFile:[NSString stringWithFormat:@"%@.png", spriteSheetName]];
        [self addChild:_objectsBatchNode];
        
        _objectsQueue = [[TrackObjectsQueue alloc] init];
    }
    return self;
}

@end
