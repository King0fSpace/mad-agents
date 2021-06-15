//
//  HelloWorldLayer.h
//  Mad Agents
//
//  Created by Long Le on 10/27/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


#import <GameKit/GameKit.h>
#import "HidgonEnemy.h"
#import "SkeletonWhale.h"
#import "DiagonalFlyerEnemy.h"
#import "RunningChaserEnemy.h"
#import "PowerUps.h"
#import "ExitDoor.h"
#import "TimeBomb.h"
#import "StunPowerUp.h"
#import "Enemy.h"
#import "MindControlPowerUp.h"
#import "StunProjectilePowerUp.h"
#import "MovingDoors.h"
#import "InGameButton.h"
#import "GCHelper.h"
#import "AppDelegate.h"
#import "CDAudioManager.h"
#import <math.h>
#import "SecondPlayer.h"
#import "MobclixFullScreenAdViewController.h"
#import "AdColonyPublic.h"
#import "LevelSelectorMenus.h"
#import "UIDeviceHardware.h"
#import "CharacterSelectionScreen.h"
#import "SaveVideoButton.h"





// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

@class SecondPlayer;

CCLayerColor *gameLayer;
CCSprite *firstPlayerSprite;
NSMutableArray *enemySpritesArray;
NSMutableArray *enemySkeletonWhaleSpritesArray;
NSMutableArray *firstPlayerSpriteArray;
NSMutableArray *fireballArray;
NSMutableArray *enemyDiagonalFlyerEnemySpritesArray;
NSMutableArray *runningChaserEnemySpritesArray;
NSMutableArray *powerUpsArray;
NSMutableArray *exitDoorArray;
NSMutableArray *timeBombArray;
NSMutableArray *stunPowerUpArray;
NSMutableArray *enemyHidgonSpritesArray;
NSMutableArray *mindControlPowerUpArray;
NSMutableArray *friendlyEnemyArray;
NSMutableArray *flyThroughWallsDiagonalFlyerEnemySpritesArray;
NSMutableArray *downwardShooterEnemySpritesArray;
NSMutableArray *stunProjectileArray;
NSMutableArray *movingDoorArray;
NSMutableArray *inGameButtonArray;
NSMutableArray *secondPlayerSpriteArray;
NSMutableArray *hidgonMovementsArrayForPlayer2;
NSMutableArray *parkourJumperMovementsArrayForPlayer2;
NSMutableArray *enemyPositionsForPlayer2Array;
NSMutableArray *parkourJumperEnemySpritesArray;
CCSprite *fireball;
CCLabelBMFont *gameOverLabel;
float totalBlackLayerFadeInTime;
float mainCharacterScaleUpTime;
float totalBlackLayerFadeInTimePlusMainCharacterScaleUpTime;
BOOL isGameOver;
int madAgentsAmount;
BOOL isPaused;
int timeInt;
BOOL deviceIsWidescreen;
CCTMXTiledMap *tileMap;
CCTMXLayer *foreground;
CCTMXLayer *solidBricks;
BOOL firstPlayerTouchingFloor;
BOOL firstPlayerHasSneakers;
BOOL firstPlayerHasTimeBomb;
BOOL timeBombPlacedOnDoor;
BOOL exitDoorIsOpen;
BOOL progressToNextLevelAlreadyRunning;
BOOL levelInSession;
BOOL powerUpAlreadyExists;
BOOL activePowerUpButtonPushed;
float enemyTotalStunTime;
BOOL playerCanSetStunBomb;
int stunBombsLeft;
int globalEnemyType;
int mindControlPowerUpsLeft;
int globalStunPowerUpsLeft;
BOOL playerHasInvincibilityPowerUp;
BOOL bulletTimeActive;
float bulletTimeSpeedReduction;
int stunProjectilesLeft;
CCSprite *stunProjectileInGame;
BOOL firstPlayerFacingRight;
CCSprite *stunProjectilePurchaseIcon;
int stunProjectilePurchaseIconPriceValue;
int invincibilityPowerUpPurchaseIconPriceValue;
UITextField *textField;
BOOL powerUpAlreadyAppearedInThisLevel;
CCTMXObjectGroup *objectsGroup;
BOOL isPlayer1;
uint32_t ourRandom;
BOOL receivedRandom;
int enemyReferenceNumberGlobal;
int totalEnemyReferenceNumbersGlobal;
CDAudioManager *am;
CDSoundEngine  *soundEngine;
SecondPlayer *secondPlayerSprite;
BOOL firstPlayerIsStunned;
BOOL secondPlayerIsStunned;
MobclixFullScreenAdViewController *mobclixFullScreenAd;
BOOL deviceIsIpad;
UIDeviceHardware *hardware;
BOOL activePowerUpButtonTouched;
BOOL leftArrowButtonTouched;
BOOL rightArrowButtonTouched;
BOOL pauseButtonTouched;
BOOL firstPlayerHasBoxingGlove;
BOOL isBossLevel;
int enemiesLeftValue;
int currentScreen;
int totalNumberOfEnemiesForCurrentBossLevel;
BOOL alreadyShowedChartboostAdForThisVictoryScreen;
BOOL chartBoostAdWasJustDismissed;
CCSprite *saveVideoButton;
CCLabelBMFont *gameOverTimeLabel;
CCLabelBMFont *enemiesLeftLabel;
SimpleAudioEngine *bossMusic;
CCLabelBMFont *resumeGameLabelForPauseScreen;
CCSprite *changeLevelLabelForPauseScreen;
CCSprite *madAgentsBanner;
CCSprite *mainPlayerBoxingGloveGlow;
CCSprite *mainCharacterBlueBoyWalking;
CCSprite *mainCharacterBlueBoyWalkingHoldingSomething;
CCSprite *mainCharacterBlueBoyStandingStill;
CCSprite *mainCharacterBlueBoyJumping;
CCSprite *mainCharacterBlueBoyDead;
CCSprite *mainCharacterBlueBoyHoldingUpBoxingGlove;
CCSprite *bossEnemySpawnPointHoleInWall;
CCSprite *whiteTeleportationSphere;
CCSprite *blackLayerForPauseScreen;

