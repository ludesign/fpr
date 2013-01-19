//
//  AppDelegate.h
//  FPRTest
//
//  Created by Toshko on 12/28/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

@interface AppDelegate : NSObject <UIApplicationDelegate, CCDirectorDelegate>

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, readonly) CCDirectorIOS *director;

@end
