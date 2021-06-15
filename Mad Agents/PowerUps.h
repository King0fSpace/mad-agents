//
//  PowerUps.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"

#define     SNEAKER_POWER_UP            0
#define     STUN_POWER_UP               1
#define     MIND_CONTROL_POWER_UP       2
#define     GLOBAL_STUN_POWER_UP        3
#define     STUN_PROJECTILE_POWER_UP    4
#define     INVINCIBILITY_POWER_UP      5
#define     BULLET_TIME_POWER_UP        6
#define     STAR_IN_GAME_CURRENCY       7
#define     BOXING_GLOVE                8


@class HelloWorldLayer;

int randomPowerUp;

@interface PowerUps : CCNode
{
    int powerUpType;
    BOOL powerUpDeployed;
}

@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCSprite *mySprite;
@property (nonatomic,assign) int powerUpType;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;



@end
