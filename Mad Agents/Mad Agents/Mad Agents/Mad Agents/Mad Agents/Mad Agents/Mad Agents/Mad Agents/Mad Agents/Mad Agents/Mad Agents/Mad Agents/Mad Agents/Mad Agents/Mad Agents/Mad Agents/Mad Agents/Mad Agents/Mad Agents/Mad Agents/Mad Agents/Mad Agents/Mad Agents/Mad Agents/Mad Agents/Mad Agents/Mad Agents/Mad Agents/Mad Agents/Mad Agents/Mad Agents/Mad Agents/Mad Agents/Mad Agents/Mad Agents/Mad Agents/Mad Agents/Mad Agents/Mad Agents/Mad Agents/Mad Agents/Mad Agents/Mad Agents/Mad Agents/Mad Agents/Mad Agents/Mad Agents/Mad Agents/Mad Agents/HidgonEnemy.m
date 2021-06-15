//
//  HidgonEnemy.m
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "HidgonEnemy.h"
//#import "HelloWorldLayer.m"

@implementation HidgonEnemy



float enemyHidgonResponseTime;


@synthesize enemyHidgonTouchingFloor;
@synthesize enemyHidgonTouchingWallOnRightSide;
@synthesize enemyHidgonTouchingWallOnLeftSide;
@synthesize enemyHidgonWalkingRight;
@synthesize enemyHidgonWalkingLeft;
@synthesize enemyHidgonStopped;
@synthesize hidgonJumpSpeed;
@synthesize hidgonCurrentlyJumping;
@synthesize hidgonAllowedToJump;
@synthesize theGame;
@synthesize mySprite;
@synthesize shootingFireBall;

@synthesize stunTimerLabel;
@synthesize stunTimeValue;
@synthesize decreaseStunTimerAction;
@synthesize hidgonMovementsArray;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}

-(void) makeHidgonJump
{
    if (isPaused == YES || self.stunTimeValue > 0) {
        
        self.hidgonCurrentlyJumping = NO;
    }
    
    else if (isPaused == NO) {
    
        self.hidgonCurrentlyJumping = YES;
    
        [self runAction: [CCSequence actions: [CCMoveBy actionWithDuration:0.5 position:ccp(0, 64)], [CCCallFunc actionWithTarget:self selector:@selector(setHidgonCurrentlyJumpingToNo)], [CCCallFunc actionWithTarget:self selector:@selector(enemyHidgonAdjustMovement)], nil]];
    }
}


-(void) setHidgonCurrentlyJumpingToNo {
    
    self.hidgonCurrentlyJumping = NO;
}

-(void) increaseEnemyHidgonResponseTimeMethod {
        
    if (madAgentsAmount == 1 && enemyHidgonResponseTime != 0.5) {
                
        [self stopAction: enemyHidgonAdjustMovement];
        
        enemyHidgonResponseTime = 0.5;
        
        enemyHidgonAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:enemyHidgonResponseTime], [CCCallFunc actionWithTarget:self selector:@selector(enemyHidgonAdjustMovement)], nil]]];
    }
}

-(void) hidgonInitialArrayPopulation
{
    //Create 2 random integers, put them in hidgonMovementsArray
    NSNumber *firstMove = [NSNumber numberWithInt: 0];
    [hidgonMovementsArray addObject: firstMove];
    
    NSNumber *secondMove = [NSNumber numberWithInt: 1];
    [hidgonMovementsArray addObject: secondMove];
}

