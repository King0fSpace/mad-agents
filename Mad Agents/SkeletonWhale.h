//
//  SkeletonWhale.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"

@class HelloWorldLayer;


CCAction *enemySkeletonWhaleAdjustMovement;
float movementSpeed;


@interface SkeletonWhale : CCSprite
{
    BOOL enemySkeletonWhaleMovingRight;
    BOOL enemySkeletonWhaleMovingLeft;
    BOOL enemySkeletonWhaleMovingUp;
    BOOL enemySkeletonWhaleMovingDown;
    BOOL enemySkeletonWhaleStopped;
    
    BOOL stunned;
}


@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCSprite *mySprite;
@property BOOL enemySkeletonWhaleMovingRight;
@property BOOL enemySkeletonWhaleMovingLeft;
@property BOOL enemySkeletonWhaleMovingUp;
@property BOOL enemySkeletonWhaleMovingDown;
@property BOOL enemySkeletonWhaleStopped;
@property BOOL enemySkeletonWhaleMovingHorizontally;
@property BOOL stunned;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;
-(void) callEnemySkeletonWhaleAdjustMovement;
-(void) pauseSchedulerAndActionsForSkeletonWhaleClass;



@end
