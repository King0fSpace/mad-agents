//
//  Enemy.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "Flurry.h"

#define HIDGON_ENEMY_TYPE                       0
#define DIAGONAL_FLYER_TYPE                     1
#define SKELETON_WHALE_TYPE                     2
#define CHASER_ENEMY_TYPE                       3
#define FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE   4
#define DOWNWARD_SHOOTER_TYPE                   5
#define PARKOUR_JUMPER_TYPE                     6

#define CHASER_BOSS_SPEED_BONUS                 0.5


@class HelloWorldLayer;

CCAction *enemySkeletonWhaleAdjustMovement;
CCAction *enemyHidgonAdjustMovement;
CCAction *downwardShooterShootingAction;
CCAction *parkourJumperAdjustMovement;
CGPoint tmpgidlocation;



@interface Enemy : CCSprite
{
    //Skeleton Whale
    BOOL enemySkeletonWhaleMovingRight;
    BOOL enemySkeletonWhaleMovingLeft;
    BOOL enemySkeletonWhaleMovingUp;
    BOOL enemySkeletonWhaleMovingDown;
    BOOL enemySkeletonWhaleStopped;
    BOOL skeletonWhaleCloserToPlayer1;
    CCSprite *jetmanFlying;
    BOOL skeletonWhaleFaceRightMessageAlreadySent;
    BOOL skeletonWhaleFaceLeftMessageAlreadySent;
    CCSprite *jetmanStunned;
    
    //Diagonal Enemy
    BOOL enemyDiagonalFlyerMovingUp;
    BOOL enemyDiagonalFlyerMovingLeft;
    BOOL enemyDiagonalFlyerMovingRight;
    BOOL enemyDiagonalFlyerMovingDown;
    BOOL enemyDiagonalFlyerStopped;
    BOOL enemyDiagonalFlyerTouchingWallOnTop;
    BOOL enemyDiagonalFlyerTouchingWallOnBottom;
    BOOL enemyDiagonalFlyerTouchingWallOnRightSide;
    BOOL enemyDiagonalFlyerTouchingWallOnLeftSide;
    CCSprite *diagonalFlyerStunned;

    
    //Fly-through-walls diagonal Enemy
    BOOL flyThroughWallsDiagonalFlyerMovingUp;
    BOOL flyThroughWallsDiagonalFlyerMovingLeft;
    BOOL flyThroughWallsDiagonalFlyerMovingRight;
    BOOL flyThroughWallsDiagonalFlyerMovingDown;
    BOOL flyThroughWallsDiagonalFlyerStopped;
    BOOL flyThroughWallsDiagonalFlyerTouchingWallOnTop;
    BOOL flyThroughWallsDiagonalFlyerTouchingWallOnBottom;
    BOOL flyThroughWallsDiagonalFlyerTouchingWallOnRightSide;
    BOOL flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide;
    float flyThroughWallsDiagonalFlyerEnemyResponseTime;
    CCSprite *flyThroughWallsDiagonalFlyerStunned;
    
    
    //Hidgon
    BOOL enemyHidgonTouchingFloor;
    BOOL enemyHidgonTouchingWallOnRightSide;
    BOOL enemyHidgonTouchingWallOnLeftSide;
    BOOL enemyHidgonWalkingRight;
    BOOL enemyHidgonWalkingLeft;
    BOOL enemyHidgonFalling;
    BOOL enemyHidgonStopped;
    float hidgonJumpSpeed;
    BOOL hidgonCurrentlyJumping;
    BOOL hidgonAllowedToJump;
    BOOL shootingFireBall;
    BOOL enemyHidgonAdjustMovementActionIsRunning;
    NSMutableArray *hidgonMovementsArray;
    CCAction *enemyHidgonWalkRightAction;
    CCAction *enemyHidgonWalkLeftAction;
    CCAction *enemyHidgonWalkRightMadAgentsValue1Action;
    CCAction *enemyHidgonWalkLeftMadAgentsValue1Action;
    CCAction *enemyHidgonFallAction;
    CCAction *enemyHidgonJumpAction;
    BOOL hidgonCloserToPlayer1;
    CCSprite *gunnerWalking;
    CCSprite *gunnerStandingStill;
    BOOL enemyHidgonFaceRightMessageAlreadySent;
    BOOL enemyHidgonFaceLeftMessageAlreadySent;
    BOOL enemyHidgonStandingStillVisibleMessageAlreadySent;
    BOOL enemyHidgonRunningVisibleMessageAlreadySent;
    CCSprite *gunnerStunned;

    
    //Chaser Enemy
    BOOL runningChaserEnemyTouchingFloor;
    BOOL runningChaserEnemyTouchingWallOnRightSide;
    BOOL runningChaserEnemyouchingWallOnLeftSide;
    BOOL runningChaserEnemyWalkingRight;
    BOOL runningChaserEnemyWalkingLeft;
    BOOL runningChaserEnemyStopped;
    BOOL runningChaserEnemyCurrentlyJumping;
    BOOL runningChaserEnemyAllowedToJump;
    BOOL runningChaserIsChasingPlayer;
    CCSprite *chaserWalking;
    CCSprite *chaserRunning;
    CCSprite *chaserStunned;
    CCSprite *chaserStandingStillBored;
    CCSprite *chaserStandingStillAngry;
    BOOL chaserCanSeePlayer;
    BOOL isBoss;
    BOOL hitPointsLeft;
    BOOL bossAlreadyPunched;
    
