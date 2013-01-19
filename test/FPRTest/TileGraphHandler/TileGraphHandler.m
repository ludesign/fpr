//
//  TileGraphHandler.m
//  FPRTest
//
//  Created by Toshko on 1/6/13.
//
//

#import "TileGraphHandler.h"

#import "SinglePriorityTrackTile.h"
#import "DualPriorityTrackTile.h"

@interface TileGraphHandler ()

@property (nonatomic, copy) NSString *defFileName;

@property (nonatomic, retain) NSArray *tilesArray;
@property (nonatomic, assign) BaseTrackTile *currentTile;

@end

@implementation TileGraphHandler

- (BaseTrackTile *)nextTile
{
    if (nil == _currentTile)
    {
        _currentTile = _tilesArray[arc4random() % [_tilesArray count]];
    }
    else
    {
        _currentTile = _tilesArray[_currentTile.nextTileIndex];
    }
    
    return _currentTile;
}

- (void)dealloc
{
    self.tilesArray = nil;
    self.defFileName = nil;
    [super dealloc];
}

- (void)loadTileDefinitions
{
    NSString *defFilePath = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@-def", _defFileName] ofType:@"plist"];
    NSArray *tileDef = [NSArray arrayWithContentsOfFile:defFilePath];
    NSMutableArray *mTilesArray = [NSMutableArray arrayWithCapacity:[tileDef count]];
    for (NSDictionary *tileInfo in tileDef)
    {
        NSString *tileName = [tileInfo objectForKey:@"name"];
        NSArray *pTiles = [tileInfo objectForKey:@"pjoin"]; // Primary tiles this one can join to
        NSArray *sTiles = [tileInfo objectForKey:@"sjoin"]; // Secondary tiles this one can join to
        
        BaseTrackTile *trackTile = nil;
        if (nil == pTiles || nil == sTiles)
        {
            NSArray *tiles = (nil != pTiles ? pTiles : sTiles);
            trackTile = [[SinglePriorityTrackTile alloc] initWithName:tileName tileIndeces:tiles];
        }
        else
        {
            trackTile = [[DualPriorityTrackTile alloc] initWithName:tileName primaryTileIndeces:pTiles secondaryTileIndeces:sTiles];
        }
        
        [mTilesArray addObject:trackTile];
        [trackTile release];
    }
    self.tilesArray = [NSArray arrayWithArray:mTilesArray];
}

- (id)initWithDefFileBaseName:(NSString *)name
{
    self = [super init];
    if (self)
    {
        self.defFileName = name;
        [self loadTileDefinitions];
    }
    return self;
}

@end
