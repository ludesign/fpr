//
//  TrackScene.h
//  FPRTest
//
//  Created by Toshko on 12/28/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface TrackScene : CCScene

@property (nonatomic, readonly) NSUInteger trackIndex;

- (void)setTrackWithIndex:(NSUInteger)trackIndex;

@end