    //DownwardShooter Enemy
    BOOL downwardShooterEnemyTouchingFloor;
    BOOL downwardShooterEnemyTouchingWallOnRightSide;
    BOOL downwardShooterEnemyTouchingWallOnLeftSide;
    BOOL downwardShooterEnemyWalkingRight;
    BOOL downwardShooterEnemyWalkingLeft;
    BOOL downwardShooterEnemyStopped;
    CCSprite *saucerFlying;
    BOOL downwardShooterShootingActionAlreadyRunning;
    CCSprite *saucerStunned;
    
    //ParkourJumper Enemy
    BOOL parkourJumperTouchingFloor;
    BOOL parkourJumperTouchingWallOnRightSide;
    BOOL parkourJumperTouchingWallOnLeftSide;    
    BOOL parkourJumperTouchingJumpableLedgeOnRightSide;
    BOOL parkourJumperTouchingJumpableLedgeOnLeftSide;
    BOOL parkourJumperJumpingOverLedgeOnLeftSide;
    BOOL parkourJumperJumpingOverLedgeOnRightSide;
    BOOL parkourJumperWalkingRight;
    BOOL parkourJumperWalkingLeft;
    BOOL parkourJumperFalling;
    BOOL parkourJumperStopped;
    float parkourJumperJumpSpeed;
    BOOL parkourJumperCurrentlyJumping;
    BOOL parkourJumperAllowedToJump;
    BOOL parkourJumperAdjustMovementActionIsRunning;
    NSMutableArray *parkourJumperMovementsArray;
    CCAction *parkourJumperWalkRightAction;
    CCAction *parkourJumperWalkLeftAction;
    CCAction *parkourJumperWalkRightMadAgentsValue1Action;
    CCAction *parkourJumperWalkLeftMadAgentsValue1Action;
    CCAction *parkourJumperFallAction;
    CCAction *parkourJumperJumpAction;
    CCAction *parkourJumperJumpingOverLedgeOnLeftSideAction;
    CCAction *parkourJumperJumpingOverLedgeOnRightSideAction;
    BOOL parkourJumperCloserToPlayer1;
    int parkourJumperDistanceToLedgeOnLeftSide;
    int parkourJumperDistanceToLedgeOnRightSide;
    CCSprite *ninjaRunning;
    CCSprite *ninjaJumping;
    CCSprite *ninjaStandingStill;
    CCSprite *ninjaStunned;

    
    //All Enemy Types
    int enemyType;
    CCLabelBMFont *stunTimerLabel;
    CCLabelBMFont *friendlyTimerLabel;
    int stunTimeValue;
    int friendlyTimeValue;
    CCAction *decreaseStunTimerAction;
    CCAction *decreaseFriendlyTimerAction;
    float walkingSpeed;
    int enemyReferenceNumber;
    CGPoint closestJumpableTileLocation;
    CCSprite *mySprite;
    CGPoint closestLedgeTileLocation;
    BOOL decreaseStunTimerActionAlreadyRunning;
    BOOL decreaseFriendlyTimerActionAlreadyRunning;
    BOOL enemyKnockedOutOfTheArena;
    BOOL isCurrentlyTeleportingIn;

    
    //Diagonal Flyer and Fly-through-Walls Diagonal Flyer
    CCSprite *flyingUpRight;
    CCSprite *flyingUpLeft;
    CCSprite *flyingDownLeft;
    CCSprite *flyingDownRight;
}

