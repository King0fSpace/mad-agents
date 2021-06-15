//
//  InGameButton.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "SimpleAudioEngine.h"

#define RED_BUTTON          0
#define BLUE_BUTTON         1
#define GREEN_BUTTON        2



@class HelloWorldLayer;


@interface InGameButton : CCSprite
{
    int buttonColor;
    BOOL leftAndRightButton;
    BOOL upAndDownButton;
    BOOL buttonReadyToBePushed;
}

@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCSprite *mySprite;
@property (nonatomic,assign) int buttonColor;
@property (nonatomic,assign) BOOL leftAndRightButton;
@property (nonatomic,assign) BOOL upAndDownButton;
@property (nonatomic,assign) BOOL buttonReadyToBePushed;



+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;
-(void) activateButton;


@end
