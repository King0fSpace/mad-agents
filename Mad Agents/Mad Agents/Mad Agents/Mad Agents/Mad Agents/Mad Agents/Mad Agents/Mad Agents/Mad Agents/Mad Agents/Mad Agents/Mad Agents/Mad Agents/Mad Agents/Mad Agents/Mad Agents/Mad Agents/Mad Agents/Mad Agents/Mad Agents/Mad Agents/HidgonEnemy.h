//
//  HidgonEnemy.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"

@class HelloWorldLayer;

CCAction *enemyHidgonAdjustMovement;
float walkingSpeed;


@interface HidgonEnemy : CCSprite
{
    BOOL enemyHidgonTouchingFloor;
    BOOL enemyHidgonTouchingWallOnRightSide;
    BOOL enemyHidgonTouchingWallOnLeftSide;
    BOOL enemyHidgonWalkingRight;
    BOOL enemyHidgonWalkingLeft;
    BOOL enemyHidgonStopped;
    float hidgonJumpSpeed;
    BOOL hidgonCurrentlyJumping;
    BOOL hidgonAllowedToJump;
    BOOL shootingFireBall;
    BOOL enemyHidgonAdjustMovementActionIsRunning;
    
    CCLabelBMFont *stunTimerLabel;
    int stunTimeValue;
    CCAction *decreaseStunTimerAction;
    NSMutableArray *hidgonMovementsArray;
}


@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCSprite *mySprite;
@property BOOL enemyHidgonTouchingFloor;
@property BOOL enemyHidgonTouchingWallOnRightSide;
@property BOOL enemyHidgonTouchingWallOnLeftSide;
@property BOOL enemyHidgonWalkingRight;
@property BOOL enemyHidgonWalkingLeft;
@property BOOL enemyHidgonStopped;
@property float hidgonJumpSpeed;
@property BOOL hidgonCurrentlyJumping;
@property BOOL hidgonAllowedToJump;
@property BOOL shootingFireBall;

@property (nonatomic,assign) CCLabelBMFont *stunTimerLabel;
@property int stunTimeValue;
@property (nonatomic,assign) CCAction *decreaseStunTimerAction;
@property (nonatomic,assign) NSMutableArray *hidgonMovementsArray;



+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;
-(void) callEnemyHidgonAdjustMovement;
-(void) pauseSchedulerAndActionsForHidgonClass;



@end