//Skeleton Whale
@property BOOL enemySkeletonWhaleMovingRight;
@property BOOL enemySkeletonWhaleMovingLeft;
@property BOOL enemySkeletonWhaleMovingUp;
@property BOOL enemySkeletonWhaleMovingDown;
@property BOOL enemySkeletonWhaleStopped;
@property BOOL enemySkeletonWhaleMovingHorizontally;
@property BOOL skeletonWhaleCloserToPlayer1;
@property (nonatomic,assign) CCSprite *jetmanFlying;
@property BOOL skeletonWhaleFaceRightMessageAlreadySent;
@property BOOL skeletonWhaleFaceLeftMessageAlreadySent;
@property (nonatomic,assign) CCSprite *jetmanStunned;


//Diagonal Enemy
@property BOOL enemyDiagonalFlyerMovingUp;
@property BOOL enemyDiagonalFlyerMovingLeft;
@property BOOL enemyDiagonalFlyerMovingRight;
@property BOOL enemyDiagonalFlyerMovingDown;
@property BOOL enemyDiagonalFlyerStopped;
@property BOOL enemyDiagonalFlyerTouchingWallOnTop;
@property BOOL enemyDiagonalFlyerTouchingWallOnBottom;
@property BOOL enemyDiagonalFlyerTouchingWallOnRightSide;
@property BOOL enemyDiagonalFlyerTouchingWallOnLeftSide;
@property (nonatomic,assign) CCSprite *diagonalFlyerStunned;


//FlyThroughWallsDiagonal Enemy
@property BOOL flyThroughWallsDiagonalFlyerMovingUp;
@property BOOL flyThroughWallsDiagonalFlyerMovingLeft;
@property BOOL flyThroughWallsDiagonalFlyerMovingRight;
@property BOOL flyThroughWallsDiagonalFlyerMovingDown;
@property BOOL flyThroughWallsDiagonalFlyerStopped;
@property BOOL flyThroughWallsDiagonalFlyerTouchingWallOnTop;
@property BOOL flyThroughWallsDiagonalFlyerTouchingWallOnBottom;
@property BOOL flyThroughWallsDiagonalFlyerTouchingWallOnRightSide;
@property BOOL flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide;
@property float flyThroughWallsDiagonalFlyerEnemyResponseTime;
@property (nonatomic,assign) CCSprite *flyThroughWallsDiagonalFlyerStunned;

