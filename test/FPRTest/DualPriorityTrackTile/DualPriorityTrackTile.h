//
//  DualPriorityTrackTile.h
//  FPRTest
//
//  Created by Toshko on 1/5/13.
//
//

#import "BaseTrackTile.h"

@interface DualPriorityTrackTile : BaseTrackTile <TrackTileInterface>

- (id)initWithName:(NSString *)tileName primaryTileIndeces:(NSArray *)pTileIndeces secondaryTileIndeces:(NSArray *)sTileIndeces;

@end