-(void) enemyHidgonAdjustMovement
{
    if (self.stunTimeValue > 0) {
        
    //    [self makeHidgonJump];
    }
 /*
    if (isPaused == NO && self.stunTimeValue == 0) {
    
        int hidgonWillJumpRandomNumber;
        
        if (madAgentsAmount == 0) {
        
            hidgonWillJumpRandomNumber = arc4random()%5;
        }
        
        if (madAgentsAmount == 1 && timeInt >= 35) {
            
            hidgonWillJumpRandomNumber = arc4random()%3;
        }
        
        //If player's y position is greater than Hidgon's AND a landable platform is within range above Hidgon, increase chance of Hidgon jumping.  One out of five chances of Hidgon jumping just because he feels like it.  Make sure he only jumps if there's a platform within landing range above him.
        if (((firstPlayerSprite.position.y > self.position.y) || (hidgonWillJumpRandomNumber == 0)) && self.hidgonCurrentlyJumping == NO && self.hidgonAllowedToJump) {
                            
            self.hidgonCurrentlyJumping = YES;
            
            //Stop Hidgon
            self.enemyHidgonWalkingRight = NO;
            self.enemyHidgonWalkingLeft = NO;
            self.enemyHidgonStopped = YES;
            
            int lookLeftAndRightTimeDivider;
            
            if (madAgentsAmount == 0) {
                
                lookLeftAndRightTimeDivider = 1;
            }
            
            else if (madAgentsAmount == 1) {
                
                lookLeftAndRightTimeDivider = 2;
            }
            
            //Hidgon will look back and forth every 0.8 seconds for 2-3 seconds before he jumps.
            [self.mySprite runAction: [CCSequence actions: [CCFlipX actionWithFlipX: YES], [CCDelayTime actionWithDuration: 0.8/lookLeftAndRightTimeDivider], [CCFlipX actionWithFlipX: NO], [CCDelayTime actionWithDuration: 0.8/lookLeftAndRightTimeDivider],  [CCCallFunc actionWithTarget:self selector:@selector(makeHidgonJump)],  nil]];
        }
        
        //If player's x position is greater than Hidgon's, then Hidgon has a higher chance of walking right
        else if (firstPlayerSprite.position.x >= self.position.x && self.hidgonCurrentlyJumping == NO) {
            
            int randomNumber;
            
            //If player is above enemy then enemy has an equal chance of walking right
            if (firstPlayerSprite.position.y > self.position.y) {
                
                randomNumber = arc4random()%2;
            }
            
            //If player's x position is greater than Hidgon's, then Hidgon has a higher chance of walking right
            else {
                
                randomNumber = arc4random()%3;
            }
            
            if (randomNumber == 0) {
                
                //Walk left
                
                self.enemyHidgonWalkingRight = NO;
                self.enemyHidgonWalkingLeft = YES;
                
                int randomChanceOfFireball = arc4random()%5;
                
                if (randomChanceOfFireball == 0) {
                    
                    //Run action which shoots fireball left
                    [(HelloWorldLayer*)theGame shootFireballLeft:self.position.x y:self.position.y];
                }
                
                else {
                    
                    return;
                }
            }
            
            else {
                                
                //Walk right
                self.enemyHidgonWalkingRight = YES;
                self.enemyHidgonWalkingLeft = NO;
                
                int randomChanceOfFireball = arc4random()%5;
                
                if (randomChanceOfFireball == 0) {

                    //Run action which shoots fireball right
                    [(HelloWorldLayer*)theGame shootFireballRight:self.position.x y:self.position.y];
                }
                
                else {
                    
                    return;
                }
            }
        }
        
        //If player's x position is less than Hidgon's, then Hidgon has a higher chance of walking left
        else if (firstPlayerSprite.position.x < self.position.x && self.hidgonCurrentlyJumping == NO) {
            
            int randomNumber;
            
            //If player is above enemy then enemy has an equal chance of walking right
            if (firstPlayerSprite.position.y > self.position.y) {
                
                randomNumber = arc4random()%2;
            }
            
            //If player's x position is greater than Hidgon's, then Hidgon has a higher chance of walking right
            else {
                
                randomNumber = arc4random()%3;
            }
            
            if (randomNumber == 0) {
                
                //Walk right
                self.enemyHidgonWalkingRight = YES;
                self.enemyHidgonWalkingLeft = NO;
                
                int randomChanceOfFireball = arc4random()%5;
                
                if (randomChanceOfFireball == 0) {
                    
                    //Run action which shoots fireball right
                    [(HelloWorldLayer*)theGame shootFireballRight:self.position.x y:self.position.y];
                }
                
                else {
                    
                    return;
                }
            }
            
            else {
                
                //Walk left
                self.enemyHidgonWalkingRight = NO;
                self.enemyHidgonWalkingLeft = YES;
            }
            
            int randomChanceOfFireball = arc4random()%5;
            
            if (randomChanceOfFireball == 0) {
                
                //Run action which shoots fireball left
                [(HelloWorldLayer*)theGame shootFireballLeft:self.position.x y:self.position.y];
            }
            
            else {
                
                return;
            }
        }
    }*/
    
    if (isPaused == NO && self.stunTimeValue == 0) {

        if ([[hidgonMovementsArray lastObject] intValue] == 0) {
            
            self.enemyHidgonWalkingRight = NO;
            self.enemyHidgonWalkingLeft = YES;
        }
        
        else if ([[hidgonMovementsArray lastObject] intValue] == 1) {
            
            self.enemyHidgonWalkingRight = YES;
            self.enemyHidgonWalkingLeft = NO;
        }
        
        [hidgonMovementsArray removeLastObject];
    }
}