//Hidgon
@property BOOL enemyHidgonTouchingFloor;
@property BOOL enemyHidgonTouchingWallOnRightSide;
@property BOOL enemyHidgonTouchingWallOnLeftSide;
@property BOOL enemyHidgonWalkingRight;
@property BOOL enemyHidgonWalkingLeft;
@property BOOL enemyHidgonFalling;
@property BOOL enemyHidgonStopped;
@property float hidgonJumpSpeed;
@property BOOL hidgonCurrentlyJumping;
@property BOOL hidgonAllowedToJump;
@property BOOL shootingFireBall;
@property (nonatomic,assign) NSMutableArray *hidgonMovementsArray;
@property (nonatomic,assign) CCAction *enemyHidgonWalkRightAction;
@property (nonatomic,assign) CCAction *enemyHidgonWalkLeftAction;
@property (nonatomic,assign) CCAction *enemyHidgonWalkRightMadAgentsValue1Action;
@property (nonatomic,assign) CCAction *enemyHidgonWalkLeftMadAgentsValue1Action;
@property (nonatomic,assign) CCAction *enemyHidgonFallAction;
@property (nonatomic,assign) CCAction *enemyHidgonJumpAction;
@property (nonatomic,assign) BOOL hidgonCloserToPlayer1;
@property (nonatomic,assign) CCSprite *gunnerWalking;
@property (nonatomic,assign) CCSprite *gunnerStandingStill;
@property BOOL enemyHidgonFaceRightMessageAlreadySent;
@property BOOL enemyHidgonFaceLeftMessageAlreadySent;
@property BOOL enemyHidgonStandingStillVisibleMessageAlreadySent;
@property BOOL enemyHidgonRunningVisibleMessageAlreadySent;
@property (nonatomic,assign) CCSprite *gunnerStunned;


//Downward Shooter
@property BOOL downwardShooterEnemyTouchingFloor;
@property BOOL downwardShooterEnemyTouchingWallOnRightSide;
@property BOOL downwardShooterEnemyTouchingWallOnLeftSide;
@property BOOL downwardShooterEnemyWalkingRight;
@property BOOL downwardShooterEnemyWalkingLeft;
@property BOOL downwardShooterEnemyStopped;
@property (nonatomic,assign) CCSprite *saucerFlying;
@property BOOL downwardShooterShootingActionAlreadyRunning;
@property (nonatomic,assign) CCSprite *saucerStunned;

//Chaser Enemy
@property BOOL runningChaserEnemyTouchingFloor;
@property BOOL runningChaserEnemyTouchingWallOnRightSide;
@property BOOL runningChaserEnemyTouchingWallOnLeftSide;
@property BOOL runningChaserEnemyWalkingRight;
@property BOOL runningChaserEnemyWalkingLeft;
@property BOOL runningChaserEnemyStopped;
@property float runningChaserEnemyJumpSpeed;
@property BOOL runningChaserEnemyCurrentlyJumping;
@property BOOL runningChaserEnemyAllowedToJump;
@property BOOL runningChaserIsChasingPlayer;
@property (nonatomic,assign) CCSprite *chaserWalking;
@property (nonatomic,assign) CCSprite *chaserRunning;
@property (nonatomic,assign) CCSprite *chaserStunned;
@property (nonatomic,assign) CCSprite *chaserStandingStillBored;
@property (nonatomic,assign) CCSprite *chaserStandingStillAngry;
@property BOOL chaserCanSeePlayer;
@property BOOL isBoss;
@property BOOL hitPointsLeft;
@property BOOL bossAlreadyPunched;


