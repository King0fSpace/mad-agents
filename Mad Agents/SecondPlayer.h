//
//  SecondPlayer.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"


@class HelloWorldLayer;


CCSprite *secondPlayerSensorFeet;
CCSprite *secondPlayerSensorRightSide;
CCSprite *secondPlayerSensorLeftSide;



@interface SecondPlayer : CCSprite
{
    BOOL secondPlayerTouchingFloor;
    int secondPlayersNumberOfJumpsAvailable;
    BOOL secondPlayerFacingRight;
    BOOL secondPlayerMoveRight;
    BOOL secondPlayerMoveLeft;
    float secondPlayerJumpSpeed;
    BOOL secondPlayerCannotMoveRight;
    BOOL secondPlayerCannotMoveLeft;
    BOOL secondPlayerHasSneakers;
    BOOL secondPlayerHeadHittingBlock;
    int secondPlayerSpriteHeadCollisionWidth;
    int secondPlayerSpriteHeadCollisionHeight;
    BOOL secondPlayerCurrentlyDead;
    BOOL secondPlayerCurrentlyInvincible;
    BOOL secondPlayerHasInvincibilityPowerUp;
}

@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCSprite *mySprite;
@property (nonatomic,assign) CCSprite *secondPlayerSensorFeet;
@property (nonatomic,assign) CCSprite *secondPlayerSensorRightSide;
@property (nonatomic,assign) CCSprite *secondPlayerSensorLeftSide;
@property (nonatomic,assign) BOOL secondPlayerTouchingFloor;
@property (nonatomic,assign) int secondPlayersNumberOfJumpsAvailable;
@property (nonatomic,assign) BOOL secondPlayerFacingRight;
@property (nonatomic,assign) BOOL secondPlayerMoveRight;
@property (nonatomic,assign) BOOL secondPlayerMoveLeft;
@property (nonatomic,assign) float secondPlayerJumpSpeed;
@property (nonatomic,assign) BOOL secondPlayerCannotMoveRight;
@property (nonatomic,assign) BOOL secondPlayerCannotMoveLeft;
@property (nonatomic,assign) BOOL secondPlayerHasSneakers;
@property (nonatomic,assign) BOOL secondPlayerHeadHittingBlock;
@property (nonatomic,assign) int secondPlayerSpriteHeadCollisionWidth;
@property (nonatomic,assign) int secondPlayerSpriteHeadCollisionHeight;
@property (nonatomic,assign) BOOL secondPlayerCurrentlyDead;
@property (nonatomic,assign) BOOL secondPlayerCurrentlyInvincible;
@property BOOL secondPlayerHasInvincibilityPowerUp;



+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;



@end