-(void) pauseSchedulerAndActionsForHidgonClass {
    
    [self pauseSchedulerAndActions];
}

-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
                
        theGame = _game;
        
        mySprite = [CCSprite spriteWithFile:@"EnemyHidgon.png"];
        self.scale = 0.9;
        [self addChild:mySprite];
                
        [theGame addChild:self];

        self.shootingFireBall = NO;
        
        enemyHidgonResponseTime = 1.0;
        
        self.stunTimeValue = 0;
        
        stunTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.stunTimeValue] fntFile:@"PixelArtFont.fnt"];
        [stunTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
        stunTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
        stunTimerLabel.scale = 0.9;
        stunTimerLabel.visible = NO;
        [self addChild:stunTimerLabel z: 5];
    
        [self scheduleUpdate];
    }
    
    enemyHidgonAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:enemyHidgonResponseTime], [CCCallFunc actionWithTarget:self selector:@selector(enemyHidgonAdjustMovement)], nil]]];
    
    //Run method which increases the timer every second
    decreaseStunTimerAction = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:1.0], [CCCallFunc actionWithTarget:self selector:@selector(decreaseStunTimer)], nil]]];
    
    return self;
}

-(void) decreaseStunTimer
{
    if (self.stunTimeValue > 0) {
        
        stunTimerLabel.visible = YES;
        
        self.stunTimeValue = self.stunTimeValue - 1;
                
        [self.stunTimerLabel setString:[NSString stringWithFormat:@"%i", self.stunTimeValue]];
    }
}

