//
//  BaseTrackTile.m
//  FPRTest
//
//  Created by Toshko on 1/5/13.
//
//

#import "BaseTrackTile.h"

@implementation BaseTrackTile

- (NSString *)name
{
    [self doesNotRecognizeSelector:_cmd];
    return nil;
}

- (NSUInteger)nextTileIndex
{
    [self doesNotRecognizeSelector:_cmd];
    return UINT16_MAX;
}

@end
