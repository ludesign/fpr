//
//  BaseTrackTile.m
//  FPRTest
//
//  Created by Toshko on 1/5/13.
//
//

#import "BaseTrackTile.h"

@interface BaseTrackTile ()

@property (nonatomic, copy) NSString *name;

@end

@implementation BaseTrackTile

- (id)initWithName:(NSString *)name
{
    self = [super init];
    if (self)
    {
        self.name = name;
    }
    return self;
}

- (NSUInteger)nextTileIndex
{
    [self doesNotRecognizeSelector:_cmd];
    return UINT16_MAX;
}

@end
