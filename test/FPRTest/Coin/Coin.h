//
//  Coin.h
//  FPRTest
//
//  Created by Toshko on 1/27/13.
//
//

#import "BaseTrackObject.h"

@interface Coin : BaseTrackObject

- (id)initWithSubtype:(TrackObjectSubtype)subtype;

+ (id)coin;
+ (id)copperCoin;
+ (id)silverCoin;
+ (id)goldenCoin;

@end
