//
//  StunPowerUp.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"



@class HelloWorldLayer;


@interface StunProjectilePowerUp : CCSprite
{
    BOOL shootingRight;
}

@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCSprite *mySprite;
@property (nonatomic,assign) CCSprite *glow;



+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;



@end
