//
//  AppDelegate.m
//  Mad Agents
//
//  Created by Long Le on 10/27/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import "cocos2d.h"

#import "AppDelegate.h"
#import "IntroLayer.h"
#import "GCHelper.h"
#import "Mobclix.h"



@implementation AppDelegate

@synthesize window=window_, navController=navController_, director=director_;
@synthesize viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [RevMobAds startSessionWithAppID:@"50fdcbaeb820751a00000012"];
        
	// Create the main window
	window_ = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];


	// Create an CCGLView with a RGB565 color buffer, and a depth buffer of 0-bits
/*	CCGLView *glView = [CCGLView viewWithFrame:[window_ bounds]
								   pixelFormat:kEAGLColorFormatRGB565	//kEAGLColorFormatRGBA8
								   depthFormat:0	//GL_DEPTH_COMPONENT24_OES
							preserveBackbuffer:NO
									sharegroup:nil
								 multiSampling:NO
							   numberOfSamples:0];
  */  
    
    // Instantiate a KCGLView, which is a subclass with CCGLView with
    // special recording functionality.
    KCGLView * glView = [KCGLView viewWithFrame:[window_ bounds]
                                    pixelFormat:kEAGLColorFormatRGB565
                                    depthFormat:0 /* GL_DEPTH_COMPONENT24_OES */
                             preserveBackbuffer:NO
                                     sharegroup:nil
                                  multiSampling:NO
                                numberOfSamples:0];
    

	director_ = (CCDirectorIOS*) [CCDirector sharedDirector];

	director_.wantsFullScreenLayout = YES;

	// Display FSP and SPF
	[director_ setDisplayStats:NO];

	// set FPS at 60
	[director_ setAnimationInterval:1.0/60];

	// attach the openglView to the director
	[director_ setView:glView];

	// for rotation and other messages
	[director_ setDelegate:self];

    //Enable multitouch
    [glView setMultipleTouchEnabled:YES];
    
	// 2D projection
	[director_ setProjection:kCCDirectorProjection2D];
//	[director setProjection:kCCDirectorProjection3D];

	// Enables High Res mode (Retina Display) on iPhone 4 and maintains low res on all other devices
	if( ! [director_ enableRetinaDisplay:NO] )
		CCLOG(@"Retina Display Not supported");

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
	[sharedFileUtils setiPadSuffix:@"-ipad"];					// Default on iPad is "ipad"
	[sharedFileUtils setiPadRetinaDisplaySuffix:@"-ipadhd"];	// Default on iPad RetinaDisplay is "-ipadhd"

	// Assume that PVR images have premultiplied alpha
	[CCTexture2D PVRImagesHavePremultipliedAlpha:YES];

	// and add the scene to the stack. The director will run it when it automatically when the view is displayed.
	[director_ pushScene: [IntroLayer scene]]; 

	
	// Create a Navigation Controller with the Director
	navController_ = [[UINavigationController alloc] initWithRootViewController:director_];
	navController_.navigationBarHidden = YES;
	
	// set the Navigation Controller as the root view controller
//	[window_ addSubview:navController_.view];	// Generates flicker.
	[window_ setRootViewController:navController_];
	
	// make main window visible
	[window_ makeKeyAndVisible];
    
    
    [Kamcord setDeveloperKey:@"w17kwzHlpEtJdIxDSKQNyW8BOiq4bkDLPmj2LDiTCP7"
             developerSecret:@"eTVCHEzuoE8UffqWaR7wH9d3y4B92yqg3vuFRiNl1PU"
                     appName:@"Mad Agents"];
    
    
    NSNumber *hiScoreSecs = [NSNumber numberWithInt: 0];
    NSNumber *hiScoreMins = [NSNumber numberWithInt: 0];
    NSNumber *inGameCurrencyAmountNumber = [NSNumber numberWithInt:100];
    
	NSDictionary *appDefaults = [[NSDictionary alloc] initWithObjectsAndKeys:
								 inGameCurrencyAmountNumber, @"inGameCurrencyAmount", hiScoreSecs, @"hiScoreSecs", hiScoreMins, @"hiScoreMins", nil];
    
    [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
    
    
    inGameCurrencyAmount = [prefs integerForKey:@"inGameCurrencyAmount"];
    NSLog (@"inGameCurrencyAmount = %i", inGameCurrencyAmount);
    
    
    [appDefaults release];
    
    [[GCHelper sharedInstance] authenticateLocalUser];
    
    [Mobclix startWithApplicationId:@"B1F32424-0C3E-4932-891C-F8C83980D2E5"];
    
    [AdColony initAdColonyWithDelegate:self];
    
    [Kamcord prepareNextVideo];
    
    // register to observe notifications from the store
    [[NSNotificationCenter defaultCenter]
     addObserver: self
     selector: @selector (storeDidChange:)
     name: NSUbiquitousKeyValueStoreDidChangeExternallyNotification
     object: [NSUbiquitousKeyValueStore defaultStore]];
    
    // get changes that might have happened while this
    // instance of your app wasn't running
    [[NSUbiquitousKeyValueStore defaultStore] synchronize];
    
    
    
    //Start the following code 'early in the app's launch cycle'
    NSUbiquitousKeyValueStore* store = [NSUbiquitousKeyValueStore defaultStore];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(updateKVStoreItems:)
                                                 name:NSUbiquitousKeyValueStoreDidChangeExternallyNotification
                                               object:store];
    [store synchronize];
    
    
    
	return YES;
}

