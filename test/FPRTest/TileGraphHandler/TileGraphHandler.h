//
//  TileGraphHandler.h
//  FPRTest
//
//  Created by Toshko on 1/6/13.
//
//

#import <Foundation/Foundation.h>

@class BaseTrackTile;

@interface TileGraphHandler : NSObject

- (id)initWithDefFileBaseName:(NSString *)name;

- (BaseTrackTile *)nextTile;

@end
