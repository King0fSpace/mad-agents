//
//  HidgonEnemy.m
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "RunningChaserEnemy.h"
//#import "HelloWorldLayer.m"

@implementation RunningChaserEnemy



float runningChaserEnemyResponseTime;


@synthesize runningChaserEnemyTouchingFloor;
@synthesize runningChaserEnemyTouchingWallOnRightSide;
@synthesize runningChaserEnemyTouchingWallOnLeftSide;
@synthesize runningChaserEnemyWalkingRight;
@synthesize runningChaserEnemyWalkingLeft;
@synthesize runningChaserEnemyStopped;
@synthesize runningChaserEnemyJumpSpeed;
@synthesize runningChaserIsChasingPlayer;
@synthesize walkingSpeed;

@synthesize theGame;
@synthesize mySprite;



+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}
/*
-(void) makeRunningChaserEnemyJump
{
    if (isPaused == YES) {
        
        self.RunningChaserEnemyCurrentlyJumping = NO;
    }
    
    else if (isPaused == NO) {
        
        self.RunningChaserEnemyCurrentlyJumping = YES;
        
        [self runAction: [CCSequence actions: [CCMoveBy actionWithDuration:0.5 position:ccp(0, 64)], [CCCallFunc actionWithTarget:self selector:@selector(setRunningChaserEnemyCurrentlyJumpingToNo)], [CCCallFunc actionWithTarget:self selector:@selector(RunningChaserEnemyAdjustMovement)], nil]];
    }
}
*/

