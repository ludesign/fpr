//
//  SinglePriorityTrackTile.m
//  FPRTest
//
//  Created by Toshko on 1/5/13.
//
//

#import "SinglePriorityTrackTile.h"

@interface SinglePriorityTrackTile ()

@property (nonatomic, retain) NSMutableArray *tileIndeces;

@end

@implementation SinglePriorityTrackTile

- (NSUInteger)nextTileIndex
{
    if (1 == [_tileIndeces count])
    {
        return [_tileIndeces[0] unsignedIntegerValue];
    }
    
    NSUInteger index = arc4random() % ([_tileIndeces count] >> 1);
    id number = [_tileIndeces[index] retain];
    NSUInteger next = [number unsignedIntegerValue];
    [_tileIndeces removeObjectAtIndex:index];
    [_tileIndeces addObject:number];
    [number release];

    return next;
}

- (void)dealloc
{
    self.tileIndeces = nil;
    [super dealloc];
}

- (id)initWithName:(NSString *)tileName tileIndeces:(NSArray *)tileIndeces
{
    self = [super initWithName:tileName];
    if (self)
    {
        self.tileIndeces = [NSMutableArray arrayWithArray:tileIndeces];
    }
    return self;
}

@end