-(void)update:(ccTime)dt {
    
    [self increaseEnemyHidgonResponseTimeMethod];
    
    if (isPaused == NO) {
    
        if (!self.enemyHidgonTouchingFloor && !self.hidgonCurrentlyJumping) {
            
            self.position = ccp(self.position.x, self.position.y - 2.0);
        }
        
        if (madAgentsAmount == 0) {
            
            walkingSpeed = 2.0;
        }
        
        else if (madAgentsAmount == 1) {
            
            walkingSpeed = 4.0;
        }
        
        if (self.stunTimeValue > 0) {
            
            self.position = ccp(self.position.x, self.position.y);
            self.mySprite.color = ccBLUE;
        }
        
        else {
            
            self.mySprite.color = ccWHITE;
            stunTimerLabel.visible = NO;
        }
        
        //Subroutine which makes enemyHidgon walk back and forth 
        if (self.enemyHidgonTouchingFloor == YES && self.stunTimeValue == 0) {
                        
            if ([self enemyHidgonWalkingRight] && self.stunTimeValue == 0) {
                
                if (self.enemyHidgonTouchingWallOnRightSide == NO) {
                    
                    self.position = ccp(self.position.x + walkingSpeed, self.position.y);
                    mySprite.flipX = NO;
                }
            }
            
            if ([self enemyHidgonWalkingLeft] && self.stunTimeValue == 0) {
                
                if (self.enemyHidgonTouchingWallOnLeftSide == NO) {
                    
                    self.position = ccp(self.position.x - walkingSpeed, self.position.y);
                    mySprite.flipX = YES;
                }
            }
            
            if (self.enemyHidgonStopped) {
                
                self.position = ccp(self.position.x, self.position.y);
            }
        }
        
        self.enemyHidgonTouchingFloor = NO;
        self.enemyHidgonTouchingWallOnRightSide = NO;
        self.enemyHidgonTouchingWallOnLeftSide = NO;
        self.hidgonAllowedToJump = NO;
        
        //Check to see if enemy is touching a solid tile, which would make him stop falling
        for (int row=0; row < [foreground layerSize].width; row++) {
            
            for (int col=0; col < [foreground layerSize].height; col++) {
                
                int tmpgid = [foreground tileGIDAt:ccp(row,col)];
                
                CGPoint tmpgidlocation = [foreground positionAt: ccp((row + 0.52), (col - 0.49))];
                
                if (tmpgid != 0) {
                    
                    if ((self.position.y - 11 < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                        
                        //stop enemy's falling
                        self.enemyHidgonTouchingFloor = YES;
                    }
                    
                    //check if enemy's right side is touching wall
                    if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                        
                        self.enemyHidgonTouchingWallOnRightSide = YES;
                        self.enemyHidgonWalkingRight = NO;
                        self.enemyHidgonWalkingLeft = YES;
                    }
                    
                    //check if enemy's left side is touching wall
                    if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x - 11 > tmpgidlocation.x - 11)) {
                        
                        self.enemyHidgonTouchingWallOnLeftSide = YES;
                        self.enemyHidgonWalkingRight = YES;
                        self.enemyHidgonWalkingLeft = NO;
                    }
                    
                    //check if hidgon is allowed to jump
                    if ((self.position.y < tmpgidlocation.y) && (self.position.y + 44 > tmpgidlocation.y) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11) && col > 0) {
                        
                        self.hidgonAllowedToJump = YES;
                    }
                }
            }
        }
        
        //Check to see if enemy is touching a solid tile, which would make him stop falling
        for (int row=0; row < [solidBricks layerSize].width; row++) {
            
            for (int col=0; col < [solidBricks layerSize].height; col++) {
                
                int tmpgid = [solidBricks tileGIDAt:ccp(row,col)];
                
                CGPoint tmpgidlocation = [solidBricks positionAt: ccp((row + 0.52), (col - 0.49))];
                
                if (tmpgid != 0) {
                    
                    if ((self.position.y - 11 < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                        
                        //stop enemy's falling
                        self.enemyHidgonTouchingFloor = YES;
                    }
                    
                    //check if enemy's right side is touching wall
                    if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                        
                        self.enemyHidgonTouchingWallOnRightSide = YES;
                        self.enemyHidgonWalkingRight = NO;
                        self.enemyHidgonWalkingLeft = YES;
                    }
                    
                    //check if enemy's left side is touching wall
                    if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x - 11 > tmpgidlocation.x - 11)) {
                        
                        self.enemyHidgonTouchingWallOnLeftSide = YES;
                        self.enemyHidgonWalkingRight = YES;
                        self.enemyHidgonWalkingLeft = NO;
                    }
                    
                    //check if hidgon is allowed to jump
                    if ((self.position.y < tmpgidlocation.y) && (self.position.y + 44 > tmpgidlocation.y) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                        
                        self.hidgonAllowedToJump = NO;
                    }
                }
            }
        }
        
        //If Hidgon touches deployed stunPowerUp it gets stunned
        for (self in enemyHidgonSpritesArray) {
            
            for (StunPowerUp *stunPowerUp in stunPowerUpArray) {
                
                if ((self.position.x < stunPowerUp.position.x + 22 && self.position.x > stunPowerUp.position.x - 22) && (self.position.y < stunPowerUp.position.y + 22 && self.position.y > stunPowerUp.position.y - 22) && self.stunTimeValue == 0) {
                    
                    self.stunTimeValue = 15;
                    
                    [[SimpleAudioEngine sharedEngine] playEffect:@"BulbBreaking.caf"];
                    
                    [stunPowerUpArray removeObject: stunPowerUp];
                    [stunPowerUp removeFromParentAndCleanup: YES];
                    
                    return;
                }
            }
        }
    }
}

-(void) dealloc
{
    [super dealloc];
}

@end
