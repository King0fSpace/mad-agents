//
//  HelloWorldLayer.m
//  Mad Agents
//
//  Created by Long Le on 10/27/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//

// Import the interfaces
#import "HelloWorldLayer.h"

// Needed to obtain the Navigation Controller
#import "SimpleAudioEngine.h"

#import "Enemy.h"


#pragma mark - HelloWorldLayer

#define STUN_POWER_UP_SELECTED              0
#define MIND_CONTROL_POWER_UP_SELECTED      1
#define STUN_PROJECTILE_POWER_UP_SELECTED   2


#define SAVE_SLOT_1                         0
#define SAVE_SLOT_2                         1
#define SAVE_SLOT_3                         2

#define STUN_BOMB_PRICE                     300
#define MIND_CONTROL_PRICE                  500
#define STUN_PROJECTILE_PRICE               500
#define INVINCIBILITY_PRICE                 500
#define BULLET_TIME_PRICE                   500
#define GLOBAL_STUN_PRICE                   500
#define SNEAKERS_PRICE                      1000
#define DOUBLE_JUMP_PRICE                   1000

#define NO_STARS_REWARD                     0
#define ONE_STARS_REWARD                    50
#define TWO_STARS_REWARD                    100
#define THREE_STARS_REWARD                  200

#define JUMP_SPEED_MULTIPLIER               0.43



/*  VAN LOOK HERE!!! Change the following variables around as you please for testing purposes.    */

//Change MAD_AGENTS_START_TIME to whatever number you want.  Agents will enter "Mad Agents" mode when the time bomb has been set and ticks to the number of seconds specified here
#define MAD_AGENTS_MODE_START_TIME              6

//Change CURRENT_LEVEL_BEING_TESTED to change the current level (DemoLevel1, DemoLevel2, etc) being tested
#define CURRENT_LEVEL_BEING_TESTED            1
//Change MANUAL_LEVEL_SELECTION to NO in order to allow levels to progress one by one
#define MANUAL_LEVEL_SELECTION              NO


//Change FIRST_PLAYER_INVINCIBLE and/or SECOND_PLAYER_INVINCIBLE to YES to make player invincible.  Change to NO to make him NOT invincible
#define FIRST_PLAYER_INVINCIBLE                 YES
#define SECOND_PLAYER_INVINCIBLE                YES

//Change the following to any number to specify the number of seconds it takes for the time bomb to explode after being placed on the steel door
#define LEVEL_TIMER_SET_TO                        60


//Change the following to any number to specify the number of seconds in between power-ups randomly appearing in the level
#define POWER_UP_GENERATION_TIME_INTERVAL       7


//Change the following to any number to specify the amount of time that enemies are stunned for
#define ENEMY_STUN_TIME                         15



//Change the following to any number to specify the time interval at which enemies spawn for the specified boss levels, and the time interval at which power ups spawn for the specified boss levels
#define BOSS_LEVEL_10_ENEMY_SPAWN_TIME              4.0
#define BOSS_LEVEL_10_POWER_UP_SPAWN_TIME           4.0
#define BOSS_LEVEL_10_CONSISTENT_ENEMY_SPAWN_TIME   7.5  //This time refers to the interval which the two enemy spawn points simultaneously spawn enemies.  This kind of spawn point may or may not exist in the level, depending on whether or not the level creator has used it
#define BOSS_LEVEL_10_THREE_STAR_TIME_LIMIT              30  //Number of seconds the player must beat the level in, in order to get 3 stars
#define BOSS_LEVEL_10_TWO_STAR_TIME_LIMIT                60  //Number of seconds the player must beat the level in, in order to get 2 stars
#define BOSS_LEVEL_10_ONE_STAR_TIME_LIMIT                90  //Number of seconds the player must beat the level in, in order to get 1 star1


#define BOSS_LEVEL_20_ENEMY_SPAWN_TIME              4.0
#define BOSS_LEVEL_20_POWER_UP_SPAWN_TIME           4.0
#define BOSS_LEVEL_20_CONSISTENT_ENEMY_SPAWN_TIME   7.5  //This time refers to the interval which the two enemy spawn points simultaneously spawn enemies.  This kind of spawn point may or may not exist in the level, depending on whether or not the level creator has used it
#define BOSS_LEVEL_20_THREE_STAR_TIME_LIMIT              30  //Number of seconds the player must beat the level in, in order to get 3 stars
#define BOSS_LEVEL_20_TWO_STAR_TIME_LIMIT                60  //Number of seconds the player must beat the level in, in order to get 2 stars
#define BOSS_LEVEL_20_ONE_STAR_TIME_LIMIT                90  //Number of seconds the player must beat the level in, in order to get 1 star1


#define BOSS_LEVEL_30_ENEMY_SPAWN_TIME              4.0
#define BOSS_LEVEL_30_POWER_UP_SPAWN_TIME           4.0
#define BOSS_LEVEL_30_CONSISTENT_ENEMY_SPAWN_TIME   7.5  //This time refers to the interval which the two enemy spawn points simultaneously spawn enemies.  This kind of spawn point may or may not exist in the level, depending on whether or not the level creator has used it
#define BOSS_LEVEL_30_THREE_STAR_TIME_LIMIT              30  //Number of seconds the player must beat the level in, in order to get 3 stars
#define BOSS_LEVEL_30_TWO_STAR_TIME_LIMIT                60  //Number of seconds the player must beat the level in, in order to get 2 stars
#define BOSS_LEVEL_30_ONE_STAR_TIME_LIMIT                90  //Number of seconds the player must beat the level in, in order to get 1 star1


#define BOSS_LEVEL_40_ENEMY_SPAWN_TIME              4.0
#define BOSS_LEVEL_40_POWER_UP_SPAWN_TIME           4.0
#define BOSS_LEVEL_40_CONSISTENT_ENEMY_SPAWN_TIME   7.5  //This time refers to the interval which the two enemy spawn points simultaneously spawn enemies.  This kind of spawn point may or may not exist in the level, depending on whether or not the level creator has used it
#define BOSS_LEVEL_40_THREE_STAR_TIME_LIMIT              30  //Number of seconds the player must beat the level in, in order to get 3 stars
#define BOSS_LEVEL_40_TWO_STAR_TIME_LIMIT                60  //Number of seconds the player must beat the level in, in order to get 2 stars
#define BOSS_LEVEL_40_ONE_STAR_TIME_LIMIT                90  //Number of seconds the player must beat the level in, in order to get 1 star1


#define BOSS_LEVEL_50_ENEMY_SPAWN_TIME              4.0
#define BOSS_LEVEL_50_POWER_UP_SPAWN_TIME           4.0
#define BOSS_LEVEL_50_CONSISTENT_ENEMY_SPAWN_TIME   7.5  //This time refers to the interval which the two enemy spawn points simultaneously spawn enemies.  This kind of spawn point may or may not exist in the level, depending on whether or not the level creator has used it
#define BOSS_LEVEL_50_THREE_STAR_TIME_LIMIT              30  //Number of seconds the player must beat the level in, in order to get 3 stars
#define BOSS_LEVEL_50_TWO_STAR_TIME_LIMIT                60  //Number of seconds the player must beat the level in, in order to get 2 stars
#define BOSS_LEVEL_50_ONE_STAR_TIME_LIMIT                90  //Number of seconds the player must beat the level in, in order to get 1 star1


#define BOSS_LEVEL_60_ENEMY_SPAWN_TIME              4.0
#define BOSS_LEVEL_60_POWER_UP_SPAWN_TIME           4.0
#define BOSS_LEVEL_60_CONSISTENT_ENEMY_SPAWN_TIME   7.5  //This time refers to the interval which the two enemy spawn points simultaneously spawn enemies.  This kind of spawn point may or may not exist in the level, depending on whether or not the level creator has used it
#define BOSS_LEVEL_60_THREE_STAR_TIME_LIMIT              30  //Number of seconds the player must beat the level in, in order to get 3 stars
#define BOSS_LEVEL_60_TWO_STAR_TIME_LIMIT                60  //Number of seconds the player must beat the level in, in order to get 2 stars
#define BOSS_LEVEL_60_ONE_STAR_TIME_LIMIT                90  //Number of seconds the player must beat the level in, in order to get 1 star1




#define LEVEL_1_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_2_TIME                               60   //This number refers to the number of seconds the level starts with
#define LEVEL_3_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_4_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_5_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_6_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_7_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_8_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_9_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_10_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_11_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_12_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_13_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_14_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_15_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_16_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_17_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_18_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_19_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_20_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_21_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_22_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_23_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_24_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_25_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_26_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_27_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_28_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_29_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_30_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_31_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_32_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_33_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_34_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_35_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_36_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_37_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_38_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_39_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_40_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_41_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_42_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_43_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_44_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_45_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_46_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_47_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_48_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_49_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_50_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_51_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_52_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_53_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_54_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_55_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_56_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_57_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_58_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_59_TIME                               60  //This number refers to the number of seconds the level starts with
#define LEVEL_60_TIME                               60  //This number refers to the number of seconds the level starts with

#define GEM_1_SECONDS_TO_SUBTRACT                   10  //This number refers to the number of seconds that collecting Gem1 subtracts from the level time
#define GEM_2_SECONDS_TO_SUBTRACT                   15  //This number refers to the number of seconds that collecting Gem2 subtracts from the level time
#define GEM_3_SECONDS_TO_SUBTRACT                   20  //This number refers to the number of seconds that collecting Gem3 subtracts from the level time





float cairoX;
float cairoY;
CCLayerColor *gameLayer;
CCLayerColor *gameMoveableLayer;
CCLayerColor *hudLayer;
CCSprite *firstPlayerSensorFeet;
CCSprite *firstPlayerSensorRightSide;
CCSprite *firstPlayerSensorLeftSide;
BOOL firstPlayerCannotMoveLeft;
BOOL moveRight1;
BOOL moveLeft1;
BOOL firstPlayerHeadHittingBlock;
BOOL firstPlayerTouchingFloor;
BOOL firstPlayerCannotMoveRight;
BOOL firstPlayerCannotMoveLeft;
float firstPlayerJumpSpeed;
CCSprite *jumpButton;
CCSprite *activePowerUpButton;
BOOL jumpButtonTouched;
CCSprite *leftArrowButton;
CCSprite *rightArrowButton;
//float hidgonSpawnPointX;
//float hidgonSpawnPointY;
CCSprite *hidgonEnemySensorFeet;
CCSprite *hidgonEnemySensorRightSide;
CCSprite *firstPlayerSensorLeftSide;
Enemy *enemyHidgonSprite;
Enemy *parkourJumperSprite;
PowerUps *powerUpSprite;
Enemy *enemySkeletonWhaleSprite;
BOOL firstPlayerCurrentlyDead;
BOOL firstPlayerCurrentlyInvincible;
SimpleAudioEngine *gameMusic;
CCLabelBMFont *timeLabel;
CCLabelBMFont *stunBombsLeftCounterLabel;
int secs;
int mins;
SimpleAudioEngine *gameOverMusic;
SimpleAudioEngine *starPowerUpMusic;
CCLabelBMFont *yourScoreLabel;
CCLabelBMFont *hiScoreLabel;
int hiScoreSecs;
int hiScoreMins;
CCLabelBMFont *hiScoreSecsLabel;
CCLabelBMFont *hiScoreMinsLabel;
CCLabelBMFont *madAgentsLabel;
SimpleAudioEngine *fastGameMusic;
SimpleAudioEngine *fastBossMusic;
//float skeletonWhaleSpawnPointX;
//float skeletonWhaleSpawnPointY;
Enemy *enemyDiagonalFlyerEnemy;
Enemy *runningChaserEnemy;
Enemy *flyThroughWallsDiagonalFlyerEnemy;
Enemy *downwardShooterEnemy;
ExitDoor *exitDoor;
TimeBomb *timeBomb;
CCSprite *blueInventorySlot1;
CCSprite *blueInventorySlot2;
CCSprite *blueInventorySlot3;
CCSprite *redInventorySlot4;
CCSprite *redInventorySlot5;
CCSprite *redInventorySlot6;
CCAction *decreaseTimerAction;
CCAction *createPowerUpAction;
CCAction *increaseTimerAction;
UIPinchGestureRecognizer *pinchGestureRecognizer;
StunPowerUp *stunPowerUp;
CCSprite *stunBombForActivePowerUpButton;
BOOL activePowerUpButtonIsEmpty;
CCSprite *mindControlCocktailForActivePowerUpButton;
int powerUpCurrentlySelected;
CCLabelBMFont *mindControlCocktailsLeftCounterLabel;
MindControlPowerUp *mindControlPowerUp;
CCLabelBMFont *inGameCurrencyAmountLabel;
CCSprite *storeButton;
CCSprite *stunBombPurchaseIcon;
CCSprite *mindControllerPurchaseIcon;
CCSprite *globalStunPurchaseIcon;
CCSprite *sneakerPurchaseIcon;
int mindControllerPurchaseIconPriceValue;
int stunBombPurchaseIconPriceValue;
int sneakerPurchaseIconPriceValue;
int globalStunPurchaseIconPriceValue;
CCSprite *globalStunForActivePowerUpButton;
CCLabelBMFont *globalStunPowerUpsLeftCounterLabel;
BOOL playerHasDoubleJumpPowerUp;
int playersNumberOfJumpsAvailable;
CCSprite *stunProjectileForActivePowerUpButton;
CCLabelBMFont *stunProjectilesLeftCounterLabel;
CCSprite *invincibilityPowerUpPurchaseIcon;
int invincibilityPowerUpsLeft;
CCSprite *bulletTimePowerUpPurchaseIcon;
int bulletTimePowerUpPurchaseIconPriceValue;
int bulletTimePowerUpsLeft;
CCLabelBMFont *bulletTimePowerUpsLeftCounterLabel;
CCLabelBMFont *invincibilityPowerUpsLeftCounterLabel;
int numberOfStarsCollected;
CCSprite *invincibilityPowerUpForActivePowerUpButton;
CCSprite *bulletTimePowerUpForActivePowerUpButton;
CCSprite *star1;
CCSprite *star2;
CCSprite *star3;
CCLabelBMFont *tryHarderLabel;
CCLabelBMFont *noStarsRewardLabel;
CCLabelBMFont *notBadLabel;
CCLabelBMFont *inGameCurrencyAmountLabelOldAmountForOneStar;
CCLabelBMFont *inGameCurrencyAmountLabelOldAmountForTwoStars;
CCLabelBMFont *inGameCurrencyAmountLabelOldAmountForThreeStars;
CCLabelBMFont *inGameCurrencyAmountLabelNewAmount;
CCLabelBMFont *noStarsRewardMoneyAmountLabel;
CCLabelBMFont *oneStarRewardMoneyAmountLabel;
CCLabelBMFont *twoStarsRewardMoneyAmountLabel;
CCLabelBMFont *threeStarsRewardMoneyAmountLabel;
CCLabelBMFont *goodLabel;
CCLabelBMFont *youreAwesomeLabel;
CCLabelBMFont *madAgentsMainMenuTitleLabel;
CCLabelBMFont *newGameLabel;
CCLabelBMFont *loadGameLabel;
NSString *saveSlot1NameLabel;
NSString *saveSlot2NameLabel;
NSString *saveSlot3NameLabel;
BOOL enteringNameFromMainMenuScreen;
BOOL enteringNameFromLoadProfileScreen;
CCLabelBMFont *saveSlot1ForLoadScreenLabel;
CCLabelBMFont *saveSlot2ForLoadScreenLabel;
CCLabelBMFont *saveSlot3ForLoadScreenLabel;
BOOL levelSelectionMode;
CCLabelBMFont *deleteGameLabel;
CCSprite *downArrowButton;
CCSprite *mainMenuButton;
CCLabelBMFont *currentLevelLabel;
CCLabelBMFont *endOfDemoLabel;
BOOL gameMusicAlreadyPlaying;
MovingDoors *movingDoor;
int firstPlayerSpriteHeadCollisionWidth = 7;
int firstPlayerSpriteHeadCollisionHeight = 11;
InGameButton *inGameButton;
GameState gameState;
CCLabelBMFont *debugLabel;
CCLabelBMFont *multiplayerGameLabel;
CCLabelBMFont *hiScoreMultiplayerLabel;
CCLabelBMFont *player1Label;
CCLabelBMFont *player2Label;
BOOL isSinglePlayer;
CGPoint player1Position;
CGPoint player2Position;
GKPlayer *player;
GKPlayer *player2;
GKVoiceChat *teamChannel;
CCLabelBMFont *versusLabel;
NSArray *defs;
int player1VersusTotalWins;
int player2VersusTotalWins;
CCLabelBMFont *player1VersusScreeScoreLabel;
CCLabelBMFont *player2VersusScreeScoreLabel;
int inGamePowerUpSpawnPointPositionInteger;
CCLabelBMFont *player1ReadyLabel;
CCLabelBMFont *player2ReadyLabel;
LevelSelectorMenus *menu;
CharacterSelectionScreen *characterSelection;
int toPauseOrNotToPause;
int stageBottomLimitBorder;
int stageTopLimitBorder;
int stageLeftLimitBorder;
int stageRightLimitBorder;
int stageBottomTeleportationDestinationLimit;
int stageTopTeleportationDestinationLimit;
int stageRightTeleportationDesintationLimit;
int stageLeftTeleportationDestinationLimit;
CCSprite *whiteOvalForNuclearExplosion1;
CCSprite *solidWhiteFlashBang;
CGPoint firstPlayerSpritePostionAtVictory;


// HelloWorldLayer implementation
@implementation HelloWorldLayer



//@synthesize enemySpritesArray;



// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (void)sendData:(NSData *)data {
    NSError *error;
    BOOL success = [[GCHelper sharedInstance].match sendDataToAllPlayers:data withDataMode:GKMatchSendDataReliable error:&error];
    if (!success) {
        CCLOG(@"Error sending init packet");
        [self matchEnded];
    }
}

- (void)sendRandomNumber {
    
    MessageRandomNumber message;
    message.message.messageType = kMessageTypeRandomNumber;
    message.randomNumber = ourRandom;
    message.deviceSpeed = deviceSpeed;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageRandomNumber)];
    [self sendData:data];
}

- (void)sendGameBegin {
    
    MessageGameBegin message;
    message.message.messageType = kMessageTypeGameBegin;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageGameBegin)];
    [self sendData:data];
    
    [self loadMultiplayerVersusScreen];
}

- (void)sendGameOver:(BOOL)player1Won {
    
    MessageGameOver message;
    message.message.messageType = kMessageTypeGameOver;
    message.player1Won = player1Won;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageGameOver)];
    [self sendData:data];
}

- (void)sendMoveRight {
    
    MessageMoveRight message;
    message.message.messageType = kMessageTypeMoveRight;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMoveRight)];
    [self sendData:data];
}

- (void)sendMoveLeft {
    
    MessageMoveLeft message;
    message.message.messageType = kMessageTypeMoveLeft;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMoveLeft)];
    [self sendData:data];
}

- (void)sendJump {
    
    MessageJump message;
    message.message.messageType = kMessageTypeJump;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageJump)];
    [self sendData:data];
}

- (void)sendStopMoving {
    
    MessageStopMoving message;
    message.message.messageType = kMessageTypeStopMoving;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageStopMoving)];
    [self sendData:data];
}

- (void)sendStartMultiplayerVersusMatch {
    
    MessageStartMultiplayerVersusMatch message;
    message.message.messageType = kMessageTypeStartMultiplayerVersusMatch;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageStartMultiplayerVersusMatch)];
    [self sendData:data];
}

-(void) sendPlayer1IsDead {
    
    MessagePlayer1IsDead message;
    message.message.messageType = kMessageTypePlayer1IsDead;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessagePlayer1IsDead)];
    [self sendData:data];
}

-(void) sendPlayer2IsDead {
    
    MessagePlayer2IsDead message;
    message.message.messageType = kMessageTypePlayer2IsDead;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessagePlayer2IsDead)];
    [self sendData:data];
}

-(void) sendPlayer1Position {
    
    MessagePlayer1Position message;
    message.message.messageType = kMessageTypePlayer1Position;
    message.player1Position = firstPlayerSprite.position;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessagePlayer1Position)];
    [self sendData:data];
}

-(void) sendPlayer2Position {
    
    MessagePlayer2Position message;
    message.message.messageType = kMessageTypePlayer2Position;
    message.player2Position = secondPlayerSprite.position;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessagePlayer2Position)];
    [self sendData:data];
}

-(void) sendMakeHidgonFaceRight: (int)hidgonEnemyReferenceNumber {
    
    if (!isSinglePlayer) {
    
        MessageMakeHidgonFaceRight message;
        message.message.messageType = kMessageTypeMakeHidgonFaceRight;
        message.enemyReferenceNumber = hidgonEnemyReferenceNumber;
        NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeHidgonFaceRight)];
        [self sendData:data];
    }
}

-(void) sendMakeHidgonFaceLeft: (int)hidgonEnemyReferenceNumber {
    
    if (!isSinglePlayer) {
    
        MessageMakeHidgonFaceLeft message;
        message.message.messageType = kMessageTypeMakeHidgonFaceLeft;
        message.enemyReferenceNumber = hidgonEnemyReferenceNumber;
        NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeHidgonFaceLeft)];
        [self sendData:data];
    }
}

-(void) sendMakeSkeletonWhaleFaceLeft: (int)skeletonWhaleReferenceNumber {
    
    if (!isSinglePlayer) {
        
        MessageMakeHidgonFaceLeft message;
        message.message.messageType = kMessageTypeMakeSkeletonWhaleFaceLeft;
        message.enemyReferenceNumber = skeletonWhaleReferenceNumber;
        NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeHidgonFaceLeft)];
        [self sendData:data];
    }
}

-(void) sendMakeSkeletonWhaleFaceRight: (int)skeletonWhaleReferenceNumber {
    
    if (!isSinglePlayer) {
        
        MessageMakeHidgonFaceRight message;
        message.message.messageType = kMessageTypeMakeSkeletonWhaleFaceRight;
        message.enemyReferenceNumber = skeletonWhaleReferenceNumber;
        NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeHidgonFaceRight)];
        [self sendData:data];
    }
}

-(void) sendMakeParkourJumperFaceRight: (int)parkourJumperReferenceNumber {
    
    if (!isSinglePlayer) {
        
        MessageMakeParkourJumperFaceRight message;
        message.message.messageType = kMessageTypeMakeParkourJumperFaceRight;
        message.enemyReferenceNumber = parkourJumperReferenceNumber;
        NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeParkourJumperFaceRight)];
        [self sendData:data];
    }
}

-(void) sendMakeParkourJumperFaceLeft: (int)parkourJumperReferenceNumber {
    
    if (!isSinglePlayer) {
        
        MessageMakeParkourJumperFaceLeft message;
        message.message.messageType = kMessageTypeMakeParkourJumperFaceLeft;
        message.enemyReferenceNumber = parkourJumperReferenceNumber;
        NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeParkourJumperFaceLeft)];
        [self sendData:data];
    }
}

-(void) sendMakeHidgonShootFireballRight: (int)hidgonEnemyReferenceNumber
{
    if (!isSinglePlayer) {
    
        MessageMakeHidgonShootFireballRight message;
        message.message.messageType = kMessageTypeMakeHidgonShootFireballRight;
        message.enemyReferenceNumber = hidgonEnemyReferenceNumber;
        NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeHidgonShootFireballRight)];
        [self sendData:data];
    }
}

-(void) sendMakeHidgonShootFireballLeft: (int)hidgonEnemyReferenceNumber
{
    if (!isSinglePlayer) {
        
        MessageMakeHidgonShootFireballLeft message;
        message.message.messageType = kMessageTypeMakeHidgonShootFireballLeft;
        message.enemyReferenceNumber = hidgonEnemyReferenceNumber;
        NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeHidgonShootFireballLeft)];
        [self sendData:data];
    }
}

-(void) sendMakeHidgonRunningAnimationVisible: (int)hidgonEnemyReferenceNumber
{
    if (!isSinglePlayer) {
    
        MessageMakeHidgonRunningAnimationVisible message;
        message.message.messageType = kMessageTypeMakeHidgonRunningAnimationVisible;
        message.enemyReferenceNumber = hidgonEnemyReferenceNumber;
        NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeHidgonRunningAnimationVisible)];
        [self sendData:data];
    }
}

-(void) sendMakeHidgonStandingStillAnimationVisible: (int)hidgonEnemyReferenceNumber
{
    if (!isSinglePlayer) {
        
        MessageMakeHidgonStandingStillAnimationVisible message;
        message.message.messageType = kMessageTypeMakeHidgonStandingStillAnimationVisible;
        message.enemyReferenceNumber = hidgonEnemyReferenceNumber;
        NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeHidgonStandingStillAnimationVisible)];
        [self sendData:data];
    }
}

-(void) sendIncreaseTimerMessage
{
    MessageIncreaseTimer message;
    message.message.messageType = kMessageTypeIncreaseTimer;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageIncreaseTimer)];
    [self sendData:data];
}

-(void) sendMessageMakeFirstPlayerSpriteFaceRight
{
    MessageMakeFirstPlayerSpriteFaceRight message;
    message.message.messageType = kMessageTypeMakeFirstPlayerSpriteFaceRight;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeFirstPlayerSpriteFaceRight)];
    [self sendData:data];
}

-(void) sendMessageMakeFirstPlayerSpriteFaceLeft
{
    MessageMakeFirstPlayerSpriteFaceLeft message;
    message.message.messageType = kMessageTypeMakeFirstPlayerSpriteFaceLeft;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeFirstPlayerSpriteFaceLeft)];
    [self sendData:data];
}

-(void) sendMessageMakeSecondPlayerSpriteFaceLeft
{
    MessageMakeSecondPlayerSpriteFaceLeft message;
    message.message.messageType = kMessageTypeMakeSecondPlayerSpriteFaceLeft;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeSecondPlayerSpriteFaceLeft)];
    [self sendData:data];
}

-(void) sendMessageMakeSecondPlayerSpriteFaceRight
{
    MessageMakeSecondPlayerSpriteFaceRight message;
    message.message.messageType = kMessageTypeMakeSecondPlayerSpriteFaceRight;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageMakeSecondPlayerSpriteFaceRight)];
    [self sendData:data];
}

-(void) sendHidgonMovementsArrayForPlayer2 {
    
    MessagePlayerHidgonMovementsArrayForPlayer2 *oinf_arr_player2 = calloc(totalEnemyReferenceNumbersGlobal, sizeof(MessagePlayerHidgonMovementsArrayForPlayer2));
    
    oinf_arr_player2->total_number_of_elements = totalEnemyReferenceNumbersGlobal;
    
    int i = 0;
    
    for (NSNumber *o in hidgonMovementsArrayForPlayer2) {
        
        int hidgonMovementInteger = [o intValue];
                
        oinf_arr_player2[i].hidgon_Movement_Integer = hidgonMovementInteger;
        
        i = i + 1;        
    }
    
    oinf_arr_player2->message.messageType = kMessageTypeHidgonMovementsArrayForPlayer2;
    NSData *data = [NSData dataWithBytes: oinf_arr_player2 length: oinf_arr_player2->total_number_of_elements*sizeof(MessagePlayerHidgonMovementsArrayForPlayer2)];
        
    [self sendData:data];
    
    [hidgonMovementsArrayForPlayer2 removeAllObjects];
}

-(void) sendEnemyLocationsArrayForPlayer2 {
    
    MessageEnemyLocationsArrayForPlayer2 *oinf_enemy_positions_array_player2 = calloc(totalEnemyReferenceNumbersGlobal, sizeof(MessageEnemyLocationsArrayForPlayer2));
    
    oinf_enemy_positions_array_player2->total_number_of_elements = [enemySpritesArray count];
    
    int i = 0;
    
    for (Enemy *enemies in enemySpritesArray) {
                
        oinf_enemy_positions_array_player2[i].enemy_location_cgpoints = enemies.position;
        
        i = i + 1;
        
      //  NSLog (@"i = %i", i);
    }
    
    oinf_enemy_positions_array_player2->message.messageType = kMessageTypeEnemyLocationsArrayForPlayer2;
    NSData *data = [NSData dataWithBytes: oinf_enemy_positions_array_player2 length: oinf_enemy_positions_array_player2->total_number_of_elements*sizeof(MessageEnemyLocationsArrayForPlayer2)];
        
    [self sendData:data];
    
    [enemyPositionsForPlayer2Array removeAllObjects];
}

-(void) sendInGamePowerUpPosition {
    
    MessageSendInGamePowerUpPosition message;
    message.message.messageType = kMessageTypeSendInGamePowerUpPosition;
    message.inGamePowerUpPosition = inGamePowerUpSpawnPointPositionInteger;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageSendInGamePowerUpPosition)];
    [self sendData:data];
}

-(void) sendSetPowerUpToNotVisible {
    
    MessageSetPowerUpToNotVisible message;
    message.message.messageType = kMessageTypeSetPowerUpToNotVisible;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageSetPowerUpToNotVisible)];
    [self sendData:data];
}

-(void) sendCreateStunPowerUpAtOpposingPlayersPosition {

    MessageCreateStunPowerUpAtOpposingPlayersPosition message;
    message.message.messageType = kMessageTypeCreateStunPowerUpAtOpposingPlayersPosition;
    
    if (isPlayer1) 
        message.playerPosition = firstPlayerSprite.position;
    else if (!isPlayer1)
        message.playerPosition = secondPlayerSprite.position;
    
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessageCreateStunPowerUpAtOpposingPlayersPosition)];
    [self sendData:data];
}

-(void) sendPlayerReadyForMultiplayerMatch {
    
    MessagePlayerReadyForMultiplayerMatch message;
    message.message.messageType = kMessageTypePlayerReadyForMultiplayerMatch;
    NSData *data = [NSData dataWithBytes:&message length:sizeof(MessagePlayerReadyForMultiplayerMatch)];
    [self sendData:data];
}

-(void) setFirstPlayerIsStunnedToYes
{
    firstPlayerIsStunned = YES;
}

-(void) setFirstPlayerIsStunnedToNo
{
    firstPlayerIsStunned = NO;
}

-(void) setSecondPlayerIsStunnedToYes
{
    secondPlayerIsStunned = YES;
}

-(void) setSecondPlayerIsStunnedToNo
{
    secondPlayerIsStunned = NO;
}

-(void) addFirstPlayerSprite: (float)x y:(float)y
{
    mainPlayerBoxingGloveGlow = [CCSprite spriteWithFile: @"GlowInTheDarkAura.png"];
    [self addChild: mainPlayerBoxingGloveGlow z:0];
    mainPlayerBoxingGloveGlow.scale = 0.7;
    mainPlayerBoxingGloveGlow.opacity = 140;
    mainPlayerBoxingGloveGlow.scaleY = 1.3;
    mainPlayerBoxingGloveGlow.scaleX = 1.8;
    mainPlayerBoxingGloveGlow.color = ccYELLOW;
    [mainPlayerBoxingGloveGlow runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCScaleTo actionWithDuration:0.05 scaleX:1.5 scaleY:1.0], [CCScaleTo actionWithDuration:0.05 scaleX:1.8 scaleY:1.3], nil]]];
    mainPlayerBoxingGloveGlow.visible = NO;
    
    firstPlayerSprite = [CCSprite spriteWithFile: @"WhiteOval.png"];
    firstPlayerSprite.scale = 0.00001;
    firstPlayerSprite.position = ccp(x, y);
    [self addChild: firstPlayerSprite z: 25];
    [firstPlayerSpriteArray addObject: firstPlayerSprite];
    firstPlayerCurrentlyInvincible = NO;
    firstPlayerIsStunned = NO;
    
    
    if (playerColorAndGender == BLUE_BOY) {
    
        //pass in the name of the property list
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"MainCharacterBlueBoy.plist"];
    }
    
    else if (playerColorAndGender == GREEN_BOY) {
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"MainCharacterGreenBoy.plist"];
    }
    
    else if (playerColorAndGender == BEIGE_GIRL) {
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"MainCharacterBeigeGirl.plist"];
    }
    
    else if (playerColorAndGender == PURPLE_GIRL) {
        
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"MainCharacterPurpleGirl.plist"];
    }
    
    
    
    if (playerColorAndGender == BLUE_BOY) {
    
        //create the sprite sheet
        spriteSheetMainCharacterBlueBoyWalking = [CCSpriteBatchNode batchNodeWithFile: @"MainCharacterBlueBoy.png"];
    }
    
    else if (playerColorAndGender == GREEN_BOY) {
        
        spriteSheetMainCharacterBlueBoyWalking = [CCSpriteBatchNode batchNodeWithFile: @"MainCharacterGreenBoy.png"];
    }
    
    else if (playerColorAndGender == BEIGE_GIRL) {
        
        spriteSheetMainCharacterBlueBoyWalking = [CCSpriteBatchNode batchNodeWithFile: @"MainCharacterBeigeGirl.png"];
    }

    else if (playerColorAndGender == PURPLE_GIRL) {
        
        spriteSheetMainCharacterBlueBoyWalking = [CCSpriteBatchNode batchNodeWithFile: @"MainCharacterPurpleGirl.png"];
    }
    
    
    [self addChild: spriteSheetMainCharacterBlueBoyWalking z: 150];
    
    
    if (playerColorAndGender == BLUE_BOY) {
    
        //Create array of cairostance frames
        mainCharacterBlueBoyWalkingAnimFrames = [NSMutableArray array];
        for(int i = 2; i <= 5; ++i) {
            [mainCharacterBlueBoyWalkingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterBlueBoy%d.png", i]]];
        }
        
        //Create array of cairostance frames
        mainCharacterBlueBoyWalkingHoldingSomethingAnimFrames = [NSMutableArray array];
        for(int i = 14; i <= 17; ++i) {
            [mainCharacterBlueBoyWalkingHoldingSomethingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterBlueBoy%d.png", i]]];
        }
    }
    
    else if (playerColorAndGender == GREEN_BOY) {
        
        //Create array of cairostance frames
        mainCharacterBlueBoyWalkingAnimFrames = [NSMutableArray array];
        for(int i = 2; i <= 5; ++i) {
            [mainCharacterBlueBoyWalkingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterGreenBoy%d.png", i]]];
        }
        
        //Create array of cairostance frames
        mainCharacterBlueBoyWalkingHoldingSomethingAnimFrames = [NSMutableArray array];
        for(int i = 14; i <= 17; ++i) {
            [mainCharacterBlueBoyWalkingHoldingSomethingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterGreenBoy%d.png", i]]];
        }
    }
    
    else if (playerColorAndGender == BEIGE_GIRL) {
        
        //Create array of cairostance frames
        mainCharacterBlueBoyWalkingAnimFrames = [NSMutableArray array];
        for(int i = 2; i <= 5; ++i) {
            [mainCharacterBlueBoyWalkingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterBeigeGirl%d.png", i]]];
        }
        
        //Create array of cairostance frames
        mainCharacterBlueBoyWalkingHoldingSomethingAnimFrames = [NSMutableArray array];
        for(int i = 14; i <= 17; ++i) {
            [mainCharacterBlueBoyWalkingHoldingSomethingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterBeigeGirl%d.png", i]]];
        }
    }
    
    else if (playerColorAndGender == PURPLE_GIRL) {
        
        //Create array of cairostance frames
        mainCharacterBlueBoyWalkingAnimFrames = [NSMutableArray array];
        for(int i = 2; i <= 5; ++i) {
            [mainCharacterBlueBoyWalkingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterPurpleGirl%d.png", i]]];
        }
        
        //Create array of cairostance frames
        mainCharacterBlueBoyWalkingHoldingSomethingAnimFrames = [NSMutableArray array];
        for(int i = 14; i <= 17; ++i) {
            [mainCharacterBlueBoyWalkingHoldingSomethingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterPurpleGirl%d.png", i]]];
        }
    }
    

    
    //Create the animation object
    CCAnimation *mainCharacterBlueBoyWalkingAnim = [CCAnimation animationWithFrames:mainCharacterBlueBoyWalkingAnimFrames delay:0.08f];
    CCAnimation *mainCharacterBlueBoyWalkingHoldingSomethingAnim = [CCAnimation animationWithFrames:mainCharacterBlueBoyWalkingHoldingSomethingAnimFrames delay:0.08f];
    
    //Create sprite and run the animation
    if (playerColorAndGender == BLUE_BOY) {
        mainCharacterBlueBoyWalking = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoy2.png"];
        mainCharacterBlueBoyWalkingHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoy14.png"];
    }
    else if (playerColorAndGender == GREEN_BOY) {
        mainCharacterBlueBoyWalking = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoy2.png"];
        mainCharacterBlueBoyWalkingHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoy14.png"];
    }
    else if (playerColorAndGender == BEIGE_GIRL) {
        mainCharacterBlueBoyWalking = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirl2.png"];
        mainCharacterBlueBoyWalkingHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirl14.png"];
    }
    else if (playerColorAndGender == PURPLE_GIRL) {
        mainCharacterBlueBoyWalking = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirl2.png"];
        mainCharacterBlueBoyWalkingHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirl14.png"];
    }
    mainCharacterBlueBoyWalking.anchorPoint = ccp(0.5, 0.4);
    CCAction *mainCharacterBlueBoyWalkingAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: mainCharacterBlueBoyWalkingAnim restoreOriginalFrame:NO]];
    [mainCharacterBlueBoyWalking runAction: mainCharacterBlueBoyWalkingAction];
    mainCharacterBlueBoyWalking.visible = NO;
    mainCharacterBlueBoyWalking.position = ccp(x, y);
    mainCharacterBlueBoyWalking.scale = 0.5;
    [spriteSheetMainCharacterBlueBoyWalking addChild: mainCharacterBlueBoyWalking z:25];
    
    mainCharacterBlueBoyWalkingHoldingSomething.anchorPoint = ccp(0.5, 0.4);
    CCAction *mainCharacterBlueBoyWalkingHoldingSomethingAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: mainCharacterBlueBoyWalkingHoldingSomethingAnim restoreOriginalFrame:NO]];
    [mainCharacterBlueBoyWalkingHoldingSomething runAction: mainCharacterBlueBoyWalkingHoldingSomethingAction];
    mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
    mainCharacterBlueBoyWalkingHoldingSomething.position = ccp(x, y);
    mainCharacterBlueBoyWalkingHoldingSomething.scale = 0.5;
    [spriteSheetMainCharacterBlueBoyWalking addChild: mainCharacterBlueBoyWalkingHoldingSomething z:25];
    
    
    
    
    

    if (playerColorAndGender == BLUE_BOY) {
        mainCharacterBlueBoyStandingStill = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoy1.png"];
        mainCharacterBlueBoyStandingStillHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoy19.png"];
    }
    else if (playerColorAndGender == GREEN_BOY) {
        mainCharacterBlueBoyStandingStill = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoy1.png"];
        mainCharacterBlueBoyStandingStillHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoy19.png"];
    }
    else if (playerColorAndGender == BEIGE_GIRL) {
        mainCharacterBlueBoyStandingStill = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirl1.png"];
        mainCharacterBlueBoyStandingStillHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirl19.png"];
    }
    else if (playerColorAndGender == PURPLE_GIRL) {
        mainCharacterBlueBoyStandingStill = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirl1.png"];
        mainCharacterBlueBoyStandingStillHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirl19.png"];
    }
    mainCharacterBlueBoyStandingStill.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyStandingStill z:25];
    mainCharacterBlueBoyStandingStill.position = ccp(x, y);
    mainCharacterBlueBoyStandingStill.visible = NO;
    mainCharacterBlueBoyStandingStill.scale = 0.5;
    mainCharacterBlueBoyStandingStillHoldingSomething.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyStandingStillHoldingSomething z:25];
    mainCharacterBlueBoyStandingStillHoldingSomething.position = ccp(x, y);
    mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
    mainCharacterBlueBoyStandingStillHoldingSomething.scale = 0.5;
    
    
    
    
    if (playerColorAndGender == BLUE_BOY) {
        mainCharacterBlueBoyJumping = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoy9.png"];
        mainCharacterBlueBoyJumpingHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoy18.png"];
    }
    else if (playerColorAndGender == GREEN_BOY) {
        mainCharacterBlueBoyJumping = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoy9.png"];
        mainCharacterBlueBoyJumpingHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoy18.png"];
    }
    else if (playerColorAndGender == BEIGE_GIRL) {
        mainCharacterBlueBoyJumping = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirl9.png"];
        mainCharacterBlueBoyJumpingHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirl18.png"];
    }
    else if (playerColorAndGender == PURPLE_GIRL) {
        mainCharacterBlueBoyJumping = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirl9.png"];
        mainCharacterBlueBoyJumpingHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirl18.png"];
    }
    mainCharacterBlueBoyJumping.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyJumping z:25];
    mainCharacterBlueBoyJumping.position = ccp(x, y);
    mainCharacterBlueBoyJumping.visible = NO;
    mainCharacterBlueBoyJumping.scale = 0.5;
    mainCharacterBlueBoyJumpingHoldingSomething.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyJumpingHoldingSomething z:25];
    mainCharacterBlueBoyJumpingHoldingSomething.position = ccp(x, y);
    mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
    mainCharacterBlueBoyJumpingHoldingSomething.scale = 0.5;
    
    if (playerColorAndGender == BLUE_BOY)
        mainCharacterBlueBoyDead = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoy6.png"];
    else if (playerColorAndGender == GREEN_BOY)
        mainCharacterBlueBoyDead = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoy6.png"];
    else if (playerColorAndGender == BEIGE_GIRL)
        mainCharacterBlueBoyDead = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirl6.png"];
    else if (playerColorAndGender == PURPLE_GIRL)
        mainCharacterBlueBoyDead = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirl6.png"]; 
    mainCharacterBlueBoyDead.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyDead z:25];
    mainCharacterBlueBoyDead.position = ccp(x, y);
    mainCharacterBlueBoyDead.visible = NO;
    mainCharacterBlueBoyDead.scale = 0.5;
    
    if (playerColorAndGender == BLUE_BOY)
        mainCharacterBlueBoyHoldingUpBoxingGlove = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoy10.png"];
    else if (playerColorAndGender == GREEN_BOY)
        mainCharacterBlueBoyHoldingUpBoxingGlove = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoy10.png"];
    else if (playerColorAndGender == BEIGE_GIRL)
        mainCharacterBlueBoyHoldingUpBoxingGlove = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirl10.png"];
    else if (playerColorAndGender == PURPLE_GIRL)
        mainCharacterBlueBoyHoldingUpBoxingGlove = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirl10.png"];
    mainCharacterBlueBoyHoldingUpBoxingGlove.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyHoldingUpBoxingGlove z:25];
    mainCharacterBlueBoyHoldingUpBoxingGlove.position = ccp(x, y);
    mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
    mainCharacterBlueBoyHoldingUpBoxingGlove.scale = 0.5;
        
    
    
    
    
    //Starting here, integration of Blue Boy WITH Sneakers
    //pass in the name of the property list
    if (playerColorAndGender == BLUE_BOY)
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"MainCharacterBlueBoyWithSneakers.plist"];
    else if (playerColorAndGender == GREEN_BOY)
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"MainCharacterGreenBoyWithSneakers.plist"];
    else if (playerColorAndGender == BEIGE_GIRL)
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"MainCharacterBeigeGirlWithSneakers.plist"];
    else if (playerColorAndGender == PURPLE_GIRL)
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"MainCharacterPurpleGirlWithSneakers.plist"];
    
    if (playerColorAndGender == BLUE_BOY)
    //create the sprite sheet
        spriteSheetMainCharacterBlueBoyWalkingWithSneakers = [CCSpriteBatchNode batchNodeWithFile: @"MainCharacterBlueBoyWithSneakers.png"];
    else if (playerColorAndGender == GREEN_BOY)
        spriteSheetMainCharacterBlueBoyWalkingWithSneakers = [CCSpriteBatchNode batchNodeWithFile: @"MainCharacterGreenBoyWithSneakers.png"];
    else if (playerColorAndGender == BEIGE_GIRL)
        spriteSheetMainCharacterBlueBoyWalkingWithSneakers = [CCSpriteBatchNode batchNodeWithFile: @"MainCharacterBeigeGirlWithSneakers.png"];
    else if (playerColorAndGender == PURPLE_GIRL)
        spriteSheetMainCharacterBlueBoyWalkingWithSneakers = [CCSpriteBatchNode batchNodeWithFile: @"MainCharacterPurpleGirlWithSneakers.png"];

    [self addChild: spriteSheetMainCharacterBlueBoyWalkingWithSneakers z: 150];
    
    NSMutableArray *mainCharacterBlueBoyWalkingWithSneakersAnimFrames;
    NSMutableArray *mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAnimFrames;
    if (playerColorAndGender == BLUE_BOY) {
        
        //Create array of cairostance frames
        mainCharacterBlueBoyWalkingWithSneakersAnimFrames = [NSMutableArray array];
        for(int i = 2; i <= 5; ++i) {
            [mainCharacterBlueBoyWalkingWithSneakersAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterBlueBoyWithSneakers%d.png", i]]];
        }
        
        //Create array of cairostance frames
        mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAnimFrames = [NSMutableArray array];
        for(int i = 14; i <= 17; ++i) {
            [mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterBlueBoyWithSneakers%d.png", i]]];
        }
    }
    
    else if (playerColorAndGender == GREEN_BOY) {
        
         mainCharacterBlueBoyWalkingWithSneakersAnimFrames = [NSMutableArray array];
         for(int i = 2; i <= 5; ++i) {
             [mainCharacterBlueBoyWalkingWithSneakersAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterGreenBoyWithSneakers%d.png", i]]];
         }
        
        mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAnimFrames = [NSMutableArray array];
        for(int i = 14; i <= 17; ++i) {
            [mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterGreenBoyWithSneakers%d.png", i]]];
        }
    }
    
    else if (playerColorAndGender == BEIGE_GIRL) {
        
        mainCharacterBlueBoyWalkingWithSneakersAnimFrames = [NSMutableArray array];
        for(int i = 2; i <= 5; ++i) {                           
            [mainCharacterBlueBoyWalkingWithSneakersAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterBeigeGirlWithSneakers%d.png", i]]];
        }
        
        mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAnimFrames = [NSMutableArray array];
        for(int i = 14; i <= 17; ++i) {
            [mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterBeigeGirlWithSneakers%d.png", i]]];
        }
    }
    
    else if (playerColorAndGender == PURPLE_GIRL) {
        
        mainCharacterBlueBoyWalkingWithSneakersAnimFrames = [NSMutableArray array];
        for(int i = 2; i <= 5; ++i) {
            [mainCharacterBlueBoyWalkingWithSneakersAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterPurpleGirlWithSneakers%d.png", i]]];
        }
        
        mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAnimFrames = [NSMutableArray array];
        for(int i = 14; i <= 17; ++i) {
            [mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"MainCharacterPurpleGirlWithSneakers%d.png", i]]];
        }
    }
    
    //Create the animation object
    CCAnimation *mainCharacterBlueBoyWalkingWithSneakersAnim = [CCAnimation animationWithFrames:mainCharacterBlueBoyWalkingWithSneakersAnimFrames delay:0.08f];
    //Create the animation object
    CCAnimation *mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAnim = [CCAnimation animationWithFrames:mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAnimFrames delay:0.08f];
    
    //Create sprite and run the animation
    if (playerColorAndGender == BLUE_BOY) {
        mainCharacterBlueBoyWalkingWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoyWithSneakers2.png"];
        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoyWithSneakers14.png"];
    }
    else if (playerColorAndGender == GREEN_BOY) {
        mainCharacterBlueBoyWalkingWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoyWithSneakers2.png"];
        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoyWithSneakers14.png"];
    }
    else if (playerColorAndGender == BEIGE_GIRL) {
        mainCharacterBlueBoyWalkingWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirlWithSneakers2.png"];
        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirlWithSneakers14.png"];
    }
    else if (playerColorAndGender == PURPLE_GIRL) {
        mainCharacterBlueBoyWalkingWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirlWithSneakers2.png"];
        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirlWithSneakers14.png"];
    }
    mainCharacterBlueBoyWalkingWithSneakers.anchorPoint = ccp(0.5, 0.4);
    CCAction *mainCharacterBlueBoyWalkingWithSneakersAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: mainCharacterBlueBoyWalkingWithSneakersAnim restoreOriginalFrame:NO]];
    [mainCharacterBlueBoyWalkingWithSneakers runAction: mainCharacterBlueBoyWalkingWithSneakersAction];
    mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
    mainCharacterBlueBoyWalkingWithSneakers.position = ccp(x, y);
    mainCharacterBlueBoyWalkingWithSneakers.scale = 0.5;
    [spriteSheetMainCharacterBlueBoyWalkingWithSneakers addChild: mainCharacterBlueBoyWalkingWithSneakers z:25];
    
    mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.anchorPoint = ccp(0.5, 0.4);
    CCAction *mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAnim restoreOriginalFrame:NO]];
    [mainCharacterBlueBoyWalkingWithSneakersHoldingSomething runAction: mainCharacterBlueBoyWalkingWithSneakersHoldingSomethingAction];
    mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = NO;
    mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.position = ccp(x, y);
    mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.scale = 0.5;
    [spriteSheetMainCharacterBlueBoyWalkingWithSneakers addChild: mainCharacterBlueBoyWalkingWithSneakersHoldingSomething z:25];
    
    
    if (playerColorAndGender == BLUE_BOY) {
        mainCharacterBlueBoyStandingStillWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoyWithSneakers1.png"];
        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoyWithSneakers19.png"];
    }
    else if (playerColorAndGender == GREEN_BOY) {
        mainCharacterBlueBoyStandingStillWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoyWithSneakers1.png"];
        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoyWithSneakers19.png"];
    }
    else if (playerColorAndGender == BEIGE_GIRL) {
        mainCharacterBlueBoyStandingStillWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirlWithSneakers1.png"];
        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirlWithSneakers19.png"];
    }
    else if (playerColorAndGender == PURPLE_GIRL) {
        mainCharacterBlueBoyStandingStillWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirlWithSneakers1.png"];
        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirlWithSneakers19.png"];
    }
    mainCharacterBlueBoyStandingStillWithSneakers.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyStandingStillWithSneakers z:25];
    mainCharacterBlueBoyStandingStillWithSneakers.position = ccp(x, y);
    mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
    mainCharacterBlueBoyStandingStillWithSneakers.scale = 0.5;
    mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething z:25];
    mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.position = ccp(x, y);
    mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = NO;
    mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.scale = 0.5;
    
    
    if (playerColorAndGender == BLUE_BOY) {
        mainCharacterBlueBoyJumpingWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoyWithSneakers9.png"];
        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoyWithSneakers18.png"];
    }
    else if (playerColorAndGender == GREEN_BOY) {
        mainCharacterBlueBoyJumpingWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoyWithSneakers9.png"];
        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoyWithSneakers18.png"];
    }
    else if (playerColorAndGender == BEIGE_GIRL) {
        mainCharacterBlueBoyJumpingWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirlWithSneakers9.png"];
        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirlWithSneakers18.png"];
    }
    else if (playerColorAndGender == PURPLE_GIRL) {
        mainCharacterBlueBoyJumpingWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirlWithSneakers9.png"];
        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirlWithSneakers18.png"];
    }
    mainCharacterBlueBoyJumpingWithSneakers.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyJumpingWithSneakers z:25];
    mainCharacterBlueBoyJumpingWithSneakers.position = ccp(x, y);
    mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
    mainCharacterBlueBoyJumpingWithSneakers.scale = 0.5;
    mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyJumpingWithSneakersHoldingSomething z:25];
    mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.position = ccp(x, y);
    mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
    mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.scale = 0.5;
    
    
    if (playerColorAndGender == BLUE_BOY)
        mainCharacterBlueBoyDeadWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoyWithSneakers6.png"];
    else if (playerColorAndGender == GREEN_BOY)
        mainCharacterBlueBoyDeadWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoyWithSneakers6.png"];
    else if (playerColorAndGender == BEIGE_GIRL)
        mainCharacterBlueBoyDeadWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirlWithSneakers6.png"];
    else if (playerColorAndGender == PURPLE_GIRL)
        mainCharacterBlueBoyDeadWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirlWithSneakers6.png"];
    
    mainCharacterBlueBoyDeadWithSneakers.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyDeadWithSneakers z:25];
    mainCharacterBlueBoyDeadWithSneakers.position = ccp(x, y);
    mainCharacterBlueBoyDeadWithSneakers.visible = NO;
    mainCharacterBlueBoyDeadWithSneakers.scale = 0.5;
    
    if (playerColorAndGender == BLUE_BOY)
        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoyWithSneakers10.png"];
    else if (playerColorAndGender == GREEN_BOY)
        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoyWithSneakers10.png"];
    else if (playerColorAndGender == BEIGE_GIRL)
        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirlWithSneakers10.png"];
    else if (playerColorAndGender == PURPLE_GIRL)
        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirlWithSneakers10.png"];
    mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers z:25];
    mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.position = ccp(x, y);
    mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = NO;
    mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.scale = 0.5;
        

    
    //Add all 'sprites' to array
    firstPlayerSpritesArray = [[NSMutableArray alloc] init];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyStandingStill];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyStandingStillHoldingSomething];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyJumping];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyJumpingHoldingSomething];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyWalking];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyWalkingHoldingSomething];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyDead];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyHoldingUpBoxingGlove];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyStandingStillWithSneakers];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyJumpingWithSneakers];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyJumpingWithSneakersHoldingSomething];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyWalkingWithSneakers];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyWalkingWithSneakersHoldingSomething];
    [firstPlayerSpritesArray addObject: mainCharacterBlueBoyDeadWithSneakers];
    
    
    
    firstPlayerIsStunned = NO;
    firstPlayerCurrentlyInvincible = NO;
    
    
    firstPlayerSensorFeet = [CCSprite spriteWithFile: @"dot.png"];
    [self addChild: firstPlayerSensorFeet z: 200];
    firstPlayerSensorFeet.color = ccWHITE;
    firstPlayerSensorFeet.scale = 1.0;
    firstPlayerSensorFeet.position = ccp(x, y);
    firstPlayerSensorFeet.visible = NO;
    
    firstPlayerSensorRightSide = [CCSprite spriteWithFile: @"dot.png"];
    [self addChild: firstPlayerSensorRightSide z: 200];
    firstPlayerSensorRightSide.color = ccWHITE;
    firstPlayerSensorRightSide.scale = 1.0;
    firstPlayerSensorRightSide.position = ccp(x, y);
    firstPlayerSensorRightSide.visible = NO;
    
    firstPlayerSensorLeftSide = [CCSprite spriteWithFile: @"dot.png"];
    [self addChild: firstPlayerSensorLeftSide z: 200];
    firstPlayerSensorLeftSide.color = ccWHITE;
    firstPlayerSensorLeftSide.scale = 1.0;
    firstPlayerSensorLeftSide.position = ccp(x, y);
    firstPlayerSensorLeftSide.visible = NO;
}

-(void) addTimeBomb: (float)x y:(float)y
{
    timeBomb = [TimeBomb nodeWithTheGame: self];
    timeBomb.position = ccp(x, y);
    [timeBombArray addObject: timeBomb];
}

-(void) addExitDoor: (float)x y:(float)y
{
    exitDoor = [ExitDoor nodeWithTheGame: self];
    exitDoor.position = ccp(x, y);
    [exitDoorArray addObject: exitDoor];
}

-(void) addHidgonEnemySprite: (float)x y:(float)y
{
    globalEnemyType = HIDGON_ENEMY_TYPE;
    enemyHidgonSprite = [Enemy nodeWithTheGame:self];
    enemyHidgonSprite.position = ccp(x, y);
    
    enemyReferenceNumberGlobal = enemyReferenceNumberGlobal + 1;
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
}

-(void) addParkourJumperSprite: (float)x y:(float)y
{
    globalEnemyType = PARKOUR_JUMPER_TYPE;
    parkourJumperSprite = [Enemy nodeWithTheGame:self];
    
    if (deviceIsIpad) {
        
        parkourJumperSprite.position = ccp(x + 300, y + 300);
    }
    
    if (!deviceIsIpad) {
    
        parkourJumperSprite.position = ccp(x, y);
    }
    
    enemyReferenceNumberGlobal = enemyReferenceNumberGlobal + 1;
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
}

-(void) addSkeletonWhaleEnemySprite: (float)x y:(float)y
{
    globalEnemyType = SKELETON_WHALE_TYPE;
    enemySkeletonWhaleSprite = [Enemy nodeWithTheGame: self];
    enemySkeletonWhaleSprite.position = ccp(x, y);
    
    enemyReferenceNumberGlobal = enemyReferenceNumberGlobal + 1;
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
}

-(void) addFlyThroughWallsDiagonalFlyerEnemySprite: (float)x y:(float)y
{
    globalEnemyType = FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE;
    flyThroughWallsDiagonalFlyerEnemy = [Enemy nodeWithTheGame: self];
    flyThroughWallsDiagonalFlyerEnemy.position = ccp(x, y);
    
    enemyReferenceNumberGlobal = enemyReferenceNumberGlobal + 1;
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
}

-(void) addDiagonalFlyerEnemySprite: (float)x y:(float)y
{
    globalEnemyType = DIAGONAL_FLYER_TYPE;
    enemyDiagonalFlyerEnemy = [Enemy nodeWithTheGame: self];
    enemyDiagonalFlyerEnemy.position = ccp(x, y);
    
    enemyReferenceNumberGlobal = enemyReferenceNumberGlobal + 1;
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
}

-(void) addDownwardShooterEnemySprite: (float)x y:(float)y
{
    globalEnemyType = DOWNWARD_SHOOTER_TYPE;
    downwardShooterEnemy = [Enemy nodeWithTheGame: self];
    downwardShooterEnemy.position = ccp(x, y);
    
    downwardShooterEnemy.downwardShooterEnemyWalkingRight = YES;
    
    enemyReferenceNumberGlobal = enemyReferenceNumberGlobal + 1;
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
}

-(void) addMovingDoorSprite: (float)x y:(float)y
{
    movingDoor = [MovingDoors nodeWithTheGame: self];
    movingDoor.position = ccp(x, y);
}

-(void) addInGameButtonSprite: (float)x y:(float) y
{
    inGameButton = [InGameButton nodeWithTheGame: self];
    inGameButton.position = ccp(x, y);
    [inGameButtonArray addObject: inGameButton];
}

-(void) addRunningChaserEnemySprite: (float)x y:(float)y
{
    globalEnemyType = CHASER_ENEMY_TYPE;
    runningChaserEnemy = [Enemy nodeWithTheGame: self];
    runningChaserEnemy.position = ccp(x, y);
        
    enemyReferenceNumberGlobal = enemyReferenceNumberGlobal + 1;
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
}

-(void) addStarInGameCurrency: (float)x y:(float)y
{
    randomPowerUp = STAR_IN_GAME_CURRENCY;
    powerUpSprite = [PowerUps nodeWithTheGame:self];
    powerUpSprite.position = ccp(x, y);
    [powerUpsArray addObject: powerUpSprite];
}

-(void) addBoxingGlovePowerUp: (float)x y:(float)y
{
    randomPowerUp = BOXING_GLOVE;
    powerUpSprite = [PowerUps nodeWithTheGame:self];
    powerUpSprite.position = ccp(x, y);
    [powerUpsArray addObject: powerUpSprite];
}

-(void) addPermanantMindControlPowerUp: (float)x y:(float)y
{
    randomPowerUp = MIND_CONTROL_POWER_UP;
    powerUpSprite = [PowerUps nodeWithTheGame:self];
    powerUpSprite.position = ccp(x, y);
    [powerUpsArray addObject: powerUpSprite];
}

-(void) addPermanantStunBombPowerUp: (float)x y:(float)y
{
    randomPowerUp = STUN_POWER_UP;
    powerUpSprite = [PowerUps nodeWithTheGame:self];
    powerUpSprite.position = ccp(x, y);
    [powerUpsArray addObject: powerUpSprite];
}

-(void) addPermanantStunProjectilePowerUp: (float)x y:(float)y
{
    randomPowerUp = STUN_PROJECTILE_POWER_UP;
    powerUpSprite = [PowerUps nodeWithTheGame:self];
    powerUpSprite.position = ccp(x, y);
    [powerUpsArray addObject: powerUpSprite];
}

-(void) addPermanantInvincibilityPowerUp: (float)x y:(float)y
{
    randomPowerUp = INVINCIBILITY_POWER_UP;
    powerUpSprite = [PowerUps nodeWithTheGame:self];
    powerUpSprite.position = ccp(x, y);
    [powerUpsArray addObject: powerUpSprite];
}

-(void) addPermanantBulletTimePowerUp: (float)x y:(float)y
{
    randomPowerUp = BULLET_TIME_POWER_UP;
    powerUpSprite = [PowerUps nodeWithTheGame:self];
    powerUpSprite.position = ccp(x, y);
    [powerUpsArray addObject: powerUpSprite];
}

-(void) addPermanantGlobalStunPowerUp: (float)x y:(float)y
{
    randomPowerUp = GLOBAL_STUN_POWER_UP;
    powerUpSprite = [PowerUps nodeWithTheGame:self];
    powerUpSprite.position = ccp(x, y);
    [powerUpsArray addObject: powerUpSprite];
}

-(void) addPowerUpSprite: (float)x y:(float)y
{
    
    if (isSinglePlayer) {
    
        randomPowerUp = arc4random()%7;
        
        if (randomPowerUp == SNEAKER_POWER_UP && firstPlayerHasSneakers) {
            
            randomPowerUp = STUN_POWER_UP;
        }
    }
    
    else if (!isSinglePlayer) {
        
        randomPowerUp = STUN_POWER_UP;
    }
        
    powerUpSprite = [PowerUps nodeWithTheGame:self];
    powerUpSprite.position = ccp(x, y);
    [powerUpsArray addObject: powerUpSprite];
}

-(void) addStunPowerUpSprite: (float)x y:(float)y
{    
    stunPowerUp = [StunPowerUp nodeWithTheGame:self];
    stunPowerUp.position = ccp(x, y);
    [stunPowerUpArray addObject: stunPowerUp];
}

-(void) addSecondPlayer: (float)x y:(float)y
{
    secondPlayerSprite = [[SecondPlayer nodeWithTheGame: self] retain];
    secondPlayerSprite.position = ccp(x, y);
    [secondPlayerSpriteArray addObject: secondPlayerSprite];
    secondPlayerIsStunned = NO;
    
    secondPlayerSensorFeet = [CCSprite spriteWithFile: @"dot.png"];
    [self addChild: secondPlayerSensorFeet z: 200];
    secondPlayerSensorFeet.color = ccWHITE;
    secondPlayerSensorFeet.scale = 1.0;
    secondPlayerSensorFeet.visible = NO;
    
    secondPlayerSensorRightSide = [CCSprite spriteWithFile: @"dot.png"];
    [self addChild: secondPlayerSensorRightSide z: 200];
    secondPlayerSensorRightSide.color = ccWHITE;
    secondPlayerSensorRightSide.scale = 1.0;
    secondPlayerSensorRightSide.visible = NO;
    
    secondPlayerSensorLeftSide = [CCSprite spriteWithFile: @"dot.png"];
    [self addChild: secondPlayerSensorLeftSide z: 200];
    secondPlayerSensorLeftSide.color = ccWHITE;
    secondPlayerSensorLeftSide.scale = 1.0;
    secondPlayerSensorLeftSide.visible = NO;
}

-(void) shootStunProjectile: (float)x y:(float)y
{
    stunProjectileInGame = [StunProjectilePowerUp nodeWithTheGame:self];
    stunProjectileInGame.position = ccp(x, y);
    [stunProjectileArray addObject: stunProjectileInGame];
}

-(void) addMindControlPowerUpSprite: (float)x y:(float)y
{
    mindControlPowerUp = [MindControlPowerUp nodeWithTheGame:self];
    mindControlPowerUp.position = ccp(x, y);
    [mindControlPowerUpArray addObject: mindControlPowerUp];
}

-(void) addMoreHidgonEnemySprites {
    
    globalEnemyType = HIDGON_ENEMY_TYPE;
    enemyHidgonSprite = [Enemy nodeWithTheGame: self];
    enemyHidgonSprite.position = ccp(60, 290);
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
    
    globalEnemyType = HIDGON_ENEMY_TYPE;
    enemyHidgonSprite = [Enemy nodeWithTheGame: self];
    enemyHidgonSprite.position = ccp(400, 290);
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
}

-(void) addMoreSkeletonEnemySprites {
    
    globalEnemyType = SKELETON_WHALE_TYPE;
    enemySkeletonWhaleSprite = [Enemy nodeWithTheGame: self];
    enemySkeletonWhaleSprite.position = ccp(60, 280);
    enemyReferenceNumberGlobal = enemyReferenceNumberGlobal + 1;
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
    
    globalEnemyType = SKELETON_WHALE_TYPE;
    enemySkeletonWhaleSprite = [Enemy nodeWithTheGame: self];
    enemySkeletonWhaleSprite.position = ccp(400, 280);
    enemyReferenceNumberGlobal = enemyReferenceNumberGlobal + 1;
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
}

-(void) addMoreFlyThroughWallsDiagonalFlyerEnemySprites {
    
    globalEnemyType = FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE;
    flyThroughWallsDiagonalFlyerEnemy = [Enemy nodeWithTheGame: self];
    flyThroughWallsDiagonalFlyerEnemy.position = ccp(60, 280);
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
    
    globalEnemyType = FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE;
    flyThroughWallsDiagonalFlyerEnemy = [Enemy nodeWithTheGame: self];
    flyThroughWallsDiagonalFlyerEnemy.position = ccp(400, 280);
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
}

-(void) addMoreDiagonalFlyerEnemySprites {

    globalEnemyType = DIAGONAL_FLYER_TYPE;
    enemyDiagonalFlyerEnemy = [Enemy nodeWithTheGame: self];
    enemyDiagonalFlyerEnemy.position = ccp(60, 280);
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
    
    globalEnemyType = DIAGONAL_FLYER_TYPE;
    enemyDiagonalFlyerEnemy = [Enemy nodeWithTheGame: self];
    enemyDiagonalFlyerEnemy.position = ccp(400, 280);
    totalEnemyReferenceNumbersGlobal = totalEnemyReferenceNumbersGlobal + 1;
}


-(void) setFirstPlayerCurrentlyInvincibleToNo {
    
    firstPlayerCurrentlyInvincible = NO;
}

-(void) respawnFirstPlayer
{
    firstPlayerCurrentlyInvincible = YES;
    firstPlayerCurrentlyDead = NO;
    
    firstPlayerSprite.visible = YES;
    
    firstPlayerSprite.position = ccp(cairoX, cairoY);
    [firstPlayerSprite runAction: [CCSequence actions: [CCRotateTo actionWithDuration:0.0 angle: 0], [CCFadeTo actionWithDuration:0.1 opacity:120], [CCDelayTime actionWithDuration: 3.0], [CCFadeTo actionWithDuration:0.0 opacity:255], [CCCallFunc actionWithTarget:self selector:@selector(setFirstPlayerCurrentlyInvincibleToNo)], nil]];
}

-(void) powerUpSelected
{
    if (powerUpCurrentlySelected == STUN_POWER_UP_SELECTED) {
                
        //Move stunBomb icon to activePowerUpButton
        [stunBombForActivePowerUpButton runAction: [CCMoveTo actionWithDuration:0.5 position: activePowerUpButton.position]];
        [stunBombForActivePowerUpButton runAction: [CCScaleTo actionWithDuration:0.5 scale:1.5]];
        stunBombForActivePowerUpButton.visible = YES;
        
        mindControlCocktailForActivePowerUpButton.visible = NO;
        stunProjectileForActivePowerUpButton.visible = NO;
    }
    
    else if (powerUpCurrentlySelected == MIND_CONTROL_POWER_UP_SELECTED) {
                
        //Move mindControlIcon icon to activePowerUpButton
        [mindControlCocktailForActivePowerUpButton runAction: [CCMoveTo actionWithDuration:0.5 position:activePowerUpButton.position]];
        [mindControlCocktailForActivePowerUpButton runAction: [CCScaleTo actionWithDuration:0.5 scale:1.6]];
        mindControlCocktailForActivePowerUpButton.visible = YES;

        stunBombForActivePowerUpButton.visible = NO;
        stunProjectileForActivePowerUpButton.visible = NO;
    }
    
    else if (powerUpCurrentlySelected == STUN_PROJECTILE_POWER_UP_SELECTED) {
        
        //Move globalStun icon to activePowerUpButton
        [stunProjectileForActivePowerUpButton runAction: [CCMoveTo actionWithDuration:0.5 position:activePowerUpButton.position]];
        [stunProjectileForActivePowerUpButton runAction: [CCScaleTo actionWithDuration:0.5 scale:1.5]];
        stunProjectileForActivePowerUpButton.visible = YES;
        
        stunBombForActivePowerUpButton.visible = NO;
        mindControlCocktailForActivePowerUpButton.visible = NO;
    }
}

-(void) step: (ccTime) delta
{    
    //If Chartboost ad was just dismissed then run mainPlayerWalkingOffScreen method
    if (chartBoostAdWasJustDismissed == YES) {
        
        chartBoostAdWasJustDismissed = NO;
        
        [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.65], [CCCallFunc actionWithTarget:self selector:@selector(mainPlayerWalkingOffScreenOnVictoryScreen)], nil]];
    }
    
    if (!isPaused) {
        
        mainCharacterBlueBoyJumping.position = firstPlayerSprite.position;
        mainCharacterBlueBoyJumpingHoldingSomething.position = firstPlayerSprite.position;
        mainCharacterBlueBoyStandingStill.position = firstPlayerSprite.position;
        mainCharacterBlueBoyStandingStillHoldingSomething.position = firstPlayerSprite.position;
        mainCharacterBlueBoyWalking.position = firstPlayerSprite.position;
        mainCharacterBlueBoyWalkingHoldingSomething.position = firstPlayerSprite.position;
        mainCharacterBlueBoyDead.position = firstPlayerSprite.position;
        mainCharacterBlueBoyHoldingUpBoxingGlove.position = firstPlayerSprite.position;
        
        mainCharacterBlueBoyJumpingWithSneakers.position = firstPlayerSprite.position;
        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.position = firstPlayerSprite.position;
        mainCharacterBlueBoyStandingStillWithSneakers.position = firstPlayerSprite.position;
        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.position = firstPlayerSprite.position;
        mainCharacterBlueBoyWalkingWithSneakers.position = firstPlayerSprite.position;
        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.position = firstPlayerSprite.position;
        mainCharacterBlueBoyDeadWithSneakers.position = firstPlayerSprite.position;
        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.position = firstPlayerSprite.position;

        mainPlayerBoxingGloveGlow.position = firstPlayerSprite.position;
    }
    
    //If firstPlayer is stunned turn firstPlayerSprite blue
    if (firstPlayerIsStunned && !isPaused && !playerHasInvincibilityPowerUp)
        firstPlayerSprite.color = ccBLUE;
    else if (!isPaused && !playerHasInvincibilityPowerUp)
        firstPlayerSprite.color = ccWHITE;
    
    //If secondPlayer is stunned turn secondPlayerSprite blue
    if (secondPlayerIsStunned && !isPaused)
        secondPlayerSprite.mySprite.color = ccBLUE;
    else if (!isPaused)
        secondPlayerSprite.mySprite.color = ccWHITE;
    
    
    
    if (!isSinglePlayer)
        currentLevel = 12;
    
    if (!isSinglePlayer && isPlayer1 && [enemyHidgonSpritesArray count] > 0) {
        
        [self sendEnemyLocationsArrayForPlayer2];
    }
    
    if (!isSinglePlayer && isPlayer1) {
    
        if (!isPaused) {
        
            [self sendPlayer1Position];
        }
    }
    
    if (!isSinglePlayer && !isPlayer1) {
        
        if (!isPaused) {
        
            [self sendPlayer2Position];
        }
    }

    
    firstPlayerCurrentlyInvincible = FIRST_PLAYER_INVINCIBLE;
    secondPlayerSprite.secondPlayerCurrentlyInvincible = SECOND_PLAYER_INVINCIBLE;
    
    
    if (isPaused == NO) {
    
        //First Player property resets
        firstPlayerTouchingFloor = NO;
        firstPlayerCannotMoveRight = NO;
        firstPlayerCannotMoveLeft = NO;
        firstPlayerHeadHittingBlock = NO;
        playerCanSetStunBomb = YES;
        
        //First Player property resets
        secondPlayerSprite.secondPlayerTouchingFloor = NO;
        secondPlayerSprite.secondPlayerCannotMoveRight = NO;
        secondPlayerSprite.secondPlayerCannotMoveLeft = NO;
        secondPlayerSprite.secondPlayerHeadHittingBlock = NO;
        

        //Cap the firstPlayer's jump speed
        if (firstPlayerHasSneakers == YES && firstPlayerJumpSpeed > 6.2 + JUMP_SPEED_MULTIPLIER*6.2) {
            
            firstPlayerJumpSpeed = 6.2 + JUMP_SPEED_MULTIPLIER*6.2;
        }
        
        if (firstPlayerHasSneakers == NO && firstPlayerJumpSpeed > 6.2) {
            
            firstPlayerJumpSpeed = 6.2;
        }
        
        
        //Reduce firstPlayerJumpSpeed value every time step
        if (firstPlayerJumpSpeed > 1.0) {
            
            if (firstPlayerHasSneakers == NO) {
                            
                if (firstPlayerHasTimeBomb == NO) {
                
                    mainCharacterBlueBoyStandingStill.visible = NO;
                    mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
                    mainCharacterBlueBoyJumping.visible = YES;
                    mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
                    mainCharacterBlueBoyWalking.visible = NO;
                    mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
                    mainCharacterBlueBoyDead.visible = NO;
                    mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
                }
                
                else if (firstPlayerHasTimeBomb == YES)  {
                                        
                    mainCharacterBlueBoyStandingStill.visible = NO;
                    mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
                    mainCharacterBlueBoyJumping.visible = NO;
                    mainCharacterBlueBoyJumpingHoldingSomething.visible = YES;
                    mainCharacterBlueBoyWalking.visible = NO;
                    mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
                    mainCharacterBlueBoyDead.visible = NO;
                    mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
                }
            }
            
            else if (firstPlayerHasSneakers == YES) {
                                
                if (firstPlayerHasTimeBomb == NO) {
                
                    mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
                    mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = NO;
                    mainCharacterBlueBoyJumpingWithSneakers.visible = YES;
                    mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
                    mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
                    mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = NO;
                    mainCharacterBlueBoyDeadWithSneakers.visible = NO;
                    mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = NO;
                }
                
                else if (firstPlayerHasTimeBomb == NO) {
                    
                    mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
                    mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = NO;
                    mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
                    mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = YES;
                    mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
                    mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = NO;
                    mainCharacterBlueBoyDeadWithSneakers.visible = NO;
                    mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = NO;
                }
            }
            
            if (firstPlayerHasSneakers == YES) {
                
                firstPlayerJumpSpeed = firstPlayerJumpSpeed - 2.0*0.12;
            }
            
            if (firstPlayerHasSneakers == NO) {
            
                firstPlayerJumpSpeed = firstPlayerJumpSpeed - 0.12;
            }
        }

        else {
            
            firstPlayerJumpSpeed = 0;
        }
        
        //Cap the secondPlayer's jump speed
        if (secondPlayerSprite.secondPlayerHasSneakers == YES && secondPlayerSprite.secondPlayerJumpSpeed > 6.2 + JUMP_SPEED_MULTIPLIER*6.2) {
            
            secondPlayerSprite.secondPlayerJumpSpeed = 6.2 + JUMP_SPEED_MULTIPLIER*6.2;
        }
        
        if (secondPlayerSprite.secondPlayerHasSneakers == NO && secondPlayerSprite.secondPlayerJumpSpeed > 6.2) {
            
            secondPlayerSprite.secondPlayerJumpSpeed = 6.2;
        }
        
        
        //Reduce secondPlayerJumpSpeed value every time step
        if (secondPlayerSprite.secondPlayerJumpSpeed > 0) {
            
            if (secondPlayerSprite.secondPlayerHasSneakers == YES) {
                
                secondPlayerSprite.secondPlayerJumpSpeed = secondPlayerSprite.secondPlayerJumpSpeed - 2.0*0.12;
            }
            
            if (secondPlayerSprite.secondPlayerHasSneakers == NO) {
                
                secondPlayerSprite.secondPlayerJumpSpeed = secondPlayerSprite.secondPlayerJumpSpeed - 0.12;
            }
        }
        
        else {
            
            secondPlayerSprite.secondPlayerJumpSpeed = 0;
        }
        
        //Make first player sensors following first player sprite
        firstPlayerSensorFeet.position = ccp(firstPlayerSprite.position.x, firstPlayerSprite.position.y - 11);
        firstPlayerSensorRightSide.position = ccp(firstPlayerSprite.position.x + 10, firstPlayerSprite.position.y - 8);
        firstPlayerSensorLeftSide.position = ccp(firstPlayerSprite.position.x - 10, firstPlayerSprite.position.y - 8);
        
        //Make second player sensors following second player sprite
        secondPlayerSensorFeet.position = ccp(secondPlayerSprite.position.x, secondPlayerSprite.position.y - 11);
        secondPlayerSensorRightSide.position = ccp(secondPlayerSprite.position.x + 10, secondPlayerSprite.position.y - 8);
        secondPlayerSensorLeftSide.position = ccp(secondPlayerSprite.position.x - 10, secondPlayerSprite.position.y - 8);

        stageBottomLimitBorder = -5;
        stageTopLimitBorder = 312;
        stageLeftLimitBorder = 5;
        stageRightLimitBorder = 470;
        
        /*
        stageBottomTeleportationDestinationLimit = -10;
        stageTopTeleportationDestinationLimit = 310;
        stageRightTeleportationDesintationLimit = 470;
        stageLeftTeleportationDestinationLimit = 0;
        */
        
        //If player falls into a hole on the bottom of the stage teleport them to the top
        if (firstPlayerSprite.position.y < -5) {
            
            firstPlayerSprite.position = ccp(firstPlayerSprite.position.x, 312);
        }
        
        //If player jumps up through the top of the screen they will teleport up through the bottom
        if (firstPlayerSprite.position.y > 312) {
            
            firstPlayerSprite.position = ccp(firstPlayerSprite.position.x, -5);
        }
        
        //If player walks through a hole on the left side of the stage teleport them to the right side
        if (firstPlayerSprite.position.x < stageLeftLimitBorder) {
            
            firstPlayerSprite.position = ccp(stageRightLimitBorder, firstPlayerSprite.position.y);
        }
        
        //If player walks through a hole on the right side of the stage teleport them to the left side
        if (firstPlayerSprite.position.x > stageRightLimitBorder) {
            
            firstPlayerSprite.position = ccp(stageLeftLimitBorder, firstPlayerSprite.position.y);
        }
        
        
        //If secondPlayer falls into a hole on the bottom of the stage teleport them to the top
        if (secondPlayerSprite.position.y < stageBottomLimitBorder) {
            
            secondPlayerSprite.position = ccp(secondPlayerSprite.position.x, stageTopLimitBorder);
        }
        
        //If secondPlayer jumps up through the top of the screen they will teleport up through the bottom
        if (secondPlayerSprite.position.y > stageTopLimitBorder) {
            
            secondPlayerSprite.position = ccp(secondPlayerSprite.position.x, stageBottomLimitBorder);
        }
        
        //If secondPlayer walks through a hole on the left side of the stage teleport them to the right side
        if (secondPlayerSprite.position.x < stageLeftLimitBorder) {
            
            secondPlayerSprite.position = ccp(stageRightLimitBorder, secondPlayerSprite.position.y);
        }
        
        //If secondPlayer walks through a hole on the right side of the stage teleport them to the left side
        if (secondPlayerSprite.position.x > stageRightLimitBorder) {
            
            secondPlayerSprite.position = ccp(stageLeftLimitBorder, secondPlayerSprite.position.y);
        }
        
        
        //Teleport FlyThroughWallsDiagonalFlyer if they cross through the stages bounds
        for (Enemy *flyThroughWallsDiagonalFlyerEnemy in flyThroughWallsDiagonalFlyerEnemySpritesArray) {
            
            if (!flyThroughWallsDiagonalFlyerEnemy.enemyKnockedOutOfTheArena) {
            
                //If flyThroughWallsDiagonalFlyerEnemy flies into a hole on the bottom of the stage teleport them to the top
                if (flyThroughWallsDiagonalFlyerEnemy.position.y < -10) {
                    
                    flyThroughWallsDiagonalFlyerEnemy.position = ccp(flyThroughWallsDiagonalFlyerEnemy.position.x, 315);
                }
                
                //If flyThroughWallsDiagonalFlyerEnemy flies up through the top of the screen they will teleport up through the bottom
                if (flyThroughWallsDiagonalFlyerEnemy.position.y > 315) {
                    
                    flyThroughWallsDiagonalFlyerEnemy.position = ccp(flyThroughWallsDiagonalFlyerEnemy.position.x, -10);
                }
                
                //If flyThroughWallsDiagonalFlyerEnemy flies through a hole on the left side of the stage teleport them to the right side
                if (flyThroughWallsDiagonalFlyerEnemy.position.x < 0) {
                    
                    flyThroughWallsDiagonalFlyerEnemy.position = ccp(470, flyThroughWallsDiagonalFlyerEnemy.position.y);
                }
                
                //If flyThroughWallsDiagonalFlyerEnemy flies through a hole on the right side of the stage teleport them to the left side
                if (flyThroughWallsDiagonalFlyerEnemy.position.x > 470) {
                    
                    flyThroughWallsDiagonalFlyerEnemy.position = ccp(0, flyThroughWallsDiagonalFlyerEnemy.position.y);
                }
            }
        }
        
        //Teleport DiagonalFlyer if they cross through the stages bounds
        for (Enemy *diagonalFlyerEnemy in enemyDiagonalFlyerEnemySpritesArray) {

            if (!diagonalFlyerEnemy.enemyKnockedOutOfTheArena) {
            
                //If diagonalFlyerEnemy flies into a hole on the bottom of the stage teleport them to the top
                if (diagonalFlyerEnemy.position.y < 0) {
                    
                    diagonalFlyerEnemy.position = ccp(diagonalFlyerEnemy.position.x, 305);
                }
                
                //If diagonalFlyerEnemy flies up through the top of the screen they will teleport up through the bottom
                if (diagonalFlyerEnemy.position.y > 305) {
                    
                    diagonalFlyerEnemy.position = ccp(diagonalFlyerEnemy.position.x, 18);
                }
                
                //If diagonalFlyerEnemy flies through a hole on the left side of the stage teleport them to the right side
                if (diagonalFlyerEnemy.position.x < 0) {
                    
                    diagonalFlyerEnemy.position = ccp(470, diagonalFlyerEnemy.position.y);
                }
                
                //If diagonalFlyerEnemy flies through a hole on the right side of the stage teleport them to the left side
                if (diagonalFlyerEnemy.position.x > 470) {
                    
                    diagonalFlyerEnemy.position = ccp(0, diagonalFlyerEnemy.position.y);
                }
            }
        }
        
        //Teleport SkeletonWhale if they cross through the stages bounds
        for (Enemy *enemySkeletonWhale in enemySkeletonWhaleSpritesArray) {
            
            if (!enemySkeletonWhale.enemyKnockedOutOfTheArena) {
            
                //If enemySkeletonWhale flies into a hole on the bottom of the stage teleport them to the top
                if (enemySkeletonWhale.position.y < 0) {
                    
                    enemySkeletonWhale.position = ccp(enemySkeletonWhale.position.x, 320);
                }
                
                //If enemySkeletonWhale flies through a hole on the left side of the stage teleport them to the right side
                if (enemySkeletonWhale.position.x < 0) {
                    
                    enemySkeletonWhale.position = ccp(470, enemySkeletonWhale.position.y);
                }
                
                //If enemySkeletonWhale flies through a hole on the right side of the stage teleport them to the left side
                if (enemySkeletonWhale.position.x > 470) {
                    
                    enemySkeletonWhale.position = ccp(0, enemySkeletonWhale.position.y);
                }
            }
        }
        
    
        //Teleport HidgonEnemy if they cross through the stages bounds
        for (Enemy *enemyHidgonSprite in enemyHidgonSpritesArray) {
            
            if (!enemyHidgonSprite.enemyKnockedOutOfTheArena) {
            
                //If enemyHidgonSprite flies into a hole on the bottom of the stage teleport them to the top
                if (enemyHidgonSprite.position.y < 0) {
                    
                    enemyHidgonSprite.position = ccp(enemyHidgonSprite.position.x, 320);
                    
                    [enemyHidgonSprite makeHidgonNotWalkLeftOrRight];
                    [enemyHidgonSprite makeHidgonFall];
                }
                
                //If enemyHidgonSprite flies through a hole on the left side of the stage teleport them to the right side
                if (enemyHidgonSprite.position.x < 0) {
                    
                    enemyHidgonSprite.position = ccp(470, enemyHidgonSprite.position.y);
                }
                
                //If enemyHidgonSprite flies through a hole on the right side of the stage teleport them to the left side
                if (enemyHidgonSprite.position.x > 470) {
                    
                    enemyHidgonSprite.position = ccp(0, enemyHidgonSprite.position.y);
                }
            }
        }
        
        
        //Teleport ParkourJumper if they cross through the stages bounds
        for (Enemy *parkourJumperSprite in parkourJumperEnemySpritesArray) {
            
            if (!parkourJumperSprite.enemyKnockedOutOfTheArena) {
            
                //If parkourJumperSprite flies into a hole on the bottom of the stage teleport them to the top
                if (parkourJumperSprite.position.y < 0) {
                    
                    parkourJumperSprite.position = ccp(parkourJumperSprite.position.x, 320);
                }
                
                //If parkourJumperSprite flies through a hole on the left side of the stage teleport them to the right side
                if (parkourJumperSprite.position.x < 0) {
                    
                    parkourJumperSprite.position = ccp(470, parkourJumperSprite.position.y);
                }
                
                //If parkourJumperSprite flies through a hole on the right side of the stage teleport them to the left side
                if (parkourJumperSprite.position.x > 470) {
                    
                    parkourJumperSprite.position = ccp(0, parkourJumperSprite.position.y);
                }
            }
        }
        
        
        //Teleport DownwardShooterEnemy if they cross through the stages bounds
        for (Enemy *downwardShooterEnemy in downwardShooterEnemySpritesArray) {
            
            if (!downwardShooterEnemy.enemyKnockedOutOfTheArena) {
            
                //If downwardShooterEnemy flies into a hole on the bottom of the stage teleport them to the top
                if (downwardShooterEnemy.position.y < 0) {
                    
                    downwardShooterEnemy.position = ccp(downwardShooterEnemy.position.x, 320);
                }
                
                //If downwardShooterEnemy flies through a hole on the left side of the stage teleport them to the right side
                if (downwardShooterEnemy.position.x < 0) {
                    
                    downwardShooterEnemy.position = ccp(470, downwardShooterEnemy.position.y);
                }
                
                //If downwardShooterEnemy flies through a hole on the right side of the stage teleport them to the left side
                if (downwardShooterEnemy.position.x > 470) {
                    
                    downwardShooterEnemy.position = ccp(0, downwardShooterEnemy.position.y);
                }
            }
        }
        
        //Check if first Player's sprite is standing on platform
        
        
        //Check to see if firstPlayerSprite or secondPlayerSprite is touching a solid tile, which would make him stop falling
        for (int row=0; row < [foreground layerSize].width; row++) {
            
            for (int col=0; col < [foreground layerSize].height; col++) {
                
                int tmpgid = [foreground tileGIDAt:ccp(row,col)];
                
                CGPoint tmpgidlocation = [foreground positionAt: ccp((row + 0.52), (col - 0.49))];
                
                if (col != 0 && tmpgid != 0) {
                    
                    //firstPlayer
                    if ((firstPlayerSensorFeet.position.y < tmpgidlocation.y + 11) && (firstPlayerSensorFeet.position.y > tmpgidlocation.y + 8) && (firstPlayerSensorFeet.position.x < tmpgidlocation.x + 11) && (firstPlayerSensorFeet.position.x > tmpgidlocation.x - 11) && firstPlayerCurrentlyDead == NO) {
                                                    
                        //stop first player's falling
                        firstPlayerTouchingFloor = YES;
                        
                        if (firstPlayerJumpSpeed == 0) {
                        
                            if (firstPlayerHasSneakers == NO) {
                                                            
                                if (firstPlayerHasTimeBomb == NO) {
                                
                                    mainCharacterBlueBoyStandingStill.visible = YES;
                                    mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
                                    mainCharacterBlueBoyJumping.visible = NO;
                                    mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
                                    mainCharacterBlueBoyWalking.visible = NO;
                                    mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
                                    mainCharacterBlueBoyDead.visible = NO;
                                    mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
                                }
                                
                                else if (firstPlayerHasTimeBomb == YES) {
                                    
                                    mainCharacterBlueBoyStandingStill.visible = NO;
                                    mainCharacterBlueBoyStandingStillHoldingSomething.visible = YES;
                                    mainCharacterBlueBoyJumping.visible = NO;
                                    mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
                                    mainCharacterBlueBoyWalking.visible = NO;
                                    mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
                                    mainCharacterBlueBoyDead.visible = NO;
                                    mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
                                }

                            }
                            
                            else if (firstPlayerHasSneakers == YES) {
                                                                
                                if (firstPlayerHasTimeBomb == NO) {
                                
                                    mainCharacterBlueBoyStandingStillWithSneakers.visible = YES;
                                    mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
                                    mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
                                    mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
                                    mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
                                    mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = NO;
                                    mainCharacterBlueBoyDeadWithSneakers.visible = NO;
                                    mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = NO;
                                }
                                
                                else if (firstPlayerHasTimeBomb == YES) {
                                    
                                    mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = YES;
                                    mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
                                    mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
                                    mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
                                    mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = NO;
                                    mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
                                    mainCharacterBlueBoyDeadWithSneakers.visible = NO;
                                    mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = NO;
                                }
                            }
                        }

                        playersNumberOfJumpsAvailable = 1;
                    }
                    //secondPlayer
                    if ((secondPlayerSensorFeet.position.y < tmpgidlocation.y + 11) && (secondPlayerSensorFeet.position.y > tmpgidlocation.y + 8) && (secondPlayerSensorFeet.position.x < tmpgidlocation.x + 11) && (secondPlayerSensorFeet.position.x > tmpgidlocation.x - 11)) {
                        
                 //       if (col != 0 && ([foreground tileGIDAt:ccp(row,col - 1)] == 0)) {
                            
                            //stop second player's falling
                            secondPlayerSprite.secondPlayerTouchingFloor = YES;
                            
                            secondPlayerSprite.secondPlayersNumberOfJumpsAvailable = 1;
                 //       }
                    }
                    
                    //Check to see if firstPlayerSensorRightSide is touching a solid tile, which would make him stop moving forward in orientation 1
                    if ((firstPlayerSensorRightSide.position.y < tmpgidlocation.y + 11) && (firstPlayerSensorRightSide.position.y > tmpgidlocation.y - 11) && (firstPlayerSensorRightSide.position.x < tmpgidlocation.x + 11) && (firstPlayerSensorRightSide.position.x > tmpgidlocation.x - 11)) {
                        
                        if ((col + 1 <= 19) && (([foreground tileGIDAt:ccp(row, col + 1)] != 0) || ([foreground tileGIDAt:ccp(row, col - 1)] != 0))) {
                                                    
                            //stop first player's from moving to the right in orientation 1
                            firstPlayerCannotMoveRight = YES;
                        }
                    }
                     
                    //Check to see if secondPlayerSensorRightSide is touching a solid tile, which would make him stop moving forward in orientation 1
                    if ((secondPlayerSensorRightSide.position.y < tmpgidlocation.y + 11) && (secondPlayerSensorRightSide.position.y > tmpgidlocation.y - 11) && (secondPlayerSensorRightSide.position.x < tmpgidlocation.x + 11) && (secondPlayerSensorRightSide.position.x > tmpgidlocation.x - 11)) {
                        
                        if ((col + 1 <= 19) && (([foreground tileGIDAt:ccp(row, col + 1)] != 0) || ([foreground tileGIDAt:ccp(row, col - 1)] != 0))) {
                            
                            //stop second player's from moving to the right in orientation 1
                            secondPlayerSprite.secondPlayerCannotMoveRight = YES;
                        }
                    }
                    
                    //Check to see if firstPlayerSensorLeftSide is touching a solid tile, which would make him stop moving backward in orientation 1
                    if ((firstPlayerSensorLeftSide.position.y < tmpgidlocation.y + 11) && (firstPlayerSensorLeftSide.position.y > tmpgidlocation.y - 11) && (firstPlayerSensorLeftSide.position.x < tmpgidlocation.x + 11) && (firstPlayerSensorLeftSide.position.x > tmpgidlocation.x - 11)) {
                        
                        if ((col + 1 <= 19) && (([foreground tileGIDAt:ccp(row, col + 1)] != 0) || ([foreground tileGIDAt:ccp(row, col - 1)] != 0))) {
                        
                            //stop first player's from moving to the right in orientation 1
                            firstPlayerCannotMoveLeft = YES;
                        }
                    }
                    
                    //Check to see if secondPlayerSensorLeftSide is touching a solid tile, which would make him stop moving backward in orientation 1
                    if ((secondPlayerSensorLeftSide.position.y < tmpgidlocation.y + 11) && (secondPlayerSensorLeftSide.position.y > tmpgidlocation.y - 11) && (secondPlayerSensorLeftSide.position.x < tmpgidlocation.x + 11) && (secondPlayerSensorLeftSide.position.x > tmpgidlocation.x - 11)) {
                        
                        if ((col + 1 <= 19) && (([foreground tileGIDAt:ccp(row, col + 1)] != 0) || ([foreground tileGIDAt:ccp(row, col - 1)] != 0))) {
                            
                            //stop second player's from moving to the right in orientation 1
                            secondPlayerSprite.secondPlayerCannotMoveLeft = YES;
                        }
                    }
                }
            }
        }
        
        
        
        //Check to see if firstPlayerSprite and secondPlayerSprites is touching an impenetrable solidbrick tile, which would make him stop falling
        for (int row=0; row < [solidBricks layerSize].width; row++) {
            
            for (int col=0; col < [solidBricks layerSize].height; col++) {
                
                int tmpgid = [solidBricks tileGIDAt:ccp(row,col)];
                
                CGPoint tmpgidlocation = [solidBricks positionAt: ccp((row + 0.52), (col - 0.49))];
                
                if (tmpgid != 0) {
                    
                    //Check to see if firstPlayer's head is hitting a block
                    if ((firstPlayerSprite.position.y + firstPlayerSpriteHeadCollisionHeight > tmpgidlocation.y - 11) && (firstPlayerSprite.position.y - 11 < tmpgidlocation.y - 11) && (firstPlayerSprite.position.x - firstPlayerSpriteHeadCollisionWidth < tmpgidlocation.x + 11) && (firstPlayerSprite.position.x + 11 > tmpgidlocation.x - firstPlayerSpriteHeadCollisionWidth)) {
                        
                        //Code to detect collision and 'repel' player from block
                        firstPlayerHeadHittingBlock = YES;
                    }
                    
                    //Check to see if secondPlayer's head is hitting a block
                    if ((secondPlayerSprite.position.y + secondPlayerSprite.secondPlayerSpriteHeadCollisionHeight > tmpgidlocation.y - 11) && (secondPlayerSprite.position.y - 11 < tmpgidlocation.y - 11) && (secondPlayerSprite.position.x - secondPlayerSprite.secondPlayerSpriteHeadCollisionWidth < tmpgidlocation.x + 11) && (secondPlayerSprite.position.x + 11 > tmpgidlocation.x - secondPlayerSprite.secondPlayerSpriteHeadCollisionWidth)) {
                        
                        //Code to detect collision and 'repel' player from block
                        secondPlayerSprite.secondPlayerHeadHittingBlock = YES;
                    }
                    
                    if (col != 0) {
                    
                        //First Player
                        if ((firstPlayerSensorFeet.position.y < tmpgidlocation.y + 11) && (firstPlayerSensorFeet.position.y > tmpgidlocation.y + 8) && (firstPlayerSensorFeet.position.x < tmpgidlocation.x + 11) && (firstPlayerSensorFeet.position.x > tmpgidlocation.x - 11) && firstPlayerCurrentlyDead == NO) {
                            
                            //stop cairo's falling
                            firstPlayerTouchingFloor = YES;
                            
                            if (firstPlayerJumpSpeed == 0) {
                            
                                if (firstPlayerHasSneakers == NO) {
                                                                    
                                    if (firstPlayerHasTimeBomb == NO) {
                                    
                                        mainCharacterBlueBoyStandingStill.visible = YES;
                                        mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
                                        mainCharacterBlueBoyJumping.visible = NO;
                                        mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
                                        mainCharacterBlueBoyWalking.visible = NO;
                                        mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
                                        mainCharacterBlueBoyDead.visible = NO;
                                        mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
                                    }
                                    
                                    else if (firstPlayerHasTimeBomb == YES) {
                                        
                                        mainCharacterBlueBoyStandingStill.visible = NO;
                                        mainCharacterBlueBoyStandingStillHoldingSomething.visible = YES;
                                        mainCharacterBlueBoyJumping.visible = NO;
                                        mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
                                        mainCharacterBlueBoyWalking.visible = NO;
                                        mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
                                        mainCharacterBlueBoyDead.visible = NO;
                                        mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
                                    }
                                }
                                
                                else if (firstPlayerHasSneakers == YES) {
                                                                 
                                    if (firstPlayerHasTimeBomb == NO) {
                                    
                                        mainCharacterBlueBoyStandingStillWithSneakers.visible = YES;
                                        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = NO;
                                        mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
                                        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
                                        mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
                                        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = NO;
                                        mainCharacterBlueBoyDeadWithSneakers.visible = NO;
                                        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = NO;
                                    }
                                    
                                    else if (firstPlayerHasTimeBomb == YES) {
                                        
                                        mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
                                        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = YES;
                                        mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
                                        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
                                        mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
                                        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = NO;
                                        mainCharacterBlueBoyDeadWithSneakers.visible = NO;
                                        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = NO;
                                    }
                                }
                            }
                            
                            playersNumberOfJumpsAvailable = 1;
                        }
                        
                        //secondPlayer
                        if ((secondPlayerSensorFeet.position.y < tmpgidlocation.y + 11) && (secondPlayerSensorFeet.position.y > tmpgidlocation.y + 8) && (secondPlayerSensorFeet.position.x < tmpgidlocation.x + 11) && (secondPlayerSensorFeet.position.x > tmpgidlocation.x - 11)) {
                            
               //             if (col != 0 && ([solidBricks tileGIDAt:ccp(row,col - 1)] == 0)) {
                                
                                //stop second player's falling
                                secondPlayerSprite.secondPlayerTouchingFloor = YES;
                                
                                secondPlayerSprite.secondPlayersNumberOfJumpsAvailable = 1;
                //            }
                        }
                        
                        //Check to see if firstPlayerSensorRightSide is touching a solid tile, which would make him stop moving forward in orientation 1
                        if ((firstPlayerSensorRightSide.position.y < tmpgidlocation.y + 11) && (firstPlayerSensorRightSide.position.y > tmpgidlocation.y - 11) && (firstPlayerSensorRightSide.position.x < tmpgidlocation.x + 11) && (firstPlayerSensorRightSide.position.x > tmpgidlocation.x - 11)) {
                            
                            if ((col + 1 <= 19) && (([solidBricks tileGIDAt:ccp(row, col + 1)] != 0) || ([solidBricks tileGIDAt:ccp(row, col - 1)] != 0))) {
                                
                                //stop first player's from moving to the right in orientation 1
                                firstPlayerCannotMoveRight = YES;
                            }
                        }
                        
                        //Check to see if secondPlayerSensorRightSide is touching a solid tile, which would make him stop moving forward in orientation 1
                        if ((secondPlayerSensorRightSide.position.y < tmpgidlocation.y + 11) && (secondPlayerSensorRightSide.position.y > tmpgidlocation.y - 11) && (secondPlayerSensorRightSide.position.x < tmpgidlocation.x + 11) && (secondPlayerSensorRightSide.position.x > tmpgidlocation.x - 11)) {
                            
                            if ((col + 1 <= 19) && (([solidBricks tileGIDAt:ccp(row, col + 1)] != 0) || ([solidBricks tileGIDAt:ccp(row, col - 1)] != 0))) {
                                
                                //stop second player's from moving to the right in orientation 1
                                secondPlayerSprite.secondPlayerCannotMoveRight = YES;
                            }
                        }
                        
                        //Check to see if firstPlayerSensorLeftSide is touching a solid tile, which would make him stop moving backward in orientation 1
                        if ((firstPlayerSensorLeftSide.position.y < tmpgidlocation.y + 11) && (firstPlayerSensorLeftSide.position.y > tmpgidlocation.y - 11) && (firstPlayerSensorLeftSide.position.x < tmpgidlocation.x + 11) && (firstPlayerSensorLeftSide.position.x > tmpgidlocation.x - 11)) {
                            
                            if ((col + 1 <= 19) && (([solidBricks tileGIDAt:ccp(row, col + 1)] != 0) || ([solidBricks tileGIDAt:ccp(row, col - 1)] != 0))) {
                                
                                //stop first player's from moving to the right in orientation 1
                                firstPlayerCannotMoveLeft = YES;
                            }
                        }
                    }
                }
            }
        }
        
        /*See if firstPlayerSprite and second is colliding with Door*/
        /*
        for (MovingDoors *movingDoor in movingDoorArray) {
        
            movingDoor.firstPlayerStandingOnDoor = NO;
            movingDoor.secondPlayerStandingOnDoor = NO;
            
            //Check to see if firstPlayer's head is hitting a block
            if ((firstPlayerSprite.position.y + firstPlayerSpriteHeadCollisionHeight > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (firstPlayerSprite.position.y - 11 < movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (firstPlayerSprite.position.x - firstPlayerSpriteHeadCollisionWidth/2 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (firstPlayerSprite.position.x + 11 > movingDoor.position.x - firstPlayerSpriteHeadCollisionWidth)) {
                
                //Code to detect collision and 'repel' player from block
                firstPlayerHeadHittingBlock = YES;
            }
            
            //Check to see if secondPlayer's head is hitting a block
            if ((secondPlayerSprite.position.y + secondPlayerSprite.secondPlayerSpriteHeadCollisionHeight > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (secondPlayerSprite.position.y - 11 < movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (secondPlayerSprite.position.x - secondPlayerSprite.secondPlayerSpriteHeadCollisionWidth/2 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (secondPlayerSprite.position.x + 11 > movingDoor.position.x - secondPlayerSprite.secondPlayerSpriteHeadCollisionWidth)) {
                
                //Code to detect collision and 'repel' player from block
                secondPlayerSprite.secondPlayerHeadHittingBlock = YES;
            }
            
            //Check if firstPlayerSprite is standing on Door
            if ((firstPlayerSensorFeet.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (firstPlayerSensorFeet.position.y > movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2 - 2) && (firstPlayerSensorFeet.position.x < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (firstPlayerSensorFeet.position.x > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                                
                //stop cairo's falling
                firstPlayerTouchingFloor = YES;
                movingDoor.firstPlayerStandingOnDoor = YES;

                playersNumberOfJumpsAvailable = 1;
            }
            
            //Check if secondPlayerSprite is standing on Door
            if ((secondPlayerSensorFeet.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (secondPlayerSensorFeet.position.y > movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2 - 2) && (secondPlayerSensorFeet.position.x < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (secondPlayerSensorFeet.position.x > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                
                //stop cairo's falling
                secondPlayerSprite.secondPlayerTouchingFloor = YES;
                movingDoor.secondPlayerStandingOnDoor = YES;
                
                secondPlayerSprite.secondPlayersNumberOfJumpsAvailable = 1;
            }
            
            //Check to see if firstPlayerSensorRightSide is touching a door
            if ((firstPlayerSensorRightSide.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (firstPlayerSensorRightSide.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (firstPlayerSensorRightSide.position.x < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.width/2) && (firstPlayerSensorRightSide.position.x > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.width/2)) {
                                                    
                //stop cairo from moving to the right in orientation 1
                firstPlayerCannotMoveRight = YES;
            }
            
            //Check to see if secondPlayerSensorRightSide is touching a door
            if ((secondPlayerSensorRightSide.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (secondPlayerSensorRightSide.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (secondPlayerSensorRightSide.position.x < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.width/2) && (secondPlayerSensorRightSide.position.x > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.width/2)) {
                
                //stop cairo from moving to the right in orientation 1
                secondPlayerSprite.secondPlayerCannotMoveRight = YES;
            }
            
            //Check to see if firstPlayerSensorLeftSide is touching a door
            if ((firstPlayerSensorLeftSide.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (firstPlayerSensorLeftSide.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (firstPlayerSensorLeftSide.position.x < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.width/2) && (firstPlayerSensorLeftSide.position.x > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.width/2)) {
                
                //stop cairo from moving to the right in orientation 1
                firstPlayerCannotMoveLeft = YES;
            }
            
            //Check to see if secondPlayerSensorLeftSide is touching a door
            if ((secondPlayerSensorLeftSide.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (secondPlayerSensorLeftSide.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (secondPlayerSensorLeftSide.position.x < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.width/2) && (secondPlayerSensorLeftSide.position.x > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.width/2)) {
                
                //stop cairo from moving to the right in orientation 1
                secondPlayerSprite.secondPlayerCannotMoveLeft = YES;
            }
        }
        */
        
        //If firstPlayerSprite's right side is overlapping a wall, repel them away from the wall
        if (firstPlayerCannotMoveRight && firstPlayerTouchingFloor == NO) {
            
            firstPlayerSprite.position = ccp(firstPlayerSprite.position.x - 1, firstPlayerSprite.position.y);
        }
        
        //If secondPlayerSprite's right side is overlapping a wall, repel them away from the wall
        if (secondPlayerSprite.secondPlayerCannotMoveRight && secondPlayerSprite.secondPlayerTouchingFloor == NO) {
            
            secondPlayerSprite.position = ccp(secondPlayerSprite.position.x - 1, secondPlayerSprite.position.y);
        }
        
        //If firstPlayerSprite's left side is overlapping a wall, repel them away from the wall
        if (firstPlayerCannotMoveLeft && firstPlayerTouchingFloor == NO) {
            
            firstPlayerSprite.position = ccp(firstPlayerSprite.position.x + 1, firstPlayerSprite.position.y);
        }
        
        //If secondPlayerSprite's left side is overlapping a wall, repel them away from the wall
        if (secondPlayerSprite.secondPlayerCannotMoveRight && secondPlayerSprite.secondPlayerTouchingFloor == NO) {
            
            secondPlayerSprite.position = ccp(secondPlayerSprite.position.x + 1, secondPlayerSprite.position.y);
        }
        
        
        //First Player's jump position
        if (firstPlayerHeadHittingBlock == NO) {
            
            firstPlayerSprite.position = ccp(firstPlayerSprite.position.x, firstPlayerSprite.position.y + firstPlayerJumpSpeed);
        }
        
        //Second Player's jump position
        if (secondPlayerSprite.secondPlayerHeadHittingBlock == NO) {
            
            secondPlayerSprite.position = ccp(secondPlayerSprite.position.x, secondPlayerSprite.position.y + secondPlayerSprite.secondPlayerJumpSpeed);
        }
        
        //If firstPlayer HAS sneakers, make sure none of its 'sneakerless' sprites show
        if (firstPlayerHasSneakers == YES) {
                            
            mainCharacterBlueBoyStandingStill.visible = NO;
            mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
            mainCharacterBlueBoyJumping.visible = NO;
            mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
            mainCharacterBlueBoyWalking.visible = NO;
            mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
            mainCharacterBlueBoyDead.visible = NO;
            mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
        }
        
        
        if (firstPlayerIsStunned == NO) {
        
            if (moveRight1 == YES && firstPlayerCannotMoveRight == NO && firstPlayerSprite.position.y < stageTopLimitBorder && firstPlayerSprite.position.y > stageBottomLimitBorder && !firstPlayerCurrentlyDead) {
                
                if (firstPlayerHasSneakers == NO) {
                                    
                    if (firstPlayerHasTimeBomb == NO) {

                        mainCharacterBlueBoyStandingStill.visible = NO;
                        mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
                        mainCharacterBlueBoyJumping.visible = NO;
                        mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
                        mainCharacterBlueBoyWalking.visible = YES;
                        mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
                        mainCharacterBlueBoyDead.visible = NO;
                        mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
                        
                        mainCharacterBlueBoyStandingStill.flipX = NO;
                        mainCharacterBlueBoyStandingStillHoldingSomething.flipX = NO;
                        mainCharacterBlueBoyJumping.flipX = NO;
                        mainCharacterBlueBoyJumpingHoldingSomething.flipX = NO;
                        mainCharacterBlueBoyWalking.flipX = NO;
                        mainCharacterBlueBoyWalkingHoldingSomething.flipX = NO;
                        mainCharacterBlueBoyDead.flipX = NO;
                        mainCharacterBlueBoyHoldingUpBoxingGlove.flipX = NO;
                    }
                    
                    else if (firstPlayerHasTimeBomb == YES) {
                        
                        mainCharacterBlueBoyStandingStill.visible = NO;
                        mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
                        mainCharacterBlueBoyJumping.visible = NO;
                        mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
                        mainCharacterBlueBoyWalking.visible = NO;
                        mainCharacterBlueBoyWalkingHoldingSomething.visible = YES;
                        mainCharacterBlueBoyDead.visible = NO;
                        mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
                        
                        mainCharacterBlueBoyStandingStill.flipX = NO;
                        mainCharacterBlueBoyStandingStillHoldingSomething.flipX = NO;
                        mainCharacterBlueBoyJumping.flipX = NO;
                        mainCharacterBlueBoyJumpingHoldingSomething.flipX = NO;
                        mainCharacterBlueBoyWalkingHoldingSomething.flipX = NO;
                        mainCharacterBlueBoyWalking.flipX = NO;
                        mainCharacterBlueBoyDead.flipX = NO;
                        mainCharacterBlueBoyHoldingUpBoxingGlove.flipX = NO;
                        
                        timeBomb.mySprite.flipX = NO;
                    }
                }
                
                else if (firstPlayerHasSneakers == YES) {
                            
                    if (firstPlayerHasTimeBomb == NO) {
                    
                        //With sneakers
                        mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
                        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = NO;
                        mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
                        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
                        mainCharacterBlueBoyWalkingWithSneakers.visible = YES;
                        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = NO;
                        mainCharacterBlueBoyDeadWithSneakers.visible = NO;
                        
                        mainCharacterBlueBoyStandingStillWithSneakers.flipX = NO;
                        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.flipX = NO;
                        mainCharacterBlueBoyJumpingWithSneakers.flipX = NO;
                        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.flipX = NO;
                        mainCharacterBlueBoyWalkingWithSneakers.flipX = NO;
                        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.flipX = NO;
                        mainCharacterBlueBoyDeadWithSneakers.flipX = NO;
                        firstPlayerSprite.flipX = NO;
                    }
                    
                    else if (firstPlayerHasTimeBomb == YES) {
                        
                        //With sneakers
                        mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
                        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = NO;
                        mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
                        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
                        mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
                        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = YES;
                        mainCharacterBlueBoyDeadWithSneakers.visible = NO;
                        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = NO;
                        
                        mainCharacterBlueBoyStandingStillWithSneakers.flipX = NO;
                        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.flipX = NO;
                        mainCharacterBlueBoyJumpingWithSneakers.flipX = NO;
                        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.flipX = NO;
                        mainCharacterBlueBoyWalkingWithSneakers.flipX = NO;
                        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.flipX = NO;
                        mainCharacterBlueBoyDeadWithSneakers.flipX = NO;
                        firstPlayerSprite.flipX = NO;
                        
                        timeBomb.mySprite.flipX = NO;
                    }
                }
                
                if ((firstPlayerSensorFeet.position.y > 0) && (firstPlayerSensorFeet.position.y < 310)) {
                    
                    if (firstPlayerHasSneakers == YES) {
                        
                        firstPlayerSprite.position = ccp(firstPlayerSprite.position.x + 3, firstPlayerSprite.position.y);                    
                    }
                    
                    if (firstPlayerHasSneakers == NO) {
                    
                        firstPlayerSprite.position = ccp(firstPlayerSprite.position.x + 2, firstPlayerSprite.position.y);
                    }
                }
                
                else {
                    
                    firstPlayerSprite.position = ccp(firstPlayerSprite.position.x, firstPlayerSprite.position.y);
                }
            }

            if (moveLeft1 == YES && firstPlayerCannotMoveLeft == NO && firstPlayerSprite.position.y < stageTopLimitBorder && firstPlayerSprite.position.y > stageBottomLimitBorder && !firstPlayerCurrentlyDead) {
                
                if (firstPlayerHasSneakers == NO) {
                                    
                    if (firstPlayerHasTimeBomb == NO) {

                        mainCharacterBlueBoyStandingStill.visible = NO;
                        mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
                        mainCharacterBlueBoyJumping.visible = NO;
                        mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
                        mainCharacterBlueBoyWalking.visible = YES;
                        mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
                        mainCharacterBlueBoyDead.visible = NO;
                        mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
                        
                        mainCharacterBlueBoyStandingStill.flipX = YES;
                        mainCharacterBlueBoyStandingStillHoldingSomething.flipX = YES;
                        mainCharacterBlueBoyJumping.flipX = YES;
                        mainCharacterBlueBoyJumpingHoldingSomething.flipX = YES;
                        mainCharacterBlueBoyWalkingHoldingSomething.flipX = YES;
                        mainCharacterBlueBoyWalking.flipX = YES;
                        mainCharacterBlueBoyDead.flipX = YES;
                        mainCharacterBlueBoyHoldingUpBoxingGlove.flipX = YES;
                    }
                    
                    else if (firstPlayerHasTimeBomb == YES) {
                        
                        mainCharacterBlueBoyStandingStill.visible = NO;
                        mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
                        mainCharacterBlueBoyJumping.visible = NO;
                        mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
                        mainCharacterBlueBoyWalking.visible = NO;
                        mainCharacterBlueBoyWalkingHoldingSomething.visible = YES;
                        mainCharacterBlueBoyDead.visible = NO;
                        mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
                        
                        mainCharacterBlueBoyStandingStill.flipX = YES;
                        mainCharacterBlueBoyStandingStillHoldingSomething.flipX = YES;
                        mainCharacterBlueBoyJumping.flipX = YES;
                        mainCharacterBlueBoyJumpingHoldingSomething.flipX = YES;
                        mainCharacterBlueBoyWalkingHoldingSomething.flipX = YES;
                        mainCharacterBlueBoyWalking.flipX = YES;
                        mainCharacterBlueBoyDead.flipX = YES;
                        mainCharacterBlueBoyHoldingUpBoxingGlove.flipX = YES;
                        
                        timeBomb.mySprite.flipX = YES;
                    }

                }
                
                else if (firstPlayerHasSneakers == YES) {
                                    
                    if (firstPlayerHasTimeBomb == NO) {
                    
                        //With sneakers
                        mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
                        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = NO;
                        mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
                        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
                        mainCharacterBlueBoyWalkingWithSneakers.visible = YES;
                        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = NO;
                        mainCharacterBlueBoyDeadWithSneakers.visible = NO;
                        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = NO;
                        
                        mainCharacterBlueBoyStandingStillWithSneakers.flipX = YES;
                        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.flipX = YES;
                        mainCharacterBlueBoyJumpingWithSneakers.flipX = YES;
                        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.flipX = YES;
                        mainCharacterBlueBoyWalkingWithSneakers.flipX = YES;
                        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.flipX = YES;
                        mainCharacterBlueBoyDeadWithSneakers.flipX = YES;
                        firstPlayerSprite.flipX = YES;
                    }
                    
                    else if (firstPlayerHasTimeBomb == YES) {
                        
                        //With sneakers
                        mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
                        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = NO;
                        mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
                        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
                        mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
                        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = YES;
                        mainCharacterBlueBoyDeadWithSneakers.visible = NO;
                        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = NO;
                        
                        mainCharacterBlueBoyStandingStillWithSneakers.flipX = YES;
                        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.flipX = YES;
                        mainCharacterBlueBoyJumpingWithSneakers.flipX = YES;
                        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.flipX = YES;
                        mainCharacterBlueBoyWalkingWithSneakers.flipX = YES;
                        mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.flipX = YES;
                        mainCharacterBlueBoyDeadWithSneakers.flipX = YES;
                        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.flipX = YES;
                        firstPlayerSprite.flipX = YES;
                        
                        timeBomb.mySprite.FlipX = YES;
                    }
                }
                
                if ((firstPlayerSensorFeet.position.y > 0) && (firstPlayerSensorFeet.position.y < 310)) {
                
                    if (firstPlayerHasSneakers == YES) {
                        
                        firstPlayerSprite.position = ccp(firstPlayerSprite.position.x - 3, firstPlayerSprite.position.y);
                    }
                    
                    if (firstPlayerHasSneakers == NO) {
                    
                        firstPlayerSprite.position = ccp(firstPlayerSprite.position.x - 2, firstPlayerSprite.position.y);
                    }
                }
                
                else {
                    
                    firstPlayerSprite.position = ccp(firstPlayerSprite.position.x, firstPlayerSprite.position.y);
                }
            }
        }

        
        
        //If player1 is not touching floor make him fall
        if (firstPlayerTouchingFloor == NO && !firstPlayerCurrentlyDead) {
            
            if (firstPlayerHasSneakers == NO) {
            
           //     if (playerColorAndGender == BLUE_BOY) {
                
                if (firstPlayerHasTimeBomb == NO) {
                
                    mainCharacterBlueBoyStandingStill.visible = NO;
                    mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
                    mainCharacterBlueBoyJumping.visible = YES;
                    mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
                    mainCharacterBlueBoyWalking.visible = NO;
                    mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
                    mainCharacterBlueBoyDead.visible = NO;
                    mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
                }
                
                else if (firstPlayerHasTimeBomb == YES) {
                    
                    mainCharacterBlueBoyStandingStill.visible = NO;
                    mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
                    mainCharacterBlueBoyJumping.visible = NO;
                    mainCharacterBlueBoyJumpingHoldingSomething.visible = YES;
                    mainCharacterBlueBoyWalking.visible = NO;
                    mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
                    mainCharacterBlueBoyDead.visible = NO;
                    mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
                }
            }
            
            else if (firstPlayerHasSneakers == YES) {
                
                
                if (firstPlayerHasTimeBomb == NO) {
                
                    mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
                    mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = NO;
                    mainCharacterBlueBoyJumpingWithSneakers.visible = YES;
                    mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
                    mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
                    mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = NO;
                    mainCharacterBlueBoyDeadWithSneakers.flipX = NO;
                    mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.flipX = NO;
                }
                
                else if (firstPlayerHasTimeBomb == YES) {
                    
                    mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
                    mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = NO;
                    mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
                    mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = YES;
                    mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
                    mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = NO;
                    mainCharacterBlueBoyDeadWithSneakers.flipX = NO;
                    mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.flipX = NO;
                }
            }
            
            if (firstPlayerHasSneakers == NO) {
                
                //keep falling
                firstPlayerSprite.position = ccp(firstPlayerSprite.position.x, firstPlayerSprite.position.y - 2.0);
            }
            
            else if (firstPlayerHasSneakers == YES) {
                
                float fallingSpeed = 2.0 + 2.0*JUMP_SPEED_MULTIPLIER;
                
                //keep falling
                firstPlayerSprite.position = ccp(firstPlayerSprite.position.x, firstPlayerSprite.position.y - fallingSpeed);
            }
        }
        
        //If player1 is jumping and his head hit a block make him bounce back
        if (firstPlayerHeadHittingBlock == YES && (firstPlayerJumpSpeed -1.0 > 0)) {
            
            firstPlayerSprite.position = ccp(firstPlayerSprite.position.x, firstPlayerSprite.position.y);
            firstPlayerJumpSpeed = 0;
        }
        
        //If secondPlayer is jumping and his head hit a block make him bounce back
        if (secondPlayerSprite.secondPlayerHeadHittingBlock == YES && (secondPlayerSprite.secondPlayerJumpSpeed -1.0 > 0)) {
            
            secondPlayerSprite.position = ccp(secondPlayerSprite.position.x, secondPlayerSprite.position.y);
            secondPlayerSprite.secondPlayerJumpSpeed = 0;
        }
        
        //If player has invincibilityPowerUP and touches an enemy the enemy gets stunned
        for (Enemy *enemies in enemySpritesArray) {
            
            if ((firstPlayerSprite.position.x < enemies.position.x + 22 && firstPlayerSprite.position.x > enemies.position.x - 22) && (firstPlayerSprite.position.y < enemies.position.y + 22 && firstPlayerSprite.position.y > enemies.position.y - 22) && firstPlayerCurrentlyDead == NO && playerHasInvincibilityPowerUp) {
                
                if (enemies.stunTimeValue == 0) {
                
                    enemies.stunTimeValue = 3;
                }
            }
        }
        
        
        
        //Movement step: mechanics for secondPlayer        
        if (secondPlayerIsStunned == NO) {
        
            if (secondPlayerSprite.secondPlayerMoveRight == YES && secondPlayerSprite.secondPlayerCannotMoveRight == NO && secondPlayerSprite.position.y < stageTopLimitBorder && secondPlayerSprite.position.y > stageBottomLimitBorder) {
                
                if (secondPlayerSprite.secondPlayerHasSneakers == YES) {
                    
                    secondPlayerSprite.position = ccp(secondPlayerSprite.position.x + 3, secondPlayerSprite.position.y);
                    
                    secondPlayerSprite.mySprite.flipX = NO;
                }
                
                if (secondPlayerSprite.secondPlayerHasSneakers == NO) {
                    
                    secondPlayerSprite.position = ccp(secondPlayerSprite.position.x + 2, secondPlayerSprite.position.y);
                    secondPlayerSprite.mySprite.flipX = NO;
                }
            }
            
            if (secondPlayerSprite.secondPlayerMoveLeft == YES && secondPlayerSprite.secondPlayerCannotMoveLeft == NO && secondPlayerSprite.position.y < stageTopLimitBorder && secondPlayerSprite.position.y > stageBottomLimitBorder) {
                
                if (secondPlayerSprite.secondPlayerHasSneakers == YES) {
                    
                    secondPlayerSprite.position = ccp(secondPlayerSprite.position.x - 3, secondPlayerSprite.position.y);
                    secondPlayerSprite.mySprite.flipX = YES;
                }
                
                if (secondPlayerSprite.secondPlayerHasSneakers == NO) {
                    
                    secondPlayerSprite.position = ccp(secondPlayerSprite.position.x - 2, secondPlayerSprite.position.y);
                    secondPlayerSprite.mySprite.flipX = YES;
                }
            }
        }
        
        
        
        
        //If secondPlayer is not touching floor make him fall
        if (secondPlayerSprite.secondPlayerTouchingFloor == NO && !secondPlayerSprite.secondPlayerTouchingFloor) {
            
            if (secondPlayerSprite.secondPlayerHasSneakers == NO || jumpButtonTouched == YES) {
                
                //keep falling
                secondPlayerSprite.position = ccp(secondPlayerSprite.position.x, secondPlayerSprite.position.y - 2.0);
            }
            
            else if (secondPlayerSprite.secondPlayerHasSneakers == YES) {
                
                //keep falling
                secondPlayerSprite.position = ccp(secondPlayerSprite.position.x, secondPlayerSprite.position.y - 3.0);
            }
        }

        if (levelInSession) {
            
            //If level is in session, if any enemy touches first player sprite then first player sprite will die
            for (CCSprite *firstPlayerSprite in firstPlayerSpriteArray) {
            
                for (Enemy *enemySprite in enemySpritesArray) {
                    
                    if ((firstPlayerSprite.position.x < enemySprite.position.x + 22 && firstPlayerSprite.position.x > enemySprite.position.x - 22) && (firstPlayerSprite.position.y < enemySprite.position.y + 22 && firstPlayerSprite.position.y > enemySprite.position.y - 22) && firstPlayerCurrentlyDead == NO && firstPlayerCurrentlyInvincible == NO && enemySprite.stunTimeValue == 0 && enemySprite.friendlyTimeValue == 0 && enemySprite.isCurrentlyTeleportingIn == NO) {
                                                
                        [self player1IsDead];
                        
                        if (!isSinglePlayer) {
                        
                            if (isPlayer1) {
                            
                                [self sendPlayer1IsDead];
                            }
                        }
                    }
                    
                    int flyThroughWallsDiagonalFlyerTopBoundary;
                    
                    //If it's the boss level then allow player's 'feet' to kncok out a stunned flythroughwallsdiagonalflyer
                    if (enemySprite.enemyType == FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE && isBossLevel && enemySprite.stunTimeValue > 0) {
                        
                        flyThroughWallsDiagonalFlyerTopBoundary = 30;
                    }
                    
                    else flyThroughWallsDiagonalFlyerTopBoundary = 22;
                    
                    //If enemySprite is stunned or on friendly pill, and it's the boss level, the enemy will get knocked out of the stage when player touches it
                    if (isBossLevel && enemySprite.enemyKnockedOutOfTheArena == NO && (firstPlayerSprite.position.x < enemySprite.position.x + flyThroughWallsDiagonalFlyerTopBoundary && firstPlayerSprite.position.x > enemySprite.position.x - 22) && (firstPlayerSprite.position.y < enemySprite.position.y + 22 && firstPlayerSprite.position.y > enemySprite.position.y - 22) && firstPlayerCurrentlyDead == NO && (enemySprite.stunTimeValue > 0 || enemySprite.friendlyTimeValue > 0)) {
                     
                        //If enemy is a Boss
                        if (enemySprite.isBoss && enemySprite.hitPointsLeft > 0 && enemySprite.bossAlreadyPunched == NO) {
                        
                            enemySprite.bossAlreadyPunched = YES;
                            
                            enemySprite.hitPointsLeft = enemySprite.hitPointsLeft - 1;
                            
                            enemySprite.stunTimeValue = 2;
                            
                            [enemySprite.stunTimerLabel setString:[NSString stringWithFormat:@"%i", enemySprite.stunTimeValue]];
                                                        
                            //Play 'Boss Hit' sound (super mario world boss hit sound)
                            [[SimpleAudioEngine sharedEngine] playEffect:@"PunchingBoss.wav"];
                            
                            //Knock enemy backwards a bit
                            if (moveLeft1) {
                            
                                [enemySprite runAction: [CCJumpBy actionWithDuration:0.5 position:ccp(-22, 0) height:11 jumps:1]];
                            }
                            
                            else if (moveRight1) {
                                
                                [enemySprite runAction: [CCJumpBy actionWithDuration:0.5 position:ccp(22, 0) height:11 jumps:1]];

                            }
                            
                            //Make enemy flash to new shade of blue until boss is unstunned
                            
                        }
                        
                        //If enemy is a boss and only has one hit point left
                        if (enemySprite.isBoss && enemySprite.hitPointsLeft == 0) {
                        
                            enemySprite.enemyKnockedOutOfTheArena = YES;
                            
                            //If it's the boss level 1 and there are 5 enemies left on screen kick on Mad Agents mode
                            if (currentLevel == 60 && enemiesLeftValue == 6) {
                                
                                [self increaseMadAgentMadnessScript];
                            }
                            
                            else if (currentLevel == 20) {
                                
                                if (enemySprite.isBoss) {
                                    
                                    [self increaseMadAgentMadnessScript];
                                }
                            }
    
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"Punch.wav"];
                            
                            enemySprite.stunTimerLabel.visible = NO;
                            enemySprite.friendlyTimerLabel.visible = NO;
                            
                            //Animation showing the enemy getting knocked out of the arena
                            [enemySprite runAction: [CCRepeatForever actionWithAction: [CCRotateBy actionWithDuration:0.4 angle:360]]];
                            //Make sure enemy doesn't move anymore
                            enemySprite.stunTimeValue = INFINITY;
                            
                            //Update enemies left counter label
                            enemiesLeftValue = enemiesLeftValue - 1;
                            [enemiesLeftLabel setString: [NSString stringWithFormat:@"Enemies Left: %i", enemiesLeftValue]];
                            
                            int timeDuration;
                            
                            if (!enemySprite.isBoss) {
                                
                                timeDuration = 4;
                            }
                            
                            else if (enemySprite.isBoss) {
                                
                                timeDuration = 8;
                            }
                            
                            if (moveRight1 == YES) {
                                
                                [enemySprite runAction: [CCMoveBy actionWithDuration:timeDuration position:ccp(1000, 1000)]];
                            }
                            
                            if (moveLeft1 == YES) {
                                
                                [enemySprite runAction: [CCMoveBy actionWithDuration:timeDuration position:ccp(-1000, 1000)]];
                            }
                            
                            else {
                                
                                int randomInt = arc4random()%2;
                                
                                if (randomInt == 0) {
                                    
                                    [enemySprite runAction: [CCMoveBy actionWithDuration:timeDuration position:ccp(-1000, 1000)]];
                                }
                                
                                else {
                                    
                                    [enemySprite runAction: [CCMoveBy actionWithDuration:timeDuration position:ccp(1000, 1000)]];
                                }
                            }
                            
                            //If there are no more enemies, progress to the next level
                            if (enemiesLeftValue == 0) {
                                
                                [self progressToVictoryScreen];
                            }
                        }
                    
                        //If enemy is not a boss
                        else if (!enemySprite.isBoss && firstPlayerHasBoxingGlove) {
                        
                            enemySprite.enemyKnockedOutOfTheArena = YES;
                            
                            //If it's the boss level and there are 5 enemies left on screen kick on Mad Agents mode
                            if (enemiesLeftValue == 6) {
                                
                                [self increaseMadAgentMadnessScript];
                            }
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"Punch.wav"];
                            
                            enemySprite.stunTimerLabel.visible = NO;
                            enemySprite.friendlyTimerLabel.visible = NO;
                            
                            //Animation showing the enemy getting knocked out of the arena
                            [enemySprite runAction: [CCRepeatForever actionWithAction: [CCRotateBy actionWithDuration:0.4 angle:360]]];
                            //Make sure enemy doesn't move anymore
                            enemySprite.stunTimeValue = INFINITY;
                            
                            //Update enemies left counter label
                            enemiesLeftValue = enemiesLeftValue - 1;
                            [enemiesLeftLabel setString: [NSString stringWithFormat:@"Enemies Left: %i", enemiesLeftValue]];
                    
                            int timeDuration;
                            
                            if (!enemySprite.isBoss) {
                                
                                timeDuration = 4;
                            }
                            
                            else if (enemySprite.isBoss) {
                                
                                timeDuration = 8;
                            }
                            
                            if (moveRight1 == YES) {
                                
                                [enemySprite runAction: [CCMoveBy actionWithDuration:timeDuration position:ccp(1000, 1000)]];
                            }
                            
                            if (moveLeft1 == YES) {
                            
                                [enemySprite runAction: [CCMoveBy actionWithDuration:timeDuration position:ccp(-1000, 1000)]];
                            }
                        
                            else {
                                
                                int randomInt = arc4random()%2;
                                
                                if (randomInt == 0) {
                                    
                                    [enemySprite runAction: [CCMoveBy actionWithDuration:timeDuration position:ccp(-1000, 1000)]];
                                }
                                
                                else {
                                    
                                    [enemySprite runAction: [CCMoveBy actionWithDuration:timeDuration position:ccp(1000, 1000)]];
                                }
                            }
                            
                            //If there are no more enemies, progress to the next level
                            if (enemiesLeftValue == 0) {
                                
                                [self progressToVictoryScreen];
                            }
                        }
                    }
                }
            }
            
            //If level is in session, if any enemy touches second player sprite then first player sprite will die
            for (SecondPlayer *secondPlayerSprite in secondPlayerSpriteArray) {
                
                for (Enemy *enemySprite in enemySpritesArray) {
                    
                    if ((secondPlayerSprite.position.x < enemySprite.position.x + 22 && secondPlayerSprite.position.x > enemySprite.position.x - 22) && (secondPlayerSprite.position.y < enemySprite.position.y + 22 && secondPlayerSprite.position.y > enemySprite.position.y - 22) && secondPlayerSprite.secondPlayerCurrentlyDead == NO && secondPlayerSprite.secondPlayerCurrentlyInvincible == NO && enemySprite.stunTimeValue == 0 && enemySprite.friendlyTimeValue == 0) {
                        
                        [self player2IsDead];
                        
                        if (!isSinglePlayer) {
                            
                            if (!isPlayer1) {
                                
                                [self sendPlayer2IsDead];
                            }
                        }
                    }
                }
            }
            
            //Reset inGameButton as ready to be pushed each time step
            for (InGameButton *inGameButton in inGameButtonArray) {

                inGameButton.buttonReadyToBePushed = YES;
            }
    
            //If firstPlayerSprite touches inGameButton then button is pushed
            for (InGameButton *inGameButton in inGameButtonArray) {
                
                for (CCSprite *firstPlayerSprite in firstPlayerSpriteArray) {

                    if ((firstPlayerSprite.position.x < inGameButton.position.x + 22 && firstPlayerSprite.position.x > inGameButton.position.x - 22) && (firstPlayerSprite.position.y < inGameButton.position.y + 22 && firstPlayerSprite.position.y > inGameButton.position.y - 22)) {

                        if (inGameButton.buttonReadyToBePushed == YES) {
                        
                            inGameButton.buttonReadyToBePushed = NO;
                            
                            [inGameButton activateButton];
                        }
                    }
                }
            }

            for (PowerUps *powerUpSprite in powerUpsArray) {
                
                //If first player and powerUp touch then firstPlayer collects powerUp                
                for (CCSprite *firstPlayerSprite in firstPlayerSpriteArray) {
                    
                    if ((firstPlayerSprite.position.x < powerUpSprite.position.x + 22 && firstPlayerSprite.position.x > powerUpSprite.position.x - 22) && (firstPlayerSprite.position.y < powerUpSprite.position.y + 22 && firstPlayerSprite.position.y > powerUpSprite.position.y - 22) && powerUpSprite.visible == YES) {

                        powerUpAlreadyExists = NO;
                        
                        if (isBossLevel) {
                            
                            powerUpAlreadyAppearedInThisLevel = NO;
                        }
                                                                        
                        if (powerUpSprite.powerUpType == SNEAKER_POWER_UP && powerUpSprite.visible == YES) {
                        
                            NSLog (@"powerUpSprite.visible = %i", powerUpSprite.visible);
                            NSLog (@"collected sneaker");
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            powerUpSprite.visible = NO;
                            
                            if (firstPlayerHasSneakers == NO) {
                                
                                firstPlayerJumpSpeed = firstPlayerJumpSpeed + JUMP_SPEED_MULTIPLIER*firstPlayerJumpSpeed;
                            }
                            
                            firstPlayerHasSneakers = YES;
                        }
                        
                        else if (powerUpSprite.powerUpType == STUN_POWER_UP && powerUpSprite.visible == YES) {
                                                        
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            stunBombForActivePowerUpButton.visible = YES;
                            powerUpCurrentlySelected = STUN_POWER_UP_SELECTED;
                            [self powerUpSelected];
                            
                            if (isPlayer1) {
                                
                                stunBombsLeft = stunBombsLeft + 1;
                                [stunBombsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", stunBombsLeft]];
                            }
                            
                            powerUpSprite.visible = NO;
                        }
                        
                        else if (powerUpSprite.powerUpType == STUN_PROJECTILE_POWER_UP && powerUpSprite.visible == YES) {
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            stunProjectileForActivePowerUpButton.visible = YES;
                            powerUpCurrentlySelected = STUN_PROJECTILE_POWER_UP_SELECTED;
                            [self powerUpSelected];
                            
                            if (isPlayer1) {
                                
                                NSLog (@"Stun Projectile Power Up Collected!");
                                
                                stunProjectilesLeft = stunProjectilesLeft + 1;
                                [stunProjectilesLeftCounterLabel setString: [NSString stringWithFormat:@"%i", stunProjectilesLeft]];
                            }
                            
                            powerUpSprite.visible = NO;
                        }

                        else if (powerUpSprite.powerUpType == MIND_CONTROL_POWER_UP && powerUpSprite.visible == YES) {
                            
                            mindControlCocktailForActivePowerUpButton.visible = YES;
                            powerUpCurrentlySelected = MIND_CONTROL_POWER_UP;
                            [self powerUpSelected];
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];

                            powerUpCurrentlySelected = MIND_CONTROL_POWER_UP_SELECTED;
                            [self powerUpSelected];
                            
                            mindControlPowerUpsLeft = mindControlPowerUpsLeft + 1;
                            
                            [mindControlCocktailsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", mindControlPowerUpsLeft]];
                            
                            powerUpSprite.visible = NO;
                        }
                        
                        
                        else if (powerUpSprite.powerUpType == INVINCIBILITY_POWER_UP && powerUpSprite.visible == YES) {
                            
                            powerUpSprite.visible = NO;
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            //Run method which makes player have invinciblePowerUP for like 10 seconds or so
                            [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(setPlayerHasInvinciblePowerUpToYes)], [CCDelayTime actionWithDuration: 10.0], [CCCallFunc actionWithTarget:self selector:@selector(setPlayerHasInvinciblePowerUpToNo)], nil]];
                        }
                        
                        else if (powerUpSprite.powerUpType == BULLET_TIME_POWER_UP && powerUpSprite.visible == YES) {
                            
                            powerUpSprite.visible = NO;
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            /*
                            bulletTimePowerUpsLeft = bulletTimePowerUpsLeft + 1;
                            
                            [bulletTimePowerUpsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", bulletTimePowerUpsLeft]];
                             */
                            
                            //Run method which starts bulletTime for like 10 seconds or so
                            [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(setBulletTimeActiveToYes)], [CCDelayTime actionWithDuration: 10.0], [CCCallFunc actionWithTarget:self selector:@selector(setBulletTimeActiveToNo)], nil]];                            
                        }
                        
                        else if (powerUpSprite.powerUpType == GLOBAL_STUN_POWER_UP && powerUpSprite.visible == YES) {
                            
                            powerUpSprite.visible = NO;
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            [self nuclearExplosionAnimation: powerUpSprite.position];
                        }
                        
                        else if (powerUpSprite.powerUpType == STAR_IN_GAME_CURRENCY && powerUpSprite.visible == YES) {
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            //Add more money to in-game currency variable
                            numberOfStarsCollected = numberOfStarsCollected + 1;
                            [self saveGameSettings];
                            
                            powerUpSprite.visible = NO;
                            
                            [self decreaseGameTimerForGemCollection];
                            
                            /*
                            if (numberOfStarsCollected == 1) {
                                
                                timeInt = timeInt - GEM_1_SECONDS_TO_SUBTRACT;
                                
                                if (timeInt < 0) {
                                    
                                    timeInt = 0;
                                }
                                
                                [self decreaseTimer];
                            }
                            
                            else if (numberOfStarsCollected == 2) {
                                
                                timeInt = timeInt - GEM_2_SECONDS_TO_SUBTRACT;
                                
                                if (timeInt < 0) {
                                    
                                    timeInt = 0;
                                }
                                
                                [self decreaseTimer];
                            }
                            
                            else if (numberOfStarsCollected == 3) {
                                
                                timeInt = timeInt - GEM_3_SECONDS_TO_SUBTRACT;
                                
                                if (timeInt < 0) {
                                    
                                    timeInt = 0;
                                }
                                
                                [self decreaseTimer];
                            }*/
                        }
                        
                        else if (powerUpSprite.powerUpType == BOXING_GLOVE && powerUpSprite.visible == YES) {
                            
                            [self pauseForBoxingGloveCollected];
                            
                            [self saveGameSettings];                            
                        }
                    }
                }
                
                                    
                for (CCSprite *secondPlayerSprite in secondPlayerSpriteArray) {
                    
                    if ((secondPlayerSprite.position.x < powerUpSprite.position.x + 22 && secondPlayerSprite.position.x > powerUpSprite.position.x - 22) && (secondPlayerSprite.position.y < powerUpSprite.position.y + 22 && secondPlayerSprite.position.y > powerUpSprite.position.y - 22) && powerUpSprite.visible) {
                        
                        powerUpAlreadyExists = NO;
                        
                        if (powerUpSprite.powerUpType == SNEAKER_POWER_UP && powerUpSprite.visible == YES) {
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            powerUpSprite.visible = NO;
                            
                            firstPlayerHasSneakers = YES;
                        }
                        
                        else if (powerUpSprite.powerUpType == STUN_POWER_UP && powerUpSprite.visible == YES) {
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            stunBombForActivePowerUpButton.visible = YES;
                            //powerUpCurrentlySelected = STUN_POWER_UP_SELECTED;
                            //[self powerUpSelected];
                            
                            if (!isPlayer1) {
                            
                                stunBombsLeft = stunBombsLeft + 1;
                                [stunBombsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", stunBombsLeft]];
                            }
                            
                            powerUpSprite.visible = NO;
                        }
                        
                        else if (powerUpSprite.powerUpType == MIND_CONTROL_POWER_UP && powerUpSprite.visible == YES) {
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            mindControlPowerUpsLeft = mindControlPowerUpsLeft + 1;
                            
                            [mindControlCocktailsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", mindControlPowerUpsLeft]];
                            
                            powerUpSprite.visible = NO;
                        }
                        
                        else if (powerUpSprite.powerUpType == GLOBAL_STUN_POWER_UP && powerUpSprite.visible == YES) {
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            globalStunPowerUpsLeft = globalStunPowerUpsLeft + 1;
                            
                            [globalStunPowerUpsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", globalStunPowerUpsLeft]];
                            
                            powerUpSprite.visible = NO;
                        }
                        
                        else if (powerUpSprite.powerUpType == STAR_IN_GAME_CURRENCY && powerUpSprite.visible == YES) {
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            //Add more money to in-game currency variable
                            numberOfStarsCollected = numberOfStarsCollected + 1;
                            [self saveGameSettings];
                            
                            powerUpSprite.visible = NO;
                        }
                        /*
                        else if (powerUpSprite.powerUpType == DOUBLE_JUMP_POWER_UP && powerUpSprite.visible == YES) {
                            
                            [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                            
                            playerHasDoubleJumpPowerUp = YES;
                            playersNumberOfJumpsAvailable = 1;
                            
                            powerUpSprite.visible = NO;
                        }
                         */
                    }
                }
            }
            
            
            //If first player and timeBomb touch then firstPlayer collects timeBomb
            for (TimeBomb *timeBomb in timeBombArray) {
                
                for (CCSprite *timeBomb in timeBombArray) {
                                        
                    if ((firstPlayerSprite.position.x < timeBomb.position.x + 22 && firstPlayerSprite.position.x > timeBomb.position.x - 22) && (firstPlayerSprite.position.y < timeBomb.position.y + 22 && firstPlayerSprite.position.y > timeBomb.position.y - 22) && timeBomb.visible && timeBombPlacedOnDoor == NO && firstPlayerHasTimeBomb == NO) {
                        
                        NSLog (@"Bomb touched!");
                        
                        [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                        
                        firstPlayerHasTimeBomb = YES;
                    }
                }
            }
            
            if (firstPlayerHasTimeBomb) {
                
                timeBomb.position = ccp(firstPlayerSprite.position.x, firstPlayerSprite.position.y + 26.3);
            }
            
            //If first player has timeBomb and touches the steel door then bomb is placed on steel door
            for (ExitDoor *exitDoor in exitDoorArray) {
                
                for (CCSprite *exitDoor in exitDoorArray) {
                    
                    if ((firstPlayerSprite.position.x < exitDoor.position.x + 22 && firstPlayerSprite.position.x > exitDoor.position.x - 22) && (firstPlayerSprite.position.y < exitDoor.position.y + 22 && firstPlayerSprite.position.y > exitDoor.position.y - 22) && timeBombPlacedOnDoor == NO && firstPlayerHasTimeBomb) {
                        
                        [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
                        
                        timeBomb.position = exitDoor.position;
                        firstPlayerHasTimeBomb = NO;
                        timeBombPlacedOnDoor = YES;
                        
                        //Rotate timeBomb sprite back to oringal 45 degree angled look
                        [timeBomb.mySprite runAction: [CCRotateTo actionWithDuration:0.0 angle:-45]];
                        timeBomb.mySprite.flipX = NO;
                        
                        //When player places bomb on steel door, all stars should disappear
                        for (PowerUps *powerUpSprite in powerUpsArray) {

                            if (powerUpSprite.powerUpType == STAR_IN_GAME_CURRENCY) {
                                
                                powerUpSprite.visible = NO;
                            }
                        }
                    }
                }
            }
            
            //If first player touches exitDoor and exitDoor is open then progress to next level
            for (ExitDoor *exitDoor in exitDoorArray) {
                
                for (CCSprite *exitDoor in exitDoorArray) {
                    
                    if ((firstPlayerSprite.position.x < exitDoor.position.x + 22 && firstPlayerSprite.position.x > exitDoor.position.x - 22) && (firstPlayerSprite.position.y < exitDoor.position.y + 22 && firstPlayerSprite.position.y > exitDoor.position.y - 22) && exitDoorIsOpen == YES && !firstPlayerCurrentlyDead) {
                        
                        NSLog (@"extiDoor soubroutine");
                        
                        levelInSession = NO;
                        timeBombPlacedOnDoor = NO;
                        firstPlayerHasTimeBomb = NO;
                        exitDoorIsOpen = NO;
                        
                        //Run method which progresses to 'Victory Transition' screen
                        [self runAction: [CCCallFunc actionWithTarget:self selector:@selector(progressToVictoryScreen)]];
                        
                        /*
                        //Run method which progresses to next level
                        [self runAction: [CCCallFunc actionWithTarget:self selector:@selector(progressToNextLevel)]];
                        */
                        mins = 0;
                        secs = 0;
                        
                        if (isSinglePlayer && !isBossLevel)
                            timeInt = LEVEL_TIMER_SET_TO;
                        else if (!isSinglePlayer && isBossLevel)
                            timeInt = 0;
                    }
                }
            }

            //If player touches fireball they die
            for (CCSprite *firstPlayerSprite in firstPlayerSpriteArray) {
                
                for (CCSprite *fireball in fireballArray) {
                    
                    if ((firstPlayerSprite.position.x < fireball.position.x + 22 && firstPlayerSprite.position.x > fireball.position.x - 22) && (firstPlayerSprite.position.y < fireball.position.y + 22 && firstPlayerSprite.position.y > fireball.position.y - 22) && firstPlayerCurrentlyDead == NO && firstPlayerCurrentlyInvincible == NO && playerHasInvincibilityPowerUp == NO) {
                        
                        NSLog (@"Player touched fireball");
                        
                        if (firstPlayerCurrentlyDead == NO) {
                         
                            [self player1IsDead];
                        }
                    }
                }
            }
            
            //If player2 touches fireball they die
            for (SecondPlayer *secondPlayerSprite in secondPlayerSpriteArray) {
                
                for (CCSprite *fireball in fireballArray) {
                    
                    if ((secondPlayerSprite.position.x < fireball.position.x + 22 && secondPlayerSprite.position.x > fireball.position.x - 22) && (secondPlayerSprite.position.y < fireball.position.y + 22 && secondPlayerSprite.position.y > fireball.position.y - 22) && secondPlayerSprite.secondPlayerCurrentlyDead == NO && secondPlayerSprite.secondPlayerCurrentlyInvincible == NO && secondPlayerSprite.secondPlayerHasInvincibilityPowerUp == NO) {
                        
                        NSLog (@"Player2 touched fireball");
                        
                        if (secondPlayerSprite.secondPlayerCurrentlyDead == NO) {
                            
                            [self player2IsDead];
                        }
                    }
                }
            }
            
            
            //If fireball touches stunProjectile both get neutralized
            for (StunProjectilePowerUp *stunProjectilePowerUp in stunProjectileArray) {
                
                for (fireball in fireballArray) {
                
                    if ((fireball.position.x < stunProjectilePowerUp.position.x + 26 && fireball.position.x > stunProjectilePowerUp.position.x - 26) && (fireball.position.y < stunProjectilePowerUp.position.y + 26 && fireball.position.y > stunProjectilePowerUp.position.y - 26)) {
                        
                        [[SimpleAudioEngine sharedEngine] playEffect:@"BulbBreaking.caf"];
                        
                        [stunProjectilePowerUp removeFromParentAndCleanup: YES];
                        [stunProjectileArray removeObject: stunProjectilePowerUp];
                        
                        [fireball removeFromParentAndCleanup: YES];
                        [fireballArray removeObject: fireball];
                        
                        return;
                    }
                }
            }
            
            
            
            //If firstPlayer touches a red Stun Bomb in multiplayer, they get stunned
            for (CCSprite *firstPlayerSprite in firstPlayerSpriteArray) {
                
                for (StunPowerUp *stunBomb in stunPowerUpArray) {
                                        
                    if ((firstPlayerSprite.position.x < stunBomb.position.x + 22 && firstPlayerSprite.position.x > stunBomb.position.x - 22) && (firstPlayerSprite.position.y < stunBomb.position.y + 22 && firstPlayerSprite.position.y > stunBomb.position.y - 22)) {
                        
                        if (!stunBomb.stunPowerUpBelongsToPlayer1 && stunBomb.visible == YES) {
                        
                            NSLog (@"player1 should be stunned");
                            
                            //Player is stunned for 4 seconds or so
                            [self runAction: [CCSequence actions:  [CCCallFunc actionWithTarget:self selector:@selector(setFirstPlayerIsStunnedToYes)], [CCDelayTime actionWithDuration: 4.0], [CCCallFunc actionWithTarget:self selector:@selector(setFirstPlayerIsStunnedToNo)], nil]];
                            
                            [(StunPowerUp *)stunBomb bombExploding];
                            
                         //   [stunBomb removeFromParentAndCleanup: YES];
                         //   [stunPowerUpArray removeObject: stunBomb];
                        }
                    }
                }
            }
            
            
            //If secondPlayer touches a red Stun Bomb in multiplayer, they get stunned
            for (CCSprite *secondPlayerSprite in secondPlayerSpriteArray) {
                
                for (StunPowerUp *stunBomb in stunPowerUpArray) {
                                        
                    if ((secondPlayerSprite.position.x < stunBomb.position.x + 22 && secondPlayerSprite.position.x > stunBomb.position.x - 22) && (secondPlayerSprite.position.y < stunBomb.position.y + 22 && secondPlayerSprite.position.y > stunBomb.position.y - 22)) {
                        
                        if (stunBomb.stunPowerUpBelongsToPlayer1 && stunBomb.visible == YES) {
                        
                            NSLog (@"player2 should be stunned");
                            
                            //Player is stunned for 4 seconds or so
                            [self runAction: [CCSequence actions:  [CCCallFunc actionWithTarget:self selector:@selector(setSecondPlayerIsStunnedToYes)], [CCDelayTime actionWithDuration: 4.0], [CCCallFunc actionWithTarget:self selector:@selector(setSecondPlayerIsStunnedToNo)], nil]];
                                                                                    
                            [(StunPowerUp *)stunBomb bombExploding];
                            
                        //    [stunBomb removeFromParentAndCleanup: YES];
                        //    [stunPowerUpArray removeObject: stunBomb];
                        }
                    }
                }
            }
        }
    }
}

// Add right after update method
- (void)tryStartGame {
    
    if (isPlayer1 && gameState == kGameStateWaitingForStart) {
        [self setGameState:kGameStateActive];
        [self sendGameBegin];
    }
    
  //  [self setupStringsWithOtherPlayerId:otherPlayerID];
}

-(void) shootFireballDownward:(float)x y:(float)y  {
    
    if (isPaused == NO) {
    
        [[SimpleAudioEngine sharedEngine] playEffect:@"ShootFireball.wav" pitch: 0.9 pan: 0.5 gain: 0.3];
        
        fireball = [CCSprite spriteWithFile: @"Fireball.png"];
        [self addChild: fireball z:100];
        [fireballArray addObject: fireball];
        fireball.scaleX = 0.2;
        fireball.scaleY = 0.7;
        //fireball.opacity = 225;
        fireball.position = ccp(x, y);
        
        if (bulletTimeActive == NO) {
        
            [fireball runAction: [CCSequence actions: [CCRotateTo actionWithDuration:0.0 angle:-90], [CCMoveBy actionWithDuration:1.4 position:ccp(0, -500)], [CCDelayTime actionWithDuration:3.0], [CCFadeOut actionWithDuration:0.0], [CCCallFuncND actionWithTarget:fireball selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
        }
        
        else if (bulletTimeActive == YES) {
            
            [fireball runAction: [CCSequence actions: [CCRotateTo actionWithDuration:0.0 angle:-90], [CCMoveBy actionWithDuration:5.6 position:ccp(0, -500)], [CCDelayTime actionWithDuration:20.0], [CCFadeOut actionWithDuration:0.0], [CCCallFuncND actionWithTarget:fireball selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
        }
    }
}

-(void) shootFireballRight:(float)x y:(float)y isBoss:(BOOL)isBoss  {
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"ShootFireball.wav" pitch: 0.9 pan: 0.5 gain: 0.3];
    
    fireball = [CCSprite spriteWithFile: @"Fireball.png"];
    [self addChild: fireball z:100];
    [fireballArray addObject: fireball];
        
    if (!isBoss)
        fireball.scale = 0.7;
    else
        fireball.scale = 1.0;
    
    fireball.opacity = 225;
    fireball.position = ccp(x, y);
    
    if (bulletTimeActive == NO) {
    
        if (madAgentsAmount == 0) {
        
            [fireball runAction: [CCSequence actions: [CCFlipX actionWithFlipX: NO], [CCMoveBy actionWithDuration:1.4*2 position:ccp(700, 0)], [CCDelayTime actionWithDuration:1.0], [CCFadeOut actionWithDuration:0.0], [CCCallFuncND actionWithTarget:fireball selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
        }
        
        else if (madAgentsAmount == 1) {
            
            [fireball runAction: [CCSequence actions: [CCFlipX actionWithFlipX: NO], [CCMoveBy actionWithDuration:1.4 position:ccp(700, 0)], [CCDelayTime actionWithDuration:1.0], [CCFadeOut actionWithDuration:0.0], [CCCallFuncND actionWithTarget:fireball selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
        }
    }
    
    if (bulletTimeActive == YES) {
        
        if (madAgentsAmount == 0) {
        
            [fireball runAction: [CCSequence actions: [CCFlipX actionWithFlipX: NO], [CCMoveBy actionWithDuration:5.6*2 position:ccp(700, 0)], [CCDelayTime actionWithDuration:10.0], [CCFadeOut actionWithDuration:0.0], [CCCallFuncND actionWithTarget:fireball selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
        }
        
        else if (madAgentsAmount == 1) {
            
            [fireball runAction: [CCSequence actions: [CCFlipX actionWithFlipX: NO], [CCMoveBy actionWithDuration:5.6 position:ccp(700, 0)], [CCDelayTime actionWithDuration:10.0], [CCFadeOut actionWithDuration:0.0], [CCCallFuncND actionWithTarget:fireball selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
        }
    }
}

-(void) shootFireballLeft: (float)x y:(float)y isBoss:(BOOL)isBoss {
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"ShootFireball.wav" pitch: 0.9 pan: 0.5 gain: 0.3];
    
    fireball = [CCSprite spriteWithFile: @"Fireball.png"];
    [self addChild: fireball z:100];
    [fireballArray addObject: fireball];
        
    if (!isBoss)
        fireball.scale = 0.7;
    else
        fireball.scale = 1.0;    fireball.opacity = 225;
    
    fireball.position = ccp(x, y);
    [fireball runAction: [CCFlipX actionWithFlipX: YES]];
    
    if (bulletTimeActive == NO) {
    
        if (madAgentsAmount == 0) {
        
            [fireball runAction: [CCSequence actions: [CCFlipX actionWithFlipX: YES], [CCMoveBy actionWithDuration:1.4*2 position:ccp(-700, 0)], [CCDelayTime actionWithDuration:1.0], [CCFadeOut actionWithDuration:0.0], [CCCallFuncND actionWithTarget:fireball selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
        }
        
        else if (madAgentsAmount == 1) {

            [fireball runAction: [CCSequence actions: [CCFlipX actionWithFlipX: YES], [CCMoveBy actionWithDuration:1.4 position:ccp(-700, 0)], [CCDelayTime actionWithDuration:1.0], [CCFadeOut actionWithDuration:0.0], [CCCallFuncND actionWithTarget:fireball selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
        }
    }
    
    else if (bulletTimeActive == YES) {
        
        if (madAgentsAmount == 0) {
            
            [fireball runAction: [CCSequence actions: [CCFlipX actionWithFlipX: YES], [CCMoveBy actionWithDuration:5.6*2 position:ccp(-700, 0)], [CCDelayTime actionWithDuration:10.0], [CCFadeOut actionWithDuration:0.0], [CCCallFuncND actionWithTarget:fireball selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
        }
        
        else if (madAgentsAmount == 1) {

            [fireball runAction: [CCSequence actions: [CCFlipX actionWithFlipX: YES], [CCMoveBy actionWithDuration:5.6 position:ccp(-700, 0)], [CCDelayTime actionWithDuration:10.0], [CCFadeOut actionWithDuration:0.0], [CCCallFuncND actionWithTarget:fireball selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
        }
    }
}

-(void) subtractASecondFromTimeInt
{
    if (timeInt > 0) {
        
        timeInt = timeInt - 1;
    }
    
    if (timeInt < 0) {
        
        timeInt = 0;
    }
}

-(void) updateTimeLabel
{
    secs = timeInt%60;
    mins = timeInt/60;
    
    [timeLabel setString: [NSString stringWithFormat:@"%02i:%02i", mins, secs]];
}

-(void) decreaseGameTimerForGemCollection
{
    if (numberOfStarsCollected == 1) {
        
        CCFiniteTimeAction *decreaseSecond = [CCCallFunc actionWithTarget:self selector:@selector(subtractASecondFromTimeInt)];
        
        CCDelayTime *delayTime = [CCDelayTime actionWithDuration: 0.1];
    
        CCFiniteTimeAction *updateTimeLabel = [CCCallFunc actionWithTarget:self selector:@selector(updateTimeLabel)];
        
        [timeLabel runAction: [CCRepeat actionWithAction: [CCSequence actions: decreaseSecond, delayTime, updateTimeLabel, nil] times:GEM_1_SECONDS_TO_SUBTRACT]];        
    }
    
    else if (numberOfStarsCollected == 2) {
        
        CCFiniteTimeAction *decreaseSecond = [CCCallFunc actionWithTarget:self selector:@selector(subtractASecondFromTimeInt)];
        
        CCDelayTime *delayTime = [CCDelayTime actionWithDuration: 0.1];
        
        CCFiniteTimeAction *updateTimeLabel = [CCCallFunc actionWithTarget:self selector:@selector(updateTimeLabel)];
        
        [timeLabel runAction: [CCRepeat actionWithAction: [CCSequence actions: decreaseSecond, delayTime, updateTimeLabel, nil] times:GEM_2_SECONDS_TO_SUBTRACT]];
    }
    
    else if (numberOfStarsCollected == 3) {
        
        CCFiniteTimeAction *decreaseSecond = [CCCallFunc actionWithTarget:self selector:@selector(subtractASecondFromTimeInt)];
        
        CCDelayTime *delayTime = [CCDelayTime actionWithDuration: 0.1];
        
        CCFiniteTimeAction *updateTimeLabel = [CCCallFunc actionWithTarget:self selector:@selector(updateTimeLabel)];
        
        [timeLabel runAction: [CCRepeat actionWithAction: [CCSequence actions: decreaseSecond, delayTime, updateTimeLabel, nil] times:GEM_3_SECONDS_TO_SUBTRACT]];
    }
}

-(void) decreaseTimer
{
    if (!isPaused) {
    
        timeLabel.visible = YES;
        
        if (madAgentsAmount == 0) {
        
            if (timeInt > 0) {
            
                timeInt = timeInt - 1;
            }
        
            if (timeInt < 0) {
                
                timeInt = 0;
            }
            
            secs = timeInt%60;
            mins = timeInt/60;
            
            if (timeInt == 0) {
                
                [self increaseMadAgentMadnessScript];
                timeLabel.color = ccRED;
            }
        }
        
        [timeLabel setString: [NSString stringWithFormat:@"%02i:%02i", mins, secs]];
        
        if (timeBombPlacedOnDoor) {
        
            timeBomb.timeBombTimeLabel.visible = YES;
            
            timeBomb.timeBombSecondsLeft = timeBomb.timeBombSecondsLeft - 1;
            
            
            [timeBomb.timeBombTimeLabel setString:[NSString stringWithFormat:@"%i", timeBomb.timeBombSecondsLeft]];
            
            if (timeBomb.timeBombSecondsLeft == 0) {
                
                [(TimeBomb *)timeBomb bombExploding];
                [(ExitDoor *)exitDoor exitDoorBlownUp];
                timeBombPlacedOnDoor = NO;
                
                //Stun all enemies for 1 second
                for (Enemy *enemies in enemySpritesArray) {
                    
                    if (!enemies.isCurrentlyTeleportingIn) {
                        
                        enemies.friendlyTimeValue = 0;
                        enemies.stunTimeValue = 1;
                    }
                }
            }
        }
    }
}

-(void) increaseTimer
{    
    if (!isPaused) {
    
        if (!isSinglePlayer && isPlayer1) {
                    
            [self sendIncreaseTimerMessage];
        }
        
        if (isBossLevel) {
            
            timeLabel.visible = YES;
        }
        
        timeInt = timeInt + 1;
        
        secs = timeInt % 60;
        mins = timeInt / 60;
        
        
        [timeLabel setString:[NSString stringWithFormat:@"%02i:%02i", mins, secs]];
        
        //If current score beats the hi-score then overwrite the high-score label
        if ((mins*60 + secs) > (hiScoreMins*60 + hiScoreSecs)) {
            
            [self saveGameSettings];
            [hiScoreMinsLabel setString: [NSString stringWithFormat:@"%02i:", mins]];
            [hiScoreSecsLabel setString: [NSString stringWithFormat:@"%02i", secs]];
        }
        
        //If current score does NOT beat the hi-score
        else {
            
            [self loadGameSettings];
            [hiScoreMinsLabel setString: [NSString stringWithFormat:@"%02i:", hiScoreMins]];
            [hiScoreSecsLabel setString: [NSString stringWithFormat:@"%02i", hiScoreSecs]];
        }
        

        if (!isSinglePlayer) {

            if (timeInt == 12) {
                
                [self increaseMadAgentMadnessScript];
            }
           
            if (timeInt == 25) {
                
                //Add more Hidgons
                [self addMoreSkeletonEnemySprites];
                
                [self increaseMadAgentMadnessScript];
            }
        }
        /*
        if (timeInt == 40) {
            
            [self addMoreHidgonEnemySprites];
          
            [self increaseMadAgentMadnessScript];
        }
        
        if (timeInt == 60) {
            
            [self addMoreHidgonEnemySprites];
            
            [self increaseMadAgentMadnessScript];
        }

        if (timeInt == 60) {
            
           // [self addMoreFlyThroughWallsDiagonalFlyerEnemySprites];
           // [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.8], [CCCallFunc actionWithTarget:self selector:@selector(sendEnemyLocationsArrayForPlayer2)], nil]];
            [self increaseMadAgentMadnessScript];
        }

        if (timeInt == 60) {
            
          //  [self addMoreFlyThroughWallsDiagonalFlyerEnemySprites];
          //  [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.8], [CCCallFunc actionWithTarget:self selector:@selector(sendEnemyLocationsArrayForPlayer2)], nil]];
            [self increaseMadAgentMadnessScript];
        }
         */
    }
}

-(void) removeAllObjectsFromCurrentLevel
{
    enemyReferenceNumberGlobal = 0;
    totalEnemyReferenceNumbersGlobal = 0;
    powerUpAlreadyAppearedInThisLevel = NO;
    powerUpAlreadyExists = NO;
    playerHasDoubleJumpPowerUp = NO;
    
    
    for (CCSprite *enemySprites in enemySpritesArray) {
        
        [enemySprites removeFromParentAndCleanup: YES];
    }
    
    for (CCSprite *firstPlayerSprite in firstPlayerSpriteArray) {
        
        [firstPlayerSprite removeFromParentAndCleanup: YES];
        [mainCharacterBlueBoyDead removeFromParentAndCleanup: YES];
        [mainCharacterBlueBoyJumping removeFromParentAndCleanup: YES];
        [mainCharacterBlueBoyStandingStill removeFromParentAndCleanup: YES];
        [mainCharacterBlueBoyWalking removeFromParentAndCleanup: YES];
        [mainCharacterBlueBoyDeadWithSneakers removeFromParentAndCleanup: YES];
        [mainCharacterBlueBoyJumpingWithSneakers removeFromParentAndCleanup: YES];
        [mainCharacterBlueBoyStandingStillWithSneakers removeFromParentAndCleanup: YES];
        [mainCharacterBlueBoyWalkingWithSneakers removeFromParentAndCleanup: YES];
        
        [mainCharacterGreenBoyDead removeFromParentAndCleanup: YES];
        [mainCharacterGreenBoyJumping removeFromParentAndCleanup: YES];
        [mainCharacterGreenBoyStandingStill removeFromParentAndCleanup: YES];
        [mainCharacterGreenBoyWalking removeFromParentAndCleanup: YES];
        [mainCharacterGreenBoyDeadWithSneakers removeFromParentAndCleanup: YES];
        [mainCharacterGreenBoyJumpingWithSneakers removeFromParentAndCleanup: YES];
        [mainCharacterGreenBoyStandingStillWithSneakers removeFromParentAndCleanup: YES];
        [mainCharacterGreenBoyWalkingWithSneakers removeFromParentAndCleanup: YES];
    }
    
    for (SecondPlayer *secondPlayerSprite in secondPlayerSpriteArray) {
        
        [secondPlayerSprite removeFromParentAndCleanup: YES];
    }
    
    for (CCSprite *fireball in fireballArray) {
        
        [fireball removeFromParentAndCleanup: YES];
    }
    
    for (Enemy *flyThroughWallsDiagonalFlyerEnemy in flyThroughWallsDiagonalFlyerEnemySpritesArray) {
        
        [flyThroughWallsDiagonalFlyerEnemy removeFromParentAndCleanup: YES];
    }
    
    for (Enemy *downwardShooterEnemy in downwardShooterEnemySpritesArray) {
        
        [downwardShooterEnemy removeFromParentAndCleanup: YES];
    }
    
    for (Enemy *enemyHidgonSprite in enemyHidgonSpritesArray) {
        
        [enemyHidgonSprite removeFromParentAndCleanup: YES];
    }
    
    [hidgonMovementsArrayForPlayer2 removeAllObjects];
    
    
    for (Enemy *parkourJumper in parkourJumperEnemySpritesArray) {
        
        [parkourJumper removeFromParentAndCleanup: YES];
    }
    
    for (Enemy *enemySkeletonWhale in enemySkeletonWhaleSpritesArray) {
        
        [enemySkeletonWhale removeFromParentAndCleanup: YES];
    }
    
    for (Enemy *diagonalFlyerEnemy in enemyDiagonalFlyerEnemySpritesArray) {
        
        [diagonalFlyerEnemy removeFromParentAndCleanup: YES];
    }
    
    for (Enemy *runningChaserEnemy in runningChaserEnemySpritesArray) {
        
        [runningChaserEnemy removeFromParentAndCleanup: YES];
    }
    
    for (TimeBomb *timeBomb in timeBombArray) {
        
        [timeBomb removeAllChildrenWithCleanup: YES];
    }
    
    for (ExitDoor *exitDoor in exitDoorArray) {
        
        [exitDoor removeFromParentAndCleanup: YES];
    }
    
    for (PowerUps *powerUp in powerUpsArray) {
    
        [powerUp removeFromParentAndCleanup: YES];
    }
    
    for (StunPowerUp *stunPowerUps in stunPowerUpArray) {
        
        [stunPowerUps removeFromParentAndCleanup: YES];
    }
    
    for (MindControlPowerUp *mindControlPowerUps in mindControlPowerUpArray) {
        
        [mindControlPowerUps removeFromParentAndCleanup: YES];
    }
    
    for (StunProjectilePowerUp *stunProjectilePowerUps in stunProjectileArray) {
        
        [stunProjectilePowerUps removeFromParentAndCleanup: YES];
    }
    
    for (MovingDoors *movingDoor in movingDoorArray) {
        
        [movingDoor removeFromParentAndCleanup: YES];
    }
    
    for (InGameButton *inGameButton in inGameButtonArray) {
        
        [inGameButton removeFromParentAndCleanup: YES];
    }
    

    [inGameButtonArray removeAllObjects];
    [movingDoorArray removeAllObjects];
    [enemySpritesArray removeAllObjects];
    [firstPlayerSpriteArray removeAllObjects];
    [secondPlayerSpriteArray removeAllObjects];
    [enemyHidgonSpritesArray removeAllObjects];
    [parkourJumperEnemySpritesArray removeAllObjects];
    [enemySkeletonWhaleSpritesArray removeAllObjects];
    [enemyDiagonalFlyerEnemySpritesArray removeAllObjects];
    [runningChaserEnemySpritesArray removeAllObjects];
    [downwardShooterEnemySpritesArray removeAllObjects];
    [timeBombArray removeAllObjects];
    [exitDoorArray removeAllObjects];
    [powerUpsArray removeAllObjects];
    [fireballArray removeAllObjects];
    [stunPowerUpArray removeAllObjects];
    [mindControlPowerUpArray removeAllObjects];
    [stunProjectileArray removeAllObjects];
}

-(void) menuScreen {
    
    [self loadGameSettings];
    
    [(LevelSelectorMenus *)menu updateDisplayedStars];
    
    currentScreen = LEVEL_SELECTION_MENU;
        
    if (deviceIsWidescreen) {
        
        self.position = ccp([[CCDirector sharedDirector] winSize].width/16 + 5, 25);
    }
    
    if (!deviceIsWidescreen) {
        
        self.position = ccp([[CCDirector sharedDirector] winSize].width/16 - 30, 25);
    }
    
    isPaused = YES;
    
    [self stopAllActions];
    
    [self removeAllObjectsFromCurrentLevel];
    
    leftArrowButton.visible = NO;
    rightArrowButton.visible = NO;
    jumpButton.visible = NO;
    activePowerUpButton.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    mindControlCocktailForActivePowerUpButton.visible = NO;
    blueInventorySlot1.visible = NO;
    blueInventorySlot2.visible = NO;
    blueInventorySlot3.visible = NO;
    redInventorySlot4.visible = NO;
    redInventorySlot5.visible = NO;
    redInventorySlot6.visible = NO;
    storeButton.visible = NO;
    inGameCurrencyAmountLabel.visible = NO;
    yourScoreLabel.visible = NO;
    gameOverLabel.visible = NO;
    hiScoreLabel.visible = NO;
    hiScoreSecsLabel.visible = NO;
    hiScoreMinsLabel.visible = NO;
    timeLabel.visible = NO;
    hudLayer.visible = NO;
    storeButton.visible = NO;
    stunProjectileForActivePowerUpButton.visible = NO;
    invincibilityPowerUpForActivePowerUpButton.visible = NO;
    bulletTimePowerUpForActivePowerUpButton.visible = NO;
    globalStunForActivePowerUpButton.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    gameLayer.visible = NO;
    saveSlot1ForLoadScreenLabel.visible = NO;
    saveSlot2ForLoadScreenLabel.visible = NO;
    saveSlot3ForLoadScreenLabel.visible = NO;
    versusLabel.visible = NO;
    player1VersusScreeScoreLabel.visible = NO;
    player2VersusScreeScoreLabel.visible = NO;
    hiScoreSecsLabel.visible = NO;
    hiScoreMinsLabel.visible = NO;
    multiplayerGameLabel.visible = NO;
    resumeGameLabelForPauseScreen.visible = NO;
    changeLevelLabelForPauseScreen.visible = NO;
    blackLayerForPauseScreen.visible = NO;
    mainPlayerBoxingGloveGlow.visible = NO;
    
    madAgentsBanner.visible = NO;
    newGameLabel.visible = NO;
    loadGameLabel.visible = NO;
    deleteGameLabel.visible = NO;
    
    gameLayer.visible = NO;

    gameOverLabel.visible = NO;
    
    characterSelectionLayer.visible = NO;
    
    menuLayer.visible = YES;
}

-(void) characterSelectionScreen
{
    currentScreen = CHARACTER_SELECTION_SCREEN;
    
    if (deviceIsWidescreen) {
        
        self.position = ccp([[CCDirector sharedDirector] winSize].width/16 + 5, 25);
    }
    
    if (!deviceIsWidescreen) {
        
        self.position = ccp([[CCDirector sharedDirector] winSize].width/16 - 30, 25);
    }
    
    isPaused = YES;
    
    [self stopAllActions];
    
    [self removeAllObjectsFromCurrentLevel];
    
    leftArrowButton.visible = NO;
    rightArrowButton.visible = NO;
    jumpButton.visible = NO;
    activePowerUpButton.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    mindControlCocktailForActivePowerUpButton.visible = NO;
    blueInventorySlot1.visible = NO;
    blueInventorySlot2.visible = NO;
    blueInventorySlot3.visible = NO;
    redInventorySlot4.visible = NO;
    redInventorySlot5.visible = NO;
    redInventorySlot6.visible = NO;
    storeButton.visible = NO;
    inGameCurrencyAmountLabel.visible = NO;
    yourScoreLabel.visible = NO;
    gameOverLabel.visible = NO;
    hiScoreLabel.visible = NO;
    hiScoreSecsLabel.visible = NO;
    hiScoreMinsLabel.visible = NO;
    timeLabel.visible = NO;
    hudLayer.visible = NO;
    storeButton.visible = NO;
    stunProjectileForActivePowerUpButton.visible = NO;
    invincibilityPowerUpForActivePowerUpButton.visible = NO;
    bulletTimePowerUpForActivePowerUpButton.visible = NO;
    globalStunForActivePowerUpButton.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    gameLayer.visible = NO;
    saveSlot1ForLoadScreenLabel.visible = NO;
    saveSlot2ForLoadScreenLabel.visible = NO;
    saveSlot3ForLoadScreenLabel.visible = NO;
    versusLabel.visible = NO;
    player1VersusScreeScoreLabel.visible = NO;
    player2VersusScreeScoreLabel.visible = NO;
    hiScoreSecsLabel.visible = NO;
    hiScoreMinsLabel.visible = NO;
    multiplayerGameLabel.visible = NO;
    
    madAgentsBanner.visible = NO;
    newGameLabel.visible = NO;
    loadGameLabel.visible = NO;
    deleteGameLabel.visible = NO;
    
    gameLayer.visible = NO;
    
    gameOverLabel.visible = NO;
    
    menuLayer.visible = NO;
    
    characterSelectionLayer.visible = YES;
}

-(void) setTapToContinueLabelToVisible
{
    //If player just finished a boss level ask the player to rate the game at the end of the victory sequence
    if (currentLevel == 11 || currentLevel == 21 || currentLevel == 31 || currentLevel == 41 || currentLevel == 51) {
        
        [Appirater userDidSignificantEvent:YES];
    }
    
    tapToContinueLabel.visible = YES;
}

-(void) gameOverScreen {
   
    int randomNumber = arc4random()%2;
    //int randomNumber = 0;
    
    if (randomNumber == 0) {
        
        [AdColony playVideoAdForZone:@"vz1d03f5640811499e884b62" withDelegate:self withV4VCPrePopup:YES andV4VCPostPopup:YES];
    }
    
    else {
                
        [cb showInterstitial];
        
        //Use revmob temporarily
        //[[RevMobAds session] showFullscreen];
    }
    
    currentScreen = GAME_OVER_SCREEN;
    
    isPaused = YES;
    gameMusicAlreadyPlaying = NO;
    
    //Remove all objects from current Level
    [self removeAllObjectsFromCurrentLevel];
    [gameLayer removeAllChildrenWithCleanup:YES];
    
    [self stopAllActions];
    
    //Stop recording after 1.5 seconds and show view
    //[self runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.5], [CCCallFunc actionWithTarget:self selector:@selector(kamcordStopRecordingAndShowView)], nil]];
    
    if (!isBossLevel) {
    
        [gameMusic stopBackgroundMusic];
    }
    
    else if (isBossLevel) {
        
        [bossMusic stopBackgroundMusic];
    }
    
    gameOverMusic = [SimpleAudioEngine sharedEngine];//play background music
    
    if (gameOverMusic != nil) {
        [gameOverMusic preloadBackgroundMusic:@"GameOver.mp3"];
        
        if (gameOverMusic.willPlayBackgroundMusic) {
            gameOverMusic.backgroundMusicVolume = 0.5f;
        }
    }
    
    [gameOverMusic playBackgroundMusic:@"GameOver.mp3" loop:NO];
    
    enemiesLeftLabel.visible = NO;
    leftArrowButton.visible = NO;
    rightArrowButton.visible = NO;
    jumpButton.visible = NO;
    activePowerUpButton.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    mindControlCocktailForActivePowerUpButton.visible = NO;
    stunProjectileForActivePowerUpButton.visible = NO;
    invincibilityPowerUpForActivePowerUpButton.visible = NO;
    bulletTimePowerUpForActivePowerUpButton.visible = NO;
    globalStunForActivePowerUpButton.visible = NO;
    blueInventorySlot1.visible = NO;
    blueInventorySlot2.visible = NO;
    blueInventorySlot3.visible = NO;
    redInventorySlot4.visible = NO;
    redInventorySlot5.visible = NO;
    redInventorySlot6.visible = NO;
    storeButton.visible = NO;
    inGameCurrencyAmountLabel.visible = NO;
    firstPlayerHasSneakers = NO;
    playerHasDoubleJumpPowerUp = NO;
    currentLevelLabel.visible = NO;
    player1ReadyLabel.visible = NO;
    player2ReadyLabel.visible = NO;
    watchedAdColonyAdForSpeedShoes = NO;
    mainPlayerBoxingGloveGlow.visible = NO;
    characterSelectionLayer.visible = NO;
    dPadLeft.visible = NO;
    dPadRight.visible = NO;
    dPadNotPressed.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    stunProjectileForActivePowerUpButton.visible = NO;
    mindControlCocktailForActivePowerUpButton.visible = NO;
    timeLabel.color = ccWHITE;
    timeLabel.visible = NO;
    mainPlayerBoxingGloveGlow.visible = NO;
    
    //Reset in-game level timer
    [self setLevelTotalTime];
    secs = timeInt % 60;
    mins = timeInt / 60;
    [timeLabel setString:[NSString stringWithFormat:@"%02i:%02i", mins, secs]];
    
    

    gameLayer.visible = NO;
    /*
    yourScoreLabel.visible = YES;
    hiScoreLabel.visible = YES;
    hiScoreSecsLabel.visible = YES;
    hiScoreMinsLabel.visible = YES;
     */
    
    gameOverLabel.visible = NO;
    
    saveVideoButton.visible = YES;
    
    if (isSinglePlayer) {
    
        if (isBossLevel) {
        
            timeLabel.visible = YES;
            timeLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 10, self.position.y + 250);
        }
    }

    if (!isSinglePlayer) {
        
        timeLabel.position = ccp(hiScoreMultiplayerLabel.position.x, hiScoreMultiplayerLabel.position.y);
    }

    //tapToContinueLabel.visible = YES is in AppDelegate method
    tapToContinueLabel.scale = 0.7;
    tapToContinueLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 190);
    
    [tapToContinueLabel runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.75], [CCFadeOut actionWithDuration:0.0], [CCDelayTime actionWithDuration:0.75], [CCFadeIn actionWithDuration:0.0], nil]]];
}

-(void) mainMenuScreen
{
    currentScreen = MAIN_MENU_SCREEN;
    
    isPaused = YES;
    
    [self removeAllObjectsFromCurrentLevel];
    
    [self stopAllActions];
    
    [gameMusic stopBackgroundMusic];
    
    [gameOverMusic playBackgroundMusic:@"GameOver.mp3" loop:NO];
    
    leftArrowButton.visible = NO;
    rightArrowButton.visible = NO;
    jumpButton.visible = NO;
    activePowerUpButton.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    mindControlCocktailForActivePowerUpButton.visible = NO;
    blueInventorySlot1.visible = NO;
    blueInventorySlot2.visible = NO;
    blueInventorySlot3.visible = NO;
    redInventorySlot4.visible = NO;
    redInventorySlot5.visible = NO;
    redInventorySlot6.visible = NO;
    storeButton.visible = NO;
    inGameCurrencyAmountLabel.visible = NO;
    yourScoreLabel.visible = NO;
    gameOverLabel.visible = NO;
    hiScoreLabel.visible = NO;
    hiScoreSecsLabel.visible = NO;
    hiScoreMinsLabel.visible = NO;
    timeLabel.visible = NO;
    hudLayer.visible = NO;
    storeButton.visible = NO;
    stunProjectileForActivePowerUpButton.visible = NO;
    invincibilityPowerUpForActivePowerUpButton.visible = NO;
    bulletTimePowerUpForActivePowerUpButton.visible = NO;
    globalStunForActivePowerUpButton.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    gameLayer.visible = NO;
    saveSlot1ForLoadScreenLabel.visible = NO;
    saveSlot2ForLoadScreenLabel.visible = NO;
    saveSlot3ForLoadScreenLabel.visible = NO;
    versusLabel.visible = NO;
    player1VersusScreeScoreLabel.visible = NO;
    player2VersusScreeScoreLabel.visible = NO;
    hiScoreSecsLabel.visible = NO;
    hiScoreMinsLabel.visible = NO;
    deleteGameLabel.visible = NO;
    menuLayer.visible = NO;
    mainPlayerBoxingGloveGlow.visible = NO;
    
    madAgentsBanner.visible = YES;
    newGameLabel.visible = YES;
    loadGameLabel.visible = YES;
    multiplayerGameLabel.visible = YES;
}

-(void) loadSavedSlotScreen
{    
    currentScreen = LOAD_PROFILE_SCREEN;
    
    saveSlot1ForLoadScreenLabel.visible = YES;
    saveSlot2ForLoadScreenLabel.visible = YES;
    saveSlot3ForLoadScreenLabel.visible = YES;
    
    multiplayerGameLabel.visible = NO;
    
    if (saveSlot1NameLabel == nil) {
        
        [saveSlot1ForLoadScreenLabel setString: [NSString stringWithFormat:@"New"]];
    }
    
    if (saveSlot2NameLabel == nil) {
        
        [saveSlot2ForLoadScreenLabel setString: [NSString stringWithFormat:@"New"]];
    }
    
    if (saveSlot3NameLabel == nil) {
        
        [saveSlot3ForLoadScreenLabel setString: [NSString stringWithFormat:@"New"]];
    }
    
    leftArrowButton.visible = NO;
    rightArrowButton.visible = NO;
    jumpButton.visible = NO;
    activePowerUpButton.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    mindControlCocktailForActivePowerUpButton.visible = NO;
    blueInventorySlot1.visible = NO;
    blueInventorySlot2.visible = NO;
    blueInventorySlot3.visible = NO;
    redInventorySlot4.visible = NO;
    redInventorySlot5.visible = NO;
    redInventorySlot6.visible = NO;
    storeButton.visible = NO;
    inGameCurrencyAmountLabel.visible = NO;
    yourScoreLabel.visible = NO;
    gameOverLabel.visible = NO;
    hiScoreLabel.visible = NO;
    hiScoreSecsLabel.visible = NO;
    hiScoreMinsLabel.visible = NO;
    timeLabel.visible = NO;
    hudLayer.visible = NO;
    storeButton.visible = NO;
    stunProjectileForActivePowerUpButton.visible = NO;
    invincibilityPowerUpForActivePowerUpButton.visible = NO;
    bulletTimePowerUpForActivePowerUpButton.visible = NO;
    globalStunForActivePowerUpButton.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    gameLayer.visible = NO;
    madAgentsBanner.visible = NO;
    newGameLabel.visible = NO;
    loadGameLabel.visible = NO;
    versusLabel.visible = NO;
    deleteGameLabel.visible = YES;
    
    if (currentSaveSlot == SAVE_SLOT_1) {
        
        deleteGameLabel.position = ccp(saveSlot1ForLoadScreenLabel.position.x + 200, saveSlot1ForLoadScreenLabel.position.y);
    }
    
    if (currentSaveSlot == SAVE_SLOT_2) {
        
        deleteGameLabel.position = ccp(saveSlot2ForLoadScreenLabel.position.x + 200, saveSlot2ForLoadScreenLabel.position.y);
    }
    
    if (currentSaveSlot == SAVE_SLOT_3) {
        
        deleteGameLabel.position = ccp(saveSlot3ForLoadScreenLabel.position.x + 200, saveSlot3ForLoadScreenLabel.position.y);
    }
}

-(void) loadGameSettings {
    
    prefs = [NSUserDefaults standardUserDefaults];
    currentSaveSlot = [prefs integerForKey:@"currentSaveSlot"];
    [self updateAllCurrencyRelatedLabels];
    
    
    saveSlot1NameLabel = [prefs stringForKey:@"saveSlot1NameLabel"];
    saveSlot2NameLabel = [prefs stringForKey:@"saveSlot2NameLabel"];
    saveSlot3NameLabel = [prefs stringForKey:@"saveSlot3NameLabel"];
    
    [saveSlot1ForLoadScreenLabel setString: [NSString stringWithFormat:@"%@", saveSlot1NameLabel]];
    [saveSlot2ForLoadScreenLabel setString: [NSString stringWithFormat:@"%@", saveSlot2NameLabel]];
    [saveSlot3ForLoadScreenLabel setString: [NSString stringWithFormat:@"%@", saveSlot3NameLabel]];
    
    if (currentSaveSlot == SAVE_SLOT_1) {
            
        if (MANUAL_LEVEL_SELECTION == NO) {
        
            currentLevel = [prefs integerForKey:@"currentLevelForSaveSlot1"];
            
            //If for some reason current level is 0, set it to 1
            if (currentLevel == 0) {
                
                currentLevel = 1;
            }
        }
        
        else if (MANUAL_LEVEL_SELECTION == YES) {
            
            currentLevel = CURRENT_LEVEL_BEING_TESTED;
            
            //If for some reason current level is 0, set it to 1
            if (currentLevel == 0) {
                
                currentLevel = 1;
            }
        }
        
        inGameCurrencyAmount = [prefs integerForKey:@"inGameCurrencyAmountForSaveSlot1"];
        stunBombsLeft = [prefs integerForKey:@"stunBombsLeftForSaveSlot1"];
        stunProjectilesLeft = [prefs integerForKey:@"stunProjectilesLeftForSaveSlot1"];
        mindControlPowerUpsLeft = [prefs integerForKey:@"mindControlPowerUpsLeftForSaveSlot1"];
        bulletTimePowerUpsLeft = [prefs integerForKey:@"bulletTimePowerUpsLeftForSaveSlot1"];
        invincibilityPowerUpsLeft = [prefs integerForKey:@"invincibilityPowerUpsLeftForSaveSlot1"];
       // powerUpCurrentlySelected = [prefs integerForKey:@"powerUpCurrentlySelectedForSaveSlot1"];
        firstPlayerHasSneakers = [prefs integerForKey:@"firstPlayerHasSneakersForSaveSlot1"];
        playerHasDoubleJumpPowerUp = [prefs integerForKey:@"playerHasDoubleJumpPowerUpForSaveSlot1"];
        
        [newGameLabel setString: [NSString stringWithFormat:@"%@", saveSlot1NameLabel]];
        
        if (saveSlot1NameLabel == nil) {
            
            [newGameLabel setString: [NSString stringWithFormat:@"New Game"]];
        }        
    }
    
    if (currentSaveSlot == SAVE_SLOT_2) {
                
        if (MANUAL_LEVEL_SELECTION == NO) {
            
            currentLevel = [prefs integerForKey:@"currentLevelForSaveSlot2"];
            
            //If for some reason current level is 0, set it to 1
            if (currentLevel == 0) {
                
                currentLevel = 1;
            }
        }
        
        else if (MANUAL_LEVEL_SELECTION == YES) {
            
            currentLevel = CURRENT_LEVEL_BEING_TESTED;
            
            //If for some reason current level is 0, set it to 1
            if (currentLevel == 0) {
                
                currentLevel = 1;
            }
        }
        
        inGameCurrencyAmount = [prefs integerForKey:@"inGameCurrencyAmountForSaveSlot2"];
        //currentLevel = [prefs integerForKey:@"currentLevelForSaveSlot2"];
        stunBombsLeft = [prefs integerForKey:@"stunBombsLeftForSaveSlot2"];
        stunProjectilesLeft = [prefs integerForKey:@"stunProjectilesLeftForSaveSlot2"];
        mindControlPowerUpsLeft = [prefs integerForKey:@"mindControlPowerUpsLeftForSaveSlot2"];
        bulletTimePowerUpsLeft = [prefs integerForKey:@"bulletTimePowerUpsLeftForSaveSlot2"];
        invincibilityPowerUpsLeft = [prefs integerForKey:@"invincibilityPowerUpsLeftForSaveSlot2"];
       // powerUpCurrentlySelected = [prefs integerForKey:@"powerUpCurrentlySelectedForSaveSlot2"];
        firstPlayerHasSneakers = [prefs integerForKey:@"firstPlayerHasSneakersForSaveSlot2"];
        playerHasDoubleJumpPowerUp = [prefs integerForKey:@"playerHasDoubleJumpPowerUpForSaveSlot2"];
        
        [newGameLabel setString: [NSString stringWithFormat:@"%@", saveSlot2NameLabel]];
        
        if (saveSlot2NameLabel == nil) {
            
            [newGameLabel setString: [NSString stringWithFormat:@"New Game"]];
        }        
    }
    
    if (currentSaveSlot == SAVE_SLOT_3) {
                        
        if (MANUAL_LEVEL_SELECTION == NO) {
            
            currentLevel = [prefs integerForKey:@"currentLevelForSaveSlot3"];
            
            //If for some reason current level is 0, set it to 1
            if (currentLevel == 0) {
                
                currentLevel = 1;
            }
        }
        
        else if (MANUAL_LEVEL_SELECTION == YES) {
            
            currentLevel = CURRENT_LEVEL_BEING_TESTED;
            
            //If for some reason current level is 0, set it to 1
            if (currentLevel == 0) {
                
                currentLevel = 1;
            }
        }
        
        inGameCurrencyAmount = [prefs integerForKey:@"inGameCurrencyAmountForSaveSlot3"];
        //currentLevel = [prefs integerForKey:@"currentLevelForSaveSlot3"];
        stunBombsLeft = [prefs integerForKey:@"stunBombsLeftForSaveSlot3"];
        stunProjectilesLeft = [prefs integerForKey:@"stunProjectilesLeftForSaveSlot3"];
        mindControlPowerUpsLeft = [prefs integerForKey:@"mindControlPowerUpsLeftForSaveSlot3"];
        bulletTimePowerUpsLeft = [prefs integerForKey:@"bulletTimePowerUpsLeftForSaveSlot3"];
        invincibilityPowerUpsLeft = [prefs integerForKey:@"invincibilityPowerUpsLeftForSaveSlot3"];
        //powerUpCurrentlySelected = [prefs integerForKey:@"powerUpCurrentlySelectedForSaveSlot3"];
        firstPlayerHasSneakers = [prefs integerForKey:@"firstPlayerHasSneakersForSaveSlot3"];
        playerHasDoubleJumpPowerUp = [prefs integerForKey:@"playerHasDoubleJumpPowerUpForSaveSlot3"];
        
        [newGameLabel setString: [NSString stringWithFormat:@"%@", saveSlot3NameLabel]];
        
        if (saveSlot3NameLabel == nil) {
            
            [newGameLabel setString: [NSString stringWithFormat:@"New Game"]];
        }        
    }
    
    [prefs synchronize];
}

-(void) updateNameLabelForMainMenu
{
    [prefs setInteger:currentSaveSlot forKey:@"currentSaveSlot"];
    
    if (currentSaveSlot == SAVE_SLOT_1) {
        
        [prefs setObject:saveSlot1NameLabel forKey:@"saveSlot1NameLabel"];
    }
    
    if (currentSaveSlot == SAVE_SLOT_2) {
        
        [prefs setObject:saveSlot2NameLabel forKey:@"saveSlot2NameLabel"];
    }
    
    if (currentSaveSlot == SAVE_SLOT_3) {
        
        [prefs setObject:saveSlot3NameLabel forKey:@"saveSlot3NameLabel"];
    }
    
    [prefs synchronize];
}

-(void) saveGameSettings {
    
    prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:currentSaveSlot forKey:@"currentSaveSlot"];

    if (currentSaveSlot == SAVE_SLOT_1) {
        
        [prefs setObject:saveSlot1NameLabel forKey:@"saveSlot1NameLabel"];
        [prefs setInteger: inGameCurrencyAmount forKey: @"inGameCurrencyAmountForSaveSlot1"];
        [prefs setInteger:currentLevel forKey:@"currentLevelForSaveSlot1"];
        [prefs setInteger:stunBombsLeft forKey:@"stunBombsLeftForSaveSlot1"];
        [prefs setInteger:stunProjectilesLeft forKey:@"stunProjectilesLeftForSaveSlot1"];
        [prefs setInteger:mindControlPowerUpsLeft forKey:@"mindControlPowerUpsLeftForSaveSlot1"];
        [prefs setInteger:bulletTimePowerUpsLeft forKey:@"bulletTimePowerUpsLeftForSaveSlot1"];
        [prefs setInteger:invincibilityPowerUpsLeft forKey:@"invincibilityPowerUpsLeftForSaveSlot1"];
      //  [prefs setInteger:powerUpCurrentlySelected forKey:@"powerUpCurrentlySelectedForSaveSlot1"];
        [prefs setBool:firstPlayerHasSneakers forKey:@"firstPlayerHasSneakersForSaveSlot1"];
        [prefs setBool:playerHasDoubleJumpPowerUp forKey:@"playerHasDoubleJumpPowerUpForSaveSlot1"];
    }
    
    if (currentSaveSlot == SAVE_SLOT_2) {
        
        [prefs setObject:saveSlot2NameLabel forKey:@"saveSlot2NameLabel"];
        [prefs setInteger: inGameCurrencyAmount forKey: @"inGameCurrencyAmountForSaveSlot2"];
        [prefs setInteger:currentLevel forKey:@"currentLevelForSaveSlot2"];
        [prefs setInteger:stunBombsLeft forKey:@"stunBombsLeftForSaveSlot2"];
        [prefs setInteger:stunProjectilesLeft forKey:@"stunProjectilesLeftForSaveSlot2"];
        [prefs setInteger:mindControlPowerUpsLeft forKey:@"mindControlPowerUpsLeftForSaveSlot2"];
        [prefs setInteger:bulletTimePowerUpsLeft forKey:@"bulletTimePowerUpsLeftForSaveSlot2"];
        [prefs setInteger:invincibilityPowerUpsLeft forKey:@"invincibilityPowerUpsLeftForSaveSlot2"];
      //  [prefs setInteger:powerUpCurrentlySelected forKey:@"powerUpCurrentlySelectedForSaveSlot2"];
        [prefs setBool:firstPlayerHasSneakers forKey:@"firstPlayerHasSneakersForSaveSlot2"];
        [prefs setBool:playerHasDoubleJumpPowerUp forKey:@"playerHasDoubleJumpPowerUpForSaveSlot2"];
    }
    
    if (currentSaveSlot == SAVE_SLOT_3) {
        
        [prefs setObject:saveSlot3NameLabel forKey:@"saveSlot3NameLabel"];
        [prefs setInteger: inGameCurrencyAmount forKey: @"inGameCurrencyAmountForSaveSlot3"];
        [prefs setInteger:currentLevel forKey:@"currentLevelForSaveSlot3"];
        [prefs setInteger:stunBombsLeft forKey:@"stunBombsLeftForSaveSlot3"];
        [prefs setInteger:stunProjectilesLeft forKey:@"stunProjectilesLeftForSaveSlot3"];
        [prefs setInteger:mindControlPowerUpsLeft forKey:@"mindControlPowerUpsLeftForSaveSlot3"];
        [prefs setInteger:bulletTimePowerUpsLeft forKey:@"bulletTimePowerUpsLeftForSaveSlot3"];
        [prefs setInteger:invincibilityPowerUpsLeft forKey:@"invincibilityPowerUpsLeftForSaveSlot3"];
       // [prefs setInteger:powerUpCurrentlySelected forKey:@"powerUpCurrentlySelectedForSaveSlot3"];
        [prefs setBool:firstPlayerHasSneakers forKey:@"firstPlayerHasSneakersForSaveSlot3"];
        [prefs setBool:playerHasDoubleJumpPowerUp forKey:@"playerHasDoubleJumpPowerUpForSaveSlot3"];
    }
    
    [prefs synchronize];
}

-(void) deleteSaveDataFromSelectedSlot {
    
    prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:currentSaveSlot forKey:@"currentSaveSlot"];
    
    if (currentSaveSlot == SAVE_SLOT_1) {
        
        [prefs setObject:nil forKey:@"saveSlot1NameLabel"];
        [prefs setInteger: 0 forKey: @"inGameCurrencyAmountForSaveSlot1"];
        [prefs setInteger:1 forKey:@"currentLevelForSaveSlot1"];
        [prefs setInteger:0 forKey:@"stunBombsLeftForSaveSlot1"];
        [prefs setInteger:0 forKey:@"stunProjectilesLeftForSaveSlot1"];
        [prefs setInteger:0 forKey:@"mindControlPowerUpsLeftForSaveSlot1"];
        [prefs setInteger:0 forKey:@"bulletTimePowerUpsLeftForSaveSlot1"];
        [prefs setInteger:0 forKey:@"invincibilityPowerUpsLeftForSaveSlot1"];
     //   [prefs setInteger:1 forKey:@"powerUpCurrentlySelectedForSaveSlot1"];
        [prefs setBool:NO forKey:@"firstPlayerHasSneakersForSaveSlot1"];
        [prefs setBool:NO forKey:@"playerHasDoubleJumpPowerUpForSaveSlot1"];
        
      //  [newGameLabel setString: [NSString stringWithFormat:@"New Game"]];
    }
    
    if (currentSaveSlot == SAVE_SLOT_2) {
        
        [prefs setObject:nil forKey:@"saveSlot2NameLabel"];
        [prefs setInteger: 0 forKey: @"inGameCurrencyAmountForSaveSlot2"];
        [prefs setInteger:1 forKey:@"currentLevelForSaveSlot2"];
        [prefs setInteger:0 forKey:@"stunBombsLeftForSaveSlot2"];
        [prefs setInteger:0 forKey:@"stunProjectilesLeftForSaveSlot2"];
        [prefs setInteger:0 forKey:@"mindControlPowerUpsLeftForSaveSlot2"];
        [prefs setInteger:0 forKey:@"bulletTimePowerUpsLeftForSaveSlot2"];
        [prefs setInteger:0 forKey:@"invincibilityPowerUpsLeftForSaveSlot2"];
      //  [prefs setInteger:0 forKey:@"powerUpCurrentlySelectedForSaveSlot2"];
        [prefs setBool:NO forKey:@"firstPlayerHasSneakersForSaveSlot2"];
        [prefs setBool:NO forKey:@"playerHasDoubleJumpPowerUpForSaveSlot2"];
        
     //   [newGameLabel setString: [NSString stringWithFormat:@"New Game"]];
    }
    
    if (currentSaveSlot == SAVE_SLOT_3) {
        
        [prefs setObject:nil forKey:@"saveSlot3NameLabel"];
        [prefs setInteger: 0 forKey: @"inGameCurrencyAmountForSaveSlot3"];
        [prefs setInteger:1 forKey:@"currentLevelForSaveSlot3"];
        [prefs setInteger:0 forKey:@"stunBombsLeftForSaveSlot3"];
        [prefs setInteger:0 forKey:@"stunProjectilesLeftForSaveSlot3"];
        [prefs setInteger:0 forKey:@"mindControlPowerUpsLeftForSaveSlot3"];
        [prefs setInteger:0 forKey:@"bulletTimePowerUpsLeftForSaveSlot3"];
        [prefs setInteger:0 forKey:@"invincibilityPowerUpsLeftForSaveSlot3"];
     //   [prefs setInteger:0 forKey:@"powerUpCurrentlySelectedForSaveSlot3"];
        [prefs setBool:NO forKey:@"firstPlayerHasSneakersForSaveSlot3"];
        [prefs setBool:NO forKey:@"playerHasDoubleJumpPowerUpForSaveSlot3"];
        
    //    [newGameLabel setString: [NSString stringWithFormat:@"New Game"]];
    }
    
    [self updateAllCurrencyRelatedLabels];
    [self loadGameSettings];
    [prefs synchronize];
}

-(void) setIsPausedToYes {
    
    isPaused = YES;
    
    //Pause player walking animation
    [mainCharacterBlueBoyWalking pauseSchedulerAndActions];
    [mainCharacterBlueBoyWalkingWithSneakers pauseSchedulerAndActions];
    
    for (Enemy *enemies in enemySpritesArray) {
        
        [enemies pauseAllMotionFramesForMadAgentsNotification];
    }
}

-(void) setIsPausedToNo {
    
    isPaused = NO;
    
    [mainCharacterBlueBoyWalking resumeSchedulerAndActions];
    [mainCharacterBlueBoyWalkingWithSneakers resumeSchedulerAndActions];
    
    for (Enemy *enemies in enemySpritesArray) {
        
        [enemies resumeAllMotionFramesForMadAgentsNotification];
    }
}

-(void) resumeGameFromStore
{
 //   [self runAction: [CCMoveBy actionWithDuration:1.0 position:ccp(0, 370)]];
    
    NSLog (@"Resume Game");
    
    [self setIsPausedToNo];
    
    for (Enemy *enemies in enemySpritesArray) {
        
        [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCCallFunc actionWithTarget:enemies selector:@selector(resumeSchedulerAndActions)], nil]];
    }
    
    for (fireball in fireballArray) {
        
        [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCCallFunc actionWithTarget:fireball selector:@selector(resumeSchedulerAndActions)], nil]];
    }
    
 //   inGameCurrencyAmountLabel.position = ccp(storeButton.position.x + 45, storeButton.position.y);
 //   inGameCurrencyAmountLabel.scale = 0.55;
    
 //   [inGameCurrencyAmountLabel setString: [NSString stringWithFormat:@"$%i", inGameCurrencyAmount]];
}

-(void) playMadAgentsNotificationAlarmSound
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"Alarm.caf" pitch:1.0 pan:0.5 gain:0.75];
}

-(void) playFastMusic {
    
    if (madAgentsAmount == 0) {
    
        if (!isBossLevel) {
            
            fastGameMusic = [SimpleAudioEngine sharedEngine];//play background music
            
            if (fastGameMusic != nil) {
                [fastGameMusic preloadBackgroundMusic:@"HurryUpGameMusic.m4a"];
                
                if (fastGameMusic.willPlayBackgroundMusic) {
                    fastGameMusic.backgroundMusicVolume = 0.5f;
                }
            }
            
            [fastGameMusic playBackgroundMusic:@"HurryUpGameMusic.m4a" loop:YES];
        }
        
        else if (isBossLevel) {
                        
            bossMusic = [SimpleAudioEngine sharedEngine];//play background music
            
            if (bossMusic != nil) {
                [bossMusic preloadBackgroundMusic:@"HurryUpBossMusic.m4a"];
                
                if (bossMusic.willPlayBackgroundMusic) {
                    bossMusic.backgroundMusicVolume = 0.5f;
                }
            }
            
            [bossMusic playBackgroundMusic:@"HurryUpBossMusic.m4a" loop:YES];
        }
    }
    
    else if (madAgentsAmount >= 1) {
        
        if (!isBossLevel) {
                    
            fastGameMusic = [SimpleAudioEngine sharedEngine];//play background music
            
            if (fastGameMusic != nil) {
                [fastGameMusic preloadBackgroundMusic:@"HurryUpGameMusic.m4a"];
                
                if (fastGameMusic.willPlayBackgroundMusic) {
                    fastGameMusic.backgroundMusicVolume = 0.5f;
                }
            }
            
            [fastGameMusic playBackgroundMusic:@"HurryUpGameMusic.m4a" loop:YES];
        }
        
        else if (isBossLevel) {
                        
            bossMusic = [SimpleAudioEngine sharedEngine];//play background music
            
            if (bossMusic != nil) {
                [bossMusic preloadBackgroundMusic:@"HurryUpBossMusic.m4a"];
                
                if (bossMusic.willPlayBackgroundMusic) {
                    bossMusic.backgroundMusicVolume = 0.5f;
                }
            }
            
            [bossMusic playBackgroundMusic:@"HurryUpBossMusic.m4a" loop:YES];
        }
    }
}

-(void) startInGameTimer
{
    if (isSinglePlayer && !isBossLevel) {
        
        decreaseTimerAction = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFunc actionWithTarget:self selector:@selector(decreaseTimer)], nil]]];
    }
    
    if (!isSinglePlayer || isBossLevel) {
    
        increaseTimerAction = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFunc actionWithTarget:self selector:@selector(increaseTimer)], nil]]];
    }
}

-(void) increaseMadAgentMadnessScript {
    
    if (madAgentsAmount == 0) {
    
        madAgentsAmount = 1;

        if (!isBossLevel) {
            
            [gameMusic stopBackgroundMusic];
        }
        
        else if (isBossLevel) {
            
            [bossMusic stopBackgroundMusic];
        }
        
        //Make all fireballs pause and then resume in accordance with the Mad Agents notification
        for (fireball in fireballArray) {
            
            [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:fireball selector:@selector(pauseSchedulerAndActions)], [CCDelayTime actionWithDuration: 2.2], [CCCallFunc actionWithTarget:fireball selector:@selector(resumeSchedulerAndActions)], nil]];
        }
        
        //Pause game for 3 seconds
        [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(setIsPausedToYes)], [CCDelayTime actionWithDuration: 2.2], [CCCallFunc actionWithTarget:self selector:@selector(setIsPausedToNo)], nil]];

        //Scroll 'Mad Agents' upwards
        [madAgentsLabel runAction: [CCSequence actions: [CCMoveTo actionWithDuration:0.6 position:ccp([[CCDirector sharedDirector] winSize].width/2 - 40, [[CCDirector sharedDirector] winSize].height/2 + 8)], [CCDelayTime actionWithDuration:1.5], [CCMoveTo actionWithDuration:0.6 position:ccp([[CCDirector sharedDirector] winSize].width/2 - 40, [[CCDirector sharedDirector] winSize].height/2 + 450)], [CCMoveTo actionWithDuration:0.0 position:ccp([[CCDirector sharedDirector] winSize].width/2 - 40, [[CCDirector sharedDirector] winSize].height/2 - 500)], nil]];
        
        [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.6], [CCCallFunc actionWithTarget:self selector:@selector(playMadAgentsNotificationAlarmSound)], [CCDelayTime actionWithDuration:2.25], [CCCallFunc actionWithTarget:self selector:@selector(playFastMusic)], nil]];

        
        if ([enemySkeletonWhaleSpritesArray count] > 0) {
        
            [(Enemy*)enemySkeletonWhaleSprite readjustEnemySkeletonWhaleResponseTime];
        }
        
        if ([enemyHidgonSpritesArray count] > 0) {
        
            [(Enemy*)enemyHidgonSprite increaseEnemyHidgonResponseTimeMethod];
        }
        
        if ([parkourJumperEnemySpritesArray count] > 0) {
            
            [(Enemy*)parkourJumperSprite increaseParkourJumperResponseTimeMethod];
        }
        
        if ([downwardShooterEnemySpritesArray count] > 0) {
            
            [(Enemy*)downwardShooterEnemy adjustDownwardShooterResponseTimeMethod];
        }
        
        for (Enemy *enemySprites in enemySpritesArray) {

            enemySprites.mySprite.color = ccc3(255, 69, 0);
            
            if (enemySprites.enemyType == PARKOUR_JUMPER_TYPE) {
                
                enemySprites.ninjaJumping.color = ccc3(255, 69, 0);
                enemySprites.ninjaRunning.color = ccc3(255, 69, 0);
                enemySprites.ninjaStandingStill.color = ccc3(255, 69, 0);
            }
            
            if (enemySprites.enemyType == HIDGON_ENEMY_TYPE) {
                
                enemySprites.gunnerWalking.color = ccc3(255, 69, 0);
                enemySprites.gunnerStandingStill.color = ccc3(255, 69, 0);
            }
            
            if (enemySprites.enemyType == SKELETON_WHALE_TYPE) {
                
                enemySprites.jetmanFlying.color = ccc3(255, 69, 0);
            }
            
            if (enemySprites.enemyType == DIAGONAL_FLYER_TYPE) {
                
                enemySprites.flyingDownLeft.color = ccc3(255, 69, 0);
                enemySprites.flyingDownRight.color = ccc3(255, 69, 0);
                enemySprites.flyingUpLeft.color = ccc3(255, 69, 0);
                enemySprites.flyingUpRight.color = ccc3(255, 69, 0);
            }
            
            if (enemySprites.enemyType == FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE) {
                
                enemySprites.flyingDownLeft.color = ccc3(255, 69, 0);
                enemySprites.flyingDownRight.color = ccc3(255, 69, 0);
                enemySprites.flyingUpLeft.color = ccc3(255, 69, 0);
                enemySprites.flyingUpRight.color = ccc3(255, 69, 0);
            }
            
            if (enemySprites.enemyType == CHASER_ENEMY_TYPE) {
                
               enemySprites.chaserWalking.color = ccc3(255, 69, 0);
               enemySprites.chaserRunning.color = ccc3(255, 69, 0);
            }
            
            if (enemySprites.enemyType == DOWNWARD_SHOOTER_TYPE) {
                
                enemySprites.saucerFlying.color = ccc3(255, 69, 0);
            }
        }
    }
}

-(void) addAllObjectsToCurrentLevel
{
    [self createNuclearExplosionEffectsSprites];
    
    objectsGroup = [tileMap objectGroupNamed:@"Objects"];
    
    //Add hidgon enemies at their spawn points
    NSMutableDictionary *timeBombPointDictionary;
    for (timeBombPointDictionary in [objectsGroup objects]) {
        if ([[timeBombPointDictionary valueForKey:@"TimeBomb"] intValue] != 0) {
            
            float timeBombPointX = [[timeBombPointDictionary valueForKey:@"x"] intValue];
            float timeBombPointY = [[timeBombPointDictionary valueForKey:@"y"] intValue];
            [self addTimeBomb: timeBombPointX y: timeBombPointY];
        }
    }
    
    //Add star (in-game currency) to the designated point
    NSMutableDictionary *starInGameCurrencyPointDictionary;
    for (starInGameCurrencyPointDictionary in [objectsGroup objects]) {
        if ([[starInGameCurrencyPointDictionary valueForKey:@"StarInGameCurrency"] intValue] != 0) {
            
            if (isSinglePlayer) {
            
                float starInGameCurrencyPointX = [[starInGameCurrencyPointDictionary valueForKey:@"x"] intValue];
                float starInGameCurrencyPointY = [[starInGameCurrencyPointDictionary valueForKey:@"y"] intValue];
                [self addStarInGameCurrency: starInGameCurrencyPointX y: starInGameCurrencyPointY];
            }
        }
    }
    
    //Add Boxing Glove to the designated point
    NSMutableDictionary *boxingGlovePointDictionary;
    for (boxingGlovePointDictionary in [objectsGroup objects]) {
        if ([[boxingGlovePointDictionary valueForKey:@"BoxingGlovePowerUp"] intValue] != 0) {
            
            if (isSinglePlayer) {
                
                float boxingGlovePointX = [[boxingGlovePointDictionary valueForKey:@"x"] intValue];
                float boxingGlovePointY = [[boxingGlovePointDictionary valueForKey:@"y"] intValue];
                [self addBoxingGlovePowerUp: boxingGlovePointX y: boxingGlovePointY];
            }
        }
    }
    
    //Add permanant stun bomb to the designated point
    NSMutableDictionary *mindControlPowerUpPointDictionary;
    for (mindControlPowerUpPointDictionary in [objectsGroup objects]) {
        if ([[mindControlPowerUpPointDictionary valueForKey:@"FriendPillPowerUp"] intValue] != 0) {
            
            float mindControlPowerUpPointX = [[mindControlPowerUpPointDictionary valueForKey:@"x"] intValue];
            float mindControlPowerUpPointY = [[mindControlPowerUpPointDictionary valueForKey:@"y"] intValue];
            [self addPermanantMindControlPowerUp: mindControlPowerUpPointX y: mindControlPowerUpPointY];
        }
    }
    
    
    //Add permanant stun bomb to the designated point
    NSMutableDictionary *stunBombPowerUpPointDictionary;
    for (stunBombPowerUpPointDictionary in [objectsGroup objects]) {
        if ([[stunBombPowerUpPointDictionary valueForKey:@"StunBombPowerUp"] intValue] != 0) {
            
            float stunBombPowerUpPointX = [[stunBombPowerUpPointDictionary valueForKey:@"x"] intValue];
            float stunBombPowerUpPointY = [[stunBombPowerUpPointDictionary valueForKey:@"y"] intValue];
            [self addPermanantStunBombPowerUp: stunBombPowerUpPointX y: stunBombPowerUpPointY];
        }
    }
    
    //Add permanant stun projectile to the designated point
    NSMutableDictionary *stunProjectilePowerUpPointDictionary;
    for (stunProjectilePowerUpPointDictionary in [objectsGroup objects]) {
        if ([[stunProjectilePowerUpPointDictionary valueForKey:@"StunProjectilePowerUp"] intValue] != 0) {
            
            float stunProjectilePowerUpPointX = [[stunProjectilePowerUpPointDictionary valueForKey:@"x"] intValue];
            float stunProjectilePowerUpPointY = [[stunProjectilePowerUpPointDictionary valueForKey:@"y"] intValue];
            [self addPermanantStunProjectilePowerUp: stunProjectilePowerUpPointX y: stunProjectilePowerUpPointY];
        }
    }
    
    //Add permanant invincibility powerup to the designated point
    NSMutableDictionary *invincibilityPowerUpPointDictionary;
    for (invincibilityPowerUpPointDictionary in [objectsGroup objects]) {
        if ([[invincibilityPowerUpPointDictionary valueForKey:@"InvincibilityPowerUp"] intValue] != 0) {
            
            float invincibilityPowerUpPointX = [[invincibilityPowerUpPointDictionary valueForKey:@"x"] intValue];
            float invincibilityPowerUpPointY = [[invincibilityPowerUpPointDictionary valueForKey:@"y"] intValue];
            [self addPermanantInvincibilityPowerUp: invincibilityPowerUpPointX y: invincibilityPowerUpPointY];
        }
    }
    
    //Add permanant bullet time powerup to the designated point
    NSMutableDictionary *bulletTimePowerUpPointDictionary;
    for (bulletTimePowerUpPointDictionary in [objectsGroup objects]) {
        if ([[bulletTimePowerUpPointDictionary valueForKey:@"BulletTimePowerUp"] intValue] != 0) {
            
            float bulletTimePowerUpPointX = [[bulletTimePowerUpPointDictionary valueForKey:@"x"] intValue];
            float bulletTimePowerUpPointY = [[bulletTimePowerUpPointDictionary valueForKey:@"y"] intValue];
            [self addPermanantBulletTimePowerUp: bulletTimePowerUpPointX y: bulletTimePowerUpPointY];
        }
    }
    
    //Add permanant global stun powerup to the designated point
    NSMutableDictionary *globalStunPowerUpPointDictionary;
    for (globalStunPowerUpPointDictionary in [objectsGroup objects]) {
        if ([[globalStunPowerUpPointDictionary valueForKey:@"GlobalStunPowerUp"] intValue] != 0) {
            
            float globalStunPowerUpPointX = [[globalStunPowerUpPointDictionary valueForKey:@"x"] intValue];
            float globalStunPowerUpPointY = [[globalStunPowerUpPointDictionary valueForKey:@"y"] intValue];
            [self addPermanantGlobalStunPowerUp: globalStunPowerUpPointX y: globalStunPowerUpPointY];
        }
    }
    
    //Add exitDoor to the spawnPoint
    NSMutableDictionary *exitDoorPointDictionary;
    for (exitDoorPointDictionary in [objectsGroup objects]) {
        if ([[exitDoorPointDictionary valueForKey:@"ExitDoor"] intValue] != 0) {
            
            float exitDoorPointX = [[exitDoorPointDictionary valueForKey:@"x"] intValue];
            float exitDoorPointY = [[exitDoorPointDictionary valueForKey:@"y"] intValue];
            [self addExitDoor: exitDoorPointX y: exitDoorPointY];
        }
    }
    
    //Add player1 spawn point
    NSMutableDictionary *spawnPoint = [objectsGroup objectNamed:@"SpawnPoint"];
    NSAssert(spawnPoint != nil, @"SpawnPoint object not found");
    cairoX = [[spawnPoint valueForKey:@"x"] intValue];
    cairoY = [[spawnPoint valueForKey:@"y"] intValue];
    [self addFirstPlayerSprite: cairoX y: cairoY];
    
    NSMutableDictionary *spawnPointPlayer2;
    for (spawnPointPlayer2 in [objectsGroup objects]) {
        if ([[spawnPointPlayer2 valueForKey:@"SpawnPointSecondPlayer"] intValue] != 0) {
            
            float spawnPointPlayer2X = [[spawnPointPlayer2 valueForKey:@"x"] intValue];
            float spawnPointPlayer2Y = [[spawnPointPlayer2 valueForKey:@"y"] intValue];
            [self addSecondPlayer: spawnPointPlayer2X y: spawnPointPlayer2Y];
        }
    }
    /*
    //Add player2 to spawnpoint
    NSMutableDictionary *spawnPointPlayer2 = [objectsGroup objectNamed:@"SpawnPointSecondPlayer"];
    NSAssert(spawnPointPlayer2 != nil, @"SpawnPointSecondPlayer object not found");
    float spawnPointPlayer2X = [[spawnPointPlayer2 valueForKey:@"x"] intValue];
    float spawnPointPlayer2Y = [[spawnPointPlayer2 valueForKey:@"y"] intValue];
    [self addSecondPlayer: spawnPointPlayer2X y: spawnPointPlayer2Y];
    */
    
    //Add hidgon enemies at their spawn points
    NSMutableDictionary *hidgonSpawnPointDictionary;
    for (hidgonSpawnPointDictionary in [objectsGroup objects]) {
        if ([[hidgonSpawnPointDictionary valueForKey:@"hidgonSpawnPoint"] intValue] != 0) {
            
            //Determine if Hidgon is a boss enemy
            if ([[hidgonSpawnPointDictionary valueForKey:@"isBoss"] isEqualToString:@"YES"]) {
                
                helloWorldIsBoss = YES;
                helloWorldHitPoints = 3;
            }
            
            else {
                
                helloWorldIsBoss = NO;
                helloWorldHitPoints = 0;
            }
            
            float hidgonSpawnPointX = [[hidgonSpawnPointDictionary valueForKey:@"x"] intValue];
            float hidgonSpawnPointY = [[hidgonSpawnPointDictionary valueForKey:@"y"] intValue];
            [self addHidgonEnemySprite: hidgonSpawnPointX y: hidgonSpawnPointY];
        }
    }
    
    NSMutableDictionary *parkourJumperSpawnPointDictionary;
    for (parkourJumperSpawnPointDictionary in [objectsGroup objects]) {
        if ([[parkourJumperSpawnPointDictionary valueForKey:@"parkourJumperSpawnPoint"] intValue] != 0) {
            
            //Determine if Hidgon is a boss enemy
            if ([[parkourJumperSpawnPointDictionary valueForKey:@"isBoss"] isEqualToString:@"YES"]) {
                
                helloWorldIsBoss = YES;
                helloWorldHitPoints = 3;
            }
            
            else {
                
                helloWorldIsBoss = NO;
                helloWorldHitPoints = 0;
            }
            
            float parkourJumperSpawnPointX = [[parkourJumperSpawnPointDictionary valueForKey:@"x"] intValue];
            float parkourJumperSpawnPointY = [[parkourJumperSpawnPointDictionary valueForKey:@"y"] intValue];
            [self addParkourJumperSprite: parkourJumperSpawnPointX y: parkourJumperSpawnPointY];
        }
    }
    
    //Add SkeletonWhale enemies at their spawn points
    NSMutableDictionary *skeletonWhaleSpawnPointDictionary;
    for (skeletonWhaleSpawnPointDictionary in [objectsGroup objects]) {
        if ([[skeletonWhaleSpawnPointDictionary valueForKey:@"skeletonWhaleSpawnPoint"] intValue] != 0) {
            
            //Determine if Hidgon is a boss enemy
            if ([[skeletonWhaleSpawnPointDictionary valueForKey:@"isBoss"] isEqualToString:@"YES"]) {
                
                helloWorldIsBoss = YES;
                helloWorldHitPoints = 3;
            }
            
            else {
                
                helloWorldIsBoss = NO;
                helloWorldHitPoints = 0;
            }
            
            float skeletonWhaleSpawnPointX = [[skeletonWhaleSpawnPointDictionary valueForKey:@"x"] intValue];
            float skeletonWhaleSpawnPointY = [[skeletonWhaleSpawnPointDictionary valueForKey:@"y"] intValue];
            [self addSkeletonWhaleEnemySprite: skeletonWhaleSpawnPointX y: skeletonWhaleSpawnPointY];
        }
    }

    
    //Add fly-through-walls diagonal flyer enemies at their spawn points
    NSMutableDictionary *flyThroughWallsDiagonalFlyerSpawnPointDictionary;
    for (flyThroughWallsDiagonalFlyerSpawnPointDictionary in [objectsGroup objects]) {
        if ([[flyThroughWallsDiagonalFlyerSpawnPointDictionary valueForKey:@"flyThroughWallsDiagonalFlyerSpawnPoint"] intValue] != 0) {
            
            //Determine if Chaser is a boss enemy
            if ([[flyThroughWallsDiagonalFlyerSpawnPointDictionary valueForKey:@"isBoss"] isEqualToString:@"YES"]) {
                
                helloWorldIsBoss = YES;
                helloWorldHitPoints = 3;
            }
            
            else {
                
                helloWorldIsBoss = NO;
                helloWorldHitPoints = 0;
            }
            
            float flyThroughWallsDiagonalFlyerSpawnPointX = [[flyThroughWallsDiagonalFlyerSpawnPointDictionary valueForKey:@"x"] intValue];
            float flyThroughWallsDiagonalFlyerSpawnPointY = [[flyThroughWallsDiagonalFlyerSpawnPointDictionary valueForKey:@"y"] intValue];
            [self addFlyThroughWallsDiagonalFlyerEnemySprite: flyThroughWallsDiagonalFlyerSpawnPointX y: flyThroughWallsDiagonalFlyerSpawnPointY];
        }
    }
    
    
    //Add SkeletonWhale enemies at their spawn points
    NSMutableDictionary *diagonalFlyerSpawnPointDictionary;
    for (diagonalFlyerSpawnPointDictionary in [objectsGroup objects]) {
        if ([[diagonalFlyerSpawnPointDictionary valueForKey:@"diagonalFlyerSpawnPoint"] intValue] != 0) {
            
            float diagonalFlyerSpawnPointX = [[diagonalFlyerSpawnPointDictionary valueForKey:@"x"] intValue];
            float diagonalFlyerSpawnPointY = [[diagonalFlyerSpawnPointDictionary valueForKey:@"y"] intValue];
            [self addDiagonalFlyerEnemySprite: diagonalFlyerSpawnPointX y: diagonalFlyerSpawnPointY];
        }
    }
    
    //Add runningChaser enemies at their spawn points
    NSMutableDictionary *runningChaserEnemySpawnPointDictionary;
    for (runningChaserEnemySpawnPointDictionary in [objectsGroup objects]) {
        if ([[runningChaserEnemySpawnPointDictionary valueForKey:@"runningChaserEnemySpawnPoint"] intValue] != 0) {
            
            //Determine if Chaser is a boss enemy
            if ([[runningChaserEnemySpawnPointDictionary valueForKey:@"isBoss"] isEqualToString:@"YES"]) {
                
                helloWorldIsBoss = YES;
                helloWorldHitPoints = 3;
            }
            
            else {
                
                helloWorldIsBoss = NO;
                helloWorldHitPoints = 0;
            }
            
            float runningChaserEnemySpawnPointX = [[runningChaserEnemySpawnPointDictionary valueForKey:@"x"] intValue];
            float runningChaserEnemySpawnPointY = [[runningChaserEnemySpawnPointDictionary valueForKey:@"y"] intValue];
            [self addRunningChaserEnemySprite: runningChaserEnemySpawnPointX y: runningChaserEnemySpawnPointY];

            if ([[runningChaserEnemySpawnPointDictionary valueForKey:@"WalkRightFirst"] isEqualToString:@"NO"]) {
                
                helloWorldChaserWalkingRight = YES;
                helloWorldChaserWalkingLeft = NO;
                
          //      runningChaserEnemy.runningChaserEnemyWalkingLeft = YES;
          //      runningChaserEnemy.runningChaserEnemyWalkingRight = NO;
            }
            
            else if ([[runningChaserEnemySpawnPointDictionary valueForKey:@"WalkRightFirst"] isEqualToString:@"YES"]) {
                
                helloWorldChaserWalkingLeft = YES;
                helloWorldChaserWalkingLeft = NO;
                
            //    runningChaserEnemy.runningChaserEnemyWalkingLeft = NO;
            //    runningChaserEnemy.runningChaserEnemyWalkingRight = YES;
            }
            
            else {
                
                helloWorldChaserWalkingRight = YES;
                helloWorldChaserWalkingLeft = NO;
                
            //    runningChaserEnemy.runningChaserEnemyWalkingLeft = NO;
            //    runningChaserEnemy.runningChaserEnemyWalkingRight = YES;
            }
        }
    }
    
    //Add DownwardShooter enemies at their spawn points
    NSMutableDictionary *downwardShooterEnemySpawnPointDictionary;
    for (downwardShooterEnemySpawnPointDictionary in [objectsGroup objects]) {
        if ([[downwardShooterEnemySpawnPointDictionary valueForKey:@"downwardShooterEnemySpawnPoint"] intValue] != 0) {
            
            float downwardShooterEnemySpawnPointX = [[downwardShooterEnemySpawnPointDictionary valueForKey:@"x"] intValue];
            float downwardShooterEnemySpawnPointY = [[downwardShooterEnemySpawnPointDictionary valueForKey:@"y"] intValue];
            [self addDownwardShooterEnemySprite: downwardShooterEnemySpawnPointX y: downwardShooterEnemySpawnPointY];
            
            if ([[downwardShooterEnemySpawnPointDictionary valueForKey:@"WalkRightFirst"] isEqualToString:@"NO"]) {
                
                downwardShooterEnemy.downwardShooterEnemyWalkingLeft = YES;
                downwardShooterEnemy.downwardShooterEnemyWalkingRight = NO;
            }
            
            else if ([[downwardShooterEnemySpawnPointDictionary valueForKey:@"WalkRightFirst"] isEqualToString:@"YES"]) {
                
                downwardShooterEnemy.downwardShooterEnemyWalkingLeft = NO;
                downwardShooterEnemy.downwardShooterEnemyWalkingRight = YES;
            }
            
            else {
                
                downwardShooterEnemy.downwardShooterEnemyWalkingLeft = NO;
                downwardShooterEnemy.downwardShooterEnemyWalkingRight = YES;
            }
        }
    }

    /*
    //Add moving door at their spawn points
    NSMutableDictionary *movingDoorSpawnPointPolygon;
    for (movingDoorSpawnPointPolygon in [objectsGroup objects]) {
        if ([[movingDoorSpawnPointPolygon valueForKey:@"movingDoorSpawnPointPolygon"] intValue] != 0) {
                        
            for(id key in movingDoorSpawnPointPolygon)
                if ([[movingDoorSpawnPointPolygon objectForKey:@"movingDoorSpawnPointPolygon"] isEqualToString:@"polygonPoints"])
                    NSLog(@"key=%@ value=%@", key, [movingDoorSpawnPointPolygon objectForKey:@"polygonPoints"]);
        }
    }
    */
    //Add moving door at their spawn points
    NSMutableDictionary *movingDoorSpawnPointDictionary;
    for (movingDoorSpawnPointDictionary in [objectsGroup objects]) {
        if ([[movingDoorSpawnPointDictionary valueForKey:@"movingDoorSpawnPoint"] intValue] != 0) {
            
            float movingDoorSpawnPointX = [[movingDoorSpawnPointDictionary valueForKey:@"x"] intValue];
            float movingDoorSpawnPointY = [[movingDoorSpawnPointDictionary valueForKey:@"y"] intValue];
            
            [self addMovingDoorSprite: movingDoorSpawnPointX y: movingDoorSpawnPointY];

            
            //Set Door Color
            if ([[movingDoorSpawnPointDictionary valueForKey:@"DoorColor"] isEqualToString:@"GREEN"]) {
                
                movingDoor.doorColor = GREEN_DOOR;
                movingDoor.mySprite.color = ccGREEN;
            }
            
            else if ([[movingDoorSpawnPointDictionary valueForKey:@"DoorColor"] isEqualToString:@"RED"]) {
                
                movingDoor.doorColor = RED_DOOR;
                movingDoor.mySprite.color = ccRED;
            }
            
            else if ([[movingDoorSpawnPointDictionary valueForKey:@"DoorColor"] isEqualToString:@"BLUE"]) {
                
                movingDoor.doorColor = BLUE_DOOR;
                movingDoor.mySprite.color = ccBLUE;
            }
            
            //Set Door Width and Height
            int widthInTileUnits = [[movingDoorSpawnPointDictionary valueForKey:@"widthInTileUnits"] intValue];
            int heightInTileUnits = [[movingDoorSpawnPointDictionary valueForKey:@"heightInTileUnits"] intValue];
            movingDoor.mySprite.scaleX = 0.2*widthInTileUnits;
            movingDoor.mySprite.scaleY = 0.2*heightInTileUnits;            
        }
    }
    
    //Add moving door at their spawn points
    NSMutableDictionary *inGameButtonSpawnPointDictionary;
    for (inGameButtonSpawnPointDictionary in [objectsGroup objects]) {
        if ([[inGameButtonSpawnPointDictionary valueForKey:@"InGameButtonSpawnPoint"] intValue] != 0) {
            
            float inGameButtonSpawnPointX = [[inGameButtonSpawnPointDictionary valueForKey:@"x"] intValue];
            float inGameButtonSpawnPointY = [[inGameButtonSpawnPointDictionary valueForKey:@"y"] intValue];
            [self addInGameButtonSprite: inGameButtonSpawnPointX y: inGameButtonSpawnPointY];
            
            //Set Door Color
            if ([[inGameButtonSpawnPointDictionary valueForKey:@"ButtonColor"] isEqualToString:@"GREEN"]) {
                
                inGameButton.buttonColor = GREEN_DOOR;
                inGameButton.mySprite.color = ccGREEN;
            }
            
            else if ([[inGameButtonSpawnPointDictionary valueForKey:@"ButtonColor"] isEqualToString:@"RED"]) {
                
                inGameButton.buttonColor = RED_DOOR;
                inGameButton.mySprite.color = ccRED;
            }
            
            else if ([[inGameButtonSpawnPointDictionary valueForKey:@"ButtonColor"] isEqualToString:@"BLUE"]) {
                
                inGameButton.buttonColor = BLUE_DOOR;
                inGameButton.mySprite.color = ccBLUE;
            }
            
            //Set whether button makes doors go up/down or left/right
            if ([[inGameButtonSpawnPointDictionary valueForKey:@"LeftAndRightButton"] isEqualToString:@"YES"]) {
                
                inGameButton.leftAndRightButton = YES;
                inGameButton.upAndDownButton = NO;
            }
            
            if ([[inGameButtonSpawnPointDictionary valueForKey:@"UpAndDownButton"] isEqualToString:@"YES"]) {
                
                inGameButton.leftAndRightButton = NO;
                inGameButton.upAndDownButton = YES;
            }
        }
    }
    /*
    if (!isSinglePlayer && isPlayer1) {
    
        increaseTimerAction = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFunc actionWithTarget:self selector:@selector(increaseTimer)], nil]]];
    }
    */
    levelInSession = YES;
}

-(void) spawnEnemiesAtRandomSpawnPointForBossLevel
{    
    NSMutableDictionary *bossEnemySpawnPointDictionary;
    int totalNumberOfEnemySpawnPoints = 0;
    BOOL levelContainsRandomBossEnemySpawnPoints = NO;
    
    if (!isPaused) {
        
        for (bossEnemySpawnPointDictionary in [objectsGroup objects]) {
            if ([[bossEnemySpawnPointDictionary valueForKey:@"randomBossEnemySpawnPoint"] intValue] > 0) {
                
                levelContainsRandomBossEnemySpawnPoints = YES;
            }
        }
    }
    
    
    if (!isPaused && levelContainsRandomBossEnemySpawnPoints && enemiesLeftValue > 0 && [enemySpritesArray count] < totalNumberOfEnemiesForCurrentBossLevel) {
        
        for (bossEnemySpawnPointDictionary in [objectsGroup objects]) {

            if ([[bossEnemySpawnPointDictionary allKeysForObject:@"randomBossEnemySpawnPoint"] count] > 0) {

                totalNumberOfEnemySpawnPoints = totalNumberOfEnemySpawnPoints + 1;
            }
        }
        
        int randomNumber = 0;
        
        while (randomNumber == 0 || randomNumber == bossLevelLastEnemySpawnPointUsed) {
        
            randomNumber = arc4random()%totalNumberOfEnemySpawnPoints;
        }
        
        bossLevelLastEnemySpawnPointUsed = randomNumber;
        
        for (bossEnemySpawnPointDictionary in [objectsGroup objects]) {
            if ([[bossEnemySpawnPointDictionary valueForKey:@"randomBossEnemySpawnPoint"] intValue] == randomNumber) {
           
                float bossEnemySpawnPointX = [[bossEnemySpawnPointDictionary valueForKey:@"x"] intValue];
                float bossEnemySpawnPointY = [[bossEnemySpawnPointDictionary valueForKey:@"y"] intValue];
                
                //White teleportation sphere animation for enemy teleportation
                whiteTeleportationSphere = [CCSprite spriteWithFile: @"WhiteCircle.png"];
                whiteTeleportationSphere.position = ccp(bossEnemySpawnPointX, bossEnemySpawnPointY);
                [gameLayer addChild: whiteTeleportationSphere z: 50];
                [whiteTeleportationSphere runAction: [CCFadeOut actionWithDuration:0.0]];
                
                //Scale to tiny dot, grow over 1 second, FadeOut over 1 second, remove and clean up.
                [whiteTeleportationSphere runAction: [CCSequence actions: [CCFadeIn actionWithDuration:0.0], [CCScaleTo actionWithDuration:0.0 scale:0.01], [CCScaleTo actionWithDuration:1.5 scale:1.0], [CCDelayTime actionWithDuration:1.0], [CCFadeOut actionWithDuration:2.0], [CCCallFuncND actionWithTarget:whiteTeleportationSphere selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];

                
                BOOL gunnerSpawnsHere = NO;
                BOOL chaserSpawnsHere = NO;
                BOOL jetmanSpawnsHere = NO;
                BOOL diagonalFlyerSpawnsHere = NO;
                BOOL flyThroughWallsDiagonalFlyerSpawnsHere = NO;
                BOOL saucerSpawnsHere = NO;
                BOOL ninjaSpawnsHere = NO;
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"gunnerSpawnsHere"] intValue] != 0) {
                    
                    gunnerSpawnsHere = YES;
                }
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"chaserSpawnsHere"] intValue] != 0) {
                    
                    chaserSpawnsHere = YES;
                }
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"jetmanSpawnsHere"] intValue] != 0) {
                    
                    jetmanSpawnsHere = YES;
                }
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"diagonalFlyerSpawnsHere"] intValue] != 0) {
                    
                    diagonalFlyerSpawnsHere = YES;
                }
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"flyThroughWallsDiagonalFlyerSpawnsHere"] intValue] != 0) {
                    
                    flyThroughWallsDiagonalFlyerSpawnsHere = YES;
                }
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"saucerSpawnsHere"] intValue] != 0) {
                    
                    saucerSpawnsHere = YES;
                }
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"ninjaSpawnsHere"] intValue] != 0) {
                    
                    ninjaSpawnsHere = YES;
                }
                
                NSLog (@"gunnerSpawnsHere = %i", gunnerSpawnsHere);
                NSLog (@"chaserSpawnsHere = %i", chaserSpawnsHere);
                NSLog (@"jetmanSpawnsHere = %i", jetmanSpawnsHere);
                NSLog (@"diagonalFlyerSpawnsHere = %i", diagonalFlyerSpawnsHere);
                NSLog (@"flyThroughWallsDiagonalFlyerSpawnsHere = %i", flyThroughWallsDiagonalFlyerSpawnsHere);
                NSLog (@"saucerSpawnsHere = %i", saucerSpawnsHere);
                NSLog (@"ninjaSpawnsHere = %i", ninjaSpawnsHere);

                
                BOOL enemyHasSpawned = NO;
                
                while (enemyHasSpawned == NO) {
                    
                    int randomEnemy = arc4random()%7;
                    
                    NSLog (@"enemyHasSpawned = %i", enemyHasSpawned);
                    NSLog (@"randomEnemy = %i", randomEnemy);
                    
                    if (randomEnemy == 0 && gunnerSpawnsHere) {
                        
                        enemyHasSpawned = YES;
                        
                        [self addHidgonEnemySprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];
                    }
                    
                    else if (randomEnemy == 1 && diagonalFlyerSpawnsHere) {
                        
                        enemyHasSpawned = YES;
                        
                        [self addDiagonalFlyerEnemySprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];                        
                    }
                    
                    else if (randomEnemy == 2 && ninjaSpawnsHere) {
                        
                        enemyHasSpawned = YES;
                        
                        [self addParkourJumperSprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];
                    }
                    
                    else if (randomEnemy == 3 && flyThroughWallsDiagonalFlyerSpawnsHere) {
                        
                        enemyHasSpawned = YES;
                        
                        [self addFlyThroughWallsDiagonalFlyerEnemySprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];                        
                    }
                    
                    else if (randomEnemy == 4 && saucerSpawnsHere) {
                        
                        enemyHasSpawned = YES;
                        
                        [self addDownwardShooterEnemySprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];
                    }
                    
                    else if (randomEnemy == 5 && jetmanSpawnsHere) {
                        
                        enemyHasSpawned = YES;
                        
                        [self addSkeletonWhaleEnemySprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];
                    }
                    
                    else if (randomEnemy == 6 && chaserSpawnsHere) {
                        
                        enemyHasSpawned = YES;
                        
                        [self addRunningChaserEnemySprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];                        
                    }
                }
            }
        }
    }
}


-(void) createPowerUpAtRandomLocation
{
    //Choose one of the designated power-up spawn points on the map and create the pop-up there.
    if (powerUpAlreadyExists == NO && powerUpAlreadyAppearedInThisLevel == NO && progressToNextLevelAlreadyRunning == NO) {
        
        int randomNumber = arc4random()%6;
        
        NSMutableDictionary *powerUpsSpawnPointDictionary;
        for (powerUpsSpawnPointDictionary in [objectsGroup objects]) {
            if ([[powerUpsSpawnPointDictionary valueForKey:@"PowerUpSpawnPoint"] intValue] == randomNumber) {
                
                inGamePowerUpSpawnPointPositionInteger = randomNumber;
                
                if (isSinglePlayer) {
                
                    float powerUpSpawnPointX = [[powerUpsSpawnPointDictionary valueForKey:@"x"] intValue];
                    float powerUpSpawnPointY = [[powerUpsSpawnPointDictionary valueForKey:@"y"] intValue];
                    [self addPowerUpSprite: powerUpSpawnPointX y: powerUpSpawnPointY];

                    return;
                }
                
                else if (!isSinglePlayer && isPlayer1) {
                    
                    float powerUpSpawnPointX = [[powerUpsSpawnPointDictionary valueForKey:@"x"] intValue];
                    float powerUpSpawnPointY = [[powerUpsSpawnPointDictionary valueForKey:@"y"] intValue];
                    [self addPowerUpSprite: powerUpSpawnPointX y: powerUpSpawnPointY];
                    
                    //Send message to second player indicating where the powerup was created
                    [self sendInGamePowerUpPosition];
                    
                    return;
                }
            }
        }
    }
}

-(void) makeRecentlyCreatedTilesCollidable
{
    foreground = [tileMap layerNamed: @"bricks"];
    solidBricks = [tileMap layerNamed: @"solidbricks"];
}

-(void) setProgressToNextLevelAlreadyRunningToNo {
    
    progressToNextLevelAlreadyRunning = NO;
}

-(void) playMoneyReceivedSound
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"MoneyReceivedSound.wav"];
}

-(void) kamcordStopRecordingAndShowView
{
    [Kamcord stopRecording];
    [Kamcord showView];
}

-(void) displayAllVictoryScreenInformationImmediately
{
    //Make saveVideoButton visible immediately
    saveVideoButton.visible = YES;
    
    int randomNumber = arc4random()%2;
    
    if (randomNumber == 0) {
        
        [AdColony playVideoAdForZone:@"vz1d03f5640811499e884b62" withDelegate:self withV4VCPrePopup:YES andV4VCPostPopup:YES];
    }
    
    else {
        
        [cb showInterstitial];
    }
    
    for (Enemy *enemies in enemySpritesArray) {
        
        enemies.visible = NO;
    }
    for (PowerUps *powerUp in powerUpsArray) {
        
        powerUp.visible = NO;
    }
    [gameLayer removeAllChildrenWithCleanup: YES];
    
    //Make blackLayer fade in, move player's z-layer higer than black layer, and have him holding up boxing glove
    blackLayerForPauseScreen.visible = YES;
    [blackLayerForPauseScreen stopAllActions];
    [blackLayerForPauseScreen runAction: [CCFadeIn actionWithDuration: 0.0]];
    
    timeBomb.visible = NO;
    
    [self stopAllActions];
    
    //tapToContinueLabel.visible = YES and flashing
    [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration: 0.0], [CCCallFunc actionWithTarget:self selector:@selector(setTapToContinueLabelToVisible)], nil]];
    
    tapToContinueLabel.scale = 0.7;
    tapToContinueLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 190);
    [tapToContinueLabel runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.75], [CCFadeOut actionWithDuration:0.0], [CCDelayTime actionWithDuration:0.75], [CCFadeIn actionWithDuration:0.0], nil]]];
    
    //Move player front and center
    if (!firstPlayerHasSneakers) {
        [mainCharacterBlueBoyHoldingUpBoxingGlove stopAllActions];
        [mainCharacterBlueBoyHoldingUpBoxingGlove runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCMoveTo actionWithDuration:0.0 position:ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 120)], nil]];
        [mainCharacterBlueBoyHoldingUpBoxingGlove setZOrder: 3000];
    }
    else if (firstPlayerHasSneakers) {
        [mainCharacterBlueBoyWalkingWithSneakers stopAllActions];
        [mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCMoveTo actionWithDuration:0.0 position:ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 120)], nil]];
        [mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers setZOrder: 3000];
    }
    
    
    
    //Display Number of Stars Collected and Subsequent currency gained as a result
    if (numberOfStarsCollected == 0) {
        
        tryHarderLabel.visible = YES;
        tryHarderLabel.scale = 1.3;
        tryHarderLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 120);
        [tryHarderLabel runAction: [CCFadeOut actionWithDuration:0.0]];
        
        star1.scale = 1.4;
        star1.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 40);
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star1 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        star2.scale = 1.4;
        [star2 runAction: [CCFadeIn actionWithDuration:0.0]];
        star2.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star2 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        star3.scale = 1.4;
        star3.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star3 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        [tryHarderLabel runAction: [CCFadeIn actionWithDuration:0.0]];
    }
    
    else if (numberOfStarsCollected == 1) {
        
        notBadLabel.visible = YES;
        notBadLabel.scale = 1.3;
        notBadLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 120);
        [notBadLabel runAction: [CCFadeOut actionWithDuration:0.0]];
        
        star1.scale = 1.0;
        star1.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 40);
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star1 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        star2.scale = 1.0;
        //star2.position = ccp(0, -50);
        star2.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star2 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        star3.scale = 1.0;
        //star3.position = ccp(50, -50);
        star3.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star3 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        [notBadLabel runAction: [CCFadeIn actionWithDuration:0.0]];
    }
    
    else if (numberOfStarsCollected == 2) {
        
        goodLabel.visible = YES;
        goodLabel.scale = 1.3;
        goodLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 120);
        [goodLabel runAction: [CCFadeOut actionWithDuration:0.0]];
        
        star1.scale = 1.0;
        star1.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 40);
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star1 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        star2.scale = 1.0;
        //star2.position = ccp(0, -50);
        star2.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star2 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        star3.scale = 1.0;
        //star3.position = ccp(50, -50);
        star3.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star3 selector:@selector(setVisible:) data:(void*)YES], nil]];

        [goodLabel runAction: [CCFadeIn actionWithDuration:0.0]];
    }
    
    else if (numberOfStarsCollected == 3) {
        
        youreAwesomeLabel.visible = YES;
        youreAwesomeLabel.scale = 1.3;
        youreAwesomeLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 120);
        [youreAwesomeLabel runAction: [CCFadeOut actionWithDuration:0.0]];
        
        star1.scale = 1.0;
        star1.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 40);
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star1 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        star2.scale = 1.0;
        //star2.position = ccp(0, -50);
        star2.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star2 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        star3.scale = 1.0;
        //star3.position = ccp(50, -50);
        star3.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star3 selector:@selector(setVisible:) data:(void*)YES], nil]];

        [youreAwesomeLabel runAction: [CCFadeIn actionWithDuration:0.0]];
    }
}

-(void) progressToVictoryScreen
{
    NSLog (@"progressToVictoryScreen");
    
    [self stopAllActions];
    [self updateAllCurrencyRelatedLabels];
    
    firstPlayerSpritePostionAtVictory = firstPlayerSprite.position;
    
    if (currentLevel == 10) {
        
        if (timeInt <= BOSS_LEVEL_10_ONE_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 1;
        }
        
        if (timeInt <= BOSS_LEVEL_10_TWO_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 2;
        }
        
        if (timeInt <= BOSS_LEVEL_10_THREE_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 3;
        }
    }
    
    else if (currentLevel == 20) {
        
        if (timeInt <= BOSS_LEVEL_20_ONE_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 1;
        }
        
        if (timeInt <= BOSS_LEVEL_20_TWO_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 2;
        }
        
        if (timeInt <= BOSS_LEVEL_20_THREE_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 3;
        }
    }
    
    else if (currentLevel == 30) {
        
        if (timeInt <= BOSS_LEVEL_30_ONE_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 1;
        }
        
        if (timeInt <= BOSS_LEVEL_30_TWO_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 2;
        }
        
        if (timeInt <= BOSS_LEVEL_30_THREE_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 3;
        }
    }
    
    else if (currentLevel == 40) {
        
        if (timeInt <= BOSS_LEVEL_40_ONE_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 1;
        }
        
        if (timeInt <= BOSS_LEVEL_40_TWO_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 2;
        }
        
        if (timeInt <= BOSS_LEVEL_40_THREE_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 3;
        }
    }
    
    else if (currentLevel == 50) {
        
        if (timeInt <= BOSS_LEVEL_50_ONE_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 1;
        }
        
        if (timeInt <= BOSS_LEVEL_50_TWO_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 2;
        }
        
        if (timeInt <= BOSS_LEVEL_50_THREE_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 3;
        }
    }
    
    else if (currentLevel == 60) {
        
        if (timeInt <= BOSS_LEVEL_60_ONE_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 1;
        }
        
        if (timeInt <= BOSS_LEVEL_60_TWO_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 2;
        }
        
        if (timeInt <= BOSS_LEVEL_60_THREE_STAR_TIME_LIMIT) {
            
            numberOfStarsCollected = 3;
        }
    }
    
    if (currentScreen == GAME_OVER_SCREEN) {
        
        saveVideoButton.visible = NO;
    }
    
    currentScreen = VICTORY_SCREEN;
    
    if (deviceIsIpad) {
        
        self.position = ccp(0, 0);
    }
    
    //Stop Music on victory screen, this is so that you can watch your Kamcord videos without
    if (!isBossLevel) {
        
        [gameMusic stopBackgroundMusic];
        gameMusicAlreadyPlaying = NO;
    }
    
    else if (isBossLevel) {
        
        [bossMusic stopBackgroundMusic];
        gameMusicAlreadyPlaying = NO;
    }
    
    
    //Stop recording after 1.5 seconds and show view
  //  [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration:3.0], [CCCallFunc actionWithTarget:self selector:@selector(kamcordStopRecordingAndShowView)], nil]];
    
//  [gameMusic playBackgroundMusic:@"GameMusic.m4a" loop:YES];

    
    //Write the number of achieved stars in the level to prefs
    [prefs setInteger:numberOfStarsCollected forKey: [NSString stringWithFormat: @"menuItem%iNumberOfStarsAchievedForSaveSlot%i", currentLevel, currentSaveSlot]];

    
    powerUpAlreadyExists = NO;
    
    CGPoint firstPlayerCurrentPosition = firstPlayerSprite.position;
    
    totalBlackLayerFadeInTime = 1.25;
    mainCharacterScaleUpTime = 0.75;
    totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime = totalBlackLayerFadeInTime + mainCharacterScaleUpTime;
    
    //Make blackLayer fade in, move player's z-layer higer than black layer, and have him holding up boxing glove
    blackLayerForPauseScreen.visible = YES;
    [blackLayerForPauseScreen runAction: [CCFadeIn actionWithDuration: totalBlackLayerFadeInTime]];
    
    //Move player front and center
    if (!firstPlayerHasSneakers) {
        [mainCharacterBlueBoyHoldingUpBoxingGlove runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTime], [CCMoveTo actionWithDuration:mainCharacterScaleUpTime position:ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 120)], nil]];
        [mainCharacterBlueBoyHoldingUpBoxingGlove setZOrder: 3000];
    }
    else if (firstPlayerHasSneakers) {
        
        [mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTime], [CCMoveTo actionWithDuration:mainCharacterScaleUpTime position:ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 120)], nil]];
        [mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers setZOrder: 3000];
    }

  
    
    if (firstPlayerHasSneakers == NO) {
        
        //Have main player hold the Boxing Glove icon over his head and pause the game for a second.
        mainCharacterBlueBoyStandingStill.visible = NO;
        mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
        mainCharacterBlueBoyJumping.visible = NO;
        mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
        mainCharacterBlueBoyWalking.visible = NO;
        mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
        mainCharacterBlueBoyDead.visible = NO;
        mainCharacterBlueBoyHoldingUpBoxingGlove.visible = YES;
    }
    
    if (firstPlayerHasSneakers == YES) {
        
        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = YES;
        mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
        mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = NO;
        mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
        mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
        mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
        mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
        mainCharacterBlueBoyDeadWithSneakers.visible = NO;
    }
        
    //Script out the progressive granting of stars, along with sound bytes appropriate for each.  Allow for ability to click to skip script.
        //Show all 3 stars but faded out to almost not being visible
    if (numberOfStarsCollected == 0) {
        
        [tryHarderLabel runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:tryHarderLabel selector:@selector(setVisible:) data:(void*)YES], nil]];
        tryHarderLabel.scale = 1.3;
        tryHarderLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 120);
        [tryHarderLabel runAction: [CCFadeOut actionWithDuration:0.0]];
       
        star1.scale = 1.0;
        star1.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 40);
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star1 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        star2.scale = 1.0;
        star2.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star2 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        star3.scale = 1.0;
        star3.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star3 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        
        [tryHarderLabel runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 0.5], [CCFadeIn actionWithDuration:0.0], nil]];
        
        [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration: totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 0.5], [CCCallFunc actionWithTarget:self selector:@selector(setTapToContinueLabelToVisible)], nil]];
        [saveVideoButton runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 0.5], [CCCallFuncND actionWithTarget:saveVideoButton selector:@selector(setVisible:) data:(void*)YES], nil]];

        tapToContinueLabel.scale = 0.7;
        tapToContinueLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 190);
        [tapToContinueLabel runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.75], [CCFadeOut actionWithDuration:0.0], [CCDelayTime actionWithDuration:0.75], [CCFadeIn actionWithDuration:0.0], nil]]];
    }
    
    else if (numberOfStarsCollected == 1) {
        
        [notBadLabel runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:notBadLabel selector:@selector(setVisible:) data:(void*)YES], nil]];
        notBadLabel.scale = 1.3;
        notBadLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 120);
        [notBadLabel runAction: [CCFadeOut actionWithDuration:0.0]];
        
        star1.scale = 1.0;
        star1.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 40);
        [star1 runAction: [CCFadeTo actionWithDuration:0.0 opacity:35]];
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star1 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        star2.scale = 1.0;
        star2.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star2 runAction: [CCFadeTo actionWithDuration:0.0 opacity:35]];
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star2 selector:@selector(setVisible:) data:(void*)YES], nil]];

        
        star3.scale = 1.0;
        star3.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star3 runAction: [CCFadeTo actionWithDuration:0.0 opacity:35]];
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star3 selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 0.5], [CCFadeTo actionWithDuration:0.0 opacity:255], nil]];
        [notBadLabel runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 1.0], [CCFadeIn actionWithDuration:0.0], nil]];
        
        [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration: totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 1.0], [CCCallFunc actionWithTarget:self selector:@selector(setTapToContinueLabelToVisible)], nil]];
        [saveVideoButton runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 1.0], [CCCallFuncND actionWithTarget:saveVideoButton selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        tapToContinueLabel.scale = 0.7;
        tapToContinueLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 190);
        [tapToContinueLabel runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.75], [CCFadeOut actionWithDuration:0.0], [CCDelayTime actionWithDuration:0.75], [CCFadeIn actionWithDuration:0.0], nil]]];
    }
    
    else if (numberOfStarsCollected == 2) {
        
        goodLabel.scale = 1.3;
        goodLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 120);
        [goodLabel runAction: [CCFadeOut actionWithDuration:0.0]];
        [goodLabel runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:goodLabel selector:@selector(setVisible:) data:(void*)YES], nil]];

        
        star1.scale = 1.0;
        star1.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 40);
        [star1 runAction: [CCFadeTo actionWithDuration:0.0 opacity:35]];
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star1 selector:@selector(setVisible:) data:(void*)YES], nil]];

        
        star2.scale = 1.0;
        star2.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star2 runAction: [CCFadeTo actionWithDuration:0.0 opacity:35]];
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star2 selector:@selector(setVisible:) data:(void*)YES], nil]];

        
        star3.scale = 1.0;
        star3.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star3 runAction: [CCFadeTo actionWithDuration:0.0 opacity:35]];
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star3 selector:@selector(setVisible:) data:(void*)YES], nil]];

        
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 0.5], [CCFadeTo actionWithDuration:0.0 opacity:255], nil]];
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 1.0], [CCFadeTo actionWithDuration:0.0 opacity:255], nil]];
        [goodLabel runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 1.5], [CCFadeIn actionWithDuration:0.0], nil]];
        
        [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration: totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 1.5], [CCCallFunc actionWithTarget:self selector:@selector(setTapToContinueLabelToVisible)], nil]];
        [saveVideoButton runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 1.5], [CCCallFuncND actionWithTarget:saveVideoButton selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        tapToContinueLabel.scale = 0.7;
        tapToContinueLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 190);
        [tapToContinueLabel runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.75], [CCFadeOut actionWithDuration:0.0], [CCDelayTime actionWithDuration:0.75], [CCFadeIn actionWithDuration:0.0], nil]]];
    }
    
    else if (numberOfStarsCollected == 3) {
        
        youreAwesomeLabel.scale = 1.3;
        youreAwesomeLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 120);
        [youreAwesomeLabel runAction: [CCFadeOut actionWithDuration:0.0]];
        [youreAwesomeLabel runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:youreAwesomeLabel selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        star1.scale = 1.0;
        star1.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 40);
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star1 selector:@selector(setVisible:) data:(void*)YES], nil]];

        
        star2.scale = 1.0;
        star2.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star2 selector:@selector(setVisible:) data:(void*)YES], nil]];

        
        star3.scale = 1.0;
        star3.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 125, [[CCDirector sharedDirector] winSize].height/2 + 30);
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.0], [CCFadeTo actionWithDuration:0.0 opacity:35], nil]];
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFuncND actionWithTarget:star3 selector:@selector(setVisible:) data:(void*)YES], nil]];

        
        [star1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 0.5], [CCFadeTo actionWithDuration:0.0 opacity:255], nil]];
        [star2 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 1.0], [CCFadeTo actionWithDuration:0.0 opacity:255], nil]];
        [star3 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 1.5], [CCFadeTo actionWithDuration:0.0 opacity:255], nil]];
        [youreAwesomeLabel runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 2.0], [CCFadeIn actionWithDuration:0.0], nil]];
        
        [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration: totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 2.0], [CCCallFunc actionWithTarget:self selector:@selector(setTapToContinueLabelToVisible)], nil]];
        [saveVideoButton runAction: [CCSequence actions: [CCDelayTime actionWithDuration:totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime + 2.0], [CCCallFuncND actionWithTarget:saveVideoButton selector:@selector(setVisible:) data:(void*)YES], nil]];
        
        tapToContinueLabel.scale = 0.7;
        tapToContinueLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 190);
        [tapToContinueLabel runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.75], [CCFadeOut actionWithDuration:0.0], [CCDelayTime actionWithDuration:0.75], [CCFadeIn actionWithDuration:0.0], nil]]];
    }
    
    
    
    if (madAgentsAmount >= 1) {
        
        madAgentsAmount = 0;
        [fastGameMusic stopBackgroundMusic];
    }
        
    isPaused = YES;
    madAgentsAmount = 0;
    
    currentLevel = currentLevel + 1;
       [self saveGameSettings];
    
    //Make all power ups not visible
    for (PowerUps *powerUp in powerUpsArray) {
        powerUp.mySprite.visible = NO;
    }
    //Make all deployed power ups not visible
    for (StunPowerUp *stunPowerUp in stunPowerUpArray) {
        stunPowerUp.visible = NO;
    }
    for (StunProjectilePowerUp *stunProjectilePowerUp in stunProjectileArray) {
        stunProjectilePowerUp.visible = NO;
    }
}

-(void) loadMultiplayerVersusScreen
{
    if (firstMatchWithThisPlayer == NO) {
        
        if (firstPlayerCurrentlyDead && !secondPlayerSprite.secondPlayerCurrentlyDead) {
            
            player2VersusTotalWins = player2VersusTotalWins + 1;
        }
        
        else if (secondPlayerSprite.secondPlayerCurrentlyDead && !firstPlayerCurrentlyDead) {
            
            player1VersusTotalWins = player1VersusTotalWins + 1;
        }
        
        else if (secondPlayerSprite.secondPlayerCurrentlyDead && firstPlayerCurrentlyDead) {
            
            player1VersusTotalWins = player1VersusTotalWins + 0;
        }
        
        isPaused = YES;
        gameMusicAlreadyPlaying = NO;
        
        //Remove all objects from current Level
        [self removeAllObjectsFromCurrentLevel];
        [gameLayer removeAllChildrenWithCleanup:YES];
        
        [self stopAllActions];
        [gameMusic stopBackgroundMusic];
        
        gameOverMusic = [SimpleAudioEngine sharedEngine];//play background music
        
        if (gameOverMusic != nil) {
            [gameOverMusic preloadBackgroundMusic:@"GameOver.mp3"];
            
            if (gameOverMusic.willPlayBackgroundMusic) {
                gameOverMusic.backgroundMusicVolume = 0.5f;
            }
        }
        
        [gameOverMusic playBackgroundMusic:@"GameOver.mp3" loop:NO];
    }
    
    [self updateAllCurrencyRelatedLabels];
    
    currentScreen = MULTIPLAYER_VERSUS_SCREEN;
    
    //Remove all objects from current Level
    [self removeAllObjectsFromCurrentLevel];
    [gameLayer removeAllChildrenWithCleanup:YES];
    
    hiScoreSecsLabel.position = ccp(hiScoreMultiplayerLabel.position.x + 20, hiScoreMultiplayerLabel.position.y - 25);
    hiScoreMinsLabel.position = ccp(hiScoreMultiplayerLabel.position.x - 20, hiScoreMultiplayerLabel.position.y - 25);
    
    //Fade out victory screen related stuff
    mins = 0;
    secs = 0;
    
    if (isSinglePlayer && !isBossLevel)
        timeInt = LEVEL_TIMER_SET_TO;
    else if (!isSinglePlayer || isBossLevel)
        timeInt = 0;
    
    numberOfStarsCollected = 0;
    star1.visible = NO;
    star2.visible = NO;
    star3.visible = NO;
    tryHarderLabel.visible = NO;
    noStarsRewardLabel.visible = NO;
    goodLabel.visible = NO;
    tapToContinueLabel.visible = NO;
    notBadLabel.visible = NO;
    youreAwesomeLabel.visible = NO;
    inGameCurrencyAmountLabelOldAmountForOneStar.visible = NO;
    inGameCurrencyAmountLabelNewAmount.visible = NO;
    noStarsRewardMoneyAmountLabel.visible = NO;
    timeBombPlacedOnDoor = NO;
    saveSlot1ForLoadScreenLabel.visible = NO;
    saveSlot2ForLoadScreenLabel.visible = NO;
    saveSlot3ForLoadScreenLabel.visible = NO;
    madAgentsBanner.visible = NO;
    newGameLabel.visible = NO;
    loadGameLabel.visible = NO;
    deleteGameLabel.visible = NO;
    gameOverLabel.visible = NO;
    firstPlayerCurrentlyDead = NO;
    firstPlayerHasTimeBomb = NO;
    timeBombPlacedOnDoor = NO;
    exitDoorIsOpen = NO;
    moveLeft1 = NO;
    moveRight1 = NO;
    player1ReadyLabel.visible = NO;
    player2ReadyLabel.visible = NO;
    
    
    //Fade out in-game related stuff
    hudLayer.visible = NO;
    gameLayer.visible = NO;
    storeButton.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    stunProjectileForActivePowerUpButton.visible = NO;
    invincibilityPowerUpForActivePowerUpButton.visible = NO;
    bulletTimePowerUpForActivePowerUpButton.visible = NO;
    globalStunForActivePowerUpButton.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    jumpButton.visible = NO;
    activePowerUpButton.visible = NO;
    leftArrowButton.visible = NO;
    rightArrowButton.visible = NO;
    mindControlCocktailForActivePowerUpButton.visible = NO;
    inGameCurrencyAmountLabel.visible = NO;
    blueInventorySlot1.visible = NO;
    blueInventorySlot2.visible = NO;
    blueInventorySlot3.visible = NO;
    redInventorySlot4.visible = NO;
    redInventorySlot5.visible = NO;
    redInventorySlot6.visible = NO;
    currentLevelLabel.visible = NO;
    multiplayerGameLabel.visible = NO;
    storeButton.visible = NO;
    currentLevelLabel.visible = NO;
    inGameCurrencyAmountLabel.visible = NO;
    
    //Load multiplayer versus screen related things
    player1Label.visible = YES;
    player2Label.visible = YES;
    versusLabel.visible = YES;
    timeLabel.visible = YES;
    player1VersusScreeScoreLabel.visible = YES;
    player2VersusScreeScoreLabel.visible = YES;
    
    //You might wanna turn these on later if you want the timer to show in versus mode
    hiScoreSecsLabel.visible = NO;
    hiScoreMinsLabel.visible = NO;
    hiScoreMultiplayerLabel.visible = NO;

    
    //Start decreaseTimerAction again
 //   decreaseTimerAction = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFunc actionWithTarget:self selector:@selector(decreaseTimer)], nil]]];
    
    [self saveGameSettings];
    [self updateAllCurrencyRelatedLabels];
    
    if (!isSinglePlayer && firstMatchWithThisPlayer == YES) {
        
        [self setupStringsWithOtherPlayerId:otherPlayerID];
    }
}

-(void) playElevatorIntro
{
    //Reset all variables just in case
    mainPlayerBoxingGloveGlow.visible = NO;
    numberOfStarsCollected = 0;
    star1.visible = NO;
    star2.visible = NO;
    star3.visible = NO;
    tryHarderLabel.visible = NO;
    noStarsRewardLabel.visible = NO;
    goodLabel.visible = NO;
    tapToContinueLabel.visible = NO;
    notBadLabel.visible = NO;
    youreAwesomeLabel.visible = NO;
    inGameCurrencyAmountLabelOldAmountForOneStar.visible = NO;
    inGameCurrencyAmountLabelNewAmount.visible = NO;
    noStarsRewardMoneyAmountLabel.visible = NO;
    timeBombPlacedOnDoor = NO;
    saveSlot1ForLoadScreenLabel.visible = NO;
    saveSlot2ForLoadScreenLabel.visible = NO;
    saveSlot3ForLoadScreenLabel.visible = NO;
    madAgentsMainMenuTitleLabel.visible = NO;
    newGameLabel.visible = NO;
    loadGameLabel.visible = NO;
    deleteGameLabel.visible = NO;
    gameOverLabel.visible = NO;
    firstPlayerCurrentlyDead = NO;
    firstPlayerHasTimeBomb = NO;
    timeBombPlacedOnDoor = NO;
    exitDoorIsOpen = NO;
    moveLeft1 = NO;
    moveRight1 = NO;
    multiplayerGameLabel.visible = NO;
    hiScoreMultiplayerLabel.visible = NO;
    player1Label.visible = NO;
    player2Label.visible = NO;
    versusLabel.visible = NO;
    player1VersusScreeScoreLabel.visible = NO;
    player2VersusScreeScoreLabel.visible = NO;
    hiScoreSecsLabel.visible = NO;
    hiScoreMinsLabel.visible = NO;
    player1ReadyLabel.visible = NO;
    player2ReadyLabel.visible = NO;
    menuLayer.visible = NO;
    firstPlayerCurrentlyInvincible = NO;
    playerHasInvincibilityPowerUp = NO;
    bulletTimeActive = NO;
    firstPlayerHasBoxingGlove = NO;
    
    //Remove all objects from current Level
    [self removeAllObjectsFromCurrentLevel];
    [gameLayer removeAllChildrenWithCleanup:YES];
    
    elevatorShaft1 = [CCSprite spriteWithFile:@"ElevatorShaft.png"];
    elevatorShaft1.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 410);
    elevatorShaft1.scale = 2.25;
    [self addChild: elevatorShaft1];

    elevatorShaft2 = [CCSprite spriteWithFile:@"ElevatorShaft.png"];
    elevatorShaft2.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 410 + elevatorShaft1.boundingBox.size.height);
    elevatorShaft2.scale = 2.25;
    [self addChild: elevatorShaft2];
    
    [elevatorShaft1 runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCMoveBy actionWithDuration:3.0 position:ccp(0, 380)], [CCMoveTo actionWithDuration:0.0 position: ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 410)], nil]]];
    
    [elevatorShaft2 runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCMoveBy actionWithDuration:3.0 position:ccp(0, 380)], [CCMoveTo actionWithDuration:0.0 position: ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 410 + elevatorShaft1.boundingBox.size.height)], nil]]];
    
    elevatorPlatform = [CCSprite spriteWithFile:@"ElevatorPlatform.png"];
    elevatorPlatform.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 80);
    elevatorPlatform.scale = 2.25;
    [self addChild: elevatorPlatform];
    
    CCSprite *mainCharacterBlueBoyStandingStill;
    
    if (playerColorAndGender == BLUE_BOY) 
         mainCharacterBlueBoyStandingStill = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBlueBoy1.png"];
    else if (playerColorAndGender == GREEN_BOY) 
        mainCharacterBlueBoyStandingStill = [CCSprite spriteWithSpriteFrameName:@"MainCharacterGreenBoy1.png"];
    else if (playerColorAndGender == BEIGE_GIRL)
        mainCharacterBlueBoyStandingStill = [CCSprite spriteWithSpriteFrameName:@"MainCharacterBeigeGirl1.png"];
    else if (playerColorAndGender == PURPLE_GIRL)
        mainCharacterBlueBoyStandingStill = [CCSprite spriteWithSpriteFrameName:@"MainCharacterPurpleGirl1.png"];
    
    mainCharacterBlueBoyStandingStill.anchorPoint = ccp(0.5, 0.4);
    [self addChild: mainCharacterBlueBoyStandingStill z:25];
    mainCharacterBlueBoyStandingStill.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 50);
}

-(void) mainPlayerWalkingOffScreenOnVictoryScreen
{
    [blackLayerForPauseScreen setZOrder:100];

    gameLayer.visible = NO;
    for (TimeBomb *timeBomb in timeBombArray) {
        timeBomb.visible = NO;
    }
    for (Enemy *enemies in enemySpritesArray) {
        enemies.visible = NO;
    }
    for (PowerUps *powerUp in powerUpsArray) {
        powerUp.mySprite.visible = NO;
    }
    
    star1.visible = NO;
    star2.visible = NO;
    star3.visible = NO;
    tryHarderLabel.visible = NO;
    notBadLabel.visible = NO;
    goodLabel.visible = NO;
    youreAwesomeLabel.visible = NO;
    tapToContinueLabel.visible = NO;
    saveVideoButton.visible = NO;

    
    if (!firstPlayerHasSneakers) {
        [mainCharacterBlueBoyWalking setZOrder: 3500];
        mainCharacterBlueBoyWalking.visible = YES;
        mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
        mainCharacterBlueBoyWalking.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 120);
        [mainCharacterBlueBoyWalking runAction: [CCFadeIn actionWithDuration:0.0]];
        [mainCharacterBlueBoyWalking runAction: [CCSequence actions: [CCMoveTo actionWithDuration:1.2 position:ccp(mainCharacterBlueBoyWalking.position.x + 400, mainCharacterBlueBoyWalking.position.y)], [CCCallFunc actionWithTarget:self selector:@selector(progressToNextLevel)], nil]];
        mainCharacterBlueBoyWalking.flipX = NO;
        //Make blackLayer not visible once player animation makes his way off screen
        [blackLayerForPauseScreen runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.2], [CCFadeOut actionWithDuration: 0.0], nil]];
    }
    else if (firstPlayerHasSneakers) {
        [mainCharacterBlueBoyWalkingWithSneakers setZOrder: 3500];
        mainCharacterBlueBoyWalkingWithSneakers.visible = YES;
        mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = NO;
        mainCharacterBlueBoyWalkingWithSneakers.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 120);
        [mainCharacterBlueBoyWalkingWithSneakers runAction: [CCFadeIn actionWithDuration:0.0]];
        [mainCharacterBlueBoyWalkingWithSneakers runAction: [CCSequence actions: [CCMoveTo actionWithDuration:1.2 position:ccp(mainCharacterBlueBoyWalkingWithSneakers.position.x + 400, mainCharacterBlueBoyWalkingWithSneakers.position.y)], [CCCallFunc actionWithTarget:self selector:@selector(progressToNextLevel)], nil]];
        mainCharacterBlueBoyWalkingWithSneakers.flipX = NO;
        [blackLayerForPauseScreen runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.2], [CCFadeOut actionWithDuration: 0.0], nil]];
    }
}

-(void) progressToNextLevel
{
    [self updateAllCurrencyRelatedLabels];

    currentScreen = GAME_SCREEN;
    
    [self stopAllActions];
        
    //Remove all objects from current Level
    [gameLayer removeAllChildrenWithCleanup:YES];
    [self removeAllObjectsFromCurrentLevel];
    
    if (currentLevel == 10 || currentLevel == 20 || currentLevel == 30 || currentLevel == 40 || currentLevel == 50 || currentLevel == 60) {
        
        isBossLevel = YES;
    }
    
    else {
        
        isBossLevel = NO;
    }
    
    if (isSinglePlayer) {
        
        timeLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, self.position.y - 36);
        timeLabel.visible = YES;
        
        secs = timeInt % 60;
        mins = timeInt / 60;
        
        [timeLabel setString:[NSString stringWithFormat:@"%02i:%02i", mins, secs]];
    }
    
    //Timer starts on condition that it's a boss level
    [self startInGameTimer];
    
    if (!isBossLevel) {
    
        if (gameMusicAlreadyPlaying == NO) {
            
            gameMusicAlreadyPlaying = YES;
            [gameMusic playBackgroundMusic:@"GameMusic.m4a" loop:YES];
        }
        
        enemiesLeftLabel.visible = NO;
        
        createPowerUpAction = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration: POWER_UP_GENERATION_TIME_INTERVAL], [CCCallFunc actionWithTarget:self selector:@selector(createPowerUpAtRandomLocation)], nil]]];
    }
    
    else if (isBossLevel) {
        
        [gameMusic stopBackgroundMusic];
        
        bossMusic = [SimpleAudioEngine sharedEngine];//play background music
        
        if (bossMusic != nil) {
            [bossMusic preloadBackgroundMusic:@"BossMusic.m4a"];
            
            if (bossMusic.willPlayBackgroundMusic) {
                bossMusic.backgroundMusicVolume = 0.5f;
            }
        }
        
        [bossMusic playBackgroundMusic:@"BossMusic.m4a" loop:YES];
        
        enemiesLeftLabel.visible = YES;
        
        float powerUpSpawnTime;
        float consistentSpawnPointSpawnTime;
        float randomSpawnPointSpawnTime;
        
        if (currentLevel == 10) {
            
            powerUpSpawnTime = BOSS_LEVEL_10_POWER_UP_SPAWN_TIME;
            consistentSpawnPointSpawnTime = BOSS_LEVEL_10_CONSISTENT_ENEMY_SPAWN_TIME;
            randomSpawnPointSpawnTime = BOSS_LEVEL_10_ENEMY_SPAWN_TIME;
        }
        
        else if (currentLevel == 20) {
            
            powerUpSpawnTime = BOSS_LEVEL_20_POWER_UP_SPAWN_TIME;
            consistentSpawnPointSpawnTime = BOSS_LEVEL_20_CONSISTENT_ENEMY_SPAWN_TIME;
            randomSpawnPointSpawnTime = BOSS_LEVEL_20_ENEMY_SPAWN_TIME;
        }
        
        else if (currentLevel == 30) {
            
            powerUpSpawnTime = BOSS_LEVEL_30_POWER_UP_SPAWN_TIME;
            consistentSpawnPointSpawnTime = BOSS_LEVEL_30_CONSISTENT_ENEMY_SPAWN_TIME;
            randomSpawnPointSpawnTime = BOSS_LEVEL_30_ENEMY_SPAWN_TIME;
        }
        
        else if (currentLevel == 40) {
            
            powerUpSpawnTime = BOSS_LEVEL_40_POWER_UP_SPAWN_TIME;
            consistentSpawnPointSpawnTime = BOSS_LEVEL_40_CONSISTENT_ENEMY_SPAWN_TIME;
            randomSpawnPointSpawnTime = BOSS_LEVEL_40_ENEMY_SPAWN_TIME;
        }
        
        else if (currentLevel == 50) {
            
            powerUpSpawnTime = BOSS_LEVEL_50_POWER_UP_SPAWN_TIME;
            consistentSpawnPointSpawnTime = BOSS_LEVEL_50_CONSISTENT_ENEMY_SPAWN_TIME;
            randomSpawnPointSpawnTime = BOSS_LEVEL_50_ENEMY_SPAWN_TIME;
        }
        
        else if (currentLevel == 60) {
            
            powerUpSpawnTime = BOSS_LEVEL_60_POWER_UP_SPAWN_TIME;
            consistentSpawnPointSpawnTime = BOSS_LEVEL_60_CONSISTENT_ENEMY_SPAWN_TIME;
         //   randomSpawnPointSpawnTime = BOSS_LEVEL_60_ENEMY_SPAWN_TIME;
        }
        
        createPowerUpAction = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration: powerUpSpawnTime], [CCCallFunc actionWithTarget:self selector:@selector(createPowerUpAtRandomLocation)], nil]]];
        
        [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration: randomSpawnPointSpawnTime], [CCCallFunc actionWithTarget:self selector:@selector(spawnEnemiesAtRandomSpawnPointForBossLevel)], nil]]];
        
        [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration: consistentSpawnPointSpawnTime], [CCCallFunc actionWithTarget:self selector:@selector(spawnEnemiesForBossLevel)], nil]]];
    }

    powerUpAlreadyAppearedInThisLevel = NO;
    
    if (deviceIsIpad) {
        
        self.scale = 1.7;
        self.position = ccp(470, 480);

        gameLayer.scale = 1.0;
        gameLayer.position = ccp(600, 0);
        
        hudLayer.position = ccp(0, 0);
   /*
        leftArrowButton.position = ccp (-33, -38);
        leftArrowButton.scaleX = 0.2;
        leftArrowButton.scaleY = 1.0;
        
        rightArrowButton.position = ccp (12, -38);
        rightArrowButton.scaleX = 0.2;
        rightArrowButton.scaleY = 1.0;
    */
        jumpButton.position = ccp(475, -45);
        activePowerUpButton.position = ccp(390, -45);
        
        storeButton.position = ccp(237, -72);
        currentLevelLabel.position = ccp(237, -107);
        
        madAgentsLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 260, [[CCDirector sharedDirector] winSize].height/2 - 500);
    }
    
    if (!deviceIsIpad) {
    
        gameLayer.position = ccp(600, 0);
    }
    
    // gameLayer.scale = 0.3;
    
    //Fade out victory screen related stuff
    mins = 0;
    secs = 0;
    
    if (isSinglePlayer && !isBossLevel)
        [self setLevelTotalTime];
    else if (!isSinglePlayer || isBossLevel)
        timeInt = 0;
    
    if (!isSinglePlayer)
        stunBombsLeft = 0;
    
    
    //Add Enemies Left counter label if it's a boss level
    if (isBossLevel == YES) {
        
        if (currentLevel == 10) {
            
            enemiesLeftValue = 20;
        }
        
        else if (currentLevel == 20) {
            
            enemiesLeftValue = 20;
        }
        
        else if (currentLevel == 30) {
            
            enemiesLeftValue = 20;
        }
        
        else if (currentLevel == 40) {
            
            enemiesLeftValue = 20;
        }
        
        else if (currentLevel == 50) {
            
            enemiesLeftValue = 20;
        }
        
        else if (currentLevel == 60) {
            
            enemiesLeftValue = 20;
        }
        
        //Set the totalNumberOfEnemiesForCurrentBossLevel equal to the initial enemiesLeftValue for the current boss level  This will make the approrpriate number of enemies spawn for the current boss level
        totalNumberOfEnemiesForCurrentBossLevel = enemiesLeftValue;
        
        [enemiesLeftLabel setString: [NSString stringWithFormat:@"Enemies Left: %i", enemiesLeftValue]];
    }
    
    mainPlayerBoxingGloveGlow.visible = NO;
    numberOfStarsCollected = 0;
    star1.visible = NO;
    star2.visible = NO;
    star3.visible = NO;
    tryHarderLabel.visible = NO;
    noStarsRewardLabel.visible = NO;
    goodLabel.visible = NO;
    tapToContinueLabel.visible = NO;
    notBadLabel.visible = NO;
    youreAwesomeLabel.visible = NO;
    inGameCurrencyAmountLabelOldAmountForOneStar.visible = NO;
    inGameCurrencyAmountLabelNewAmount.visible = NO;
    noStarsRewardMoneyAmountLabel.visible = NO;
    timeBombPlacedOnDoor = NO;
    saveSlot1ForLoadScreenLabel.visible = NO;
    saveSlot2ForLoadScreenLabel.visible = NO;
    saveSlot3ForLoadScreenLabel.visible = NO;
    madAgentsMainMenuTitleLabel.visible = NO;
    newGameLabel.visible = NO;
    loadGameLabel.visible = NO;
    deleteGameLabel.visible = NO;
    gameOverLabel.visible = NO;
    firstPlayerCurrentlyDead = NO;
    firstPlayerHasTimeBomb = NO;
    timeBombPlacedOnDoor = NO;
    exitDoorIsOpen = NO;
    moveLeft1 = NO;
    moveRight1 = NO;
    multiplayerGameLabel.visible = NO;
    hiScoreMultiplayerLabel.visible = NO;
    player1Label.visible = NO;
    player2Label.visible = NO;
    versusLabel.visible = NO;
    player1VersusScreeScoreLabel.visible = NO;
    player2VersusScreeScoreLabel.visible = NO;
    hiScoreSecsLabel.visible = NO;
    hiScoreMinsLabel.visible = NO;
    player1ReadyLabel.visible = NO;
    player2ReadyLabel.visible = NO;
    menuLayer.visible = NO;
    firstPlayerCurrentlyInvincible = NO;
    playerHasInvincibilityPowerUp = NO;
    bulletTimeActive = NO;
    firstPlayerHasBoxingGlove = NO;
    characterSelectionLayer.visible = NO;
    stunBombForActivePowerUpButton.visible = NO;
    stunProjectileForActivePowerUpButton.visible = NO;
    mindControlCocktailForActivePowerUpButton.visible = NO;
    timeLabel.color = ccWHITE;
    
    
    if (watchedAdColonyAdForSpeedShoes == YES) {
        
        firstPlayerHasSneakers = YES;
    }
    
    
    //Reset all powerup inventory to 0
    stunBombsLeft = 0;
    mindControlPowerUpsLeft = 0;
    stunProjectilesLeft = 0;
    invincibilityPowerUpsLeft = 0;
    bulletTimePowerUpsLeft = 0;
    globalStunPowerUpsLeft = 0;
    
    //Fade in in-game related stuff
    hudLayer.visible = YES;
    gameLayer.visible = YES;
    storeButton.visible = YES;
    jumpButton.visible = YES;
    activePowerUpButton.visible = YES;
    leftArrowButton.visible = YES;
    rightArrowButton.visible = YES;
    [self dPadNotPressed];

    
    if (!isSinglePlayer) {
        
        storeButton.visible = NO;
        currentLevelLabel.visible = NO;
        inGameCurrencyAmountLabel.visible = NO;
        //activePowerUpButton.visible = NO;
    }
    
    
    
    if ([self fileExistsInProject: [NSString stringWithFormat:@"TileMapLevel%d.tmx", currentLevel]]) {
        
        if (madAgentsAmount >= 1) {
            
            madAgentsAmount = 0;
            [fastGameMusic stopBackgroundMusic];
        }
        
        isPaused = YES;
        madAgentsAmount = 0;
        
        if (progressToNextLevelAlreadyRunning == NO) {
                        
            progressToNextLevelAlreadyRunning = YES;
            
            if (isSinglePlayer ) {
                
                tileMap = [CCTMXTiledMap tiledMapWithTMXFile: [NSString stringWithFormat:@"TileMapLevel%d.tmx", currentLevel]];
                tileMap.anchorPoint = ccp(0, 0);
                [gameLayer addChild: tileMap z:5];
            }
            
            else if (!isSinglePlayer) {
                
                tileMap = [CCTMXTiledMap tiledMapWithTMXFile: [NSString stringWithFormat:@"DemoLevel%d.tmx", currentLevel]];
                tileMap.anchorPoint = ccp(0, 0);
                [gameLayer addChild: tileMap z:5];
            }
            
            //Move gameLayer to the LEFT by 500 over 1.0 seconds
            [gameLayer runAction: [CCMoveBy actionWithDuration: 1.0 position:ccp(-600, 0)]];
        //    [gameLayer runAction: [CCScaleTo actionWithDuration: 1.0 scale:1.0]];
            
            //Create enemies on new level after 1.3s delay
            [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration: 1.3], [CCCallFunc actionWithTarget:self selector:@selector(addAllObjectsToCurrentLevel)], [CCCallFunc actionWithTarget:self selector:@selector(setIsPausedToYes)],  nil]];
            //Make new tileset collidable
            [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration: 1.3], [CCCallFunc actionWithTarget:self selector:@selector(makeRecentlyCreatedTilesCollidable)], nil]];
            [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration: 2.0], [CCCallFunc actionWithTarget:self selector:@selector(setIsPausedToNo)], nil]];
        
            
            //set progressToNextLevelAlreadyRunning to NO
            [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration: 1.5], [CCCallFunc actionWithTarget:self selector:@selector(setProgressToNextLevelAlreadyRunningToNo)], nil]];
        }
    }
    
    /*
    //Start decreaseTimerAction again
    decreaseTimerAction = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFunc actionWithTarget:self selector:@selector(decreaseTimer)], nil]]];
    */
    [self saveGameSettings];
    [self updateAllCurrencyRelatedLabels];
    
    //DEBUG: Turn off recording for simulator
   // [Kamcord startRecording];
}

-(BOOL) fileExistsInProject:(NSString *)fileName
{
	NSFileManager *fileManager = [NSFileManager defaultManager];
	NSString *fileInResourcesFolder = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
	return [fileManager fileExistsAtPath:fileInResourcesFolder];
}


-(void) updateAllCurrencyRelatedLabels {
    
    [stunBombsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", stunBombsLeft]];
    [mindControlCocktailsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", stunBombsLeft]];
    [globalStunPowerUpsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", globalStunPowerUpsLeft]];
    [inGameCurrencyAmountLabel setString: [NSString stringWithFormat:@"$%i", inGameCurrencyAmount]];
    [bulletTimePowerUpsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", bulletTimePowerUpsLeft]];
    [invincibilityPowerUpsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", invincibilityPowerUpsLeft]];
    [stunProjectilesLeftCounterLabel setString: [NSString stringWithFormat:@"%i", stunProjectilesLeft]];
    [inGameCurrencyAmountLabelOldAmountForOneStar setString: [NSString stringWithFormat:@"$%i", inGameCurrencyAmount - ONE_STARS_REWARD]];
    [inGameCurrencyAmountLabelNewAmount setString: [NSString stringWithFormat:@"$%i", inGameCurrencyAmount]];
    [inGameCurrencyAmountLabelOldAmountForTwoStars setString: [NSString stringWithFormat:@"$%i", inGameCurrencyAmount - TWO_STARS_REWARD]];
    [inGameCurrencyAmountLabelNewAmount setString: [NSString stringWithFormat:@"$%i", inGameCurrencyAmount]];
    [inGameCurrencyAmountLabelOldAmountForThreeStars setString: [NSString stringWithFormat:@"$%i", inGameCurrencyAmount - THREE_STARS_REWARD]];
    [inGameCurrencyAmountLabelNewAmount setString: [NSString stringWithFormat:@"$%i", inGameCurrencyAmount]];
    [inGameCurrencyAmountLabel setString: [NSString stringWithFormat:@"$%i", inGameCurrencyAmount]];
    [currentLevelLabel setString: [NSString stringWithFormat:@"Level %i", currentLevel]];
    [player1VersusScreeScoreLabel setString: [NSString stringWithFormat:@"Wins: %i", player1VersusTotalWins]];
    [player2VersusScreeScoreLabel setString: [NSString stringWithFormat:@"Wins: %i", player2VersusTotalWins]];
}

-(void) setPlayerHasInvinciblePowerUpToYes
{
    [self fastFirstPlayerInvincibilityRainbowAction];
    
    if (madAgentsAmount == 0) {
    
        [gameMusic stopBackgroundMusic];
    }
    
    if (madAgentsAmount == 1) {
        
        [fastGameMusic stopBackgroundMusic];
    }
    
    [starPowerUpMusic playBackgroundMusic:@"StarPowerUpMusic.mp3" loop:YES];
    
    [firstPlayerSprite setColor: ccRED];
    playerHasInvincibilityPowerUp = YES;
}

-(void) setPlayerHasInvincibilityPowerUpBooleanToNo
{
    //Set all firstPlayer sprites to white just in case the rainbow action left them off on another color
    for (CCSprite *firstPlayerSpriteChild in firstPlayerSpritesArray) {
        
        [firstPlayerSpriteChild runAction: [CCTintTo actionWithDuration:0.0 red:255 green:255 blue:255]];        
    }
    
    playerHasInvincibilityPowerUp = NO;
}

-(void) setPlayerHasInvinciblePowerUpToNo
{
    //Stop music immediately and restore regular game music, or fast game music if madAgentsValue is 1
    [starPowerUpMusic stopBackgroundMusic];
    
    if (!isBossLevel) {
    
        if (madAgentsAmount == 0) {
            
            [gameMusic playBackgroundMusic:@"GameMusic.m4a" loop:YES];
        }
        
        if (madAgentsAmount == 1) {
            
            [fastGameMusic playBackgroundMusic:@"HurryUpGameMusic.m4a" loop:YES ];
        }
    }
    
    else if (isBossLevel) {
       
        [bossMusic playBackgroundMusic:@"BossMusic.m4a" loop:YES];
    }
}

-(void) setBulletTimeActiveToYes
{
    bulletTimeActive = YES;
    
    [[SimpleAudioEngine sharedEngine]setBackgroundMusicVolume:0.05f];
    [[SimpleAudioEngine sharedEngine] playEffect:@"TimeSlowDown.wav"];
        
    if ([enemySkeletonWhaleSpritesArray count] > 0) {
    
        [(Enemy*)enemySkeletonWhaleSprite readjustEnemySkeletonWhaleResponseTime];
    }
    
    if ([enemyHidgonSpritesArray count] > 0) {
    
        [(Enemy*)enemyHidgonSprite increaseEnemyHidgonResponseTimeMethod];
    }
    
    if ([downwardShooterEnemySpritesArray count] > 0) {
        
        NSLog (@"HelloWorld bulletTimeActive = %i", bulletTimeActive);
        
        [(Enemy*)downwardShooterEnemy adjustDownwardShooterResponseTimeMethod];
    }
}

-(void) setBulletTimeActiveToNo
{
    [[SimpleAudioEngine sharedEngine]setBackgroundMusicVolume:1.0f];
    [[SimpleAudioEngine sharedEngine] playEffect:@"TimeSpeedBackUp.wav"];
    
    bulletTimeActive = NO;
    
    if ([enemySkeletonWhaleSpritesArray count] > 0) {
    
        [(Enemy*)enemySkeletonWhaleSprite readjustEnemySkeletonWhaleResponseTime];
    }
    
    if ([enemyHidgonSpritesArray count] > 0) {
    
        [(Enemy*)enemyHidgonSprite increaseEnemyHidgonResponseTimeMethod];
    }
    
    if ([downwardShooterEnemySpritesArray count] > 0) {
        
        NSLog (@"HelloWorld bulletTimeActive = %i", bulletTimeActive);
        
        [(Enemy*)downwardShooterEnemy adjustDownwardShooterResponseTimeMethod];
    }
}

-(void) enterName
{
    madAgentsMainMenuTitleLabel.visible = NO;
    
    // Create textfield
    textField = [[[UITextField alloc] initWithFrame:CGRectMake(10,10,500,50)] autorelease];
    textField.placeholder = @"Enter Your Name" ;
    textField.borderStyle = UITextBorderStyleNone ;
    textField.autocorrectionType = UITextAutocorrectionTypeNo ;
    textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    textField.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:48.0f];
    textField.font = [UIFont systemFontOfSize:48.0];
    textField.clearButtonMode = UITextFieldViewModeWhileEditing ;
    textField.adjustsFontSizeToFitWidth = YES;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    textField.textAlignment = 1;
    textField.returnKeyType = UIReturnKeyDone ;
    textField.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0f];
    
    // Workaround to dismiss keyboard when Done/Return is tapped
    [textField addTarget:self action:@selector(textFieldEditingDidEndOnExit:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    // Add textfield into cocos2d view
    [[[CCDirector sharedDirector] openGLView] addSubview:textField];
    [textField becomeFirstResponder];
}

-(void) textFieldEditingDidEndOnExit:(UITextField*) tf {
    
    madAgentsMainMenuTitleLabel.visible = YES;
    
    if (currentSaveSlot == SAVE_SLOT_1) {
    
        saveSlot1NameLabel = [NSString stringWithFormat:@"%@'s Game", textField.text];
    }
    
    if (currentSaveSlot == SAVE_SLOT_2) {
        
        saveSlot2NameLabel = [NSString stringWithFormat:@"%@'s Game", textField.text];
    }
    
    if (currentSaveSlot == SAVE_SLOT_3) {
        
        saveSlot3NameLabel = [NSString stringWithFormat:@"%@'s Game", textField.text];
    }
    
    [newGameLabel setString: [NSString stringWithFormat:@"%@'s Game", textField.text]];
    
    [textField removeFromSuperview];
    [self saveGameSettings];
    [self loadGameSettings];
}

- (void)setGameState:(GameState)state {
    
    gameState = state;
    if (gameState == kGameStateWaitingForMatch) {
        [debugLabel setString:@"Waiting for match"];
    } else if (gameState == kGameStateWaitingForRandomNumber) {
        [debugLabel setString:@"Waiting for rand #"];
    } else if (gameState == kGameStateWaitingForStart) {
        [debugLabel setString:@"Waiting for start"];
    } else if (gameState == kGameStateActive) {
        [debugLabel setString:@"Active"];
    } else if (gameState == kGameStateDone) {
        [debugLabel setString:@"Done"];
    }
}

-(void) makePlayerJump {
    
    jumpButtonTouched = YES;
    
    if (firstPlayerIsStunned == NO) {
    
        if (isPlayer1 && ((firstPlayerTouchingFloor && firstPlayerJumpSpeed == 0 && !firstPlayerCurrentlyDead && playersNumberOfJumpsAvailable > 0) || (playerHasDoubleJumpPowerUp && playersNumberOfJumpsAvailable > 0))) {
            
            NSLog (@"first player jumping");
            
            [[SimpleAudioEngine sharedEngine] playEffect:@"Jump.wav"];
            
            playersNumberOfJumpsAvailable = playersNumberOfJumpsAvailable - 1;
            
            if (firstPlayerHasSneakers == YES) {
                
                firstPlayerJumpSpeed = firstPlayerJumpSpeed + 6.0 + JUMP_SPEED_MULTIPLIER*6.0;
            }
            
            if (firstPlayerHasSneakers == NO) {
                
                firstPlayerJumpSpeed = firstPlayerJumpSpeed + 6.0;
            }
        }
    }
    
    if (secondPlayerIsStunned == NO) {
    
        if (!isPlayer1 && ((secondPlayerSprite.secondPlayerTouchingFloor && secondPlayerSprite.secondPlayerJumpSpeed == 0 && !secondPlayerSprite.secondPlayerCurrentlyDead) && playersNumberOfJumpsAvailable > 0)) {
            
            secondPlayerSprite.secondPlayersNumberOfJumpsAvailable = secondPlayerSprite.secondPlayersNumberOfJumpsAvailable - 1;
            
            [[SimpleAudioEngine sharedEngine] playEffect:@"Jump.wav"];
            
            if (secondPlayerSprite.secondPlayerHasSneakers == YES) {
                
                secondPlayerSprite.secondPlayerJumpSpeed = secondPlayerSprite.secondPlayerJumpSpeed + 6.0 + JUMP_SPEED_MULTIPLIER*6.0;
            }
            
            if (secondPlayerSprite.secondPlayerHasSneakers == NO) {
                
                secondPlayerSprite.secondPlayerJumpSpeed = secondPlayerSprite.secondPlayerJumpSpeed + 6.0;
            }
        }
    }
}

-(void) player1IsDead
{
    if (firstPlayerCurrentlyDead == NO) {
      
        for (Enemy *enemies in enemySpritesArray) {
            
            [enemies pauseSchedulerAndActions];
        }
        
        for (fireball in fireballArray) {
            
            [fireball pauseSchedulerAndActions];
        }
        
        firstPlayerCurrentlyDead = YES;
        
        [[SimpleAudioEngine sharedEngine] playEffect:@"PlayerDeath.wav"];
        
        [self dPadNotPressed];
        
        moveRight1 = NO;
        moveLeft1 = NO;
        firstPlayerJumpSpeed = 0;
        
        if (firstPlayerHasSneakers == NO) {
            
            mainCharacterBlueBoyStandingStill.visible = NO;
            mainCharacterBlueBoyStandingStillHoldingSomething.visible = NO;
            mainCharacterBlueBoyJumping.visible = NO;
            mainCharacterBlueBoyJumpingHoldingSomething.visible = NO;
            mainCharacterBlueBoyWalking.visible = NO;
            mainCharacterBlueBoyWalkingHoldingSomething.visible = NO;
            mainCharacterBlueBoyDead.visible = YES;
            mainCharacterBlueBoyHoldingUpBoxingGlove.visible = NO;
        }
        
        else if (firstPlayerHasSneakers == YES) {
            
            mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
            mainCharacterBlueBoyStandingStillWithSneakersHoldingSomething.visible = NO;
            mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
            mainCharacterBlueBoyJumpingWithSneakersHoldingSomething.visible = NO;
            mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
            mainCharacterBlueBoyWalkingWithSneakersHoldingSomething.visible = NO;
            mainCharacterBlueBoyDeadWithSneakers.visible = YES;
            mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = NO;
        }
        
        mainCharacterBlueBoyDead.position = firstPlayerSprite.position;
        
        if (isSinglePlayer) {
        
            [mainCharacterBlueBoyDead runAction: [CCSequence actions: [CCRotateBy actionWithDuration:0.9 angle:-550], [CCFadeOut actionWithDuration:0.0], [CCCallFunc actionWithTarget:self selector:@selector(gameOverScreen)], nil]];
            
            [mainCharacterBlueBoyDeadWithSneakers runAction: [CCSequence actions: [CCRotateBy actionWithDuration:0.9 angle:-550], [CCFadeOut actionWithDuration:0.0], [CCCallFunc actionWithTarget:self selector:@selector(gameOverScreen)], nil]];

            [mainCharacterGreenBoyDead runAction: [CCSequence actions: [CCRotateBy actionWithDuration:0.9 angle:-550], [CCFadeOut actionWithDuration:0.0], [CCCallFunc actionWithTarget:self selector:@selector(gameOverScreen)], nil]];

            [mainCharacterGreenBoyDeadWithSneakers runAction: [CCSequence actions: [CCRotateBy actionWithDuration:0.9 angle:-550], [CCFadeOut actionWithDuration:0.0], [CCCallFunc actionWithTarget:self selector:@selector(gameOverScreen)], nil]];

        }
        
        else {
            
            [mainCharacterBlueBoyDead runAction: [CCSequence actions: [CCRotateBy actionWithDuration:0.9 angle:-550], [CCFadeOut actionWithDuration:0.0], [CCCallFunc actionWithTarget:self selector:@selector(loadMultiplayerVersusScreen)], nil]];
            
            [mainCharacterBlueBoyDeadWithSneakers runAction: [CCSequence actions: [CCRotateBy actionWithDuration:0.9 angle:-550], [CCFadeOut actionWithDuration:0.0], [CCCallFunc actionWithTarget:self selector:@selector(loadMultiplayerVersusScreen)], nil]];

            [mainCharacterGreenBoyDead runAction: [CCSequence actions: [CCRotateBy actionWithDuration:0.9 angle:-550], [CCFadeOut actionWithDuration:0.0], [CCCallFunc actionWithTarget:self selector:@selector(loadMultiplayerVersusScreen)], nil]];

            [mainCharacterGreenBoyDeadWithSneakers runAction: [CCSequence actions: [CCRotateBy actionWithDuration:0.9 angle:-550], [CCFadeOut actionWithDuration:0.0], [CCCallFunc actionWithTarget:self selector:@selector(loadMultiplayerVersusScreen)], nil]];
        }
    }
}

-(void) player2IsDead
{
    if (secondPlayerSprite.secondPlayerCurrentlyDead == NO) {
        
        for (Enemy *enemies in enemySpritesArray) {
            
            [enemies pauseSchedulerAndActions];
        }
        
        for (fireball in fireballArray) {
            
            [fireball pauseSchedulerAndActions];
        }
        
        secondPlayerSprite.secondPlayerCurrentlyDead = YES;
        
        [[SimpleAudioEngine sharedEngine] playEffect:@"PlayerDeath.wav"];
                
        //Stop player from moving right or left
        secondPlayerSprite.secondPlayerMoveRight = NO;
        secondPlayerSprite.secondPlayerMoveLeft = NO;
        secondPlayerSprite.secondPlayerJumpSpeed = 0;
        
        if (isSinglePlayer) {
        
            [secondPlayerSprite runAction: [CCSequence actions: [CCRotateBy actionWithDuration:0.8 angle:-450], [CCFadeOut actionWithDuration:0.0], [CCCallFunc actionWithTarget:self selector:@selector(gameOverScreen)], nil]];
        }
        
        else {
            
            [secondPlayerSprite runAction: [CCSequence actions: [CCRotateBy actionWithDuration:0.8 angle:-450], [CCFadeOut actionWithDuration:0.0], [CCCallFunc actionWithTarget:self selector:@selector(loadMultiplayerVersusScreen)], nil]];
        }
    }
}

- (void)setupStringsWithOtherPlayerId:(NSString *)playerID {
    
    if (isPlayer1) {
        
        if (firstMatchWithThisPlayer == YES) {
            
            [player1Label setString: [GKLocalPlayer localPlayer].alias];
        }

        if (firstMatchWithThisPlayer == YES) {
            
            player = [[GCHelper sharedInstance].playersDict objectForKey:playerID];
            [player2Label setString: player.alias];
        }
    }
    
    else if (!isPlayer1) {
        
        if (firstMatchWithThisPlayer == YES) {
            
            [player2Label setString: [GKLocalPlayer localPlayer].alias];
        }

        if (firstMatchWithThisPlayer == YES) {
            
            player2 = [[GCHelper sharedInstance].playersDict objectForKey:playerID];
            [player1Label setString: player2.alias];
        }
    }
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [audioSession setActive: YES error: nil];
    
    
    if (firstMatchWithThisPlayer == YES) {
        
        //Voice chat code
        teamChannel = [[[GCHelper sharedInstance].match voiceChatWithName:@"redTeam"] retain];
        
        teamChannel.active = YES;
        teamChannel.volume = 1.0;
        
        [teamChannel setMute: NO forPlayer: otherPlayerID];
        
        [teamChannel start];
    }
    
    firstMatchWithThisPlayer = NO;
}

-(void) makeGameLayerRumble
{
    shakeGameLayerForNuclearExplosion = [gameLayer runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCMoveBy actionWithDuration:0.02 position:ccp(3, 0)], [CCMoveBy actionWithDuration:0.02 position:ccp(0, 0)], [CCMoveBy actionWithDuration:0.02 position:ccp(-3, 0)], [CCMoveBy actionWithDuration:0.02 position:ccp(0, 0)], nil]]];
}

-(void) makeGameLayerRumbleStop
{
    [self stopAction: shakeGameLayerForNuclearExplosion];
}

-(void) stunAllEnemiesForNuclearExplosionAnimationMethod
{
    for (Enemy *enemies in enemySpritesArray) {
        
        if (!enemies.isCurrentlyTeleportingIn) {
            
            enemies.friendlyTimeValue = 0;
            enemies.stunTimeValue = 6;
        }
    }
}

-(void) nuclearExplosionAnimation: (CGPoint) explosionPoint
{
    [whiteOvalForNuclearExplosion1 runAction: [CCMoveTo actionWithDuration:0.0 position:explosionPoint]];
    
    //Solid White should flash in and then out almost immediately
    [solidWhiteFlashBang runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCFadeIn actionWithDuration:2.0], [CCFadeOut actionWithDuration: 3.0], nil]];
    
    //Pause game for a very short time before nuclear oval expands
    [self runAction: [CCSequence actions:  [CCCallFunc actionWithTarget:self selector:@selector(setIsPausedToYes)], [CCDelayTime actionWithDuration:1.0], [CCCallFunc actionWithTarget:self selector:@selector(setIsPausedToNo)], nil]];
    
    //Pause everything in the game first before nuclear explosion shows for dramatic effect
    [whiteOvalForNuclearExplosion1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFunc actionWithTarget:self selector:@selector(makeGameLayerRumble)], nil]];
    
    //Fade the tiny white oval in immediately at first
    [whiteOvalForNuclearExplosion1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCFadeTo actionWithDuration:0.0 opacity:230], nil]];
    
    //Make white oval grow over a short time
    [whiteOvalForNuclearExplosion1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCScaleTo actionWithDuration:2.0 scale:5.0], [CCCallFunc actionWithTarget:self selector:@selector(makeGameLayerRumbleStop)], nil]];
    //After 1 sec delay, set isPaused to No
    [whiteOvalForNuclearExplosion1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCFadeTo actionWithDuration:1.0 opacity:230], [CCCallFunc actionWithTarget:self selector:@selector(setIsPausedToNo)], nil]];
    //After whiteOval had already expanded the entire screen, have it fade out over 4 seconds
    [whiteOvalForNuclearExplosion1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:3.0], [CCFadeOut actionWithDuration:3.0], nil]];
    
    //Stun all enemies after 1 second delay
    [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFunc actionWithTarget:self selector:@selector(stunAllEnemiesForNuclearExplosionAnimationMethod)], nil]];
    
    //After whiteOvalForNuclearExplosion1 is completely faded out, move white oval off screen, shrink it way down, and then make it visible again
    [whiteOvalForNuclearExplosion1 runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.75], [CCDelayTime actionWithDuration:4.4], [CCMoveTo actionWithDuration:0.0 position:ccp(-300, -300)], [CCFadeIn actionWithDuration:0.0], [CCScaleTo actionWithDuration:0.0 scale:0.01], nil]];
}

-(void) spawnEnemiesForBossLevel
{
    if (!isPaused && enemiesLeftValue > 0 && [enemySpritesArray count] < totalNumberOfEnemiesForCurrentBossLevel) {
    
        //Boss enemy spawn point
        NSMutableDictionary *bossEnemySpawnPointDictionary;
        for (bossEnemySpawnPointDictionary in [objectsGroup objects]) {
            if ([[bossEnemySpawnPointDictionary valueForKey:@"bossEnemySpawnPoint"] intValue] != 0) {
                                
                float bossEnemySpawnPointX = [[bossEnemySpawnPointDictionary valueForKey:@"x"] intValue];
                float bossEnemySpawnPointY = [[bossEnemySpawnPointDictionary valueForKey:@"y"] intValue];
                
                BOOL gunnerSpawnsHere = NO;
                BOOL chaserSpawnsHere = NO;
                BOOL jetmanSpawnsHere = NO;
                BOOL diagonalFlyerSpawnsHere = NO;
                BOOL flyThroughWallsDiagonalFlyerSpawnsHere = NO;
                BOOL saucerSpawnsHere = NO;
                BOOL ninjaSpawnsHere = NO;
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"gunnerSpawnsHere"] intValue] != 0) {
                                        
                    gunnerSpawnsHere = YES;
                }
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"chaserSpawnsHere"] intValue] != 0) {
                    
                    chaserSpawnsHere = YES;
                }
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"jetmanSpawnsHere"] intValue] != 0) {
                    
                    jetmanSpawnsHere = YES;
                }
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"diagonalFlyerSpawnsHere"] intValue] != 0) {
                    
                    diagonalFlyerSpawnsHere = YES;
                }
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"flyThroughWallsDiagonalFlyerSpawnsHere"] intValue] != 0) {
                    
                    flyThroughWallsDiagonalFlyerSpawnsHere = YES;
                }
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"saucerSpawnsHere"] intValue] != 0) {
                    
                    saucerSpawnsHere = YES;
                }
                
                if ([[bossEnemySpawnPointDictionary valueForKey:@"ninjaSpawnsHere"] intValue] != 0) {
                                        
                    ninjaSpawnsHere = YES;
                }
                
                
                
                BOOL enemyHasSpawned = NO;
                                
                while (enemyHasSpawned == NO) {
                
                    int randomEnemy = arc4random()%7;
                    
                    if (randomEnemy == 0 && gunnerSpawnsHere) {
                        
                        [self addHidgonEnemySprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];
                        
                        enemyHasSpawned = YES;
                    }
                    
                    else if (randomEnemy == 1 && diagonalFlyerSpawnsHere) {
                        
                        [self addDiagonalFlyerEnemySprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];
                        
                        enemyHasSpawned = YES;
                    }
                    
                    else if (randomEnemy == 2 && ninjaSpawnsHere) {
                        
                        [self addParkourJumperSprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];
                        
                        enemyHasSpawned = YES;
                    }
                    
                    else if (randomEnemy == 3 && flyThroughWallsDiagonalFlyerSpawnsHere) {
                        
                        [self addFlyThroughWallsDiagonalFlyerEnemySprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];
                        
                        enemyHasSpawned = YES;
                    }
                    
                    else if (randomEnemy == 4 && saucerSpawnsHere) {
                        
                        [self addDownwardShooterEnemySprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];
                        
                        enemyHasSpawned = YES;
                    }
                    
                    else if (randomEnemy == 5 && jetmanSpawnsHere) {
                        
                        [self addSkeletonWhaleEnemySprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];
                        
                        enemyHasSpawned = YES;
                    }
                    
                    else if (randomEnemy == 6 && chaserSpawnsHere) {
                        
                        [self addRunningChaserEnemySprite: bossEnemySpawnPointX y: bossEnemySpawnPointY];
                        
                        enemyHasSpawned = YES;
                    }
                }
            }
        }
    }
}

-(void) createNuclearExplosionEffectsSprites
{
    //Add white oval for nuclear explosion
    whiteOvalForNuclearExplosion1 = [CCSprite spriteWithFile:@"WhiteOval.png"];
    [self addChild: whiteOvalForNuclearExplosion1 z: 1900];
    whiteOvalForNuclearExplosion1.position = ccp(-300, -300);
    //[whiteOvalForNuclearExplosion1 runAction: [CCScaleTo actionWithDuration:0.0 scale:0.01]];
    whiteOvalForNuclearExplosion1.scale = 0.01;
    
    //Add the white for the flashbang
    solidWhiteFlashBang = [CCSprite spriteWithFile:@"SolidWhiteFlashbang.png"];
    [gameLayer addChild: solidWhiteFlashBang];
    solidWhiteFlashBang.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2);
    solidWhiteFlashBang.scale = 7.0;
    [solidWhiteFlashBang runAction: [CCFadeOut actionWithDuration:0.0]];
}

-(void) playBuzzerSound
{
    [[SimpleAudioEngine sharedEngine] playEffect:@"Buzzer.wav" pitch:1.0 pan:0.0 gain:0.5];
}

-(void) setBoxingGlovePowerUpToNotVisible
{
    for (PowerUps *powerUpSprite in powerUpsArray) {
        
        if (powerUpSprite.powerUpType == BOXING_GLOVE && powerUpSprite.visible == YES) {
            
            powerUpSprite.visible = NO;
        }
    }
}

-(void) pauseForBoxingGloveCollected
{
    firstPlayerHasBoxingGlove = YES;
    
    [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(setIsPausedToYes)], [CCDelayTime actionWithDuration:1.25], [CCCallFunc actionWithTarget:self selector:@selector(setIsPausedToNo)], [CCCallFunc actionWithTarget:self selector:@selector(setBoxingGlovePowerUpToNotVisible)], nil]];
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"CollectPowerUp.wav"];
    
//    if (playerColorAndGender == BLUE_BOY) {
    
        if (firstPlayerHasSneakers == NO) {
        
            //Have main player hold the Boxing Glove icon over his head and pause the game for a second.
            mainCharacterBlueBoyHoldingUpBoxingGlove.visible = YES;
            mainCharacterBlueBoyStandingStill.visible = NO;
            mainCharacterBlueBoyJumping.visible = NO;
            mainCharacterBlueBoyWalking.visible = NO;
            mainCharacterBlueBoyDead.visible = NO;
        }
        
        if (firstPlayerHasSneakers == YES) {
        
            mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers.visible = YES;
            mainCharacterBlueBoyStandingStillWithSneakers.visible = NO;
            mainCharacterBlueBoyJumpingWithSneakers.visible = NO;
            mainCharacterBlueBoyWalkingWithSneakers.visible = NO;
            mainCharacterBlueBoyDeadWithSneakers.visible = NO;
        }
//    }
    
    mainPlayerBoxingGloveGlow.visible = YES;
    
    //Move Boxing Glove power up icon above main player
    for (PowerUps *powerUpSprite in powerUpsArray) {
        
        if (powerUpSprite.powerUpType == BOXING_GLOVE && powerUpSprite.visible == YES) {
            
            [powerUpSprite runAction: [CCMoveTo actionWithDuration:0.03 position:ccp(firstPlayerSprite.position.x, firstPlayerSprite.position.y + 35)]];
        }
    }
        
    //Make his 'boxing glove aura' visible
}

-(void) gamePausedAction
{
    resumeGameLabelForPauseScreen.visible = YES;
    changeLevelLabelForPauseScreen.visible = YES;
    
    [self setIsPausedToYes];
    
    [blackLayerForPauseScreen setZOrder: 2000];
    [blackLayerForPauseScreen runAction: [CCFadeTo actionWithDuration:0.0 opacity:220]];
    blackLayerForPauseScreen.visible = YES;
    
    //Make all fireballs pause 
    for (fireball in fireballArray) {
        
        [self runAction: [CCCallFunc actionWithTarget:fireball selector:@selector(pauseSchedulerAndActions)]];
    }
}

-(void) gameResumeFromPauseAction
{
    resumeGameLabelForPauseScreen.visible = NO;
    changeLevelLabelForPauseScreen.visible = NO;
    
    [self setIsPausedToNo];
    
    blackLayerForPauseScreen.visible = NO;
    
    //Make all fireballs pause
    for (fireball in fireballArray) {
        
        [self runAction: [CCCallFunc actionWithTarget:fireball selector:@selector(resumeSchedulerAndActions)]];
    }
}

- (void) adColonyTakeoverEndedForZone:(NSString *)zone
                               withVC:(BOOL)withVirtualCurrencyAward {
    NSLog(@"AdColony video ad finished for zone %@", zone);

    if (currentScreen == GAME_OVER_SCREEN) {
        
        tapToContinueLabel.visible = YES;
        gameOverLabel.visible = YES;
    }
    
    else if (currentScreen == VICTORY_SCREEN) {
        
        chartBoostAdWasJustDismissed = YES;
    }
}

- (void) adColonyVideoAdNotServedForZone:(NSString *)zone {
    NSLog(@"AdColony did not serve a video for zone %@", zone);
    
    tapToContinueLabel.visible = YES;
    gameOverLabel.visible = YES;
    
    [cb showInterstitial];
}

-(void) jumpButtonPressed {
    
    jumpButton.visible = NO;
    jumpButtonPressed.visible = YES;
}

-(void) jumpButtonNotPressed {
    
    jumpButton.visible = YES;
    jumpButtonPressed.visible = NO;
}

-(void) activePowerUpButtonPressed {
    
    activePowerUpButton.visible = NO;
    activePowerUpButtonPressed.visible = YES;
}

-(void) activePowerUpButtonNotPressed {
    
    activePowerUpButton.visible = YES;
    activePowerUpButtonPressed.visible = NO;
}

-(void) dPadNotPressed {
    
    dPadNotPressed.visible = YES;
    dPadLeft.visible = NO;
    dPadRight.visible = NO;
}

-(void) dPadLeftPressed {
    
    dPadNotPressed.visible = NO;
    dPadLeft.visible = YES;
    dPadRight.visible = NO;
}

-(void) dPadRightPressed {
    
    dPadNotPressed.visible = NO;
    dPadLeft.visible = NO;
    dPadRight.visible = YES;
}

-(void) setLevelTotalTime
{
    if (currentLevel == 1) {
        
        timeInt = LEVEL_1_TIME;
    }
    
    else if (currentLevel == 2) {
        
        timeInt = LEVEL_2_TIME;
    }
    
    else if (currentLevel == 3) {
        
        timeInt = LEVEL_3_TIME;
    }
    
    else if (currentLevel == 4) {
        
        timeInt = LEVEL_4_TIME;
    }
    
    else if (currentLevel == 5) {
        
        timeInt = LEVEL_5_TIME;
    }
    
    else if (currentLevel == 6) {
        
        timeInt = LEVEL_6_TIME;
    }
    
    else if (currentLevel == 7) {
        
        timeInt = LEVEL_7_TIME;
    }
    
    else if (currentLevel == 8) {
        
        timeInt = LEVEL_8_TIME;
    }
    
    else if (currentLevel == 9) {
        
        timeInt = LEVEL_9_TIME;
    }
    
    else if (currentLevel == 10) {
        
        timeInt = LEVEL_10_TIME;
    }
    
    else if (currentLevel == 11) {
        
        timeInt = LEVEL_11_TIME;
    }
    
    else if (currentLevel == 12) {
        
        timeInt = LEVEL_12_TIME;
    }
    
    else if (currentLevel == 13) {
        
        timeInt = LEVEL_13_TIME;
    }
    
    else if (currentLevel == 14) {
        
        timeInt = LEVEL_14_TIME;
    }
    
    else if (currentLevel == 15) {
        
        timeInt = LEVEL_15_TIME;
    }
    
    else if (currentLevel == 16) {
        
        timeInt = LEVEL_16_TIME;
    }
    
    else if (currentLevel == 17) {
        
        timeInt = LEVEL_17_TIME;
    }
    
    else if (currentLevel == 18) {
        
        timeInt = LEVEL_18_TIME;
    }
    
    else if (currentLevel == 19) {
        
        timeInt = LEVEL_19_TIME;
    }
    
    else if (currentLevel == 20) {
        
        timeInt = LEVEL_20_TIME;
    }
    
    else if (currentLevel == 21) {
        
        timeInt = LEVEL_21_TIME;
    }
    
    else if (currentLevel == 22) {
        
        timeInt = LEVEL_22_TIME;
    }
    
    else if (currentLevel == 23) {
        
        timeInt = LEVEL_23_TIME;
    }
    
    else if (currentLevel == 24) {
        
        timeInt = LEVEL_24_TIME;
    }
    
    else if (currentLevel == 25) {
        
        timeInt = LEVEL_25_TIME;
    }
    
    else if (currentLevel == 26) {
        
        timeInt = LEVEL_26_TIME;
    }
    
    else if (currentLevel == 27) {
        
        timeInt = LEVEL_27_TIME;
    }
    
    else if (currentLevel == 28) {
        
        timeInt = LEVEL_28_TIME;
    }
    
    else if (currentLevel == 29) {
        
        timeInt = LEVEL_29_TIME;
    }
    
    else if (currentLevel == 30) {
        
        timeInt = LEVEL_30_TIME;
    }
    
    else if (currentLevel == 31) {
        
        timeInt = LEVEL_31_TIME;
    }
    
    else if (currentLevel == 32) {
        
        timeInt = LEVEL_32_TIME;
    }
    
    else if (currentLevel == 33) {
        
        timeInt = LEVEL_33_TIME;
    }
    
    else if (currentLevel == 34) {
        
        timeInt = LEVEL_34_TIME;
    }
    
    else if (currentLevel == 35) {
        
        timeInt = LEVEL_35_TIME;
    }
    
    else if (currentLevel == 36) {
        
        timeInt = LEVEL_36_TIME;
    }
    
    else if (currentLevel == 37) {
        
        timeInt = LEVEL_37_TIME;
    }
    
    else if (currentLevel == 38) {
        
        timeInt = LEVEL_38_TIME;
    }
    
    else if (currentLevel == 39) {
        
        timeInt = LEVEL_39_TIME;
    }
    
    else if (currentLevel == 40) {
        
        timeInt = LEVEL_40_TIME;
    }
    
    else if (currentLevel == 41) {
        
        timeInt = LEVEL_41_TIME;
    }
    
    else if (currentLevel == 42) {
        
        timeInt = LEVEL_42_TIME;
    }
    
    else if (currentLevel == 43) {
        
        timeInt = LEVEL_43_TIME;
    }
    
    else if (currentLevel == 44) {
        
        timeInt = LEVEL_44_TIME;
    }
    
    else if (currentLevel == 45) {
        
        timeInt = LEVEL_45_TIME;
    }
    
    else if (currentLevel == 46) {
        
        timeInt = LEVEL_46_TIME;
    }
    
    else if (currentLevel == 47) {
        
        timeInt = LEVEL_47_TIME;
    }
    
    else if (currentLevel == 48) {
        
        timeInt = LEVEL_48_TIME;
    }
    
    else if (currentLevel == 49) {
        
        timeInt = LEVEL_49_TIME;
    }
    
    else if (currentLevel == 50) {
        
        timeInt = LEVEL_50_TIME;
    }
    
    else if (currentLevel == 51) {
        
        timeInt = LEVEL_51_TIME;
    }
    
    else if (currentLevel == 52) {
        
        timeInt = LEVEL_52_TIME;
    }
    
    else if (currentLevel == 53) {
        
        timeInt = LEVEL_53_TIME;
    }
    
    else if (currentLevel == 54) {
        
        timeInt = LEVEL_54_TIME;
    }
    
    else if (currentLevel == 55) {
        
        timeInt = LEVEL_55_TIME;
    }
    
    else if (currentLevel == 56) {
        
        timeInt = LEVEL_56_TIME;
    }
    
    else if (currentLevel == 57) {
        
        timeInt = LEVEL_57_TIME;
    }
    
    else if (currentLevel == 58) {
        
        timeInt = LEVEL_58_TIME;
    }
    
    else if (currentLevel == 59) {
        
        timeInt = LEVEL_59_TIME;
    }
    
    else if (currentLevel == 60) {
        
        timeInt = LEVEL_60_TIME;
    }
}


-(void) fastFirstPlayerInvincibilityRainbowAction
{
    fastInvincibilityRainbowActionRunning = YES;
    
    for (CCSprite *firstPlayerSpriteChild in firstPlayerSpritesArray) {
        
        fastInvincibilityRainbowAction = [firstPlayerSpriteChild runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.05], [CCTintTo actionWithDuration:0.0 red:255 green:0 blue:0], [CCDelayTime actionWithDuration:0.05], [CCTintTo actionWithDuration:0.0 red:0 green:255 blue:0], [CCDelayTime actionWithDuration:0.05], [CCTintTo actionWithDuration:0.0 red:0 green:0 blue:255], [CCDelayTime actionWithDuration:0.05], [CCTintTo actionWithDuration:0.0 red:255 green:255 blue:255], [CCDelayTime actionWithDuration:0.05], [CCTintTo actionWithDuration:0.0 red:255 green:255 blue:0], nil]]];
        
        //Stop fastInvcinbilityRainAction after 10sec
        [firstPlayerSpriteChild performSelector:@selector(stopAction:) withObject:fastInvincibilityRainbowAction afterDelay:10];
        [self performSelector:@selector(slowFirstPlayerInvincibilityRainbowAction) withObject:nil afterDelay:10];
    }
}

-(void) slowFirstPlayerInvincibilityRainbowAction
{
    //Write code to slow down firstPlayer sprite rainbow flashing
    for (CCSprite *firstPlayerSpriteChild in firstPlayerSpritesArray) {
        
        slowInvincibilityRainbowAction = [firstPlayerSpriteChild runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.25], [CCTintTo actionWithDuration:0.0 red:255 green:0 blue:0], [CCDelayTime actionWithDuration:0.25], [CCTintTo actionWithDuration:0.0 red:0 green:255 blue:0], [CCDelayTime actionWithDuration:0.25], [CCTintTo actionWithDuration:0.0 red:0 green:0 blue:255], [CCDelayTime actionWithDuration:0.25], [CCTintTo actionWithDuration:0.0 red:255 green:255 blue:255], [CCDelayTime actionWithDuration:0.25], [CCTintTo actionWithDuration:0.0 red:255 green:255 blue:0], nil]]];
        
        [firstPlayerSpriteChild performSelector:@selector(stopAction:) withObject:slowInvincibilityRainbowAction afterDelay:2.5];
    }
    
    //After the 2.5 seconds of slowInvincibilityRainbowing, set firstPlayer to not invincible
    [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCCallFunc actionWithTarget:self selector:@selector(setPlayerHasInvincibilityPowerUpBooleanToNo)], nil]];
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        enemyReferenceNumberGlobal = -1;
        totalEnemyReferenceNumbersGlobal = 0;
        
        if ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON ) {
            
            deviceIsWidescreen = YES;
        }
        
        else {
            
            deviceIsWidescreen = NO;
        }
        
        [Kamcord setVideoResolution: TRAILER_VIDEO_RESOLUTION];
        
        [self loadGameSettings];
        
        fastInvincibilityRainbowActionRunning = NO;
        slowInvincibilityRainbowActionRunning = NO;
        chartBoostAdWasJustDismissed = NO;
        powerUpCurrentlySelected = STUN_POWER_UP_SELECTED;
        activePowerUpButtonIsEmpty = YES;
        mindControlPowerUpsLeft = 1;
        stunBombsLeft = 1;
        stunProjectilesLeft = 1;
        globalStunPowerUpsLeft = 1;
        enemyTotalStunTime = ENEMY_STUN_TIME;
        powerUpAlreadyExists = NO;
        firstPlayerHasSneakers = NO;
        firstPlayerHeadHittingBlock = NO;
        firstPlayerCurrentlyDead = NO;
        firstPlayerCurrentlyInvincible = NO;
        madAgentsAmount = 0;
        isPaused = NO;
        firstPlayerHasTimeBomb = NO;
        timeBombPlacedOnDoor = NO;
        progressToNextLevelAlreadyRunning = NO;
        exitDoorIsOpen = NO;
        levelInSession = NO;
        activePowerUpButton = NO;
        playerHasInvincibilityPowerUp = NO;
        playerHasDoubleJumpPowerUp = NO;
        playersNumberOfJumpsAvailable = 1;
        bulletTimeActive = NO;
        bulletTimeSpeedReduction = 0;
        firstPlayerFacingRight = YES;
        numberOfStarsCollected = 0;
        enteringNameFromMainMenuScreen = NO;
        enteringNameFromLoadProfileScreen = NO;
        currentScreen = MAIN_MENU_SCREEN;
        currentLevel = CURRENT_LEVEL_BEING_TESTED;
        inGameCurrencyAmount = 0;
        gameMusicAlreadyPlaying = NO;
        isPlayer1 = YES;
        isSinglePlayer = YES;
        player1VersusTotalWins = 0;
        player2VersusTotalWins = 0;
        activePowerUpButtonTouched = NO;
        leftArrowButtonTouched = NO;
        rightArrowButtonTouched = NO;
        toPauseOrNotToPause = YES;
        pauseButtonTouched = NO;
        firstPlayerHasBoxingGlove = NO;
        enemiesLeftValue = 0;
        watchedAdColonyAdForSpeedShoes = NO;
        bossLevelLastEnemySpawnPointUsed = 0;
        
        
        [self powerUpSelected];
        
        if (currentLevel == 10 || currentLevel == 20 || currentLevel == 30 || currentLevel == 40 || currentLevel == 50 || currentLevel == 60) {
            
            isBossLevel = YES;
        }
        
        else {
            
            isBossLevel = NO;
        }
        
        
        secondPlayerSprite.mySprite.flipX = YES;
        
        if (isSinglePlayer && !isBossLevel)
            timeInt = LEVEL_TIMER_SET_TO;
        else if (!isSinglePlayer || isBossLevel)
           timeInt = 0;
            
        //secs = 0;
        //mins = 0;
        
        [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:NO];

    //    pinchGestureRecognizer = [[[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinchFrom:)] autorelease];
    //    pinchGestureRecognizer.delegate = self;
    //    [[[CCDirector sharedDirector] openGLView] addGestureRecognizer:pinchGestureRecognizer];

        enemySpritesArray = [[NSMutableArray alloc] init];
        enemySkeletonWhaleSpritesArray = [[NSMutableArray alloc] init];
        firstPlayerSpriteArray = [[NSMutableArray alloc] init];
        fireballArray = [[NSMutableArray alloc] init];
        enemyDiagonalFlyerEnemySpritesArray = [[NSMutableArray alloc] init];
        runningChaserEnemySpritesArray = [[NSMutableArray alloc] init];
        powerUpsArray = [[NSMutableArray alloc] init];
        exitDoorArray = [[NSMutableArray alloc] init];
        timeBombArray = [[NSMutableArray alloc] init];
        stunPowerUpArray = [[NSMutableArray alloc] init];
        enemyHidgonSpritesArray = [[NSMutableArray alloc] init];
        mindControlPowerUpArray = [[NSMutableArray alloc] init];
        friendlyEnemyArray = [[NSMutableArray alloc] init];
        flyThroughWallsDiagonalFlyerEnemySpritesArray = [[NSMutableArray alloc] init];
        stunProjectileArray = [[NSMutableArray alloc] init];
        movingDoorArray = [[NSMutableArray alloc] init];
        inGameButtonArray = [[NSMutableArray alloc] init];
        secondPlayerSpriteArray = [[NSMutableArray alloc] init];
        hidgonMovementsArrayForPlayer2 = [[NSMutableArray alloc] init];
        enemyPositionsForPlayer2Array = [[NSMutableArray alloc] init];
        downwardShooterEnemySpritesArray = [[NSMutableArray alloc] init];
        parkourJumperEnemySpritesArray = [[NSMutableArray alloc] init];
        parkourJumperMovementsArrayForPlayer2 = [[NSMutableArray alloc] init];
        
        gameLayer = [CCLayerColor layerWithColor:ccc4(0,0,0,0)];
        [self addChild: gameLayer z: 0];
        
        menuLayer = [CCLayerColor layerWithColor:ccc4(0,0,0,0)];
        [self addChild: menuLayer z: 0];
        
        characterSelectionLayer = [CCLayerColor layerWithColor:ccc4(0,0,0,0)];
        [self addChild: characterSelectionLayer z: 0];
        
        gameMoveableLayer = [CCLayerColor layerWithColor:ccc4(0,0,0,0)];
        [self addChild: gameMoveableLayer z: 0];
        
        hudLayer = [CCLayerColor layerWithColor:ccc4(0,0,0,0)];
        [self addChild: hudLayer z: 10];
        
        blueInventorySlot1 = [CCSprite spriteWithFile: @"RoundedRectangle.png"];
        [hudLayer addChild: blueInventorySlot1 z: -5];
        blueInventorySlot1.scaleX = 0.35 + 0.05;
        blueInventorySlot1.scaleY = 0.48 + 0.05;
        blueInventorySlot1.position = ccp(-23.5, 295);
        blueInventorySlot1.color = ccBLUE;
        blueInventorySlot1.opacity = 185;
        blueInventorySlot1.anchorPoint = ccp(0.5, 0.5);
        blueInventorySlot1.visible = NO;
                                       
        blueInventorySlot2 = [CCSprite spriteWithFile: @"RoundedRectangle.png"];
        [hudLayer addChild: blueInventorySlot2 z: -5];
        blueInventorySlot2.scaleX = 0.35 + 0.05;
        blueInventorySlot2.scaleY = 0.48 + 0.05;
        blueInventorySlot2.position = ccp(blueInventorySlot1.position.x, blueInventorySlot1.position.y - 80);
        blueInventorySlot2.color = ccBLUE;
        blueInventorySlot2.opacity = 185;
        blueInventorySlot2.anchorPoint = ccp(0.5, 0.5);
        blueInventorySlot2.visible = NO;
        
        blueInventorySlot3 = [CCSprite spriteWithFile: @"RoundedRectangle.png"];
        [hudLayer addChild: blueInventorySlot3 z: -5];
        blueInventorySlot3.scaleX = 0.35 + 0.05;
        blueInventorySlot3.scaleY = 0.48 + 0.05;
        blueInventorySlot3.position = ccp(blueInventorySlot1.position.x, blueInventorySlot1.position.y - 160);
        blueInventorySlot3.color = ccBLUE;
        blueInventorySlot3.opacity = 185;
        blueInventorySlot3.anchorPoint = ccp(0.5, 0.5);
        blueInventorySlot3.visible = NO;
        
        /*
        redInventorySlot4 = [CCSprite spriteWithFile: @"RedButton.png"];
        [hudLayer addChild: redInventorySlot4 z: -5];
        redInventorySlot4.scale = 0.32;
        redInventorySlot4.position = ccp(504, 295);
        redInventorySlot4.opacity = 185;
        redInventorySlot4.anchorPoint = ccp(0.5, 0.5);
        
        redInventorySlot5 = [CCSprite spriteWithFile: @"RedButton.png"];
        [hudLayer addChild: redInventorySlot5 z: -5];
        redInventorySlot5.scale = 0.32;
        redInventorySlot5.position = ccp(redInventorySlot4.position.x, redInventorySlot4.position.y - 80);
        redInventorySlot5.opacity = 185;
        redInventorySlot5.anchorPoint = ccp(0.5, 0.5);
        
        redInventorySlot6 = [CCSprite spriteWithFile: @"RedButton.png"];
        [hudLayer addChild: redInventorySlot6 z: -5];
        redInventorySlot6.scale = 0.32;
        redInventorySlot6.position = ccp(redInventorySlot4.position.x, redInventorySlot4.position.y - 160);
        redInventorySlot6.opacity = 185;
        redInventorySlot6.anchorPoint = ccp(0.5, 0.5);
        */
        //Add jump button
        jumpButton = [CCSprite spriteWithFile: @"AButtonNotPressed.png"];
        jumpButton.scale = 0.44;
        jumpButton.opacity = 130;
        [hudLayer addChild: jumpButton];
        jumpButtonPressed = [CCSprite spriteWithFile: @"AButtonPressed.png"];
        jumpButtonPressed.scale = 0.44;
        jumpButtonPressed.opacity = 130;
        jumpButtonPressed.visible = NO;
        [hudLayer addChild: jumpButtonPressed];
        
        //Add active power up activation button
        activePowerUpButton = [CCSprite spriteWithFile: @"BButtonNotPressed.png"];
        activePowerUpButton.scale = 0.44;
        activePowerUpButton.opacity = 130;
        activePowerUpButton.anchorPoint = ccp(0.5, 0.5);
        [hudLayer addChild: activePowerUpButton z: -10];
        activePowerUpButtonPressed = [CCSprite spriteWithFile: @"BButtonPressed.png"];
        activePowerUpButtonPressed.scale = 0.44;
        activePowerUpButtonPressed.opacity = 130;
        activePowerUpButtonPressed.anchorPoint = ccp(0.5, 0.5);
        activePowerUpButtonPressed.visible = NO;
        [hudLayer addChild: activePowerUpButtonPressed z: -10];
        
        //Add black layer for pause screen
        blackLayerForPauseScreen = [CCSprite spriteWithFile:@"SolidWhiteFlashbang.png"];
        [self addChild: blackLayerForPauseScreen z:2000];
        blackLayerForPauseScreen.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2);
        blackLayerForPauseScreen.scale = 7.0;
        blackLayerForPauseScreen.color = ccBLACK;
        [blackLayerForPauseScreen runAction: [CCFadeTo actionWithDuration:0.0 opacity:220]];
        blackLayerForPauseScreen.visible = NO;
        
        //Resume Game Label for Pause Screen
        resumeGameLabelForPauseScreen = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Resume"] fntFile:@"PixelArtFont.fnt"];
        [resumeGameLabelForPauseScreen setAnchorPoint:ccp(0.5, 0.5)];
        resumeGameLabelForPauseScreen.scale = 1.3;
        //Make z-layer greater than black pause layer
        [self addChild:resumeGameLabelForPauseScreen z: 3000];
        resumeGameLabelForPauseScreen.visible = NO;
        resumeGameLabelForPauseScreen.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 25);
        
        //Resume Game Label for Pause Screen
        changeLevelLabelForPauseScreen = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Change Level"] fntFile:@"PixelArtFont.fnt"];
        [changeLevelLabelForPauseScreen setAnchorPoint:ccp(0.5, 0.5)];
        changeLevelLabelForPauseScreen.scale = 1.3;
        //Make z-layer greater than black pause layer
        [self addChild:changeLevelLabelForPauseScreen z: 3000];
        changeLevelLabelForPauseScreen.visible = NO;
        changeLevelLabelForPauseScreen.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 45);
        
        if (deviceIsWidescreen) {
            
            jumpButton.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 240, [[CCDirector sharedDirector] winSize].height/2 - 187);
            activePowerUpButton.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 130, [[CCDirector sharedDirector] winSize].height/2 - 187);
            jumpButtonPressed.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 240, [[CCDirector sharedDirector] winSize].height/2 - 187);
            activePowerUpButtonPressed.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 130, [[CCDirector sharedDirector] winSize].height/2 - 187);
        }
        
        if (!deviceIsWidescreen) {
            
            jumpButton.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 240, [[CCDirector sharedDirector] winSize].height/2 - 188);
            activePowerUpButton.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 130, [[CCDirector sharedDirector] winSize].height/2 - 188);
            jumpButtonPressed.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 240, [[CCDirector sharedDirector] winSize].height/2 - 188);
            activePowerUpButtonPressed.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 130, [[CCDirector sharedDirector] winSize].height/2 - 188);
        }
        
        /*Store Icons*/
        //BulletTimePowerUp Purchase Icon
        bulletTimePowerUpPurchaseIcon = [CCSprite spriteWithFile:@"Clock.png"];
        bulletTimePowerUpPurchaseIcon.scale = 1.5;
        bulletTimePowerUpPurchaseIcon.anchorPoint = ccp(0.5, 0.5);
        [self addChild: bulletTimePowerUpPurchaseIcon z: 10];
        bulletTimePowerUpPurchaseIcon.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 100, [[CCDirector sharedDirector] winSize].height/2 + 406);
        
        //BulletTimePowerUp Purchase Icon Name Label
        CCLabelBMFont *bulletTimePowerUpPurchaseIconNameLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Bullet Time"] fntFile:@"PixelArtFont.fnt"];
        [bulletTimePowerUpPurchaseIconNameLabel setAnchorPoint:ccp(0.5, 0.5)];
        bulletTimePowerUpPurchaseIconNameLabel.scale = 0.27;
        [bulletTimePowerUpPurchaseIcon addChild:bulletTimePowerUpPurchaseIconNameLabel z: 100];
        bulletTimePowerUpPurchaseIconNameLabel.position = ccp(bulletTimePowerUpPurchaseIconNameLabel.position.x + 15, bulletTimePowerUpPurchaseIconNameLabel.position.y + 42.5);
        
        //BulletTimePowerUp Purchase Icon Pricetag
        bulletTimePowerUpPurchaseIconPriceValue = BULLET_TIME_PRICE;
        CCLabelBMFont *bulletTimePowerUpPurchaseIconPriceLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", bulletTimePowerUpPurchaseIconPriceValue] fntFile:@"PixelArtFont.fnt"];
        [bulletTimePowerUpPurchaseIconPriceLabel setAnchorPoint:ccp(0.5, 0.5)];
        bulletTimePowerUpPurchaseIconPriceLabel.scale = 0.56;
        [bulletTimePowerUpPurchaseIcon addChild:bulletTimePowerUpPurchaseIconPriceLabel z: 100];
        bulletTimePowerUpPurchaseIconPriceLabel.position = ccp(bulletTimePowerUpPurchaseIconPriceLabel.position.x + 15, bulletTimePowerUpPurchaseIconPriceLabel.position.y - 10);
        
        
        //InvincibilityPowerUp Purchase Icon
        invincibilityPowerUpPurchaseIcon = [CCSprite spriteWithFile:@"StarPowerUp.png"];
        invincibilityPowerUpPurchaseIcon.scale = 0.85;
        invincibilityPowerUpPurchaseIcon.anchorPoint = ccp(0.5, 0.5);
        [self addChild: invincibilityPowerUpPurchaseIcon z: 10];
        invincibilityPowerUpPurchaseIcon.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 0, [[CCDirector sharedDirector] winSize].height/2 + 410);
        
        //InvincibilityPowerUp Purchase Icon Name Label
        CCLabelBMFont *invincibilityPowerUpPurchaseIconNameLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Invincibility"] fntFile:@"PixelArtFont.fnt"];
        [invincibilityPowerUpPurchaseIconNameLabel setAnchorPoint:ccp(0.5, 0.5)];
        invincibilityPowerUpPurchaseIconNameLabel.scale = 0.45;
        [invincibilityPowerUpPurchaseIcon addChild:invincibilityPowerUpPurchaseIconNameLabel z: 100];
        invincibilityPowerUpPurchaseIconNameLabel.position = ccp(invincibilityPowerUpPurchaseIconNameLabel.position.x + 32, invincibilityPowerUpPurchaseIconNameLabel.position.y + 69);
        
        //InvincibilityPowerUp Purchase Icon Pricetag
        invincibilityPowerUpPurchaseIconPriceValue = 500;
        CCLabelBMFont *invincibilityPowerUpPurchaseIconPriceLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", invincibilityPowerUpPurchaseIconPriceValue] fntFile:@"PixelArtFont.fnt"];
        [invincibilityPowerUpPurchaseIconPriceLabel setAnchorPoint:ccp(0.5, 0.5)];
        invincibilityPowerUpPurchaseIconPriceLabel.scale = 1.0;
        [invincibilityPowerUpPurchaseIcon addChild:invincibilityPowerUpPurchaseIconPriceLabel z: 100];
        invincibilityPowerUpPurchaseIconPriceLabel.position = ccp(invincibilityPowerUpPurchaseIconPriceLabel.position.x + 30, invincibilityPowerUpPurchaseIconPriceLabel.position.y - 20);
        
        
        
        //StunBomb Purchase Icon
        stunBombPurchaseIcon = [CCSprite spriteWithFile:@"StunPowerUp.png"];
        stunBombPurchaseIcon.scale = 1.5;
        stunBombPurchaseIcon.anchorPoint = ccp(0.5, 0.5);
        [self addChild: stunBombPurchaseIcon z: 10];
        stunBombPurchaseIcon.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 100, [[CCDirector sharedDirector] winSize].height/2 + 550);
        
        //StunBomb Purchase Icon Name Label
        CCLabelBMFont *stunBombPurchaseIconNameLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Stun Bomb"] fntFile:@"PixelArtFont.fnt"];
        [stunBombPurchaseIconNameLabel setAnchorPoint:ccp(0.5, 0.5)];
        stunBombPurchaseIconNameLabel.scale = 0.25;
        [stunBombPurchaseIcon addChild:stunBombPurchaseIconNameLabel z: 100];
        stunBombPurchaseIconNameLabel.position = ccp(stunBombPurchaseIconNameLabel.position.x + 15, stunBombPurchaseIconNameLabel.position.y + 40);
        
        //StunBomb Purchase Icon Pricetag
        stunBombPurchaseIconPriceValue = STUN_BOMB_PRICE;
        CCLabelBMFont *stunBombPurchaseIconPriceLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", stunBombPurchaseIconPriceValue] fntFile:@"PixelArtFont.fnt"];
        [stunBombPurchaseIconPriceLabel setAnchorPoint:ccp(0.5, 0.5)];
        stunBombPurchaseIconPriceLabel.scale = 0.6;
        [stunBombPurchaseIcon addChild:stunBombPurchaseIconPriceLabel z: 100];
        stunBombPurchaseIconPriceLabel.position = ccp(stunBombPurchaseIconPriceLabel.position.x + 15, stunBombPurchaseIconPriceLabel.position.y - 10);
        
        //Mind Controller Purchase Icon
        mindControllerPurchaseIcon = [CCSprite spriteWithFile:@"MindControlCocktail.png"];
        mindControllerPurchaseIcon.scale = 1.5;
        mindControllerPurchaseIcon.anchorPoint = ccp(0.5, 0.5);
        [self addChild: mindControllerPurchaseIcon z: 10];
        mindControllerPurchaseIcon.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 0, [[CCDirector sharedDirector] winSize].height/2 + 550);
        
        //Mind Controller Purchase Icon Name Label
        CCLabelBMFont *mindControllerPurchaseIconPriceLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Mind Controller"] fntFile:@"PixelArtFont.fnt"];
        [mindControllerPurchaseIconPriceLabel setAnchorPoint:ccp(0.5, 0.5)];
        mindControllerPurchaseIconPriceLabel.scale = 0.25;
        [mindControllerPurchaseIcon addChild:mindControllerPurchaseIconPriceLabel z: 100];
        mindControllerPurchaseIconPriceLabel.position = ccp(mindControllerPurchaseIconPriceLabel.position.x + 15, mindControllerPurchaseIconPriceLabel.position.y + 40);
        
        //Mind Controller Purchase Icon Pricetag
        mindControllerPurchaseIconPriceValue = MIND_CONTROL_PRICE;
        CCLabelBMFont *mindControllerPurchaseIconNameLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", mindControllerPurchaseIconPriceValue] fntFile:@"PixelArtFont.fnt"];
        [mindControllerPurchaseIconNameLabel setAnchorPoint:ccp(0.5, 0.5)];
        mindControllerPurchaseIconNameLabel.scale = 0.6;
        [mindControllerPurchaseIcon addChild:mindControllerPurchaseIconNameLabel z: 100];
        mindControllerPurchaseIconNameLabel.position = ccp(mindControllerPurchaseIconNameLabel.position.x + 15, mindControllerPurchaseIconNameLabel.position.y - 10);

        
        //Stun-Projectile Purchase Icon
        stunProjectilePurchaseIcon = [CCSprite spriteWithFile:@"LightningBubble.png"];
        stunProjectilePurchaseIcon.scale = 1.35;
        stunProjectilePurchaseIcon.anchorPoint = ccp(0.5, 0.5);
        [self addChild: stunProjectilePurchaseIcon z: 10];
        stunProjectilePurchaseIcon.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 100, [[CCDirector sharedDirector] winSize].height/2 + 549);
        
        //Stun-Projectile Purchase Icon Name Label
        CCLabelBMFont *stunProjectilePurchaseIconNameLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Stun Gun"] fntFile:@"PixelArtFont.fnt"];
        [stunProjectilePurchaseIconNameLabel setAnchorPoint:ccp(0.5, 0.5)];
        stunProjectilePurchaseIconNameLabel.scale = 0.28;
        [stunProjectilePurchaseIcon addChild:stunProjectilePurchaseIconNameLabel z: 100];
        stunProjectilePurchaseIconNameLabel.position = ccp(stunProjectilePurchaseIconNameLabel.position.x + 15, stunProjectilePurchaseIconNameLabel.position.y + 43.5);
        
        //Stun-Projectile Purchase Icon Price Tag
        stunProjectilePurchaseIconPriceValue = STUN_PROJECTILE_PRICE;
        CCLabelBMFont *stunProjectilePurchaseIconPriceLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", stunProjectilePurchaseIconPriceValue] fntFile:@"PixelArtFont.fnt"];
        [stunProjectilePurchaseIconPriceLabel setAnchorPoint:ccp(0.5, 0.5)];
        stunProjectilePurchaseIconPriceLabel.scale = 0.6;
        [stunProjectilePurchaseIcon addChild:stunProjectilePurchaseIconPriceLabel z: 100];
        stunProjectilePurchaseIconPriceLabel.position = ccp(stunProjectilePurchaseIconPriceLabel.position.x + 15, stunProjectilePurchaseIconPriceLabel.position.y - 10);
        
        
        
        //Global Stun Purchase Icon
        globalStunPurchaseIcon = [CCSprite spriteWithFile:@"RedCross.png"];
        globalStunPurchaseIcon.scale = 1.6;
        globalStunPurchaseIcon.anchorPoint = ccp(0.5, 0.5);
        [self addChild: globalStunPurchaseIcon z: 10];
        globalStunPurchaseIcon.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 100, [[CCDirector sharedDirector] winSize].height/2 + 410);
        
        //Global Stun Purchase Icon Name Label
        CCLabelBMFont *globalStunPurchaseIconNameLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Stun Everything"] fntFile:@"PixelArtFont.fnt"];
        [globalStunPurchaseIconNameLabel setAnchorPoint:ccp(0.5, 0.5)];
        globalStunPurchaseIconNameLabel.scale = 0.25;
        [globalStunPurchaseIcon addChild:globalStunPurchaseIconNameLabel z: 100];
        globalStunPurchaseIconNameLabel.position = ccp(globalStunPurchaseIconNameLabel.position.x + 15, globalStunPurchaseIconNameLabel.position.y + 37.5);
        
        //Global Stun Purchase Icon Pricetag
        globalStunPurchaseIconPriceValue = GLOBAL_STUN_PRICE;
        CCLabelBMFont *globalStunPurchaseIconPriceLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", globalStunPurchaseIconPriceValue] fntFile:@"PixelArtFont.fnt"];
        [globalStunPurchaseIconPriceLabel setAnchorPoint:ccp(0.5, 0.5)];
        globalStunPurchaseIconPriceLabel.scale = 0.53;
        [globalStunPurchaseIcon addChild:globalStunPurchaseIconPriceLabel z: 100];
        globalStunPurchaseIconPriceLabel.position = ccp(globalStunPurchaseIconPriceLabel.position.x + 15, globalStunPurchaseIconPriceLabel.position.y - 10);
        

        //Sneaker Purchase Icon
        sneakerPurchaseIcon = [CCSprite spriteWithFile:@"Sneaker.png"];
        sneakerPurchaseIcon.scale = 1.5;
        sneakerPurchaseIcon.anchorPoint = ccp(0.5, 0.5);
        [hudLayer addChild: sneakerPurchaseIcon z: 10];
        sneakerPurchaseIcon.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 100, [[CCDirector sharedDirector] winSize].height/2 + 275);
        
        //Sneaker Purchase Icon Name Label
        CCLabelBMFont *sneakerPurchaseIconNameLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Sneaker"] fntFile:@"PixelArtFont.fnt"];
        [sneakerPurchaseIconNameLabel setAnchorPoint:ccp(0.5, 0.5)];
        sneakerPurchaseIconNameLabel.scale = 0.25;
        [sneakerPurchaseIcon addChild:sneakerPurchaseIconNameLabel z: 100];
        sneakerPurchaseIconNameLabel.position = ccp(sneakerPurchaseIconNameLabel.position.x + 15, sneakerPurchaseIconNameLabel.position.y + 40);
        
        //Sneaker Purchase Icon Pricetag
        sneakerPurchaseIconPriceValue = SNEAKERS_PRICE;
        CCLabelBMFont *sneakerPurchaseIconPriceLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", sneakerPurchaseIconPriceValue] fntFile:@"PixelArtFont.fnt"];
        [sneakerPurchaseIconPriceLabel setAnchorPoint:ccp(0.5, 0.5)];
        sneakerPurchaseIconPriceLabel.scale = 0.6;
        [sneakerPurchaseIcon addChild:sneakerPurchaseIconPriceLabel z: 100];
        sneakerPurchaseIconPriceLabel.position = ccp(sneakerPurchaseIconPriceLabel.position.x + 15, sneakerPurchaseIconPriceLabel.position.y - 10);
        
        
        /*
        //Clock icon for bullet time activation button
        bulletTimePowerUpForActivePowerUpButton = [CCSprite spriteWithFile: @"Clock.png"];
        bulletTimePowerUpForActivePowerUpButton.scale = 0.9;
        bulletTimePowerUpForActivePowerUpButton.anchorPoint = ccp(0.5, 0.5);
        bulletTimePowerUpForActivePowerUpButton.opacity = 100;
        [hudLayer addChild: bulletTimePowerUpForActivePowerUpButton z: 10];
        bulletTimePowerUpForActivePowerUpButton.position = ccp(redInventorySlot5.position.x, redInventorySlot5.position.y);
        
        bulletTimePowerUpsLeftCounterLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", bulletTimePowerUpsLeft] fntFile:@"PixelArtFont.fnt"];
        [bulletTimePowerUpsLeftCounterLabel setAnchorPoint:ccp(0.5, 0.5)];
        bulletTimePowerUpsLeftCounterLabel.scale = 0.6;
        [bulletTimePowerUpForActivePowerUpButton addChild:bulletTimePowerUpsLeftCounterLabel z: 10];
        bulletTimePowerUpsLeftCounterLabel.position = ccp(18, 18);
        
        //Invincibility star icon for invincibility star activation button
        invincibilityPowerUpForActivePowerUpButton = [CCSprite spriteWithFile: @"StarPowerUp.png"];
        invincibilityPowerUpForActivePowerUpButton.scale = 0.4;
        invincibilityPowerUpForActivePowerUpButton.anchorPoint = ccp(0.5, 0.5);
        invincibilityPowerUpForActivePowerUpButton.opacity = 100;
        [hudLayer addChild: invincibilityPowerUpForActivePowerUpButton z: 10];
        invincibilityPowerUpForActivePowerUpButton.position = ccp(redInventorySlot4.position.x, redInventorySlot4.position.y);

        invincibilityPowerUpsLeftCounterLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", invincibilityPowerUpsLeft] fntFile:@"PixelArtFont.fnt"];
        [invincibilityPowerUpsLeftCounterLabel setAnchorPoint:ccp(0.5, 0.5)];
        invincibilityPowerUpsLeftCounterLabel.scale = 1.35;
        [invincibilityPowerUpForActivePowerUpButton addChild:invincibilityPowerUpsLeftCounterLabel z: 10];
        invincibilityPowerUpsLeftCounterLabel.position = ccp(32, 30);
        
        
        
        //Global Stun for Active Powerup Button
        globalStunForActivePowerUpButton = [CCSprite spriteWithFile: @"RedCross.png"];
        globalStunForActivePowerUpButton.scale = 1.0;
        globalStunForActivePowerUpButton.anchorPoint = ccp(0.5, 0.5);
        globalStunForActivePowerUpButton.opacity = 100;
        [hudLayer addChild: globalStunForActivePowerUpButton z: 10];
        globalStunForActivePowerUpButton.position = ccp(redInventorySlot6.position.x, redInventorySlot6.position.y);
        
        globalStunPowerUpsLeftCounterLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", globalStunPowerUpsLeft] fntFile:@"PixelArtFont.fnt"];
        [globalStunPowerUpsLeftCounterLabel setAnchorPoint:ccp(0.5, 0.5)];
        globalStunPowerUpsLeftCounterLabel.scale = 0.6;
        [globalStunForActivePowerUpButton addChild:globalStunPowerUpsLeftCounterLabel z: 10];
        globalStunPowerUpsLeftCounterLabel.position = ccp(18, 18);
        */
        
        
        //Stun Bomb for Active Powerup Button
        stunBombForActivePowerUpButton = [CCSprite spriteWithFile: @"StunBomb.png"];
        stunBombForActivePowerUpButton.scale = 1.5;
        stunBombForActivePowerUpButton.anchorPoint = ccp(0.5, 0.5);
       // stunBombForActivePowerUpButton.opacity = 100;
        [self addChild: stunBombForActivePowerUpButton z: 10];
        stunBombForActivePowerUpButton.position = ccp(activePowerUpButton.position.x, activePowerUpButton.position.y);
        
        stunBombsLeftCounterLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", stunBombsLeft] fntFile:@"PixelArtFont.fnt"];
        [stunBombsLeftCounterLabel setAnchorPoint:ccp(0.5, 0.5)];
        stunBombsLeftCounterLabel.scale = 0.6;
        [stunBombForActivePowerUpButton addChild:stunBombsLeftCounterLabel z: 10];
        stunBombsLeftCounterLabel.position = ccp(18, 18);
        
        //MindControlCocktail for Active Powerup Button
        mindControlCocktailForActivePowerUpButton = [CCSprite spriteWithFile: @"LovePill.png"];
        mindControlCocktailForActivePowerUpButton.scale = 0.8;
       // mindControlCocktailForActivePowerUpButton.opacity = 100;
        mindControlCocktailForActivePowerUpButton.anchorPoint = ccp(0.5, 0.5);
        [hudLayer addChild: mindControlCocktailForActivePowerUpButton z: 10];
        mindControlCocktailForActivePowerUpButton.position = ccp(activePowerUpButton.position.x, activePowerUpButton.position.y);
        
        mindControlCocktailsLeftCounterLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", stunBombsLeft] fntFile:@"PixelArtFont.fnt"];
        [mindControlCocktailsLeftCounterLabel setAnchorPoint:ccp(0.5, 0.5)];
        mindControlCocktailsLeftCounterLabel.scale = 0.75;
        [mindControlCocktailForActivePowerUpButton addChild:mindControlCocktailsLeftCounterLabel z: 10];
        mindControlCocktailsLeftCounterLabel.position = ccp(18, 18);
        
        //Stun Projectile for Active Powerup Button
        stunProjectileForActivePowerUpButton = [CCSprite spriteWithFile: @"StunProjectiles.png"];
        stunProjectileForActivePowerUpButton.scale = 0.9;
      //  stunProjectileForActivePowerUpButton.opacity = 100;
        stunProjectileForActivePowerUpButton.anchorPoint = ccp(0.5, 0.5);
        [hudLayer addChild: stunProjectileForActivePowerUpButton z: 10];
        stunProjectileForActivePowerUpButton.position = ccp(activePowerUpButton.position.x, activePowerUpButton.position.y);
        
        stunProjectilesLeftCounterLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", stunProjectilesLeft] fntFile:@"PixelArtFont.fnt"];
        [stunProjectilesLeftCounterLabel setAnchorPoint:ccp(0.5, 0.5)];
        stunProjectilesLeftCounterLabel.scale = 0.6;
        [stunProjectileForActivePowerUpButton addChild:stunProjectilesLeftCounterLabel z: 10];
        stunProjectilesLeftCounterLabel.position = ccp(18, 18);
        
        
        //Add 'down' button for store UI
        downArrowButton = [CCSprite spriteWithFile: @"RedArrow.png"];
        downArrowButton.scale = 0.2;
        downArrowButton.opacity = 130;
        downArrowButton.rotation = -90;
        downArrowButton.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 260, [[CCDirector sharedDirector] winSize].height/2 + 240);
        [self addChild: downArrowButton];
        downArrowButton.visible = NO;
        
        //Add 'MainMenu' button for store UI
        mainMenuButton = [CCSprite spriteWithFile: @"MainMenuIcon.png"];
        mainMenuButton.scale = 2.3;
        mainMenuButton.opacity = 200;
        mainMenuButton.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 260, [[CCDirector sharedDirector] winSize].height/2 + 560);
        [self addChild: mainMenuButton];
        
        //Add 'enemies left' counter used for boss levels
        enemiesLeftLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Enemies Left: %i", enemiesLeftValue] fntFile:@"PixelArtFont.fnt"];
        [hudLayer addChild: enemiesLeftLabel];
        enemiesLeftLabel.position = ccp(240, 280);
        enemiesLeftLabel.visible = NO;
        
        //Add 'move-left' button
        leftArrowButton = [CCSprite spriteWithFile: @"RedArrow.png"];
        leftArrowButton.scaleX = 0.7;
        leftArrowButton.scaleY = 0.75;
        leftArrowButton.opacity = 0;
        [hudLayer addChild: leftArrowButton];
        
        //Add 'move-right' button
        rightArrowButton = [CCSprite spriteWithFile: @"RedArrow.png"];
        rightArrowButton.scaleX = 0.7;
        rightArrowButton.scaleY = 0.75;
        rightArrowButton.opacity = 0;
        rightArrowButton.flipX = YES;
        [hudLayer addChild: rightArrowButton];
        
        //Add 'move-left' button
        dPadNotPressed = [CCSprite spriteWithFile: @"DPadNotPressed.png"];
        dPadNotPressed.scaleX = 0.6;
        dPadNotPressed.scaleY = 0.45;
        dPadNotPressed.opacity = 130;
        [hudLayer addChild: dPadNotPressed];
        
        dPadLeft = [CCSprite spriteWithFile: @"DPadLeft.png"];
        dPadLeft.scaleX = 0.6;
        dPadLeft.scaleY = 0.45;
        dPadLeft.opacity = 130;
        dPadLeft.visible = NO;
        [hudLayer addChild: dPadLeft];
        
        dPadRight = [CCSprite spriteWithFile: @"DPadRight.png"];
        dPadRight.scaleX = 0.6;
        dPadRight.scaleY = 0.45;
        dPadRight.opacity = 130;
        dPadRight.visible = NO;
        [hudLayer addChild: dPadRight];

        
        //Position right arrow button
        if (deviceIsWidescreen) {
            
            leftArrowButton.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 280 - 19, [[CCDirector sharedDirector] winSize].height/2 - 189);
            rightArrowButton.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 180 + 19, [[CCDirector sharedDirector] winSize].height/2 - 189);
            dPadNotPressed.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 180, [[CCDirector sharedDirector] winSize].height/2 - 189);
            dPadLeft.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 180, [[CCDirector sharedDirector] winSize].height/2 - 189);
            dPadRight.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 180, [[CCDirector sharedDirector] winSize].height/2 - 189);
        }
        
        if (!deviceIsWidescreen) {
            
            leftArrowButton.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 230 - 19, [[CCDirector sharedDirector] winSize].height/2 - 189);
            rightArrowButton.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 130 + 19, [[CCDirector sharedDirector] winSize].height/2 - 189);
            dPadNotPressed.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 130, [[CCDirector sharedDirector] winSize].height/2 - 189);
            dPadLeft.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 130, [[CCDirector sharedDirector] winSize].height/2 - 189);
            dPadRight.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 130, [[CCDirector sharedDirector] winSize].height/2 - 189);
        }
        
        //Position D-Pad
        if (deviceIsWidescreen) {
            
            dPadNotPressed.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 230, [[CCDirector sharedDirector] winSize].height/2 - 189);
            dPadLeft.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 230, [[CCDirector sharedDirector] winSize].height/2 - 189);
            dPadRight.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 230, [[CCDirector sharedDirector] winSize].height/2 - 189);
        }
        
        if (!deviceIsWidescreen) {
            
            dPadNotPressed.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 180, [[CCDirector sharedDirector] winSize].height/2 - 189);
            dPadLeft.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 180, [[CCDirector sharedDirector] winSize].height/2 - 189);
            dPadRight.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 180, [[CCDirector sharedDirector] winSize].height/2 - 189);
        }
        
        
        gameOverLabel = [CCLabelBMFont labelWithString: @"Game Over" fntFile:@"PixelArtFont.fnt"];
        [self addChild: gameOverLabel];
        gameOverLabel.visible = NO;
        gameOverLabel.scale = 1.3;
        
        endOfDemoLabel = [CCLabelBMFont labelWithString: @"Thanks for Playing" fntFile:@"PixelArtFont.fnt"];
        [self addChild: endOfDemoLabel];
        endOfDemoLabel.visible = NO;
        endOfDemoLabel.position = ccp(gameOverLabel.position.x, gameOverLabel.position.y);
        endOfDemoLabel.scale = 1.3;
        
        if (deviceIsWidescreen) {
            
            gameOverLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 15, [[CCDirector sharedDirector] winSize].height/2);
            endOfDemoLabel.position = ccp(gameOverLabel.position.x, gameOverLabel.position.y);
        }
        
        if (!deviceIsWidescreen) {
            
            gameOverLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 15, [[CCDirector sharedDirector] winSize].height/2);
            endOfDemoLabel.position = ccp(gameOverLabel.position.x, gameOverLabel.position.y);
        }
        
        
        yourScoreLabel = [CCLabelBMFont labelWithString: @"Your Score" fntFile:@"PixelArtFont.fnt"];
        [self addChild: yourScoreLabel];
        yourScoreLabel.visible = NO;
        yourScoreLabel.scale = 0.8;
        
        if (deviceIsWidescreen) {
            
            yourScoreLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 130, [[CCDirector sharedDirector] winSize].height/2 - 75);
        }
        
        if (!deviceIsWidescreen) {
            
            yourScoreLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 95, [[CCDirector sharedDirector] winSize].height/2 - 75);
        }
        
        hiScoreLabel = [CCLabelBMFont labelWithString: @"Hi-Score" fntFile:@"PixelArtFont.fnt"];
        [self addChild: hiScoreLabel];
        hiScoreLabel.anchorPoint = ccp(0.5, 0.5);
        hiScoreLabel.visible = NO;
        hiScoreLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 50, [[CCDirector sharedDirector] winSize].height/2 - 75);
        hiScoreLabel.scale = 0.8;
        
                
        hiScoreSecsLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%02d", hiScoreSecs] fntFile:@"PixelArtFont.fnt"];
        [self addChild: hiScoreSecsLabel];
        hiScoreSecsLabel.anchorPoint = ccp(0.5, 0.5);
        hiScoreSecsLabel.visible = NO;
        hiScoreSecsLabel.position = ccp(hiScoreLabel.position.x + 20, hiScoreLabel.position.y - 25);
        hiScoreSecsLabel.scale = 0.8;
        
        hiScoreMinsLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%02d:", hiScoreMins]fntFile:@"PixelArtFont.fnt"];
        [self addChild: hiScoreMinsLabel];
        hiScoreMinsLabel.anchorPoint = ccp(0.5, 0.5);
        hiScoreMinsLabel.visible = NO;
        hiScoreMinsLabel.position = ccp(hiScoreLabel.position.x - 20, hiScoreLabel.position.y - 25);
        hiScoreMinsLabel.scale = 0.8;
        
        madAgentsLabel = [CCLabelBMFont labelWithString: @"Mad Agents!" fntFile:@"PixelArtFont.fnt"];
        [hudLayer addChild: madAgentsLabel];
        madAgentsLabel.visible = YES;
        madAgentsLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 40, [[CCDirector sharedDirector] winSize].height/2 - 500);
        madAgentsLabel.scale = 1.4;
        madAgentsLabel.color = ccc3(255, 69, 0);
        madAgentsLabel.opacity = 200;
        /*
        madAgentsMainMenuTitleLabel = [CCLabelBMFont labelWithString: @"MAD AGENTS" fntFile:@"PixelArtFont.fnt"];
        [self addChild: madAgentsMainMenuTitleLabel];
        madAgentsMainMenuTitleLabel.visible = YES;
        madAgentsMainMenuTitleLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 100);
        madAgentsMainMenuTitleLabel.scale = 2.7;
        madAgentsMainMenuTitleLabel.color = ccGRAY;
        madAgentsMainMenuTitleLabel.visible = NO;
        
        madAgentsBanner = [CCSprite spriteWithFile:@"MadAgentsBanner.png"];
        madAgentsBanner.scale = 1.0;
        madAgentsBanner.anchorPoint = ccp(0.5, 0.5);
        madAgentsBanner.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 50);
        [self addChild: madAgentsBanner];
        */
        
        //pass in the name of the property list
        [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"TitleBanner.plist"];
        
        //create the sprite sheet
        CCSpriteBatchNode *spriteSheetTitleBanner = [CCSpriteBatchNode batchNodeWithFile: @"TitleBanner.png"];
        [self addChild: spriteSheetTitleBanner z: 3500];
        
        //Create array of cairostance frames
        NSMutableArray *titleBannerAnimFrames = [NSMutableArray array];
        for(int i = 1; i <= 3; ++i) {
            [titleBannerAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Title%d.png", i]]];
        }
        
        //WidescreenOffset is the offset applied to iPhone 4 devices
        int widescreenOffset;
        
        if (deviceIsWidescreen) {
        
            widescreenOffset = 44;
        }
        
        else if (!deviceIsWidescreen) {
            
            widescreenOffset = 0;
        }
        
        
        
        //Create the animation object
        CCAnimation *titleBannerAnim = [CCAnimation animationWithFrames:titleBannerAnimFrames delay:0.5f];
        
        //Create sprite and run the animation
        madAgentsBanner = [CCSprite spriteWithSpriteFrameName:@"Title1.png"];
        // mySprite.anchorPoint = ccp(0.5, 0.35);
        CCAction *titleBannerAction1 = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: titleBannerAnim restoreOriginalFrame:NO]];
        [madAgentsBanner runAction: titleBannerAction1];
        madAgentsBanner.scale = 1.0;
        madAgentsBanner.anchorPoint = ccp(0.5, 0.5);
        madAgentsBanner.position = ccp([[CCDirector sharedDirector] winSize].width/2 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 + 50);
        madAgentsBanner.visible = NO;
        [spriteSheetTitleBanner addChild: madAgentsBanner];

        
        newGameLabel = [CCLabelBMFont labelWithString: @"New Game" fntFile:@"PixelArtFont.fnt"];
        [self addChild: newGameLabel];
        newGameLabel.visible = YES;
        newGameLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 - 60);
        newGameLabel.scale = 1.0;
        newGameLabel.color = ccWHITE;
        newGameLabel.visible = NO;
        
        deleteGameLabel = [CCLabelBMFont labelWithString: @"<- Delete" fntFile:@"PixelArtFont.fnt"];
        [self addChild: deleteGameLabel];
        deleteGameLabel.visible = YES;
        deleteGameLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 180 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 - 101);
        deleteGameLabel.scale = 1.0;
        deleteGameLabel.color = ccWHITE;
        
        saveSlot1ForLoadScreenLabel = [CCLabelBMFont labelWithString: @"NEW" fntFile:@"PixelArtFont.fnt"];
        [self addChild: saveSlot1ForLoadScreenLabel];
        saveSlot1ForLoadScreenLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 + 50);
        saveSlot1ForLoadScreenLabel.scale = 1.0;
        saveSlot1ForLoadScreenLabel.color = ccWHITE;
        saveSlot1ForLoadScreenLabel.visible = NO;
        
        saveSlot2ForLoadScreenLabel = [CCLabelBMFont labelWithString: @"NEW" fntFile:@"PixelArtFont.fnt"];
        [self addChild: saveSlot2ForLoadScreenLabel];
        saveSlot2ForLoadScreenLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 - 50);
        saveSlot2ForLoadScreenLabel.scale = 1.0;
        saveSlot2ForLoadScreenLabel.color = ccWHITE;
        saveSlot2ForLoadScreenLabel.visible = NO;
        
        saveSlot3ForLoadScreenLabel = [CCLabelBMFont labelWithString: @"NEW" fntFile:@"PixelArtFont.fnt"];
        [self addChild: saveSlot3ForLoadScreenLabel];
        saveSlot3ForLoadScreenLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 - 150);
        saveSlot3ForLoadScreenLabel.scale = 1.0;
        saveSlot3ForLoadScreenLabel.color = ccWHITE;
        saveSlot3ForLoadScreenLabel.visible = NO;
        
        loadGameLabel = [CCLabelBMFont labelWithString: @"LOAD GAME" fntFile:@"PixelArtFont.fnt"];
        [self addChild: loadGameLabel];
        loadGameLabel.visible = YES;
        loadGameLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 - 119);
        loadGameLabel.scale = 1.0;
        loadGameLabel.color = ccWHITE;
        loadGameLabel.visible = NO;
        
        multiplayerGameLabel = [CCLabelBMFont labelWithString: @"MULTIPLAYER" fntFile:@"PixelArtFont.fnt"];
        [self addChild: multiplayerGameLabel];
        multiplayerGameLabel.visible = YES;
        multiplayerGameLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 - 180);
        multiplayerGameLabel.scale = 1.0;
        multiplayerGameLabel.color = ccWHITE;
        multiplayerGameLabel.visible = YES;
        
        hiScoreMultiplayerLabel = [CCLabelBMFont labelWithString: @"Hi-Score" fntFile:@"PixelArtFont.fnt"];
        [self addChild: hiScoreMultiplayerLabel];
        hiScoreMultiplayerLabel.visible = YES;
        hiScoreMultiplayerLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 + 120);
        hiScoreMultiplayerLabel.scale = 1.0;
        hiScoreMultiplayerLabel.color = ccWHITE;
        hiScoreMultiplayerLabel.visible = NO;
        
        player1Label = [CCLabelBMFont labelWithString: @"First Player" fntFile:@"PixelArtFont.fnt"];
        [self addChild: player1Label];
        player1Label.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 160 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 + 0);
        player1Label.scale = 1.0;
        player1Label.color = ccWHITE;
        player1Label.visible = NO;
        
        player1ReadyLabel = [CCLabelBMFont labelWithString: @"Ready!" fntFile:@"PixelArtFont.fnt"];
        [self addChild: player1ReadyLabel];
        player1ReadyLabel.position = ccp(player1Label.position.x - widescreenOffset, player1Label.position.y - 75);
        player1ReadyLabel.scale = 1.0;
        player1ReadyLabel.color = ccWHITE;
        player1ReadyLabel.visible = NO;
        [player1ReadyLabel runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCFadeIn actionWithDuration: 0.0], [CCDelayTime actionWithDuration: 0.75], [CCFadeOut actionWithDuration:0.0], [CCDelayTime actionWithDuration: 0.75], nil]]];
        
        
        
        player2Label = [CCLabelBMFont labelWithString: @"Second Player" fntFile:@"PixelArtFont.fnt"];
        [self addChild: player2Label];
        player2Label.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 160 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 + 0);
        player2Label.scale = 1.0;
        player2Label.color = ccWHITE;
        player2Label.visible = NO;
        
        player2ReadyLabel = [CCLabelBMFont labelWithString: @"Ready!" fntFile:@"PixelArtFont.fnt"];
        [self addChild: player2ReadyLabel];
        player2ReadyLabel.position = ccp(player2Label.position.x - widescreenOffset, player2Label.position.y - 75);
        player2ReadyLabel.scale = 1.0;
        player2ReadyLabel.color = ccWHITE;
        player2ReadyLabel.visible = NO;
        [player2ReadyLabel runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCFadeIn actionWithDuration: 0.0], [CCDelayTime actionWithDuration: 0.75], [CCFadeOut actionWithDuration:0.0], [CCDelayTime actionWithDuration: 0.75], nil]]];

        
        
        versusLabel = [CCLabelBMFont labelWithString: @"vs." fntFile:@"PixelArtFont.fnt"];
        [self addChild: versusLabel];
        versusLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2);
        versusLabel.scale = 0.8;
        versusLabel.color = ccWHITE;
        versusLabel.visible = NO;
        
        //Player1 Versus Screen Score
        player1VersusScreeScoreLabel = [CCLabelBMFont labelWithString: [NSString stringWithFormat:@"Wins: %i", player1VersusTotalWins] fntFile:@"PixelArtFont.fnt"];
        [self addChild: player1VersusScreeScoreLabel];
        player1VersusScreeScoreLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 - 160 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 - 40);
        player1VersusScreeScoreLabel.scale = 0.7;
        player1VersusScreeScoreLabel.color = ccWHITE;
        player1VersusScreeScoreLabel.visible = NO;
        
        //Player2 Versus Screen Score
        player2VersusScreeScoreLabel = [CCLabelBMFont labelWithString: [NSString stringWithFormat:@"Wins: %i", player2VersusTotalWins] fntFile:@"PixelArtFont.fnt"];
        [self addChild: player2VersusScreeScoreLabel];
        player2VersusScreeScoreLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 160 - widescreenOffset, [[CCDirector sharedDirector] winSize].height/2 - 40);
        player2VersusScreeScoreLabel.scale = 0.7;
        player2VersusScreeScoreLabel.color = ccWHITE;
        player2VersusScreeScoreLabel.visible = NO;
        
        
        if (isSinglePlayer) {
        
            tileMap = [CCTMXTiledMap tiledMapWithTMXFile: [NSString stringWithFormat:@"TileMapLevel%d.tmx", CURRENT_LEVEL_BEING_TESTED]];
            tileMap.anchorPoint = ccp(0, 0);
            [gameLayer addChild: tileMap z:5];
            foreground = [tileMap layerNamed: @"bricks"];
            solidBricks = [tileMap layerNamed: @"solidbricks"];
            [self addAllObjectsToCurrentLevel];
        }
        
        else if (!isSinglePlayer) {
            
            tileMap = [CCTMXTiledMap tiledMapWithTMXFile: [NSString stringWithFormat:@"DemoLevel%d.tmx", CURRENT_LEVEL_BEING_TESTED]];
            tileMap.anchorPoint = ccp(0, 0);
            [gameLayer addChild: tileMap z:5];
            foreground = [tileMap layerNamed: @"bricks"];
            solidBricks = [tileMap layerNamed: @"solidbricks"];
            [self addAllObjectsToCurrentLevel];
        }

        
        //Hud Layer Timer Label
        timeLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%02d:%02d", mins, secs] fntFile:@"PixelArtFont.fnt"];
        [timeLabel setAnchorPoint:ccp(0.5, 0.5)];
        timeLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, self.position.y - 30);
        timeLabel.scale = 0.7;
        timeLabel.visible = NO;
        [hudLayer addChild:timeLabel z:100];
        
        
        storeButton = [CCSprite spriteWithFile: @"PauseButton.png"];
        storeButton.position = ccp([[CCDirector sharedDirector] winSize].width/2, self.position.y - 31);
        storeButton.scale = 1.2;
        storeButton.color = ccRED;
        storeButton.opacity = 180;
        [hudLayer addChild: storeButton z:100];
        
        //Currency Label
        inGameCurrencyAmountLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", inGameCurrencyAmount] fntFile:@"PixelArtFont.fnt"];
        [inGameCurrencyAmountLabel setAnchorPoint:ccp(0.5, 0.5)];
        inGameCurrencyAmountLabel.position = ccp(storeButton.position.x + 45, storeButton.position.y);
        inGameCurrencyAmountLabel.scale = 0.55;
        [hudLayer addChild:inGameCurrencyAmountLabel z:100];
        inGameCurrencyAmountLabel.visible = NO;
        
        currentLevelLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Level %i", currentLevel] fntFile:@"PixelArtFont.fnt"];
        [currentLevelLabel setAnchorPoint:ccp(0.5, 0.5)];
        currentLevelLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 211);
        currentLevelLabel.scale = 0.45;
        [hudLayer addChild:currentLevelLabel z:100];
        
        //Run method which decreases the timer every second
       // decreaseTimerAction = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFunc actionWithTarget:self selector:@selector(decreaseTimer)], nil]]];
	}
    
    //Add Victory Screen Stuff
    saveVideoButton = [CCSprite spriteWithFile:@"WhiteRoundedRectangle.png"];
    saveVideoButton.scaleX = 1.7;
    saveVideoButton.scaleY = 1.5;
    saveVideoButton.anchorPoint = ccp(0.5, 0.5);
    saveVideoButton.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 62);
    [self addChild:saveVideoButton z:3500];
    saveVideoButton.visible = NO;
    
    CCLabelBMFont *saveVideoButtonLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"WATCH\nREPLAY"] fntFile:@"PixelArtFont.fnt"];
    [saveVideoButton addChild: saveVideoButtonLabel z:4000];
    saveVideoButtonLabel.scale = 0.31;
    saveVideoButtonLabel.anchorPoint = ccp(0.5, 0.5);
    saveVideoButtonLabel.position = ccp(29, 20);
    
    
    youreAwesomeLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"You're Awesome!"] fntFile:@"PixelArtFont.fnt"];
    [self addChild: youreAwesomeLabel z:3500];
    youreAwesomeLabel.visible = NO;
    
    tryHarderLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Try Harder"] fntFile:@"PixelArtFont.fnt"];
    [self addChild: tryHarderLabel z:3500];
    tryHarderLabel.visible = NO;
    /*
    star1 = [CCSprite spriteWithFile:@"Star.png"];
    [self addChild: star1 z:3500];
    star1.visible = NO;
    
    star2 = [CCSprite spriteWithFile:@"Star.png"];
    [self addChild: star2 z:3500];
    star2.visible = NO;
    
    star3 = [CCSprite spriteWithFile:@"Star.png"];
    [self addChild: star3 z:3500];
    star3.visible = NO;
     */
    

    
    /*Gem Spinning Animation*/
    //pass in the name of the property list
    [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"Gem.plist"];
    
    //create the sprite sheet
    CCSpriteBatchNode *spriteSheetGemSpinning = [CCSpriteBatchNode batchNodeWithFile: @"Gem.png"];
    [self addChild: spriteSheetGemSpinning z: 3500];
    
    //Create array of cairostance frames
    NSMutableArray *gemSpinningAnimFrames = [NSMutableArray array];
    for(int i = 1; i <= 4; ++i) {
        [gemSpinningAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Gem%d.png", i]]];
    }
    
    //Create the animation object
    CCAnimation *gemSpinningAnim = [CCAnimation animationWithFrames:gemSpinningAnimFrames delay:0.25f];
    
    //Create sprite and run the animation
    star1 = [CCSprite spriteWithSpriteFrameName:@"Gem1.png"];
    // mySprite.anchorPoint = ccp(0.5, 0.35);
    CCAction *gemSpinningAction1 = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: gemSpinningAnim restoreOriginalFrame:NO]];
    [star1 runAction: gemSpinningAction1];
    star1.scale = 0.48;
    star1.visible = NO;
    [spriteSheetGemSpinning addChild: star1 z: 3500];
    
    //Create sprite and run the animation
    star2 = [CCSprite spriteWithSpriteFrameName:@"Gem1.png"];
    // mySprite.anchorPoint = ccp(0.5, 0.35);
    CCAction *gemSpinningAction2 = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: gemSpinningAnim restoreOriginalFrame:NO]];
    [star2 runAction: gemSpinningAction2];
    star2.scale = 0.48;
    star2.visible = NO;
    [spriteSheetGemSpinning addChild: star2 z: 3500];
    
    //Create sprite and run the animation
    star3 = [CCSprite spriteWithSpriteFrameName:@"Gem1.png"];
    // mySprite.anchorPoint = ccp(0.5, 0.35);
    CCAction *gemSpinningAction3 = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: gemSpinningAnim restoreOriginalFrame:NO]];
    [star3 runAction: gemSpinningAction3];
    star1.scale = 0.48;
    star3.visible = NO;
    [spriteSheetGemSpinning addChild: star3 z: 3500];
    

    
    noStarsRewardLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"No Reward"] fntFile:@"PixelArtFont.fnt"];
    [self addChild: noStarsRewardLabel z:3500];
    noStarsRewardLabel.visible = NO;
    
    tapToContinueLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"tap to continue"] fntFile:@"PixelArtFont.fnt"];
    [self addChild: tapToContinueLabel z:3500];
    tapToContinueLabel.visible = NO;
    
    notBadLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Not Bad"] fntFile:@"PixelArtFont.fnt"];
    [self addChild: notBadLabel z:3500];
    notBadLabel.visible = NO;
    
    inGameCurrencyAmountLabelOldAmountForOneStar = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", inGameCurrencyAmount - 50] fntFile:@"PixelArtFont.fnt"];
    [self addChild:inGameCurrencyAmountLabelOldAmountForOneStar  z:3500];
    inGameCurrencyAmountLabelOldAmountForOneStar.visible = NO;
    
    inGameCurrencyAmountLabelOldAmountForTwoStars = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", inGameCurrencyAmount - 200] fntFile:@"PixelArtFont.fnt"];
    [self addChild:inGameCurrencyAmountLabelOldAmountForTwoStars  z:3500];
    inGameCurrencyAmountLabelOldAmountForTwoStars.visible = NO;
    
    inGameCurrencyAmountLabelOldAmountForThreeStars = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", inGameCurrencyAmount - 500] fntFile:@"PixelArtFont.fnt"];
    [self addChild:inGameCurrencyAmountLabelOldAmountForThreeStars  z:3500];
    inGameCurrencyAmountLabelOldAmountForThreeStars.visible = NO;
    
    inGameCurrencyAmountLabelNewAmount = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", inGameCurrencyAmount] fntFile:@"PixelArtFont.fnt"];
    [self addChild:inGameCurrencyAmountLabelNewAmount z:100];
    inGameCurrencyAmountLabelNewAmount.visible = NO;
    
    noStarsRewardMoneyAmountLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", NO_STARS_REWARD] fntFile:@"PixelArtFont.fnt"];
    [self addChild:noStarsRewardMoneyAmountLabel  z:3500];
    noStarsRewardMoneyAmountLabel.visible = NO;
    
    oneStarRewardMoneyAmountLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", ONE_STARS_REWARD] fntFile:@"PixelArtFont.fnt"];
    [self addChild:oneStarRewardMoneyAmountLabel  z:3500];
    oneStarRewardMoneyAmountLabel.visible = NO;
    
    twoStarsRewardMoneyAmountLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", TWO_STARS_REWARD] fntFile:@"PixelArtFont.fnt"];
    [self addChild:twoStarsRewardMoneyAmountLabel  z:3500];
    twoStarsRewardMoneyAmountLabel.visible = NO;
    
    threeStarsRewardMoneyAmountLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"$%i", THREE_STARS_REWARD] fntFile:@"PixelArtFont.fnt"];
    [self addChild:threeStarsRewardMoneyAmountLabel  z:3500];
    threeStarsRewardMoneyAmountLabel.visible = NO;
    
    goodLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Good"] fntFile:@"PixelArtFont.fnt"];
    [self addChild: goodLabel z:3500];
    goodLabel.visible = NO;

    
    //queue up but dont play starPowerUp music
    starPowerUpMusic = [SimpleAudioEngine sharedEngine];//play background music
    
    if (starPowerUpMusic != nil) {
        [starPowerUpMusic preloadBackgroundMusic:@"StarPowerUpMusic.mp3"];
        
        if (starPowerUpMusic.willPlayBackgroundMusic) {
            starPowerUpMusic.backgroundMusicVolume = 0.5f;
        }
    }

    //Queue up and play game music
    gameMusic = [SimpleAudioEngine sharedEngine];//play background music
    
    if (gameMusic != nil) {
        [gameMusic preloadBackgroundMusic:@"GameMusic.m4a"];
        
        if (gameMusic.willPlayBackgroundMusic) {
            gameMusic.backgroundMusicVolume = 0.5f;
        }
    }
    
    [gameMusic playBackgroundMusic:@"GameMusic.m4a" loop:YES];
    
    
    [self schedule: @selector(step:)];
    
    self.anchorPoint = ccp(0.5, 0.5);
    
    //Default self.scale = 0.85
    self.scale = 0.85;
    
    
    createPowerUpAction = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration: POWER_UP_GENERATION_TIME_INTERVAL], [CCCallFunc actionWithTarget:self selector:@selector(createPowerUpAtRandomLocation)], nil]]];
    [self stopAction: createPowerUpAction];

    [self mainMenuScreen];
    [self loadGameSettings];
    
    ourRandom = arc4random();
    [self setGameState:kGameStateWaitingForMatch];
    
    
    mobclixFullScreenAd = [[[MobclixFullScreenAdViewController alloc] init] autorelease];

    
    
    if (deviceIsWidescreen) {
        
        self.position = ccp([[CCDirector sharedDirector] winSize].width/16 + 5, self.position.y + 25);
    }
    
    if (!deviceIsWidescreen) {
        
        self.position = ccp([[CCDirector sharedDirector] winSize].width/16 - 30, self.position.y + 25);
    }
    
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        
        deviceIsIpad = YES;
    }
    
    else {
        
        deviceIsIpad = NO;
    }
    
    if (deviceIsIpad) {
        
        gameLayer.scale = 1.2;
        self.scale = 1.4;
        self.position = ccp(self.position.x, self.position.y + 55);
        hudLayer.position = ccp(hudLayer.position.x + 200, hudLayer.position.y + 250);
        
        leftArrowButton.position = ccp (leftArrowButton.position.x - 335, leftArrowButton.position.y - 230);
        leftArrowButton.scaleX = 0.2;
        leftArrowButton.scaleY = 1.5;
        
        rightArrowButton.position = ccp (rightArrowButton.position.x - 390, rightArrowButton.position.y - 230);
        rightArrowButton.scaleX = 0.2;
        rightArrowButton.scaleY = 1.5;
        
        activePowerUpButton.position = ccp(activePowerUpButton.position.x - 100, activePowerUpButton.position.y - 325);        
    }
    
    menu = [LevelSelectorMenus nodeWithTheGame:self];
    [menuLayer addChild: menu];
    menuLayer.visible = NO;
    
    characterSelection = [CharacterSelectionScreen nodeWithTheGame: self];
    [characterSelectionLayer addChild: characterSelection];
    characterSelectionLayer.visible = NO;

    /*
    fastInvincibilityRainbowAction = [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.05], [CCTintTo actionWithDuration:0.0 red:255 green:0 blue:0], [CCDelayTime actionWithDuration:0.05], [CCTintTo actionWithDuration:0.0 red:0 green:255 blue:0], [CCDelayTime actionWithDuration:0.05], [CCTintTo actionWithDuration:0.0 red:0 green:0 blue:255], [CCDelayTime actionWithDuration:0.05], [CCTintTo actionWithDuration:0.0 red:255 green:255 blue:255], [CCDelayTime actionWithDuration:0.05], [CCTintTo actionWithDuration:0.0 red:255 green:255 blue:0], nil]];

    slowInvincibilityRainbowAction = [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.25], [CCTintTo actionWithDuration:0.0 red:255 green:0 blue:0], [CCDelayTime actionWithDuration:0.25], [CCTintTo actionWithDuration:0.0 red:0 green:255 blue:0], [CCDelayTime actionWithDuration:0.25], [CCTintTo actionWithDuration:0.0 red:0 green:0 blue:255], [CCDelayTime actionWithDuration:0.25], [CCTintTo actionWithDuration:0.0 red:255 green:255 blue:255], [CCDelayTime actionWithDuration:0.25], [CCTintTo actionWithDuration:0.0 red:255 green:255 blue:0], nil]];
     */
    
	return self;
}

-(void) slideUpGameCenterViewController
{
    AppDelegate *delegate = (AppDelegate *) [UIApplication sharedApplication].delegate;
    [[GCHelper sharedInstance] findMatchWithMinPlayers:2 maxPlayers:2 viewController:delegate.navController delegate:self];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:[touch view]];
	touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
	
	CGPoint touchLocation = [touch locationInView: [touch view]];
	CGPoint prevLocation = [touch previousLocationInView: [touch view]];
	
	touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
	prevLocation = [[CCDirector sharedDirector] convertToGL: prevLocation];
    
    CGPoint touchLocationHudLayer = [hudLayer convertTouchToNodeSpace:touch];
    CGPoint touchLocationSelfLayer = [self convertTouchToNodeSpace:touch];
    
    CGPoint touchLocationCharacterSelectionLayer = [characterSelectionLayer convertTouchToNodeSpace:touch];
    
    CGPoint touchLocationLevelSelectionLayer = [menuLayer convertTouchToNodeSpace: touch];
    
    
    if (currentScreen == MULTIPLAYER_VERSUS_SCREEN) {
        
        [self sendPlayerReadyForMultiplayerMatch];
        
        if (isPlayer1)
            player1ReadyLabel.visible = YES;
        else if (!isPlayer1)
            player2ReadyLabel.visible = YES;
    }
    
    else if (currentScreen == LEVEL_SELECTION_MENU) {
        
        if (CGRectContainsPoint(menu.whiteArrow.boundingBox, touchLocationSelfLayer)) {

            [self mainMenuScreen];
        }
    }
    
    else if (currentScreen == MAIN_MENU_SCREEN) {

        if (CGRectContainsPoint(multiplayerGameLabel.boundingBox, touchLocationSelfLayer)) {

          [self slideUpGameCenterViewController];
            
          //DEBUG: Comment above and uncomment below to go straight to multiplayer versus screen when you touch the main menu's multiplayerGameLabel
          [self loadMultiplayerVersusScreen];
        }
        
        if (CGRectContainsPoint(newGameLabel.boundingBox, touchLocationSelfLayer)) {
                        
            if (currentSaveSlot == SAVE_SLOT_1) {
            
                if (saveSlot1NameLabel == nil) {
                
                    [self enterName];
                }
                
                else {
                    
                    [self menuScreen];
                 //   [self progressToNextLevel];
                }
            }
            
            if (currentSaveSlot == SAVE_SLOT_2) {
                
                if (saveSlot2NameLabel == nil) {
                    
                    [self enterName];
                }
                
                else {
                    
                    [self menuScreen];
                //    [self progressToNextLevel];
                }
            }
            
            if (currentSaveSlot == SAVE_SLOT_3) {
                
                if (saveSlot3NameLabel == nil) {
                    
                    [self enterName];
                }
                
                else {
                    
                    [self menuScreen];
                 //   [self progressToNextLevel];
                }
            }
        }
        
        else if (CGRectContainsPoint(loadGameLabel.boundingBox, touchLocationSelfLayer)) {
                        
            [self loadSavedSlotScreen];
        }
    }
    
    else if (currentScreen == LOAD_PROFILE_SCREEN) {
                
        if (CGRectContainsPoint(saveSlot1ForLoadScreenLabel.boundingBox, touchLocationHudLayer)) {
                        
            currentSaveSlot = SAVE_SLOT_1;
            
            [self updateNameLabelForMainMenu];
            [self loadGameSettings];
            [self mainMenuScreen];
        }
        
        else if (CGRectContainsPoint(saveSlot2ForLoadScreenLabel.boundingBox, touchLocationHudLayer)) {
            
            currentSaveSlot = SAVE_SLOT_2;
            
            [self updateNameLabelForMainMenu];
            [self loadGameSettings];
            [self mainMenuScreen];
        }
        
        else if (CGRectContainsPoint(saveSlot3ForLoadScreenLabel.boundingBox, touchLocationHudLayer)) {

            currentSaveSlot = SAVE_SLOT_3;
            
            [self updateNameLabelForMainMenu];
            [self loadGameSettings];
            [self mainMenuScreen];
        }
        
        else if (CGRectContainsPoint(deleteGameLabel.boundingBox, touchLocationSelfLayer)) {
            
            [self deleteSaveDataFromSelectedSlot];
            
            if (saveSlot1NameLabel == nil) {
                
                [saveSlot1ForLoadScreenLabel setString: [NSString stringWithFormat:@"New"]];
            }
            
            if (saveSlot2NameLabel == nil) {
                
                [saveSlot2ForLoadScreenLabel setString: [NSString stringWithFormat:@"New"]];
            }
            
            if (saveSlot3NameLabel == nil) {
                
                [saveSlot3ForLoadScreenLabel setString: [NSString stringWithFormat:@"New"]];
            }
        }
    }
    
    
    else if (currentScreen == CHARACTER_SELECTION_SCREEN) {
        
        if (CGRectContainsPoint(characterSelection.blueBoy.boundingBox, touchLocationCharacterSelectionLayer)) {
            
            playerColorAndGender = BLUE_BOY;
            [self progressToNextLevel];
            
            NSLog (@"1");
        }
        
        else if (CGRectContainsPoint(characterSelection.greenBoy.boundingBox, touchLocationCharacterSelectionLayer)) {
            
            playerColorAndGender = GREEN_BOY;
            [self progressToNextLevel];
            
            NSLog (@"2");
        }
        
        else if (CGRectContainsPoint(characterSelection.beigeGirl.boundingBox, touchLocationCharacterSelectionLayer)) {
            
            playerColorAndGender = BEIGE_GIRL;
            [self progressToNextLevel];
        }
        
        else if (CGRectContainsPoint(characterSelection.purpleGirl.boundingBox, touchLocationCharacterSelectionLayer)) {
            
            playerColorAndGender = PURPLE_GIRL;
            [self progressToNextLevel];
        }
    }

    else if (currentScreen == GAME_SCREEN) {
    
        //If game is going and buttons aren't pushed then ignore touches
      /*  if (!(CGRectContainsPoint(leftArrowButton.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(rightArrowButton.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(jumpButton.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(activePowerUpButton.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(blueInventorySlot1.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(blueInventorySlot2.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(blueInventorySlot3.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(storeButton.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(stunBombPurchaseIcon.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(mindControllerPurchaseIcon.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(sneakerPurchaseIcon.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(globalStunPurchaseIcon.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(stunProjectilePurchaseIcon.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(invincibilityPowerUpPurchaseIcon.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(bulletTimePowerUpPurchaseIcon.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(downArrowButton.boundingBox, touchLocationHudLayer)) && !(CGRectContainsPoint(mainMenuButton.boundingBox, touchLocationHudLayer))) {
            
            return 0;
        }
        */
        if (CGRectContainsPoint(storeButton.boundingBox, touchLocationHudLayer) && storeButton.visible == YES) {
        
            [self gamePausedAction];
                        
            //[self menuScreen];
            
            /*
            isPaused = YES;
            pauseButtonTouched = YES;
            
            //DEBUG: Pushing storeButton turns invincibility on and off
            if (firstPlayerCurrentlyInvincible) {
                
                firstPlayerCurrentlyInvincible = NO;
            }
            
            else if (!firstPlayerCurrentlyInvincible) {
                
                firstPlayerCurrentlyInvincible = YES;
            }
            
            if (toPauseOrNotToPause == YES) {
            
                toPauseOrNotToPause = NO;
                
                NSLog (@"Pause Game");
                
                for (Enemy *enemies in enemySpritesArray) {
                                    
                    [enemies pauseSchedulerAndActions];
                }
                
                for (fireball in fireballArray) {
                    
                    [fireball pauseSchedulerAndActions];
                }
            }
            
            else if (toPauseOrNotToPause == NO) {
                
                toPauseOrNotToPause = YES;
                [self resumeGameFromStore];
            }
          */ 
            //Turning off store, for good probably
          /*  [self runAction: [CCMoveBy actionWithDuration:1.0 position:ccp(0, -370)]];
            
            inGameCurrencyAmountLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2 + 60, [[CCDirector sharedDirector] winSize].height/2 + 290);
            inGameCurrencyAmountLabel.scale = 0.9;
            [inGameCurrencyAmountLabel setString:[NSString stringWithFormat:@"Total = $%i", inGameCurrencyAmount]];
           */
        }
        
        //Player pushing resume game label on pause screen to resume game
        if (CGRectContainsPoint(resumeGameLabelForPauseScreen.boundingBox, touchLocationSelfLayer) && resumeGameLabelForPauseScreen.visible == YES) {
            
            [self gameResumeFromPauseAction];
        }
        
        //Player pushing 'change level' label on pause screen to go back to level selection
        else if (CGRectContainsPoint(changeLevelLabelForPauseScreen.boundingBox, touchLocationSelfLayer) && changeLevelLabelForPauseScreen.visible == YES) {

            [self menuScreen];
        }
        
        //Player purchasing bulletTimePowerUp
        if (CGRectContainsPoint(bulletTimePowerUpPurchaseIcon.boundingBox, touchLocationSelfLayer) && bulletTimePowerUpPurchaseIcon.visible == YES) {
            
            if (inGameCurrencyAmount >= bulletTimePowerUpPurchaseIconPriceValue || inGameCurrencyAmount > bulletTimePowerUpPurchaseIconPriceValue) {
                
                bulletTimePowerUpsLeft = bulletTimePowerUpsLeft + 1;
                inGameCurrencyAmount = inGameCurrencyAmount - bulletTimePowerUpPurchaseIconPriceValue;
            }
            
            [self updateAllCurrencyRelatedLabels];
            [[SimpleAudioEngine sharedEngine] playEffect:@"MoneySpentSound.wav"];
        }
        
        //Player purchasing invinciblityPowerUp
        if (CGRectContainsPoint(downArrowButton.boundingBox, touchLocationSelfLayer) && downArrowButton.visible == YES) {

            NSLog (@"downArrowButton pushed");
            
            [self resumeGameFromStore];
            [self updateAllCurrencyRelatedLabels];
        }
        
        //Player purchasing invinciblityPowerUp
        if (CGRectContainsPoint(invincibilityPowerUpPurchaseIcon.boundingBox, touchLocationHudLayer)) {
            
            if (inGameCurrencyAmount >= invincibilityPowerUpPurchaseIconPriceValue || inGameCurrencyAmount > invincibilityPowerUpPurchaseIconPriceValue) {
                
                invincibilityPowerUpsLeft = invincibilityPowerUpsLeft + 1;
                inGameCurrencyAmount = inGameCurrencyAmount - invincibilityPowerUpPurchaseIconPriceValue;
            }
            
            [self updateAllCurrencyRelatedLabels];
            [[SimpleAudioEngine sharedEngine] playEffect:@"MoneySpentSound.wav"];
        }
        
        //Player purchasing stunProjectile
        if (CGRectContainsPoint(stunProjectilePurchaseIcon.boundingBox, touchLocationHudLayer)) {
            
            if (inGameCurrencyAmount >= stunProjectilePurchaseIconPriceValue || inGameCurrencyAmount > stunProjectilePurchaseIconPriceValue) {
                
                stunProjectilesLeft = stunProjectilesLeft + 1;
                inGameCurrencyAmount = inGameCurrencyAmount - stunProjectilePurchaseIconPriceValue;
            }
            
            [self updateAllCurrencyRelatedLabels];
            [[SimpleAudioEngine sharedEngine] playEffect:@"MoneySpentSound.wav"];
        }
        
        //Player purchasing stunBomb
        if (CGRectContainsPoint(stunBombPurchaseIcon.boundingBox, touchLocationHudLayer) && stunBombPurchaseIcon.visible == YES) {

            if (inGameCurrencyAmount >= STUN_BOMB_PRICE) {
            
                stunBombsLeft = stunBombsLeft + 1;
                inGameCurrencyAmount = inGameCurrencyAmount - STUN_BOMB_PRICE;
            }
            
            [self updateAllCurrencyRelatedLabels];
            [[SimpleAudioEngine sharedEngine] playEffect:@"MoneySpentSound.wav"];
        }
        
        //Player purchasing mindController
        if (CGRectContainsPoint(mindControllerPurchaseIcon.boundingBox, touchLocationHudLayer) && mindControllerPurchaseIcon.visible == YES) {
            
            if (inGameCurrencyAmount >= MIND_CONTROL_PRICE) {
                
                mindControlPowerUpsLeft = mindControlPowerUpsLeft + 1;
                inGameCurrencyAmount = inGameCurrencyAmount - MIND_CONTROL_PRICE;
            }
            
            [self updateAllCurrencyRelatedLabels];
            [[SimpleAudioEngine sharedEngine] playEffect:@"MoneySpentSound.wav"];
        }
        
        //Player purchasing globalStunner
        if (CGRectContainsPoint(globalStunPurchaseIcon.boundingBox, touchLocationHudLayer) && globalStunPurchaseIcon.visible == YES) {
                    
            if (inGameCurrencyAmount >= GLOBAL_STUN_PRICE) {
                
                globalStunPowerUpsLeft = globalStunPowerUpsLeft + 1;
                inGameCurrencyAmount = inGameCurrencyAmount - GLOBAL_STUN_PRICE;
            }
            
            [self updateAllCurrencyRelatedLabels];
            [[SimpleAudioEngine sharedEngine] playEffect:@"MoneySpentSound.wav"];
        }
        
        if (CGRectContainsPoint(sneakerPurchaseIcon.boundingBox, touchLocationHudLayer) && sneakerPurchaseIcon.visible == YES) {
            
            if (inGameCurrencyAmount >= SNEAKERS_PRICE) {
                
                firstPlayerHasSneakers = YES;
                inGameCurrencyAmount = inGameCurrencyAmount - SNEAKERS_PRICE;
            }
            
            [self updateAllCurrencyRelatedLabels];
            [[SimpleAudioEngine sharedEngine] playEffect:@"MoneySpentSound.wav"];
        }
        
        
        if (progressToNextLevelAlreadyRunning == NO) {
            
            if ((touchLocationHudLayer.x < jumpButton.position.x + 60 && touchLocationHudLayer.x > jumpButton.position.x - 55) && (touchLocationHudLayer.y < jumpButton.position.y + 100 && touchLocationHudLayer.y > jumpButton.position.y - 60)) {
                
                [self makePlayerJump];
                
                [self jumpButtonPressed];
                
                if (!isSinglePlayer) {
                
                    [self sendJump];
                }
            }
            
            if (CGRectContainsPoint(leftArrowButton.boundingBox, touchLocationHudLayer) && !firstPlayerCurrentlyDead) {
                
                [self dPadLeftPressed];
                
                leftArrowButtonTouched = YES;
                rightArrowButtonTouched = NO;
                
                if (isPlayer1) {
                    
                    if (!isSinglePlayer) {
                    
                        [self sendMessageMakeFirstPlayerSpriteFaceLeft];
                    }
                    
                    moveLeft1 = YES;
                    firstPlayerFacingRight = NO;
                }
                
                if (!isPlayer1) {
                    
                    if (!isSinglePlayer) {
                    
                        [self sendMessageMakeSecondPlayerSpriteFaceLeft];
                    }
                    
                    secondPlayerSprite.secondPlayerMoveLeft = YES;
                    secondPlayerSprite.secondPlayerFacingRight = NO;
                }
                
                if (!isSinglePlayer) {
                    
                //    [self sendMoveLeft];
                }
            }
            
            else if (CGRectContainsPoint(rightArrowButton.boundingBox, touchLocationHudLayer) && !firstPlayerCurrentlyDead) {
                
                [self dPadRightPressed];
                
                leftArrowButtonTouched = NO;
                rightArrowButtonTouched = YES;
                
                if (isPlayer1) {
                    
                    if (!isSinglePlayer && !firstPlayerCurrentlyDead && !secondPlayerSprite.secondPlayerCurrentlyDead) {
                    
                        [self sendMessageMakeFirstPlayerSpriteFaceRight];
                    }
                    
                    moveRight1 = YES;
                    firstPlayerFacingRight = YES;
                }
                
                if (!isPlayer1) {
                    
                    if (!isSinglePlayer && !secondPlayerSprite.secondPlayerCurrentlyDead && !firstPlayerCurrentlyDead) {
                    
                        [self sendMessageMakeSecondPlayerSpriteFaceRight];
                    }
                    
                    secondPlayerSprite.secondPlayerMoveRight = YES;
                    secondPlayerSprite.secondPlayerFacingRight = YES;
                }
                
                if (!isSinglePlayer) {
                    
                //    [self sendMoveRight];
                }
            }
            
          //  if (CGRectContainsPoint(activePowerUpButton.boundingBox, touchLocationHudLayer) && !firstPlayerCurrentlyDead) {
            if ((touchLocationHudLayer.x < activePowerUpButton.position.x + 50 && touchLocationHudLayer.x > activePowerUpButton.position.x - 75) && (touchLocationHudLayer.y < activePowerUpButton.position.y + 100 && touchLocationHudLayer.y > activePowerUpButton.position.y - 50) && !firstPlayerCurrentlyDead) {
                                
                activePowerUpButtonTouched = YES;
                                
                [self activePowerUpButtonPressed];
                                
                //If player has no more useable power ups, play buzzer sound
                if (stunBombsLeft == 0 && stunProjectilesLeft == 0 && mindControlPowerUpsLeft == 0) {
                    
                    [[SimpleAudioEngine sharedEngine] playEffect:@"Buzzer.wav" pitch:1.0 pan:0.0 gain:1.0];
                }
                
                //If player just used up their last power up, let them know by playing a delayed sound
                if (stunBombsLeft == 1 || stunProjectilesLeft == 1 || mindControlPowerUpsLeft == 1) {
                    
                    [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration: 0.45], [CCCallFunc actionWithTarget:self selector:@selector(playBuzzerSound)], nil]];
                }
                
                if (powerUpCurrentlySelected == STUN_POWER_UP_SELECTED && stunBombsLeft > 0) {
                                        
                    //Create and stun powerup where first player is.
                    if (isPlayer1) {
                        
                        [self addStunPowerUpSprite: firstPlayerSprite.position.x y: firstPlayerSprite.position.y];
                        stunPowerUp.stunPowerUpBelongsToPlayer1 = YES;
                        
                        if (!isSinglePlayer) {
                        
                            //Send message to other player telling them to create stunPowerUp at this CGPoint
                            [self sendCreateStunPowerUpAtOpposingPlayersPosition];
                        }
                    }
                    
                    if (!isPlayer1) {
                        
                        [self addStunPowerUpSprite: secondPlayerSprite.position.x y: secondPlayerSprite.position.y];
                        stunPowerUp.stunPowerUpBelongsToPlayer1 = NO;
                        
                        if (!isSinglePlayer) {
                        
                            //Send message to other player telling them to create stunPowerUp at this CGPoint
                            [self sendCreateStunPowerUpAtOpposingPlayersPosition];
                        }
                    }
                    
                    //Decrement one of the stun powerups
                    stunBombsLeft = stunBombsLeft - 1;
                    
                    [stunBombsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", stunBombsLeft]];
                }
                
                else if (powerUpCurrentlySelected == MIND_CONTROL_POWER_UP_SELECTED && mindControlPowerUpsLeft > 0) {
                    
                    //Create and mind control powerup where first player is.
                    [self addMindControlPowerUpSprite: firstPlayerSprite.position.x y: firstPlayerSprite.position.y];
                    
                    //Decrement one of the stun powerups
                    mindControlPowerUpsLeft = mindControlPowerUpsLeft - 1;
                    
                    [mindControlCocktailsLeftCounterLabel setString: [NSString stringWithFormat:@"%i", mindControlPowerUpsLeft]];
                }
                
                else if (powerUpCurrentlySelected == STUN_PROJECTILE_POWER_UP_SELECTED && stunProjectilesLeft > 0) {
                    
                    //Shoot Lightning bubbles
                    [self shootStunProjectile: firstPlayerSprite.position.x y:firstPlayerSprite.position.y];
                    
                    //Decrement one of the stun powerups
                    stunProjectilesLeft = stunProjectilesLeft - 1;
                    
                    [stunProjectilesLeftCounterLabel setString: [NSString stringWithFormat:@"%i", stunProjectilesLeft]];
                }
            }
            
            if (CGRectContainsPoint(blueInventorySlot1.boundingBox, touchLocationSelfLayer) && !firstPlayerCurrentlyDead) {
                
                powerUpCurrentlySelected = STUN_POWER_UP_SELECTED;
                
                [self powerUpSelected];
            }
            
            else if (CGRectContainsPoint(blueInventorySlot2.boundingBox, touchLocationHudLayer) && !firstPlayerCurrentlyDead) {
                
                powerUpCurrentlySelected = MIND_CONTROL_POWER_UP_SELECTED;
                
                [self powerUpSelected];
            }
            
            else if (CGRectContainsPoint(blueInventorySlot3.boundingBox, touchLocationHudLayer) && !firstPlayerCurrentlyDead) {
                
                powerUpCurrentlySelected = STUN_PROJECTILE_POWER_UP_SELECTED;
                
                [self powerUpSelected];
            }
        }
    }
    
    else if (currentScreen == VICTORY_SCREEN) {

        if (tapToContinueLabel.visible == NO && !(CGRectContainsPoint(saveVideoButton.boundingBox, touchLocationSelfLayer))) {
                        
            [self displayAllVictoryScreenInformationImmediately];
        }
        
        else if (tapToContinueLabel.visible == YES && !(CGRectContainsPoint(saveVideoButton.boundingBox, touchLocationSelfLayer))) {
            
            //Set blackLayer Z-Layer to black out gameLayer
            [blackLayerForPauseScreen setZOrder: 100];
            
            //Make all Victory screen assets not visible
            star1.visible = NO;
            star2.visible = NO;
            star3.visible = NO;
            tryHarderLabel.visible = NO;
            notBadLabel.visible = NO;
            goodLabel.visible = NO;
            youreAwesomeLabel.visible = NO;
            tapToContinueLabel.visible = NO;
            saveVideoButton.visible = NO;
            
            if (currentLevel != 11 && currentLevel != 21 && currentLevel != 31 && currentLevel != 41 && currentLevel != 51) {
            
                int randomNumber = arc4random()%2;
                
                if (randomNumber == 0 && !firstPlayerHasSneakers) {
                    
                    [AdColony playVideoAdForZone:@"vz1d03f5640811499e884b62" withDelegate:self withV4VCPrePopup:YES andV4VCPostPopup:YES];
                }
                
                else {
                    
                    [cb showInterstitial];
                }
            }
            
            else {
                
                [self mainPlayerWalkingOffScreenOnVictoryScreen];
            }
        }
        
        else if (CGRectContainsPoint(saveVideoButton.boundingBox, touchLocationSelfLayer)) {
            
            //DEBUG: Turn off kamcord for simulator
            //[self kamcordStopRecordingAndShowView];
        }
    }
    
    else if (currentScreen == GAME_OVER_SCREEN) {
        
        if (tapToContinueLabel.visible == YES && !(CGRectContainsPoint(saveVideoButton.boundingBox, touchLocationSelfLayer))) {
            
            [self progressToNextLevel];
            saveVideoButton.visible = NO;
            
            if (!isSinglePlayer) {
                
                [self sendStartMultiplayerVersusMatch];
            }
        }
        
        else if (CGRectContainsPoint(saveVideoButton.boundingBox, touchLocationSelfLayer)) {
            
            //DEBUG: Turn off kamcord for simulator
            //[self kamcordStopRecordingAndShowView];
        }
    }
    
    return YES;
}

-(void) ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:[touch view]];
	touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
	
	CGPoint touchLocation = [touch locationInView: [touch view]];
	CGPoint prevLocation = [touch previousLocationInView: [touch view]];
	
	touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
	prevLocation = [[CCDirector sharedDirector] convertToGL: prevLocation];
    
    CGPoint touchLocationSelfLayer = [self convertTouchToNodeSpace:touch];
    CGPoint touchLocationHudLayer = [hudLayer convertTouchToNodeSpace:touch];
    /*
    if (currentScreen == LEVEL_SELECTION_MENU) {

        CGPoint diff = ccpSub(touchLocation,prevLocation);
        [menuLayer setPosition: ccpAdd(ccp(menuLayer.position.x, 0), ccp(diff.x, 0))];
        
        NSLog (@"menuLayer position - (%f, %f)", menuLayer.position.x, menuLayer.position.y);
    }
    */
    if (CGRectContainsPoint(leftArrowButton.boundingBox, touchLocationHudLayer)) {
        
        [self dPadLeftPressed];
        
        leftArrowButtonTouched = YES;
        rightArrowButtonTouched = NO;
        
        if (isPlayer1 && !firstPlayerCurrentlyDead) {
        
            if (!isSinglePlayer && !firstPlayerCurrentlyDead && !secondPlayerSprite.secondPlayerCurrentlyDead) {
            
                [self sendMessageMakeFirstPlayerSpriteFaceLeft];
            }
            
            moveLeft1 = YES;
            moveRight1 = NO;
            firstPlayerFacingRight = NO;
        }
        
        if (!isPlayer1 && !secondPlayerSprite.secondPlayerCurrentlyDead) {
            
            if (!isSinglePlayer && !firstPlayerCurrentlyDead && !secondPlayerSprite.secondPlayerCurrentlyDead) {
            
                [self sendMessageMakeSecondPlayerSpriteFaceLeft];
            }
            
            secondPlayerSprite.secondPlayerMoveLeft = YES;
            secondPlayerSprite.secondPlayerMoveRight = NO;
            secondPlayerSprite.secondPlayerFacingRight = NO;
        }
    }
    
    if (CGRectContainsPoint(rightArrowButton.boundingBox, touchLocationHudLayer)) {
    
        [self dPadRightPressed];
        
        leftArrowButtonTouched = NO;
        rightArrowButtonTouched = YES;
        
        if (isPlayer1 && !firstPlayerCurrentlyDead) {
        
            if (!firstPlayerCurrentlyDead) {
            
                if (!isSinglePlayer) {
                
                    [self sendMessageMakeFirstPlayerSpriteFaceRight];
                }
            }
            
            moveRight1 = YES;
            moveLeft1 = NO;
            firstPlayerFacingRight = YES;
        }
        
        if (!isPlayer1 && !secondPlayerSprite.secondPlayerCurrentlyDead) {
            
            if (!secondPlayerSprite.secondPlayerCurrentlyDead) {
            
                if (!isSinglePlayer) {
                
                    [self sendMessageMakeSecondPlayerSpriteFaceRight];
                }
            }
            
            secondPlayerSprite.secondPlayerMoveRight = YES;
            secondPlayerSprite.secondPlayerMoveLeft = NO;
            secondPlayerSprite.secondPlayerFacingRight = YES;
        }
        
        if (!isSinglePlayer) {
            
        //    [self sendStopMoving];
        //    [self sendMoveRight];
        }
    }
    
    
    if (CGRectContainsPoint(leftArrowButton.boundingBox, touchLocationHudLayer)) {
        
        [self dPadLeftPressed];
        
        if (isPlayer1) {
        
            if (!isSinglePlayer && !firstPlayerCurrentlyDead && !secondPlayerSprite.secondPlayerCurrentlyDead) {
            
                [self sendMessageMakeFirstPlayerSpriteFaceLeft];
            }
            
            moveRight1 = NO;
            moveLeft1 = YES;
        }
        
        if (!isPlayer1) {
            
            if (!isSinglePlayer && !firstPlayerCurrentlyDead && !secondPlayerSprite.secondPlayerCurrentlyDead) {
            
                [self sendMessageMakeSecondPlayerSpriteFaceLeft];
            }
            
            secondPlayerSprite.secondPlayerMoveRight = NO;
            secondPlayerSprite.secondPlayerMoveLeft = YES;
        }
        
        if (!isSinglePlayer) {
            
        //    [self sendStopMoving];
        //    [self sendMoveLeft];
        }
    }
    
    if (CGRectContainsPoint(rightArrowButton.boundingBox, touchLocationHudLayer)) {
        
        [self dPadRightPressed];
        
        if (isPlayer1) {
        
            if (!firstPlayerCurrentlyDead) {
            
                if (!isSinglePlayer) {
                
                    [self sendMessageMakeFirstPlayerSpriteFaceRight];
                }
            }
            
            moveLeft1 = NO;
            moveRight1 = YES;
        }
        
        if (!isPlayer1) {
            
            if (!secondPlayerSprite.secondPlayerCurrentlyDead) {
            
                if (!isSinglePlayer) {
                
                    [self sendMessageMakeSecondPlayerSpriteFaceRight];
                }
            }
            
            secondPlayerSprite.secondPlayerMoveLeft = NO;
            secondPlayerSprite.secondPlayerMoveRight = YES;
        }
        
        if (!isSinglePlayer) {
            
        //    [self sendStopMoving];
        //    [self sendMoveRight];
        }
    }
}

-(void) ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event
{
    NSLog (@"Touch cancelled!");
    
    if (isPlayer1) {
    
        [self dPadNotPressed];
        
        moveRight1 = NO;
        moveLeft1 = NO;
    }
    
    if (!isPlayer1) {
        
        secondPlayerSprite.secondPlayerMoveRight = NO;
        secondPlayerSprite.secondPlayerMoveLeft = NO;
    }
    
    if (pauseButtonTouched) {
        
        pauseButtonTouched = NO;
    }
}

-(void) ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [touch locationInView:[touch view]];
	touchPoint = [[CCDirector sharedDirector] convertToGL:touchPoint];
	
	CGPoint touchLocation = [touch locationInView: [touch view]];
	CGPoint prevLocation = [touch previousLocationInView: [touch view]];
	
	touchLocation = [[CCDirector sharedDirector] convertToGL: touchLocation];
	prevLocation = [[CCDirector sharedDirector] convertToGL: prevLocation];
    
    CGPoint touchLocationSelfLayer = [self convertTouchToNodeSpace:touch];
    CGPoint touchLocationHudLayer = [hudLayer convertTouchToNodeSpace:touch];

    
    if (isPlayer1) {
    
        if (leftArrowButtonTouched && touchLocation.x < 240) {
            
            [self dPadNotPressed];
            
            leftArrowButtonTouched = NO;
            moveLeft1 = NO;
        }
        
        if (rightArrowButtonTouched && touchLocation.x < 240) {
            
            [self dPadNotPressed];
            
            rightArrowButtonTouched = NO;
            moveRight1 = NO;
        }
    }
    
    if (!isPlayer1) {
        
        if (leftArrowButtonTouched && !jumpButtonTouched && !activePowerUpButtonTouched) {
            
            [self dPadNotPressed];
            
            leftArrowButtonTouched = NO;
            secondPlayerSprite.secondPlayerMoveLeft = NO;
        }
        
        if (rightArrowButtonTouched && !jumpButtonTouched && !activePowerUpButtonTouched) {
            
            [self dPadNotPressed];
            
            rightArrowButtonTouched = NO;
            secondPlayerSprite.secondPlayerMoveRight = NO;
        }
    }
    
    if (jumpButtonTouched && touchLocation.x >= 240) {
        
        if (jumpButtonTouched) {
        
            [self jumpButtonNotPressed];
            
            jumpButtonTouched = NO;
        }
        
        if (isPlayer1) {
            
            if (moveLeft1)
                moveLeft1 = YES;
            
            if (moveRight1)
                moveRight1 = YES;
        }
        
        if (!isPlayer1) {
            
            if (secondPlayerSprite.secondPlayerMoveLeft)
                secondPlayerSprite.secondPlayerMoveLeft = YES;
            
            
            if (secondPlayerSprite.secondPlayerMoveRight)
                secondPlayerSprite.secondPlayerMoveRight = YES;
        }
    }
    
    
    if (activePowerUpButtonTouched && touchLocation.x >= 240) {
        
        if (activePowerUpButtonTouched) {
            
            activePowerUpButtonTouched = NO;
            
            [self activePowerUpButtonNotPressed];
        }
        
        if (isPlayer1) {
            
            if (moveLeft1)
                moveLeft1 = YES;
            
            if (moveRight1)
                moveRight1 = YES;
        }
        
        if (!isPlayer1) {
            
            if (secondPlayerSprite.secondPlayerMoveLeft)
                secondPlayerSprite.secondPlayerMoveLeft = YES;
            
            
            if (secondPlayerSprite.secondPlayerMoveRight)
                secondPlayerSprite.secondPlayerMoveRight = YES;
        }
    }
    
    if (pauseButtonTouched && touchLocation.x < 240 + 40 && touchLocation.x > 240 - 40) {
        
        if (pauseButtonTouched) {
            
            pauseButtonTouched = NO;
        }
            
        if (moveLeft1)
            moveLeft1 = YES;
        
        if (moveRight1)
            moveRight1 = YES;
    }
}


#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppDelegate *app = (AppDelegate*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppDelegate *app = (AppDelegate*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
  //  [enemySpritesArray release];
    
    [otherPlayerID release];
    otherPlayerID = nil;
    
	[super dealloc];
}

- (void)matchStarted {
    CCLOG(@"Match started");
    
    isSinglePlayer = NO;
    
    if (receivedRandom) {
        [self setGameState:kGameStateWaitingForStart];
    } else {
        [self setGameState:kGameStateWaitingForRandomNumber];
    }
    [self sendRandomNumber];
    [self tryStartGame];
}

- (void)matchEnded {
    CCLOG(@"Match ended");
    
    [[GCHelper sharedInstance].match disconnect];
    [GCHelper sharedInstance].match = nil;
    [self endScene:kEndReasonDisconnect];
}

- (void)match:(GKMatch *)match didReceiveData:(NSData *)data fromPlayer:(NSString *)playerID {
    
    // Store away other player ID for later
    if (otherPlayerID == nil) {
        otherPlayerID = [playerID retain];
    }
    
    Message *message = (Message *) [data bytes];
    if (message->messageType == kMessageTypeRandomNumber) {
        
        MessageRandomNumber * messageInit = (MessageRandomNumber *) [data bytes];
        
        //Create a subroutine which takes the opposing device's deviceSpeed, and compares it to the local deviceSpeed.
        //If opposing device's deviceSpeed is larger, then local player becomes player 2.
        //If both devices are the same speed, then use randomNumber to figure out who player1 should be.
        
        
        
        CCLOG(@"Received random number: %ud, ours %ud", messageInit->randomNumber, ourRandom);
        bool tie = false;
        
        if (messageInit->randomNumber == ourRandom) {
            CCLOG(@"TIE!");
            tie = true;
            ourRandom = arc4random();
            [self sendRandomNumber];
        } else if (ourRandom > messageInit->randomNumber) {
            CCLOG(@"We are player 1");
            isPlayer1 = YES;
        } else {
            CCLOG(@"We are player 2");
            isPlayer1 = NO;
        }
        
        if (!tie) {
            receivedRandom = YES;
            if (gameState == kGameStateWaitingForRandomNumber) {
                [self setGameState:kGameStateWaitingForStart];
            }
            [self tryStartGame];
        }
        
    } else if (message->messageType == kMessageTypeGameBegin) {
        
        [self setGameState:kGameStateActive];
                
        [self loadMultiplayerVersusScreen];
        
    //    [self setupStringsWithOtherPlayerId:otherPlayerID];
    
    } else if (message->messageType == kMessageTypeGameOver) {
        
        MessageGameOver * messageGameOver = (MessageGameOver *) [data bytes];
        CCLOG(@"Received game over with player 1 won: %d", messageGameOver->player1Won);
        
        if (messageGameOver->player1Won) {
            [self endScene:kEndReasonLose];
        } else {
            [self endScene:kEndReasonWin];    
        }
        
    } else if (message->messageType == kMessageTypeMoveRight) {
                
        if (isPlayer1) {
            
            NSLog (@"I am player 1");

            secondPlayerSprite.secondPlayerMoveRight = YES;
        }
        
        else if (!isPlayer1) {
            
            NSLog (@"I am player 2");
            
            moveRight1 = YES;
        }
        
    } else if (message->messageType == kMessageTypeMoveLeft) {
        
        if (isPlayer1) {
            
            secondPlayerSprite.secondPlayerMoveLeft= YES;
        }
        
        else if (!isPlayer1) {
            
            moveLeft1 = YES;
        }
        
    } else if (message->messageType == kMessageTypeJump) {
        
        [[SimpleAudioEngine sharedEngine] playEffect:@"Jump.wav"];
        /*
        if (isPlayer1) {
            
            secondPlayerSprite.secondPlayersNumberOfJumpsAvailable = secondPlayerSprite.secondPlayersNumberOfJumpsAvailable - 1;
            
            if (secondPlayerSprite.secondPlayerHasSneakers == YES) {
                
                secondPlayerSprite.secondPlayerJumpSpeed = secondPlayerSprite.secondPlayerJumpSpeed + 6.2 + JUMP_SPEED_MULTIPLIER*6.2;
            }
            
            if (secondPlayerSprite.secondPlayerHasSneakers == NO) {
                
                secondPlayerSprite.secondPlayerJumpSpeed = secondPlayerSprite.secondPlayerJumpSpeed + 6.2;
            }
        }
        
        if (!isPlayer1) {
            
            playersNumberOfJumpsAvailable = playersNumberOfJumpsAvailable - 1;
            
            if (firstPlayerHasSneakers == YES) {
                
                firstPlayerJumpSpeed = firstPlayerJumpSpeed + 6.2 + JUMP_SPEED_MULTIPLIER*6.2;
            }
            
            if (firstPlayerHasSneakers == NO) {
                
                firstPlayerJumpSpeed = firstPlayerJumpSpeed + 6.2;
            }
        }
        */
    } else if (message->messageType == kMessageTypeStopMoving) {
        
        if (isPlayer1) {
            
            secondPlayerSprite.secondPlayerMoveRight = NO;
            secondPlayerSprite.secondPlayerMoveLeft = NO;
        }
        
        else if (!isPlayer1) {
            
            moveRight1 = NO;
            moveLeft1 = NO;
        }
        
    } else if (message->messageType == kMessageTypePlayer1Position) {
        
        MessagePlayer1Position * structPlayer1Position = (MessagePlayer1Position *) [data bytes];
        player1Position = structPlayer1Position->player1Position;
        
        if (currentScreen == GAME_SCREEN && progressToNextLevelAlreadyRunning == NO) {
        
        //    NSLog (@"I am player 2 and player1Position = (%f, %f)", player1Position.x, player1Position.y);
    
            firstPlayerSprite.position = player1Position;
        }
        
    } else if (message->messageType == kMessageTypePlayer2Position) {
        
        MessagePlayer2Position * structPlayer2Position = (MessagePlayer2Position *) [data bytes];
        player2Position = structPlayer2Position->player2Position;
        
        if (currentScreen == GAME_SCREEN && progressToNextLevelAlreadyRunning == NO) {
            
        //    NSLog (@"I am player 1 and player2Position = (%f, %f)", player2Position.x, player2Position.y);
            
            secondPlayerSprite.position = player2Position;
        }
        
    } else if (message->messageType == kMessageTypePlayer1IsDead) {
                    
        [self player1IsDead];
        
    } else if (message->messageType == kMessageTypePlayer2IsDead) {
        
        [self player2IsDead];
        
    } else if (message->messageType == kMessageTypeHidgonMovementsArrayForPlayer2) {
        
        MessagePlayerHidgonMovementsArrayForPlayer2 * receivedDynamicPlacesArrayPointer = (MessagePlayerHidgonMovementsArrayForPlayer2*)malloc([data length]);
        [data getBytes:receivedDynamicPlacesArrayPointer length:[data length]];
                
        for (int i = 0; i < receivedDynamicPlacesArrayPointer->total_number_of_elements; i++) {
                            
            NSNumber *hidgonMovementInteger = [NSNumber numberWithInt: receivedDynamicPlacesArrayPointer[i].hidgon_Movement_Integer];
            [hidgonMovementsArrayForPlayer2 insertObject:hidgonMovementInteger atIndex:0];
           
        //    NSLog (@"I am player2 and received = %i", [hidgonMovementInteger integerValue]);
        }

        for (Enemy *hidgonEnemy in enemyHidgonSpritesArray) {
                        
            NSNumber *number = [hidgonMovementsArrayForPlayer2 lastObject];
                        
            [hidgonEnemy.hidgonMovementsArray insertObject:number atIndex:0];
            
            [hidgonMovementsArrayForPlayer2 removeLastObject];            
        }
                
    } else if (message->messageType == kMessageTypeEnemyLocationsArrayForPlayer2) {
        
        MessageEnemyLocationsArrayForPlayer2 * receivedDynamicPlacesArrayPointer = (MessageEnemyLocationsArrayForPlayer2*)malloc([data length]);
        [data getBytes:receivedDynamicPlacesArrayPointer length:[data length]];
        
        for (int i = 0; i < receivedDynamicPlacesArrayPointer->total_number_of_elements; i++) {
            
            NSValue *enemyPostionPoint = [NSValue valueWithCGPoint:receivedDynamicPlacesArrayPointer[i].enemy_location_cgpoints];

            [enemyPositionsForPlayer2Array insertObject:enemyPostionPoint atIndex:0];
        }
        
        for (Enemy *enemies in enemySpritesArray) {
            
            //NSLog (@"hidgonEnemy.enemyReferenceNumber = %i", hidgonEnemy.enemyReferenceNumber);
            NSValue *enemyPosition = [enemyPositionsForPlayer2Array lastObject];
            
            
    //        if ((enemies.position.x > [enemyPosition CGPointValue].x + 0) || (enemies.position.x < [enemyPosition CGPointValue].x - 0) || (enemies.position.y > [enemyPosition CGPointValue].y + 0) || (enemies.position.y < [enemyPosition CGPointValue].y - 0)) {
            
                enemies.position = [enemyPosition CGPointValue];
    //        }
            
            [enemyPositionsForPlayer2Array removeLastObject];
        }
        
        [enemyPositionsForPlayer2Array removeAllObjects];
        
    } else if (message->messageType == kMessageTypeStartMultiplayerVersusMatch) {
        
        [self progressToNextLevel];
        
    } else if (message->messageType == kMessageTypeIncreaseTimer) {
    
        //Player2 is receiving this message and should increase the game timer by a tick
        [self increaseTimer];
        
    } else if (message->messageType == kMessageTypeMakeHidgonFaceRight) {
    
        MessageMakeHidgonFaceRight * structEnemyReferenceNumber = (MessageMakeHidgonFaceRight *) [data bytes];
        int hidgonReferenceNumberFromStruct = structEnemyReferenceNumber->enemyReferenceNumber;
        
        for (Enemy *hidgonEnemy in enemyHidgonSpritesArray) {
            
            if (hidgonEnemy.enemyReferenceNumber == hidgonReferenceNumberFromStruct) {
                
                hidgonEnemy.gunnerWalking.flipX = NO;
                hidgonEnemy.gunnerStandingStill.flipX = NO;
            }
        }
        
    } else if (message->messageType == kMessageTypeMakeHidgonFaceLeft) {
        
        MessageMakeHidgonFaceLeft * structEnemyReferenceNumber = (MessageMakeHidgonFaceLeft *) [data bytes];
        int hidgonReferenceNumberFromStruct = structEnemyReferenceNumber->enemyReferenceNumber;
        
        for (Enemy *hidgonEnemy in enemyHidgonSpritesArray) {
            
            if (hidgonEnemy.enemyReferenceNumber == hidgonReferenceNumberFromStruct) {
                
                hidgonEnemy.gunnerWalking.flipX = YES;
                hidgonEnemy.gunnerStandingStill.flipX = YES;
            }
        }
        
    } else if (message->messageType == kMessageTypeMakeParkourJumperFaceRight) {
        
        MessageMakeParkourJumperFaceRight * structEnemyReferenceNumber = (MessageMakeParkourJumperFaceRight *) [data bytes];
        int parkourJumperReferenceNumberFromStruct = structEnemyReferenceNumber->enemyReferenceNumber;
        
        for (Enemy *parkourJumper in parkourJumperEnemySpritesArray) {
            
            if (parkourJumper.enemyReferenceNumber == parkourJumperReferenceNumberFromStruct) {
                
                parkourJumper.mySprite.flipX = NO;
            }
        }
        
    } else if (message->messageType == kMessageTypeMakeParkourJumperFaceLeft) {
        
        MessageMakeParkourJumperFaceLeft * structEnemyReferenceNumber = (MessageMakeParkourJumperFaceLeft *) [data bytes];
        int parkourJumperReferenceNumberFromStruct = structEnemyReferenceNumber->enemyReferenceNumber;
        
        for (Enemy *parkourJumper in parkourJumperEnemySpritesArray) {
            
            if (parkourJumper.enemyReferenceNumber == parkourJumperReferenceNumberFromStruct) {
                
                parkourJumper.mySprite.flipX = YES;
            }
        }

    } else if (message->messageType == kMessageTypeMakeHidgonShootFireballRight) {
    
        MessageMakeHidgonFaceLeft * structEnemyReferenceNumber = (MessageMakeHidgonFaceLeft *) [data bytes];
        int hidgonReferenceNumberFromStruct = structEnemyReferenceNumber->enemyReferenceNumber;
        
        for (Enemy *hidgonEnemy in enemyHidgonSpritesArray) {
            
            if (hidgonEnemy.enemyReferenceNumber == hidgonReferenceNumberFromStruct) {
                
                [[SimpleAudioEngine sharedEngine] playEffect:@"ShootFireball.wav" pitch: 0.9 pan: 0.5 gain: 0.3];
                
                [self shootFireballRight:hidgonEnemy.position.x y:hidgonEnemy.position.y];
            }
        }
    } else if (message->messageType == kMessageTypeMakeHidgonShootFireballLeft) {
        
        MessageMakeHidgonFaceLeft * structEnemyReferenceNumber = (MessageMakeHidgonFaceLeft *) [data bytes];
        int hidgonReferenceNumberFromStruct = structEnemyReferenceNumber->enemyReferenceNumber;
        
        for (Enemy *hidgonEnemy in enemyHidgonSpritesArray) {
            
            if (hidgonEnemy.enemyReferenceNumber == hidgonReferenceNumberFromStruct) {
                
                [[SimpleAudioEngine sharedEngine] playEffect:@"ShootFireball.wav" pitch: 0.9 pan: 0.5 gain: 0.3];
                
                [self shootFireballLeft:hidgonEnemy.position.x y:hidgonEnemy.position.y];
            }
        }
        
    } else if (message->messageType == kMessageTypeMakeFirstPlayerSpriteFaceRight) {
    
        if (!isPaused) {
        
            //I am Player2 receiving a message from Player1
            firstPlayerSprite.flipX = NO;
        }
        
    } else if (message->messageType == kMessageTypeMakeFirstPlayerSpriteFaceLeft) {
        
        if (!isPaused) {
        
            //I am Player2 receiving a message from Player1
            firstPlayerSprite.flipX = YES;
        }
    
    } else if (message->messageType == kMessageTypeMakeSecondPlayerSpriteFaceRight) {
        
        if (!isPaused) {
        
            //I am Player1 receiving a message from Player2
            secondPlayerSprite.mySprite.flipX = NO;
        }
        
    } else if (message->messageType == kMessageTypeMakeSecondPlayerSpriteFaceLeft) {
        
        if (!isPaused) {
        
            //I am Player1 receiving a message from Player2
            secondPlayerSprite.mySprite.flipX = YES;
        }
        
    } else if (message->messageType == kMessageTypeSendInGamePowerUpPosition) {
        
        MessageSendInGamePowerUpPosition * structInGamePowerUpPosition = (MessageSendInGamePowerUpPosition *) [data bytes];
        int inGamePowerUpPositionFromStruct = structInGamePowerUpPosition->inGamePowerUpPosition;
        
        NSLog (@"inGamePowerUpPositionFromStruct = %i", inGamePowerUpPositionFromStruct);
        
        NSMutableDictionary *powerUpsSpawnPointDictionary;

        for (powerUpsSpawnPointDictionary in [objectsGroup objects]) {
            if ([[powerUpsSpawnPointDictionary valueForKey:@"PowerUpSpawnPoint"] intValue] == inGamePowerUpPositionFromStruct) {
                                            
                float powerUpSpawnPointX = [[powerUpsSpawnPointDictionary valueForKey:@"x"] intValue];
                float powerUpSpawnPointY = [[powerUpsSpawnPointDictionary valueForKey:@"y"] intValue];
                [self addPowerUpSprite: powerUpSpawnPointX y: powerUpSpawnPointY];
                
                return;
            }
        }
        
    } else if (message->messageType == kMessageTypeSetPowerUpToNotVisible) {
        
        //Set inGame power up to not visible
        
        powerUpSprite.visible = NO;
        powerUpAlreadyExists = NO;
        powerUpAlreadyAppearedInThisLevel = NO;
    
    } else if (message->messageType == kMessageTypeCreateStunPowerUpAtOpposingPlayersPosition) {
        
        MessageCreateStunPowerUpAtOpposingPlayersPosition * structPlayerPosition = (MessageCreateStunPowerUpAtOpposingPlayersPosition *) [data bytes];
        
        CGPoint playerPosition = structPlayerPosition->playerPosition;
        
        [self addStunPowerUpSprite:playerPosition.x y:playerPosition.y];
        stunPowerUp.mySprite.color = ccRED;
        stunPowerUp.glow.color = ccRED;
        
        //If you're player1 and receiving the message, then the stunPowerUp doesn't belong to you, and vice versa
        if (isPlayer1) 
            stunPowerUp.stunPowerUpBelongsToPlayer1 = NO;
        if (!isPlayer1)
            stunPowerUp.stunPowerUpBelongsToPlayer1 = YES;
        
    } else if (message->messageType == kMessageTypePlayerReadyForMultiplayerMatch) {
        
        if (isPlayer1) {
            
            player2ReadyLabel.visible = YES;
            
            if (player1ReadyLabel.visible == YES && player2ReadyLabel.visible == YES) {
                
                [self sendStartMultiplayerVersusMatch];
                [self progressToNextLevel];
            }
        }
        
        else if (!isPlayer1) {
            
            player1ReadyLabel.visible = YES;
            
            if (player1ReadyLabel.visible == YES && player2ReadyLabel.visible == YES) {
                
                [self sendStartMultiplayerVersusMatch];
                [self progressToNextLevel];
            }
        }
        
    } else if (message->messageType == kMessageTypeMakeHidgonRunningAnimationVisible) {
        
        MessageMakeHidgonRunningAnimationVisible * structEnemyReferenceNumber = (MessageMakeHidgonRunningAnimationVisible *) [data bytes];
        int hidgonReferenceNumberFromStruct = structEnemyReferenceNumber->enemyReferenceNumber;
        
        for (Enemy *hidgonEnemy in enemyHidgonSpritesArray) {
            
            if (hidgonEnemy.enemyReferenceNumber == hidgonReferenceNumberFromStruct) {
                
                hidgonEnemy.gunnerWalking.visible = YES;
                hidgonEnemy.gunnerStandingStill.visible = NO;
            }
        }
        
    } else if (message->messageType == kMessageTypeMakeHidgonStandingStillAnimationVisible) {
        
        MessageMakeHidgonStandingStillAnimationVisible * structEnemyReferenceNumber = (MessageMakeHidgonStandingStillAnimationVisible *) [data bytes];
        int hidgonReferenceNumberFromStruct = structEnemyReferenceNumber->enemyReferenceNumber;
        
        for (Enemy *hidgonEnemy in enemyHidgonSpritesArray) {
            
            if (hidgonEnemy.enemyReferenceNumber == hidgonReferenceNumberFromStruct) {
                
                hidgonEnemy.gunnerWalking.visible = NO;
                hidgonEnemy.gunnerStandingStill.visible = YES;
            }
        }
        
    } else if (message->messageType == kMessageTypeMakeSkeletonWhaleFaceLeft) {
        
        MessageMakeSkeletonWhaleFaceLeft * structEnemyReferenceNumber = (MessageMakeSkeletonWhaleFaceLeft *) [data bytes];
        int skeletonWhaleReferenceNumberFromStruct = structEnemyReferenceNumber->enemyReferenceNumber;
        
        for (Enemy *skeletonWhale in enemySkeletonWhaleSpritesArray) {
            
            if (skeletonWhale.enemyReferenceNumber == skeletonWhaleReferenceNumberFromStruct) {
                
                skeletonWhale.jetmanFlying.flipX = YES;
            }
        }
        
    } else if (message->messageType == kMessageTypeMakeSkeletonWhaleFaceRight) {
        
        MessageMakeSkeletonWhaleFaceRight * structEnemyReferenceNumber = (MessageMakeSkeletonWhaleFaceRight *) [data bytes];
        int skeletonWhaleReferenceNumberFromStruct = structEnemyReferenceNumber->enemyReferenceNumber;
        
        for (Enemy *skeletonWhale in enemySkeletonWhaleSpritesArray) {
            
            if (skeletonWhale.enemyReferenceNumber == skeletonWhaleReferenceNumberFromStruct) {
                
                skeletonWhale.jetmanFlying.flipX = NO;
            }
        }
    }
}


@end
