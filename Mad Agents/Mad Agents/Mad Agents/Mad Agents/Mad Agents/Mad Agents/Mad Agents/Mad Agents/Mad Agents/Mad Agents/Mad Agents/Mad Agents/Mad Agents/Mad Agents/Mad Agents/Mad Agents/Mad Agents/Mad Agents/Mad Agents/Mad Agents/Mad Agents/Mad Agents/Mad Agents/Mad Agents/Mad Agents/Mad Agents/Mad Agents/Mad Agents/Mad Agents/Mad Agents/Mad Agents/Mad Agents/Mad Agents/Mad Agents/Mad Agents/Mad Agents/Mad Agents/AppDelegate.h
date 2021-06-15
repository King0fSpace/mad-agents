//
//  AppDelegate.h
//  Mad Agents
//
//  Created by Long Le on 10/27/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"
#import "RootViewController.h"
#import "Chartboost.h"
#import "AdColonyPublic.h"
#import <RevMobAds/RevMobAds.h>
#import <Kamcord/Kamcord.h>



#define MAIN_MENU_SCREEN                    0
#define LOAD_PROFILE_SCREEN                 1
#define GAME_SCREEN                         2
#define VICTORY_SCREEN                      3
#define GAME_OVER_SCREEN                    4
#define MULTIPLAYER_VERSUS_SCREEN           5
#define LEVEL_SELECTION_MENU                6



CCLabelBMFont *tapToContinueLabel;


BOOL watchedAdColonyAdForSpeedShoes;


NSUserDefaults *prefs;

int inGameCurrencyAmount;
Chartboost *cb;

@interface AppDelegate : NSObject <UIApplicationDelegate, CCDirectorDelegate, AdColonyDelegate, RevMobAdsDelegate, ChartboostDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;

	CCDirectorIOS	*director_;							// weak ref
}

@property (nonatomic, retain) UIWindow *window;
@property (readonly) UINavigationController *navController;
@property (readonly) CCDirectorIOS *director;
@property (nonatomic, retain) UIViewController *viewController;



@end