CCSprite *mainCharacterBlueBoyWalkingWithSneakers;
CCSprite *mainCharacterBlueBoyStandingStillWithSneakers;
CCSprite *mainCharacterBlueBoyJumpingWithSneakers;
CCSprite *mainCharacterBlueBoyDeadWithSneakers;
CCSprite *mainCharacterBlueBoyHoldingUpBoxingGloveWithSneakers;

CCSprite *mainCharacterGreenBoyWalking;
CCSprite *mainCharacterGreenBoyStandingStill;
CCSprite *mainCharacterGreenBoyJumping;
CCSprite *mainCharacterGreenBoyDead;
CCSprite *mainCharacterGreenBoyHoldingUpBoxingGlove;

CCSprite *mainCharacterGreenBoyWalkingWithSneakers;
CCSprite *mainCharacterGreenBoyStandingStillWithSneakers;
CCSprite *mainCharacterGreenBoyJumpingWithSneakers;
CCSprite *mainCharacterGreenBoyDeadWithSneakers;
CCSprite *mainCharacterGreenBoyHoldingUpBoxingGloveWithSneakers;

CCSprite *mainCharacterBeigeGirlWalking;
CCSprite *mainCharacterBeigeGirlStandingStill;
CCSprite *mainCharacterBeigeGirlJumping;
CCSprite *mainCharacterBeigeGirlDead;
CCSprite *mainCharacterBeigeGirlHoldingUpBoxingGlove;

CCSprite *mainCharacterBeigeGirlWalkingWithSneakers;
CCSprite *mainCharacterBeigeGirlStandingStillWithSneakers;
CCSprite *mainCharacterBeigeGirlJumpingWithSneakers;
CCSprite *mainCharacterBeigeGirlDeadWithSneakers;
CCSprite *mainCharacterBeigeGirlHoldingUpBoxingGloveWithSneakers;

CCSprite *mainCharacterPurpleGirlWalking;
CCSprite *mainCharacterPurpleGirlStandingStill;
CCSprite *mainCharacterPurpleGirlJumping;
CCSprite *mainCharacterPurpleGirlDead;
CCSprite *mainCharacterPurpleGirlHoldingUpBoxingGlove;

CCSprite *mainCharacterPurpleGirlStandingStillWithSneakers;
CCSprite *mainCharacterPurpleGirlJumpingWithSneakers;
CCSprite *mainCharacterPurpleGirlDeadWithSneakers;
CCSprite *mainCharacterPurpleGirlWalkingWithSneakers;
CCSprite *mainCharacterPurpleGirlHoldingUpBoxingGloveWithSneakers;

