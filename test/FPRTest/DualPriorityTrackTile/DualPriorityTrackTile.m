//
//  DualPriorityTrackTile.m
//  FPRTest
//
//  Created by Toshko on 1/5/13.
//
//

#import "DualPriorityTrackTile.h"

@interface DualPriorityTrackTile ()

@property (nonatomic, retain) NSString *name;

@property (nonatomic, retain) NSMutableArray *primaryTileIndeces;
@property (nonatomic, retain) NSMutableArray *secondaryTileIndeces;

@end

@implementation DualPriorityTrackTile

@synthesize name = _name;

- (NSUInteger)nextTileIndex
{
    NSMutableArray *array = (arc4random() % 7 == 0 ? _secondaryTileIndeces : _primaryTileIndeces);
    if (1 == [array count])
    {
        return [array[0] unsignedIntegerValue];
    }
    
    NSUInteger index = arc4random() % ([array count] >> 1);
    id number = [array[index] retain];
    NSUInteger next = [number unsignedIntegerValue];
    [array removeObjectAtIndex:index];
    [array addObject:number];
    [number release];
    
    return next;
}

- (void)dealloc
{
    self.primaryTileIndeces = nil;
    self.secondaryTileIndeces = nil;
    [super dealloc];
}

- (id)initWithName:(NSString *)tileName primaryTileIndeces:(NSArray *)pTileIndeces secondaryTileIndeces:(NSArray *)sTileIndeces
{
    self = [super init];
    if (self)
    {
        self.name = tileName;
        self.primaryTileIndeces = [NSMutableArray arrayWithArray:pTileIndeces];
        self.secondaryTileIndeces = [NSMutableArray arrayWithArray:sTileIndeces];
    }
    return self;
}

@end
