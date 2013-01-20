//
//  TrackMysteryCrate.h
//  FPRTest
//
//  Created by Toshko on 1/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

typedef enum {
    MysteryCrateContentsCoins = 0,
    MysteryCrateContentsBoost,
    MysteryCrateContentsInverseDirection
} MysteryCrateContents;

@interface TrackMysteryCrate : CCSprite

@property (nonatomic, assign) MysteryCrateContents contents;

- (id)initWithContents:(MysteryCrateContents)contents spriteFrameName:(NSString *)spriteFrameName;

@end