CCSpriteBatchNode *spriteSheetMainCharacterBlueBoyWalking;
NSMutableArray *mainCharacterBlueBoyWalkingAnimFrames;
NSMutableArray *mainCharacterBlueBoyWalkingHoldingSomethingAnimFrames;


BOOL helloWorldIsBoss;
int helloWorldHitPoints;
BOOL helloWorldChaserWalkingRight;
BOOL helloWorldChaserWalkingLeft;
int bossLevelLastEnemySpawnPointUsed;
CCSprite *elevatorPlatform;
CCSprite *elevatorShaft1;
CCSprite *elevatorShaft2;





//Enumerations
typedef enum {
    kGameStateWaitingForMatch = 0,
    kGameStateWaitingForRandomNumber,
    kGameStateWaitingForStart,
    kGameStateActive,
    kGameStateDone,
    kMessageTypeMoveRight,
    kMessageTypeMoveLeft,
    kMessageTypeStopMoving,
    kMessageTypeJump,
    kMessageTypePlayer1Position,
    kMessageTypePlayer2Position,
    kMessageTypePlayer1IsDead,
    kMessageTypePlayer2IsDead,
    kMessageTypeHidgonMovementsArrayForPlayer2,
    kMessageTypeEnemyLocationsArrayForPlayer2,
    kMessageTypeStartMultiplayerVersusMatch,
    kMessageTypeIncreaseTimer,
    kMessageTypeMakeHidgonFaceRight,
    kMessageTypeMakeHidgonFaceLeft,
    kMessageTypeMakeHidgonShootFireballRight,
    kMessageTypeMakeHidgonShootFireballLeft,
    kMessageTypeMakeFirstPlayerSpriteFaceRight,
    kMessageTypeMakeFirstPlayerSpriteFaceLeft,
    kMessageTypeMakeSecondPlayerSpriteFaceRight,
    kMessageTypeMakeSecondPlayerSpriteFaceLeft,
    kMessageTypeMakeParkourJumperFaceRight,
    kMessageTypeMakeParkourJumperFaceLeft,
    kMessageTypeSendInGamePowerUpPosition,
    kMessageTypeSetPowerUpToNotVisible,
    kMessageTypeCreateStunPowerUpAtOpposingPlayersPosition,
    kMessageTypePlayerReadyForMultiplayerMatch,
    kMessageTypeMakeHidgonRunningAnimationVisible,
    kMessageTypeMakeHidgonStandingStillAnimationVisible,
    kMessageTypeMakeSkeletonWhaleFaceRight,
    kMessageTypeMakeSkeletonWhaleFaceLeft,
} GameState;

//End Game Reasons
typedef enum {
    kEndReasonWin,
    kEndReasonLose,
    kEndReasonDisconnect
} EndReason;

//Network message structures
typedef enum {
    kMessageTypeRandomNumber = 0,
    kMessageTypeGameBegin,
    kMessageTypeMove,
    kMessageTypeGameOver
} MessageType;

typedef struct {
    MessageType messageType;
} Message;

typedef struct {
    Message message;
    uint32_t randomNumber;
    int deviceSpeed;
} MessageRandomNumber;

typedef struct {
    Message message;
} MessageGameBegin;

typedef struct {
    Message message;
} MessageMove;

typedef struct {
    Message message;
    BOOL player1Won;
} MessageGameOver;

//Players related movement messages
typedef struct {
    Message message;
} MessageMoveRight;

typedef struct {
    Message message;
} MessageMoveLeft;

typedef struct {
    Message message;
} MessageJump;

typedef struct {
    Message message;
} MessageStopMoving;

typedef struct {
    Message message;
} MessagePlayer1IsDead;

typedef struct {
    Message message;
} MessagePlayer2IsDead;

typedef struct {
    Message message;
    CGPoint player1Position;
} MessagePlayer1Position;

typedef struct {
    Message message;
    CGPoint player2Position;
} MessagePlayer2Position;

typedef struct {
    Message message;
    int total_number_of_elements;
    int hidgon_Movement_Integer;
} MessagePlayerHidgonMovementsArrayForPlayer2;

typedef struct {
    Message message;
    int total_number_of_elements;
    CGPoint enemy_location_cgpoints;
} MessageEnemyLocationsArrayForPlayer2;

