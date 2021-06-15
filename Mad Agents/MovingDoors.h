//
//  MovingDoors.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"

#define RED_DOOR        0
#define BLUE_DOOR       1
#define GREEN_DOOR      2


@class HelloWorldLayer;


@interface MovingDoors : CCSprite
{
    BOOL movingRight;
    BOOL movingLeft;
    BOOL movingUp;
    BOOL movingDown;
    float movingSpeed;
    int doorColor;
    BOOL movingDoorTouchingWallOnTop;
    BOOL movingDoorTouchingWallOnBottom;
    BOOL movingDoorTouchingWallOnRight;
    BOOL movingDoorTouchingWallOnLeft;
    BOOL firstPlayerStandingOnDoor;
    BOOL secondPlayerStandingOnDoor;
}

@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCSprite *mySprite;
@property (nonatomic, assign) BOOL movingRight;
@property (nonatomic, assign) BOOL movingLeft;
@property (nonatomic, assign) BOOL movingUp;
@property (nonatomic, assign) BOOL movingDown;
@property (nonatomic, assign) float movingSpeed;
@property (nonatomic, assign) int doorColor;
@property (nonatomic, assign) BOOL movingDoorTouchingWallOnTop;
@property (nonatomic, assign) BOOL movingDoorTouchingWallOnBottom;
@property (nonatomic, assign) BOOL movingDoorTouchingWallOnRight;
@property (nonatomic, assign) BOOL movingDoorTouchingWallOnLeft;
@property (nonatomic, assign) BOOL firstPlayerStandingOnDoor;
@property (nonatomic, assign) BOOL secondPlayerStandingOnDoor;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;



@end
