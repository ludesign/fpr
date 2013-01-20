//
//  BaseTrackTile.h
//  FPRTest
//
//  Created by Toshko on 1/5/13.
//
//

#import <Foundation/Foundation.h>

@protocol TrackTileInterface <NSObject>

- (NSUInteger)nextTileIndex;

@end


@interface BaseTrackTile : NSObject <TrackTileInterface>

@property (nonatomic, readonly) NSString *name;

- (id)initWithName:(NSString *)name;

@end
