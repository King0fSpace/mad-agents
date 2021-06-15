//
//  DiagonalFlyerEnemy.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//


#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"




CCAction *enemyDiagonalFlyerEnemyAdjustMovement;
float movementSpeed;


@interface DiagonalFlyerEnemy : CCSprite
{
    BOOL enemyDiagonalFlyerMovingUp;
    BOOL enemyDiagonalFlyerMovingLeft;
    BOOL enemyDiagonalFlyerMovingRight;
    BOOL enemyDiagonalFlyerMovingDown;
    BOOL enemyDiagonalFlyerStopped;
    
    BOOL enemyDiagonalFlyerTouchingWallOnTop;
    BOOL enemyDiagonalFlyerTouchingWallOnBottom;
    BOOL enemyDiagonalFlyerTouchingWallOnRightSide;
    BOOL enemyDiagonalFlyerTouchingWallOnLeftSide;
}


@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) DiagonalFlyerEnemy *mySprite;
@property BOOL enemyDiagonalFlyerMovingUp;
@property BOOL enemyDiagonalFlyerMovingLeft;
@property BOOL enemyDiagonalFlyerMovingRight;
@property BOOL enemyDiagonalFlyerMovingDown;
@property BOOL enemyDiagonalFlyerStopped;
@property BOOL enemyDiagonalFlyerTouchingWallOnTop;
@property BOOL enemyDiagonalFlyerTouchingWallOnBottom;
@property BOOL enemyDiagonalFlyerTouchingWallOnRightSide;
@property BOOL enemyDiagonalFlyerTouchingWallOnLeftSide;

+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;
-(void) callEnemyDiagonalFlyerAdjustMovement;
-(void) pauseSchedulerAndActionsForDiagonalFlyerEnemyClass;




@end