/*
-(void) runningChaserEnemyAdjustMovement
{
    if (isPaused == NO) {
        
        for (RunningChaserEnemy *runningChaserEnemySprite in runningChaserEnemySpritesArray) {
                    
            int runningChaserEnemyWillJumpRandomNumber;
            
            if (madAgentsAmount == 0) {
                
                runningChaserEnemyWillJumpRandomNumber = arc4random()%5;
            }
            
            if (madAgentsAmount == 1 && timeInt >= 35) {
                
                runningChaserEnemyWillJumpRandomNumber = arc4random()%3;
            }
                        
            //If player's y position is greater than Hidgon's AND a landable platform is within range above Hidgon, increase chance of Hidgon jumping.  One out of five chances of Hidgon jumping just because he feels like it.  Make sure he only jumps if there's a platform within landing range above him.
            if (((firstPlayerSprite.position.y > enemyHidgonSprite.position.y) || (hidgonWillJumpRandomNumber == 0)) && enemyHidgonSprite.hidgonCurrentlyJumping == NO && enemyHidgonSprite.hidgonAllowedToJump) {
                
                enemyHidgonSprite.hidgonCurrentlyJumping = YES;
                
                //Stop Hidgon
                enemyHidgonSprite.enemyHidgonWalkingRight = NO;
                enemyHidgonSprite.enemyHidgonWalkingLeft = NO;
                enemyHidgonSprite.enemyHidgonStopped = YES;
                
                int lookLeftAndRightTimeDivider;
                
                if (madAgentsAmount == 0) {
                    
                    lookLeftAndRightTimeDivider = 1;
                }
                
                else if (madAgentsAmount == 1) {
                    
                    lookLeftAndRightTimeDivider = 2;
                }
                
                //Hidgon will look back and forth every 0.8 seconds for 2-3 seconds before he jumps.
                [enemyHidgonSprite.mySprite runAction: [CCSequence actions: [CCFlipX actionWithFlipX: YES], [CCDelayTime actionWithDuration: 0.8/lookLeftAndRightTimeDivider], [CCFlipX actionWithFlipX: NO], [CCDelayTime actionWithDuration: 0.8/lookLeftAndRightTimeDivider],  [CCCallFunc actionWithTarget:enemyHidgonSprite selector:@selector(makeHidgonJump)],  nil]];
            }
            
            
            
            //If player's x position is greater than RunningChaserEnemy, then Hidgon has a higher chance of walking right
            if (firstPlayerSprite.position.x >= enemyHidgonSprite.position.x && enemyHidgonSprite.hidgonCurrentlyJumping == NO) {
                
                int randomNumber;
                
                //If player is above enemy then enemy has an equal chance of walking right
                if (firstPlayerSprite.position.y > enemyHidgonSprite.position.y) {
                    
                    randomNumber = arc4random()%2;
                }
                
                //If player's x position is greater than Hidgon's, then Hidgon has a higher chance of walking right
                else {
                    
                    randomNumber = arc4random()%3;
                }
                
                if (randomNumber == 0) {
                    
                    //Walk left
                    enemyHidgonSprite.enemyHidgonWalkingRight = NO;
                    enemyHidgonSprite.enemyHidgonWalkingLeft = YES;
                    
                    int randomChanceOfFireball = arc4random()%5;
                    
                    if (randomChanceOfFireball == 0) {
                        
                        //Run action which shoots fireball left
                        [(HelloWorldLayer*)theGame shootFireballLeft:enemyHidgonSprite.position.x y:enemyHidgonSprite.position.y];
                    }
                    
                    else {
                        
                        return;
                    }
                }
                
                else {
                    
                    //Walk right
                    enemyHidgonSprite.enemyHidgonWalkingRight = YES;
                    enemyHidgonSprite.enemyHidgonWalkingLeft = NO;
                    
                    int randomChanceOfFireball = arc4random()%5;
                    
                    if (randomChanceOfFireball == 0) {
                        
                        //Run action which shoots fireball right
                        [(HelloWorldLayer*)theGame shootFireballRight:enemyHidgonSprite.position.x y:enemyHidgonSprite.position.y];
                    }
                    
                    else {
                        
                        return;
                    }
                }
            }
            
            //If player's x position is less than Hidgon's, then Hidgon has a higher chance of walking left
            else if (firstPlayerSprite.position.x < enemyHidgonSprite.position.x && enemyHidgonSprite.hidgonCurrentlyJumping == NO) {
                
                int randomNumber;
                
                //If player is above enemy then enemy has an equal chance of walking right
                if (firstPlayerSprite.position.y > enemyHidgonSprite.position.y) {
                    
                    randomNumber = arc4random()%2;
                }
                
                //If player's x position is greater than Hidgon's, then Hidgon has a higher chance of walking right
                else {
                    
                    randomNumber = arc4random()%3;
                }
                
                if (randomNumber == 0) {
                    
                    //Walk right
                    enemyHidgonSprite.enemyHidgonWalkingRight = YES;
                    enemyHidgonSprite.enemyHidgonWalkingLeft = NO;
                    
                    int randomChanceOfFireball = arc4random()%5;
                    
                    if (randomChanceOfFireball == 0) {
                        
                        //Run action which shoots fireball right
                        [(HelloWorldLayer*)theGame shootFireballRight:enemyHidgonSprite.position.x y:enemyHidgonSprite.position.y];
                    }
                    
                    else {
                        
                        return;
                    }
                }
                
                else {
                    
                    //Walk left
                    enemyHidgonSprite.enemyHidgonWalkingRight = NO;
                    enemyHidgonSprite.enemyHidgonWalkingLeft = YES;
                }
                
                int randomChanceOfFireball = arc4random()%5;
                
                if (randomChanceOfFireball == 0) {
                    
                    //Run action which shoots fireball left
                    [(HelloWorldLayer*)theGame shootFireballLeft:enemyHidgonSprite.position.x y:enemyHidgonSprite.position.y];
                }
                
                else {
                    
                    return;
                }
            }
        }
    }
}
*/
-(void) pauseSchedulerAndActionsForHidgonClass {
    
    [self pauseSchedulerAndActions];
}

-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        theGame = _game;
        
        mySprite = [CCSprite spriteWithFile:@"RunningChaserEnemy.png"];
        self.scale = 0.9;
        mySprite.position = ccp(mySprite.position.x, mySprite.position.y + 2);
        [self addChild:mySprite];
        
        [theGame addChild:self];
        
        runningChaserEnemyWalkingRight = YES;
        runningChaserEnemyWalkingLeft = NO;
        runningChaserIsChasingPlayer = NO;
        
        int randomNumber = arc4random()%2;
        
        if (randomNumber == 0) {
            
            runningChaserEnemyWalkingRight = YES;
            runningChaserEnemyWalkingLeft = NO;
        }
        
        else {
            
            runningChaserEnemyWalkingRight = NO;
            runningChaserEnemyWalkingLeft = YES;
        }
        
        [self scheduleUpdate];
    }
    
    return self;
}

