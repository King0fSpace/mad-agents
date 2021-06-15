//
//  RunningChaserEnemy.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"

@class HelloWorldLayer;

CCAction *runningChaserEnemyAdjustMovement;


@interface RunningChaserEnemy : CCSprite
{
    BOOL runningChaserEnemyTouchingFloor;
    BOOL runningChaserEnemyTouchingWallOnRightSide;
    BOOL runningChaserEnemyouchingWallOnLeftSide;
    BOOL runningChaserEnemyWalkingRight;
    BOOL runningChaserEnemyWalkingLeft;
    BOOL runningChaserEnemyStopped;
    BOOL runningChaserEnemyCurrentlyJumping;
    BOOL runningChaserEnemyAllowedToJump;
    BOOL runningChaserIsChasingPlayer;
    float walkingSpeed;
}


@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCSprite *mySprite;
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
@property float walkingSpeed;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;
-(void) pauseSchedulerAndActionsForRunningChaserEnemyClass;



@end
