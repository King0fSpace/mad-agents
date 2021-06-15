//
//  SecondPlayer.m
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "SecondPlayer.h"

@implementation SecondPlayer


@synthesize theGame;
@synthesize mySprite;
@synthesize secondPlayerSensorFeet;
@synthesize secondPlayerSensorLeftSide;
@synthesize secondPlayerSensorRightSide;
@synthesize secondPlayerTouchingFloor;
@synthesize secondPlayersNumberOfJumpsAvailable;
@synthesize secondPlayerFacingRight;
@synthesize secondPlayerMoveRight;
@synthesize secondPlayerMoveLeft;
@synthesize secondPlayerJumpSpeed;
@synthesize secondPlayerCannotMoveRight;
@synthesize secondPlayerCannotMoveLeft;
@synthesize secondPlayerHasSneakers;
@synthesize secondPlayerHeadHittingBlock;
@synthesize secondPlayerSpriteHeadCollisionWidth;
@synthesize secondPlayerSpriteHeadCollisionHeight;
@synthesize secondPlayerCurrentlyDead;
@synthesize secondPlayerCurrentlyInvincible;
@synthesize secondPlayerHasInvincibilityPowerUp;



+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}


-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        theGame = _game;
        
        self.visible = YES;
        
        mySprite = [CCSprite spriteWithFile:@"BlueDinosaur.png"];
        
        //Second Player Properties
        self.secondPlayerFacingRight = NO;
        self.secondPlayerMoveRight = NO;
        self.secondPlayerMoveLeft = NO;
        self.secondPlayerJumpSpeed = NO;
        self.secondPlayerCannotMoveLeft = NO;
        self.secondPlayerCannotMoveRight = NO;
        self.secondPlayerHasSneakers = NO;
        self.secondPlayerCurrentlyDead = NO;
        self.secondPlayerCurrentlyInvincible = NO;
        self.secondPlayerHasInvincibilityPowerUp = NO;
        
        
        
        secondPlayerSpriteHeadCollisionWidth = 7;
        secondPlayerSpriteHeadCollisionHeight = 9;
        
        self.scale = 0.45;
        [self addChild:mySprite z:100];
        
        [theGame addChild:self z:100];
        
        [self scheduleUpdate];
    }
    
    return self;
}


-(void)update:(ccTime)dt {
    
    if (isPaused == NO) {
        
        
    }
}


-(void) dealloc
{
    [super dealloc];
}

@end
