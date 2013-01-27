//
//  Coin.m
//  FPRTest
//
//  Created by Toshko on 1/27/13.
//
//

#import "Coin.h"

@implementation Coin

- (id)init
{
    self = [super init];
    if (self)
    {
        self.objectType = TrackObjectTypeCoin;
        self.objectSubtype = TrackObjectSubtypeInvalid;
    }
    return self;
}

- (id)initWithSubtype:(TrackObjectSubtype)subtype
{
    self = [super init];
    if (self)
    {
        self.objectType = TrackObjectTypeCoin;
        self.objectSubtype = subtype;
    }
    return self;
}

@end
