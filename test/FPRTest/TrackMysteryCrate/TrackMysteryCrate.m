//
//  TrackMysteryCrate.m
//  FPRTest
//
//  Created by Toshko on 1/21/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TrackMysteryCrate.h"


@implementation TrackMysteryCrate

- (id)initWithContents:(MysteryCrateContents)contents spriteFrameName:(NSString *)spriteFrameName
{
    self = [super initWithSpriteFrameName:spriteFrameName];
    if (self)
    {
        _contents = contents;
    }
    return self;
}

@end