//ParkourJumper Enemy
@property BOOL parkourJumperTouchingFloor;
@property BOOL parkourJumperTouchingWallOnRightSide;
@property BOOL parkourJumperTouchingWallOnLeftSide;
@property BOOL parkourJumperTouchingJumpableLedgeOnRightSide;
@property BOOL parkourJumperTouchingJumpableLedgeOnLeftSide;
@property BOOL parkourJumperJumpingOverLedgeOnLeftSide;
@property BOOL parkourJumperJumpingOverLedgeOnRightSide;
@property BOOL parkourJumperWalkingRight;
@property BOOL parkourJumperWalkingLeft;
@property BOOL parkourJumperFalling;
@property BOOL parkourJumperStopped;
@property float parkourJumperJumpSpeed;
@property BOOL parkourJumperCurrentlyJumping;
@property BOOL parkourJumperAllowedToJump;
@property BOOL parkourJumperAdjustMovementActionIsRunning;
@property (nonatomic,assign) NSMutableArray *parkourJumperMovementsArray;
@property (nonatomic,assign) CCAction *parkourJumperWalkRightAction;
@property (nonatomic,assign) CCAction *parkourJumperWalkLeftAction;
@property (nonatomic,assign) CCAction *parkourJumperWalkRightMadAgentsValue1Action;
@property (nonatomic,assign) CCAction *parkourJumperWalkLeftMadAgentsValue1Action;
@property (nonatomic,assign) CCAction *parkourJumperFallAction;
@property (nonatomic,assign) CCAction *parkourJumperJumpAction;
@property (nonatomic,assign) CCAction *parkourJumperJumpingOverLedgeOnLeftSideAction;
@property (nonatomic,assign) CCAction *parkourJumperJumpingOverLedgeOnRightSideAction;
@property BOOL parkourJumperCloserToPlayer1;
@property int parkourJumperDistanceToLedgeOnLeftSide;
@property int parkourJumperDistanceToLedgeOnRightSide;
@property (nonatomic,assign) CCSprite *ninjaRunning;
@property (nonatomic,assign) CCSprite *ninjaJumping;
@property (nonatomic,assign) CCSprite *ninjaStandingStill;
@property (nonatomic,assign) CCSprite *ninjaStunned;

//All
@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCSprite *mySprite;
@property int enemyType;
@property (nonatomic,assign) CCLabelBMFont *stunTimerLabel;
@property int stunTimeValue;
@property int friendlyTimeValue;
@property (nonatomic,assign) CCAction *decreaseStunTimerAction;
@property (nonatomic,assign) CCAction *decreaseFriendlyTimerAction;
@property (nonatomic,assign) CCLabelBMFont *friendlyTimerLabel;
@property float walkingSpeed;
@property int enemyReferenceNumber;
@property CGPoint closestJumpableTileLocation;
@property CGPoint closestLedgeTileLocation;
@property BOOL decreaseStunTimerActionAlreadyRunning;
@property BOOL decreaseFriendlyTimerActionAlreadyRunning;
@property BOOL enemyKnockedOutOfTheArena;
@property BOOL isCurrentlyTeleportingIn;

//Diagonal Flyer and Fly-through-Walls Diagonal Flyer
@property (nonatomic,assign) CCSprite *flyingUpRight;
@property (nonatomic,assign) CCSprite *flyingUpLeft;
@property (nonatomic,assign) CCSprite *flyingDownLeft;
@property (nonatomic,assign) CCSprite *flyingDownRight;



//Skeleton Whale
-(void) callEnemySkeletonWhaleAdjustMovement;
-(void) pauseSchedulerAndActionsForSkeletonWhaleClass;
-(void) readjustEnemySkeletonWhaleResponseTime;

//Diagonal Enemy
-(void) callEnemyDiagonalFlyerAdjustMovement;
-(void) pauseSchedulerAndActionsForDiagonalFlyerEnemyClass;

//Hidgon
-(void) callEnemyHidgonAdjustMovement;
-(void) pauseSchedulerAndActionsForHidgonClass;
-(void) increaseEnemyHidgonResponseTimeMethod;
-(void) makeHidgonStopWalkingBeforeMadAgentsMode;
-(void) makeHidgonNotWalkLeftOrRight;
-(void) makeHidgonFall;


//Chaser Enemy
-(void) pauseSchedulerAndActionsForRunningChaserEnemyClass;

//Downward Shooter Enemy
-(void) downwardShooterShootingMethod;
-(void) adjustDownwardShooterResponseTimeMethod;

//ParkourJumper
-(void) increaseParkourJumperResponseTimeMethod;

//All
+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;
-(void) pauseAllMotionFramesForMadAgentsNotification;
-(void) resumeAllMotionFramesForMadAgentsNotification;




@end
