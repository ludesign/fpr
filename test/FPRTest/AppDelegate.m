//
//  AppDelegate.m
//  FPRTest
//
//  Created by Toshko on 12/28/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "AppDelegate.h"
#import "TrackScene.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	// Create the main window
	self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
	_window.backgroundColor = [UIColor whiteColor];

	// Create an CCGLView with a RGB565 color buffer, and a depth buffer of 0-bits
	CCGLView *glView = [CCGLView viewWithFrame:[_window bounds] pixelFormat:kEAGLColorFormatRGB565 depthFormat:0 preserveBackbuffer:NO sharegroup:nil multiSampling:NO numberOfSamples:0];

	_director = (CCDirectorIOS *)[CCDirector sharedDirector];

	_director.wantsFullScreenLayout = YES;

	// Display FSP and SPF
	[_director setDisplayStats:YES];

	// set FPS at 60
	[_director setAnimationInterval:1.0f / 60.0f];

	// attach the openglView to the director
	[_director setView:glView];

	// for rotation and other messages
	[_director setDelegate:self];

	// 2D projection
	[_director setProjection:kCCDirectorProjection2D];

	// Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
	if(![_director enableRetinaDisplay:YES])
	{
		CCLOG(@"Retina Display Not supported");
	}

	// Default texture format for PNG/BMP/TIFF/JPEG/GIF images
	// It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
	// You can change anytime.
	[CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];

	// If the 1st suffix is not found and if fallback is enabled then fallback suffixes are going to searched. If none is found, it will try with the name without suffix.
	// On iPad HD  : "-ipadhd", "-ipad",  "-hd"
	// On iPad     : "-ipad", "-hd"
	// On iPhone HD: "-hd"
	CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
	[sharedFileUtils setEnableFallbackSuffixes:NO];				// Default: NO. No fallback suffixes are going to be used
	[sharedFileUtils setiPhoneRetinaDisplaySuffix:@"-hd"];		// Default on iPhone RetinaDisplay is "-hd"

	// Assume that PVR images have premultiplied alpha
	[CCTexture2D PVRImagesHavePremultipliedAlpha:YES];
	
    // Create the initial scene
    TrackScene *trackScene = [[TrackScene alloc] init];
    [trackScene setTrackWithIndex:0];
    [_director pushScene:trackScene];
    [_window setRootViewController:_director];
    
    [trackScene release];
    
	// make main window visible
	[_window makeKeyAndVisible];
	
	return YES;
}

// Supported orientations: Landscape. Customize it for your own needs
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (UIInterfaceOrientationPortrait == interfaceOrientation);
}

// getting a call, pause the game
-(void)applicationWillResignActive:(UIApplication *)application
{
	[_director pause];
}

// call got rejected
-(void)applicationDidBecomeActive:(UIApplication *)application
{
	[_director resume];
}

-(void)applicationDidEnterBackground:(UIApplication *)application
{
	[_director stopAnimation];
}

-(void)applicationWillEnterForeground:(UIApplication *)application
{
	[_director startAnimation];
}

// purge memory
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	[[CCDirector sharedDirector] purgeCachedData];
}

// next delta time will be zero
-(void)applicationSignificantTimeChange:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void)dealloc
{
	self.window = nil;
	[super dealloc];
}

@end