-(void)update:(ccTime)dt {
        
    if (isPaused == NO) {
        
        if (!self.runningChaserEnemyTouchingFloor) {
            
            self.position = ccp(self.position.x, self.position.y - 2.0);
        }
        
        if (runningChaserIsChasingPlayer == NO) {
        
            if (madAgentsAmount == 0) {
                
                walkingSpeed = 1.0;
            }
            
            else if (madAgentsAmount == 1) {
                
                walkingSpeed = 2.0;
            }
        }
        
        //Subroutine which makes enemyHidgon walk back and forth
        if (self.runningChaserEnemyTouchingFloor == YES) {
            
            if ([self runningChaserEnemyWalkingRight]) {
                
                if (self.runningChaserEnemyTouchingWallOnRightSide == NO) {
                    
                    self.position = ccp(self.position.x + walkingSpeed, self.position.y);
                    mySprite.flipX = NO;
                }
            }
            
            if ([self runningChaserEnemyWalkingLeft]) {
                
                if (self.runningChaserEnemyTouchingWallOnLeftSide == NO) {
                    
                    self.position = ccp(self.position.x - walkingSpeed, self.position.y);
                    mySprite.flipX = YES;
                }
            }
            
            if (self.runningChaserEnemyStopped) {
                
                self.position = ccp(self.position.x, self.position.y);
            }
        }
        
        
        self.runningChaserEnemyTouchingFloor = NO;
        self.runningChaserEnemyTouchingWallOnRightSide = NO;
        self.runningChaserEnemyTouchingWallOnLeftSide = NO;

        
        //Check to see if enemy is touching a solid tile, which would make him stop falling
        for (int row=0; row < [foreground layerSize].width; row++) {
            
            for (int col=0; col < [foreground layerSize].height; col++) {
                
                int tmpgid = [foreground tileGIDAt:ccp(row,col)];
                
                CGPoint tmpgidlocation = [foreground positionAt: ccp((row + 0.52), (col - 0.49))];
            
                if (tmpgid != 0) {
                    
                    if ((self.position.y - 11 < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                        
                        //stop enemy's falling
                        self.runningChaserEnemyTouchingFloor = YES;
                    }
                    
                    //check if enemy's right side is touching wall
                    if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                        
                        self.runningChaserEnemyTouchingWallOnRightSide = YES;
                        self.runningChaserEnemyWalkingRight = NO;
                        self.runningChaserEnemyWalkingLeft = YES;                        
                    }
                    
                    //check if enemy's left side is touching wall
                    if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x - 11 > tmpgidlocation.x - 11)) {
                        
                        self.runningChaserEnemyTouchingWallOnLeftSide = YES;
                        self.runningChaserEnemyWalkingRight = YES;
                        self.runningChaserEnemyWalkingLeft = NO;
                    }
                    
                    //Have RunningChaserEnemy reverse direction if it's approaching a platform ledge
                    if ((self.position.y - 11 < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - (-4) < tmpgidlocation.x + 11) && (self.position.x + (-4) > tmpgidlocation.x - 11)) {

                        if (self.runningChaserEnemyWalkingRight && (row + 1 < 29) && [foreground tileGIDAt:ccp(row + 1,col)] == 0) {
                            
                            self.runningChaserEnemyTouchingWallOnRightSide = YES;
                            self.runningChaserEnemyWalkingRight = NO;
                            self.runningChaserEnemyWalkingLeft = YES;
                        }
                        
                        else if (self.runningChaserEnemyWalkingLeft && (row + 1 < 29) && [foreground tileGIDAt:ccp(row - 1,col)] == 0) {
                            
                            self.runningChaserEnemyTouchingWallOnLeftSide = YES;
                            self.runningChaserEnemyWalkingRight = YES;
                            self.runningChaserEnemyWalkingLeft = NO;
                        }
                    }
                    
                    //If player's sprite is within 'sight' range of runningChaser then runningChaser's speed will increase
                    if (runningChaserEnemyWalkingRight && ((firstPlayerSprite.position.x >= self.position.x && firstPlayerSprite.position.y >= self.position.y && firstPlayerSprite.position.y < self.position.y + 33) || (firstPlayerSprite.position.x >= self.position.x && firstPlayerSprite.position.y >= self.position.y && firstPlayerTouchingFloor == NO))) {
                        
                       // NSLog (@"Hi");
                        
                        runningChaserIsChasingPlayer = YES;
                        
                        if (madAgentsAmount == 0) {
                                                
                            if (walkingSpeed < 2*walkingSpeed) {
                                                                
                                walkingSpeed = walkingSpeed + 0.0008;
                            }
                        }
                        
                        else if (madAgentsAmount == 1) {
                            
                            if (walkingSpeed < 2*walkingSpeed) {
                                
                                walkingSpeed = walkingSpeed + 0.0008;
                            }
                        }
                    }
                    
                    //If player's sprite is within 'sight' range of runningChaser then runningChaser's speed will increase
                    if (runningChaserEnemyWalkingLeft && ((firstPlayerSprite.position.x <= self.position.x && firstPlayerSprite.position.y >= self.position.y && firstPlayerSprite.position.y < self.position.y + 33) || (firstPlayerSprite.position.x <= self.position.x && firstPlayerSprite.position.y <= self.position.y && firstPlayerTouchingFloor == NO))) {
                                                
                        runningChaserIsChasingPlayer = YES;
                        
                        if (madAgentsAmount == 0) {
                            
                            if (walkingSpeed < 2*walkingSpeed) {
                                
                                walkingSpeed = walkingSpeed + 0.0008;
                            }
                        }
                        
                        else if (madAgentsAmount == 1) {
                            
                            if (walkingSpeed < 2*walkingSpeed) {
                                
                                walkingSpeed = walkingSpeed + 0.0008;
                            }
                        }
                    }
                    
                    else {
                        
                        runningChaserIsChasingPlayer = NO;
                    }
                }
            }
        }
        
        
        
        //Check to see if runningChaserEnemy is touching an impenetrable solidbrick tile, which would make him stop falling
        for (int row=0; row < [solidBricks layerSize].width; row++) {
            
            for (int col=0; col < [solidBricks layerSize].height; col++) {
                
                int tmpgid = [solidBricks tileGIDAt:ccp(row,col)];
                
                CGPoint tmpgidlocation = [solidBricks positionAt: ccp((row + 0.52), (col - 0.49))];
                
                if (tmpgid != 0) {
                    
                    if ((self.position.y - 11 < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                        
                        //stop enemy's falling
                        self.runningChaserEnemyTouchingFloor = YES;
                    }
                    
                    //check if enemy's right side is touching wall
                    if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                        
                        self.runningChaserEnemyTouchingWallOnRightSide = YES;
                        self.runningChaserEnemyWalkingRight = NO;
                        self.runningChaserEnemyWalkingLeft = YES;
                    }
                    
                    //check if enemy's left side is touching wall
                    if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x - 11 > tmpgidlocation.x - 11)) {
                        
                        self.runningChaserEnemyTouchingWallOnLeftSide = YES;
                        self.runningChaserEnemyWalkingRight = YES;
                        self.runningChaserEnemyWalkingLeft = NO;
                    }
                    
                    //Have RunningChaserEnemy reverse direction if it's approaching a platform ledge
                    if ((self.position.y - 11 < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - (-4) < tmpgidlocation.x + 11) && (self.position.x + (-4) > tmpgidlocation.x - 11)) {
                        
                        if (self.runningChaserEnemyWalkingRight && (row + 1 < 29) && [solidBricks tileGIDAt:ccp(row + 1,col)] == 0) {
                                                        
                            self.runningChaserEnemyTouchingWallOnRightSide = YES;
                            self.runningChaserEnemyWalkingRight = NO;
                            self.runningChaserEnemyWalkingLeft = YES;
                        }
                        
                        else if (self.runningChaserEnemyWalkingLeft && (row + 1 < 29) && [solidBricks tileGIDAt:ccp(row - 1,col)] == 0) {
                            
                            self.runningChaserEnemyTouchingWallOnLeftSide = YES;
                            self.runningChaserEnemyWalkingRight = YES;
                            self.runningChaserEnemyWalkingLeft = NO;
                        }
                    }
                    
                    //If player's sprite is within 'sight' range of runningChaser then runningChaser's speed will increase
                    //If player's x position is greater than Hidgon's, then Hidgon has a higher chance of walking right
                    if (runningChaserEnemyWalkingRight && ((firstPlayerSprite.position.x >= self.position.x && firstPlayerSprite.position.y >= self.position.y && firstPlayerSprite.position.y < self.position.y + 33) || (firstPlayerSprite.position.x >= self.position.x && firstPlayerSprite.position.y >= self.position.y && firstPlayerTouchingFloor == NO))) {
                        
                        // NSLog (@"Hi");
                        
                        runningChaserIsChasingPlayer = YES;
                        
                        if (madAgentsAmount == 0) {
                            
                            //     NSLog (@"Lo");
                            
                            if (walkingSpeed < 2*walkingSpeed) {
                                
                                //      NSLog (@"Bye");
                                
                                walkingSpeed = walkingSpeed + 0.0008;
                            }
                        }
                        
                        else if (madAgentsAmount == 1) {
                            
                            if (walkingSpeed < 2*walkingSpeed) {
                                
                                walkingSpeed = walkingSpeed + 0.0008;
                            }
                        }
                    }
                    
                    else {
                        
                        runningChaserIsChasingPlayer = NO;
                    }
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