typedef struct {
    Message message;
} MessageStartMultiplayerVersusMatch;

typedef struct {
    Message message;
} MessageIncreaseTimer;

typedef struct {
    Message message;
    int enemyReferenceNumber;
} MessageMakeHidgonFaceRight;

typedef struct {
    Message message;
    int enemyReferenceNumber;
} MessageMakeHidgonFaceLeft;

typedef struct {
    Message message;
    int enemyReferenceNumber;
} MessageMakeHidgonShootFireballRight;

typedef struct {
    Message message;
    int enemyReferenceNumber;
} MessageMakeHidgonShootFireballLeft;

typedef struct {
    Message message;
} MessageMakeFirstPlayerSpriteFaceRight;

typedef struct {
    Message message;
} MessageMakeFirstPlayerSpriteFaceLeft;

typedef struct {
    Message message;
} MessageMakeSecondPlayerSpriteFaceLeft;

typedef struct {
    Message message;
} MessageMakeSecondPlayerSpriteFaceRight;

typedef struct {
    Message message;
    int enemyReferenceNumber;
} MessageMakeParkourJumperFaceRight;

typedef struct {
    Message message;
    int enemyReferenceNumber;
} MessageMakeParkourJumperFaceLeft;

typedef struct {
    Message message;
    int inGamePowerUpPosition;
} MessageSendInGamePowerUpPosition;

typedef struct {
    Message message;
} MessageSetPowerUpToNotVisible;

typedef struct {
    Message message;
    CGPoint playerPosition;
} MessageCreateStunPowerUpAtOpposingPlayersPosition;

typedef struct {
    Message message;
} MessagePlayerReadyForMultiplayerMatch;

typedef struct {
    Message message;
    int enemyReferenceNumber;
} MessageMakeHidgonRunningAnimationVisible;

typedef struct {
    Message message;
    int enemyReferenceNumber;
} MessageMakeHidgonStandingStillAnimationVisible;

typedef struct {
    Message message;
    int enemyReferenceNumber;
} MessageMakeSkeletonWhaleFaceRight;

typedef struct {
    Message message;
    int enemyReferenceNumber;
} MessageMakeSkeletonWhaleFaceLeft;

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate, UIGestureRecognizerDelegate, GCHelperDelegate, AdColonyTakeoverAdDelegate>
{
}


//@property (nonatomic, retain) NSMutableArray *enemySpritesArray;


// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void) enemyHidgonAdjustMovement;
-(void) shootFireballRight:(float)x y:(float)y isBoss: (BOOL) isBoss;
-(void) shootFireballLeft:(float)x y:(float)y isBoss: (BOOL) isBoss;
-(void) increaseTimer;
-(void) shootFireballDownward:(float)x y:(float)y;
-(void) sendHidgonMovementsArrayForPlayer2;
-(void) sendEnemyLocationsArrayForPlayer2;
-(void) setupStringsWithOtherPlayerId: playerID;
-(void) sendMakeHidgonFaceRight: (int)hidgonEnemyReferenceNumber;
-(void) sendMakeHidgonFaceLeft: (int)hidgonEnemyReferenceNumber;
-(void) sendMakeHidgonShootFireballRight: (int)hidgonEnemyReferenceNumber;
-(void) sendMakeHidgonShootFireballLeft: (int)hidgonEnemyReferenceNumber;
-(void) sendMakeParkourJumperFaceRight: (int)parkourJumperReferenceNumber;
-(void) sendMakeParkourJumperFaceLeft: (int)parkourJumperReferenceNumber;
-(void) sendSetPowerUpToNotVisible;
-(void) progressToNextLevel;
-(void) gameOverScreen;
-(void) sendMakeHidgonStandingStillAnimationVisible: (int)hidgonEnemyReferenceNumber;
-(void) sendMakeHidgonRunningAnimationVisible: (int)hidgonEnemyReferenceNumber;
-(void) sendMakeSkeletonWhaleFaceRight: (int)skeletonWhaleReferenceNumber;
-(void) sendMakeSkeletonWhaleFaceLeft: (int)skeletonWhaleReferenceNumber;
-(void) playElevatorIntro;
-(void) characterSelectionScreen;
-(void) mainPlayerWalkingOffScreenOnVictoryScreen;


@end