- (void)updateKVStoreItems:(NSNotification*)notification {
    // Get the list of keys that changed.
    NSDictionary* userInfo = [notification userInfo];
    NSNumber* reasonForChange = [userInfo objectForKey:NSUbiquitousKeyValueStoreChangeReasonKey];
    NSInteger reason = -1;
    
    // If a reason could not be determined, do not update anything.
    if (!reasonForChange)
        return;
    
    // Update only for changes from the server.
    reason = [reasonForChange integerValue];
    if ((reason == NSUbiquitousKeyValueStoreServerChange) ||
        (reason == NSUbiquitousKeyValueStoreInitialSyncChange)) {
        // If something is changing externally, get the changes
        // and update the corresponding keys locally.
        NSArray* changedKeys = [userInfo objectForKey:NSUbiquitousKeyValueStoreChangedKeysKey];
        NSUbiquitousKeyValueStore* store = [NSUbiquitousKeyValueStore defaultStore];
        NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
        
        // This loop assumes you are using the same key names in both
        // the user defaults database and the iCloud key-value store
        /*LONG TO DO: Within this loop compare the value of the 'changedKey' to that of whats currently on the userDefaults.  If the value of the userDefaults is larger do not overwrite it.  http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/UserDefaults/StoringPreferenceDatainiCloud/StoringPreferenceDatainiCloud.html#//apple_ref/doc/uid/10000059i-CH7 */
        /* LONG: Getting and Setting Key-Values in iCloud.  Class reference: http://developer.apple.com/library/mac/#documentation/Foundation/Reference/NSUbiquitousKeyValueStore_class/Reference/Reference.html#//apple_ref/doc/uid/TP40010934 */
        
        for (NSString* key in changedKeys) {
            id value = [store objectForKey:key];
            [userDefaults setObject:value forKey:key];
        }
    }
}

- (void) adColonyVirtualCurrencyAwardedByZone:(NSString *)zone currencyName:(NSString *)name currencyAmount:(int)amount {
    
    watchedAdColonyAdForSpeedShoes = YES;
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"MoneyReceivedSound.wav"];
        
    zone = @"vz1d03f5640811499e884b62";
    name = @"Speed Shoes";
}


//usetheappidprovidedbyadcolony.com
-(NSString*) adColonyApplicationID {
    
    return @"app835b11c99fa34aaab57b9e";
}

//usethezonenumbersprovidedbyadcolony.com
-(NSDictionary*) adColonyAdZoneNumberAssociation {
    
    return [NSDictionary dictionaryWithObjectsAndKeys: @"vz1d03f5640811499e884b62", [NSNumber numberWithInt:1], @"vzb988620759594d7ab29057", [NSNumber numberWithInt: 2], nil];
}

// Supported orientations: Landscape. Customize it for your own needs
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}


// getting a call, pause the game
-(void) applicationWillResignActive:(UIApplication *)application
{    
	if( [navController_ visibleViewController] == director_ )
		[director_ pause];
}

// call got rejected
-(void) applicationDidBecomeActive:(UIApplication *)application
{    
	if( [navController_ visibleViewController] == director_ )
		[director_ resume];
 
    cb = [Chartboost sharedChartboost];
    
    cb.appId = @"50fdf21716ba47b52700004c";
    cb.appSignature = @"ca0cbdc4567e702708273c122c57300939433e6f";
    cb.delegate = self;
    
    [cb cacheInterstitial];
    
    // Begin a user session
    [cb startSession];
}

-(void) applicationDidEnterBackground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ stopAnimation];
}

-(void) applicationWillEnterForeground:(UIApplication*)application
{
	if( [navController_ visibleViewController] == director_ )
		[director_ startAnimation];
}

// application will be killed
- (void)applicationWillTerminate:(UIApplication *)application
{
	CC_DIRECTOR_END();
}

// purge memory
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
	[[CCDirector sharedDirector] purgeCachedData];
}

// next delta time will be zero
-(void) applicationSignificantTimeChange:(UIApplication *)application
{
	[[CCDirector sharedDirector] setNextDeltaTimeZero:YES];
}

- (void)didDismissInterstitial:(NSString *)location {
   
    NSLog(@"dismissed interstitial at screen %@", location);
    
    [[Chartboost sharedChartboost] cacheInterstitial:location];
    
    if (currentScreen == GAME_OVER_SCREEN) {
    
        tapToContinueLabel.visible = YES;
        gameOverLabel.visible = YES;
    }
    
    else if (currentScreen == VICTORY_SCREEN) {
        
        chartBoostAdWasJustDismissed = YES;
    }
}

- (void)didFailToLoadInterstitial:(NSString *)location {
    NSLog(@"failure to load interstitial at location %@", location);
    
    if (currentScreen == VICTORY_SCREEN || currentScreen == GAME_OVER_SCREEN) {
    
        chartBoostAdWasJustDismissed = YES;
    }
}


- (void) dealloc
{
	[window_ release];
	[navController_ release];

	[super dealloc];
}
@end

