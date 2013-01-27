//
//  Coin.m
//  FPRTest
//
//  Created by Toshko on 1/27/13.
//
//

#import "Coin.h"

@implementation Coin

+ (id)coin
{
    return [[[self alloc] init] autorelease];
}

+ (id)copperCoin
{
    return [[[self alloc] initWithSubtype:TrackCoinTypeCopper] autorelease];
}

+ (id)silverCoin
{
    return [[[self alloc] initWithSubtype:TrackCoinTypeSilver] autorelease];
}

+ (id)goldenCoin
{
    return [[[self alloc] initWithSubtype:TrackCoinTypeGold] autorelease];
}

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
