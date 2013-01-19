//
//  BaseTrackTile.h
//  FPRTest
//
//  Created by Toshko on 1/5/13.
//
//

#import <Foundation/Foundation.h>

@protocol TrackTileInterface <NSObject>

@property (nonatomic, readonly) NSString *name;

- (NSUInteger)nextTileIndex;

@end


@interface BaseTrackTile : NSObject <TrackTileInterface>

@end
