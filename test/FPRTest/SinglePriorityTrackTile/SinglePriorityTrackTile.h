//
//  SinglePriorityTrackTile.h
//  FPRTest
//
//  Created by Toshko on 1/5/13.
//
//

#import "BaseTrackTile.h"

@interface SinglePriorityTrackTile : BaseTrackTile <TrackTileInterface>

- (id)initWithName:(NSString *)tileName tileIndeces:(NSArray *)tileIndeces;

@end
