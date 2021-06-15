//
//  TimeBomb.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"


@class HelloWorldLayer;


@interface TimeBomb : CCSprite
{
    CCLabelBMFont *timeBombTimeLabel;
    int timeBombSecondsLeft;
    CCSprite *solidWhiteFlashBang;
}

@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCSprite *mySprite;
@property (nonatomic,assign) CCSprite *solidWhiteFlashBang;
@property (nonatomic,assign) CCSprite *explosion;
@property (nonatomic,assign) CCLabelBMFont *timeBombTimeLabel;
@property int timeBombSecondsLeft;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;
-(void) bombExploding;


@end
