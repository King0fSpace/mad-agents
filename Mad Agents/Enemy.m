//
//  Enemy.m
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "Enemy.h"




@implementation Enemy

//Skeleton Whale
float enemySkeletonWhaleResponseTime;

//Hidgon
float enemyHidgonResponseTime;

//Parkour Jumper
float parkourJumperResponseTime;

//Diagonal Flyer
float enemyDiagonalFlyerEnemyResponseTime;


//Skeleton Whale
@synthesize enemySkeletonWhaleMovingRight;
@synthesize enemySkeletonWhaleMovingLeft;
@synthesize enemySkeletonWhaleMovingUp;
@synthesize enemySkeletonWhaleMovingDown;
@synthesize enemySkeletonWhaleStopped;
@synthesize enemySkeletonWhaleMovingHorizontally;
@synthesize skeletonWhaleCloserToPlayer1;
@synthesize jetmanFlying;
@synthesize skeletonWhaleFaceRightMessageAlreadySent;
@synthesize skeletonWhaleFaceLeftMessageAlreadySent;
@synthesize jetmanStunned;

//Diagonal Enemy
@synthesize enemyDiagonalFlyerMovingUp;
@synthesize enemyDiagonalFlyerMovingLeft;
@synthesize enemyDiagonalFlyerMovingRight;
@synthesize enemyDiagonalFlyerMovingDown;
@synthesize enemyDiagonalFlyerStopped;
@synthesize enemyDiagonalFlyerTouchingWallOnTop;
@synthesize enemyDiagonalFlyerTouchingWallOnBottom;
@synthesize enemyDiagonalFlyerTouchingWallOnRightSide;
@synthesize enemyDiagonalFlyerTouchingWallOnLeftSide;
@synthesize flyingDownLeft;
@synthesize flyingUpLeft;
@synthesize flyingDownRight;
@synthesize flyingUpRight;
@synthesize diagonalFlyerStunned;

//FlyThroughWallsDiagonal Enemy
@synthesize flyThroughWallsDiagonalFlyerMovingUp;
@synthesize flyThroughWallsDiagonalFlyerMovingLeft;
@synthesize flyThroughWallsDiagonalFlyerMovingRight;
@synthesize flyThroughWallsDiagonalFlyerMovingDown;
@synthesize flyThroughWallsDiagonalFlyerStopped;
@synthesize flyThroughWallsDiagonalFlyerTouchingWallOnTop;
@synthesize flyThroughWallsDiagonalFlyerTouchingWallOnBottom;
@synthesize flyThroughWallsDiagonalFlyerTouchingWallOnRightSide;
@synthesize flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide;
@synthesize flyThroughWallsDiagonalFlyerEnemyResponseTime;
@synthesize flyThroughWallsDiagonalFlyerStunned;

//Hidgon
@synthesize enemyHidgonTouchingFloor;
@synthesize enemyHidgonTouchingWallOnRightSide;
@synthesize enemyHidgonTouchingWallOnLeftSide;
@synthesize enemyHidgonWalkingRight;
@synthesize enemyHidgonWalkingLeft;
@synthesize enemyHidgonFalling;
@synthesize enemyHidgonStopped;
@synthesize hidgonJumpSpeed;
@synthesize hidgonCurrentlyJumping;
@synthesize hidgonAllowedToJump;
@synthesize shootingFireBall;
@synthesize hidgonMovementsArray;
@synthesize enemyHidgonWalkRightAction;
@synthesize enemyHidgonWalkLeftAction;
@synthesize enemyHidgonWalkRightMadAgentsValue1Action;
@synthesize enemyHidgonWalkLeftMadAgentsValue1Action;
@synthesize enemyHidgonFallAction;
@synthesize enemyHidgonJumpAction;
@synthesize hidgonCloserToPlayer1;
@synthesize gunnerWalking;
@synthesize gunnerStandingStill;
@synthesize enemyHidgonFaceLeftMessageAlreadySent;
@synthesize enemyHidgonFaceRightMessageAlreadySent;
@synthesize enemyHidgonRunningVisibleMessageAlreadySent;
@synthesize enemyHidgonStandingStillVisibleMessageAlreadySent;
@synthesize gunnerStunned;


//Downward Shooter
@synthesize downwardShooterEnemyTouchingFloor;
@synthesize downwardShooterEnemyTouchingWallOnRightSide;
@synthesize downwardShooterEnemyTouchingWallOnLeftSide;
@synthesize downwardShooterEnemyWalkingRight;
@synthesize downwardShooterEnemyWalkingLeft;
@synthesize downwardShooterEnemyStopped;
@synthesize saucerFlying;
@synthesize downwardShooterShootingActionAlreadyRunning;
@synthesize saucerStunned;

//Chaser Enemy
@synthesize runningChaserEnemyTouchingFloor;
@synthesize runningChaserEnemyTouchingWallOnRightSide;
@synthesize runningChaserEnemyTouchingWallOnLeftSide;
@synthesize runningChaserEnemyWalkingRight;
@synthesize runningChaserEnemyWalkingLeft;
@synthesize runningChaserEnemyStopped;
@synthesize runningChaserEnemyJumpSpeed;
@synthesize runningChaserIsChasingPlayer;
@synthesize chaserWalking;
@synthesize chaserRunning;
@synthesize chaserStunned;
@synthesize chaserStandingStillAngry;
@synthesize chaserStandingStillBored;
@synthesize chaserCanSeePlayer;
@synthesize isBoss;
@synthesize bossAlreadyPunched;


//ParkourJumper Enemy
@synthesize parkourJumperTouchingFloor;
@synthesize parkourJumperTouchingWallOnRightSide;
@synthesize parkourJumperTouchingWallOnLeftSide;
@synthesize parkourJumperTouchingJumpableLedgeOnLeftSide;
@synthesize parkourJumperTouchingJumpableLedgeOnRightSide;
@synthesize parkourJumperJumpingOverLedgeOnLeftSide;
@synthesize parkourJumperJumpingOverLedgeOnRightSide;
@synthesize parkourJumperWalkingRight;
@synthesize parkourJumperWalkingLeft;
@synthesize parkourJumperFalling;
@synthesize parkourJumperStopped;
@synthesize parkourJumperJumpSpeed;
@synthesize parkourJumperCurrentlyJumping;
@synthesize parkourJumperAllowedToJump;
@synthesize parkourJumperAdjustMovementActionIsRunning;
@synthesize parkourJumperMovementsArray;
@synthesize parkourJumperWalkRightAction;
@synthesize parkourJumperWalkLeftAction;
@synthesize parkourJumperWalkRightMadAgentsValue1Action;
@synthesize parkourJumperWalkLeftMadAgentsValue1Action;
@synthesize parkourJumperFallAction;
@synthesize parkourJumperJumpAction;
@synthesize parkourJumperCloserToPlayer1;
@synthesize parkourJumperJumpingOverLedgeOnLeftSideAction;
@synthesize parkourJumperJumpingOverLedgeOnRightSideAction;
@synthesize parkourJumperDistanceToLedgeOnLeftSide;
@synthesize parkourJumperDistanceToLedgeOnRightSide;
@synthesize ninjaJumping;
@synthesize ninjaRunning;
@synthesize ninjaStandingStill;
@synthesize ninjaStunned;



//All
@synthesize theGame;
@synthesize stunTimerLabel;
@synthesize stunTimeValue;
@synthesize decreaseStunTimerAction;
@synthesize enemyType;
@synthesize friendlyTimeValue;
@synthesize friendlyTimerLabel;
@synthesize decreaseFriendlyTimerAction;
@synthesize walkingSpeed;
@synthesize enemyReferenceNumber;
@synthesize closestJumpableTileLocation;
@synthesize mySprite;
@synthesize closestLedgeTileLocation;
@synthesize decreaseStunTimerActionAlreadyRunning;
@synthesize decreaseFriendlyTimerActionAlreadyRunning;
@synthesize enemyKnockedOutOfTheArena;
@synthesize isCurrentlyTeleportingIn;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    
    return [[[self alloc] initWithTheGame:_game] autorelease];
}

-(void) makeHidgonNotWalkLeftOrRight
{
    NSLog (@"makeHidgonNotWalkLeftOrRight method running");
    
    gunnerWalking.visible = NO;
    gunnerStandingStill.visible = YES;
    gunnerStunned.visible = NO;
    
    if (enemyHidgonWalkingLeft) {
        
        [self stopAction: enemyHidgonWalkLeftAction];
    }
    
    if (enemyHidgonWalkingRight) {
        
        [self stopAction: enemyHidgonWalkRightAction];
    }
    
   /* if (enemyHidgonFalling) {
        
        [self stopAction: enemyHidgonFallAction];
    }*/
    
    self.enemyHidgonWalkingRight = NO;
    self.enemyHidgonWalkingLeft = NO;
  //  self.enemyHidgonFalling = NO;
}

-(void) makeHidgonStopAllActionsAndThenRestartEnemyHidgonAdjustMovementMethod
{
    gunnerWalking.visible = NO;
    gunnerStandingStill.visible = YES;
    gunnerStunned.visible = NO;
    
    [self makeHidgonNotWalkLeftOrRight];
    
    if (enemyHidgonAdjustMovementActionIsRunning) {
        
        [self stopAction: enemyHidgonAdjustMovement];
        
        enemyHidgonAdjustMovementActionIsRunning = YES;
        
        enemyHidgonAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(enemyHidgonAdjustMovement)], [CCDelayTime actionWithDuration:enemyHidgonResponseTime], nil]]];        
    }
}

-(void) makeHidgonJump
{
    NSLog (@"makHidgonJump running");
    
    if (isPaused == YES || self.stunTimeValue > 0) {
        
        self.hidgonCurrentlyJumping = NO;
    }
    
    else if (isPaused == NO) {
        
        if (self.hidgonAllowedToJump) {
        
            gunnerWalking.visible = NO;
            gunnerStandingStill.visible = YES;
            gunnerStunned.visible = NO;
            
            self.hidgonCurrentlyJumping = YES;
                    
            //If bulletTime is not active, Hidgon jumps at normal rate
            if (bulletTimeActive == NO) {
                
                [self runAction: [CCSequence actions: [CCMoveBy actionWithDuration:0.5 position:ccp(0, 64)], [CCCallFunc actionWithTarget:self selector:@selector(setHidgonCurrentlyJumpingToNo)], nil]];
            }
            
            //If bulletTime is active, Hidgon jumps at slower rate
            else if (bulletTimeActive == YES) {
                
                [self runAction: [CCSequence actions: [CCMoveBy actionWithDuration:2.0 position:ccp(0, 64)], [CCCallFunc actionWithTarget:self selector:@selector(setHidgonCurrentlyJumpingToNo)], [CCCallFunc actionWithTarget:self selector:@selector(makeHidgonNotWalkLeftOrRight)], nil]];
            }
        }
    }
}


-(void) setHidgonCurrentlyJumpingToNo {
    
    self.hidgonCurrentlyJumping = NO;
}

-(void) setParkourJumperCurrentlyJumpingToNo {
    
    self.parkourJumperCurrentlyJumping = NO;
}

-(void) readjustEnemySkeletonWhaleResponseTime {
    
    //If it is not bulletTime and madAgentsAmount is 0, then set enemySkeletonWhale's response time to the default
    if (bulletTimeActive == NO && madAgentsAmount == 0) {
                    
        for (self in enemySkeletonWhaleSpritesArray) {
            
            self.enemySkeletonWhaleStopped = NO;
            self.enemySkeletonWhaleMovingRight = NO;
            self.enemySkeletonWhaleMovingLeft = NO;
            self.enemySkeletonWhaleMovingDown = NO;
            self.enemySkeletonWhaleMovingUp = NO;
            
            [self stopAllActions];
            
            enemySkeletonWhaleResponseTime = 1.0;
            
            enemySkeletonWhaleAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(enemySkeletonWhaleAdjustMovement)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],[CCCallFunc actionWithTarget:self selector:@selector(setEnemySkeletonWhaleStopped)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],  nil]]];
        }
    }
    
    //If it is not bulletTime and madAgentsAmount is 1, then increase SkeletonWhale's response time
    if (bulletTimeActive == NO && madAgentsAmount == 1) {
            
            for (self in enemySkeletonWhaleSpritesArray) {
            
            self.enemySkeletonWhaleStopped = NO;
            self.enemySkeletonWhaleMovingRight = NO;
            self.enemySkeletonWhaleMovingLeft = NO;
            self.enemySkeletonWhaleMovingDown = NO;
            self.enemySkeletonWhaleMovingUp = NO;
            
            [self stopAllActions];
            
            enemySkeletonWhaleResponseTime = 0.5;

            enemySkeletonWhaleAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(enemySkeletonWhaleAdjustMovement)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],[CCCallFunc actionWithTarget:self selector:@selector(setEnemySkeletonWhaleStopped)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],  nil]]];
        }
    }
    
    //If bulletTimeActive is YES then increase SkeletonWhale's response time by a factor of how much slower it is
    if (bulletTimeActive == YES && madAgentsAmount == 0) {
        
            
        for (self in enemySkeletonWhaleSpritesArray) {
            
            self.enemySkeletonWhaleStopped = NO;
            self.enemySkeletonWhaleMovingRight = NO;
            self.enemySkeletonWhaleMovingLeft = NO;
            self.enemySkeletonWhaleMovingDown = NO;
            self.enemySkeletonWhaleMovingUp = NO;
            
            [self stopAllActions];
            
            enemySkeletonWhaleResponseTime = 4.0;
            
            enemySkeletonWhaleAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(enemySkeletonWhaleAdjustMovement)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],[CCCallFunc actionWithTarget:self selector:@selector(setEnemySkeletonWhaleStopped)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],  nil]]];
        }
        
        //If bulletTimeActive is YES then increase SkeletonWhale's response time by a factor of how much slower it is
        if (bulletTimeActive == YES && madAgentsAmount == 1) {
            
            
            for (self in enemySkeletonWhaleSpritesArray) {
                
                self.enemySkeletonWhaleStopped = NO;
                self.enemySkeletonWhaleMovingRight = NO;
                self.enemySkeletonWhaleMovingLeft = NO;
                self.enemySkeletonWhaleMovingDown = NO;
                self.enemySkeletonWhaleMovingUp = NO;
                
                [self stopAllActions];
                
                enemySkeletonWhaleResponseTime = 2.0;
                
                enemySkeletonWhaleAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(enemySkeletonWhaleAdjustMovement)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],[CCCallFunc actionWithTarget:self selector:@selector(setEnemySkeletonWhaleStopped)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],  nil]]];
            }
        }
    }
}

-(void) adjustDownwardShooterResponseTimeMethod {
        
    if (madAgentsAmount == 0) {
        
        for (self in downwardShooterEnemySpritesArray) {
                    
            [self stopAllActions];
            
            float shootingSpeed;
            
            NSLog (@"Enemy bulletTimeActive = %i", bulletTimeActive);
            
            if (bulletTimeActive == NO) {
            
                shootingSpeed = 1.5;
            }
            
            else if (bulletTimeActive == YES) {
                
                shootingSpeed = 3.0;
            }
            
            NSLog (@"shootingSpeed = %f", shootingSpeed);
            
            downwardShooterShootingAction = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:shootingSpeed], [CCCallFunc actionWithTarget:self selector:@selector(downwardShooterShootingMethod)], nil]]];
        }
    }
    
    else if (madAgentsAmount == 1) {
        
        for (self in downwardShooterEnemySpritesArray) {
                    
            [self stopAllActions];
            
            float shootingSpeed;
            
            if (bulletTimeActive == NO) {
            
                shootingSpeed = 0.75;
            }
            
            else if (bulletTimeActive == YES) {
                
                shootingSpeed = 1.5;
            }
            
            downwardShooterShootingAction = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:shootingSpeed], [CCCallFunc actionWithTarget:self selector:@selector(downwardShooterShootingMethod)], nil]]];
        }
    }
}

-(void) increaseEnemyHidgonResponseTimeMethod {
    
    //If it is not bulletTime and madAgentsAmount is 0, then increase Hidgon's response time to the default
    if (bulletTimeActive == NO && madAgentsAmount == 0) {
                    
        for (self in enemyHidgonSpritesArray) {
            
            [self stopAction: enemyHidgonAdjustMovement];
            
            enemyHidgonResponseTime = 2.0;
            
            enemyHidgonAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:enemyHidgonResponseTime], [CCCallFunc actionWithTarget:self selector:@selector(enemyHidgonAdjustMovement)], nil]]];
            
            enemyHidgonAdjustMovementActionIsRunning = YES;
        }
    }
    
    //If it is not bulletTime and madAgentsAmount is 1, then increase Hidgon's response time
    if (bulletTimeActive == NO && madAgentsAmount == 1) {

        for (self in enemyHidgonSpritesArray) {
                        
            [self stopAction: enemyHidgonAdjustMovement];
            
            [self makeHidgonStopWalkingBeforeMadAgentsMode];
            
            [self pauseSchedulerAndActions];
            
            [self performSelector:@selector(resumeSchedulerAndActions) withObject:nil afterDelay:2.2];
            
        //    [enemyHidgonWalkLeftAction release];
        //    [enemyHidgonWalkRightAction release];
            
            enemyHidgonResponseTime = 1.0;
            
            enemyHidgonWalkRightAction = [[self runAction: [CCMoveBy actionWithDuration:5 position:ccp(1000, 0)]] retain];
            [self stopAction: enemyHidgonWalkRightAction];
            
            enemyHidgonWalkLeftAction = [[self runAction: [CCMoveBy actionWithDuration:5 position:ccp(-1000, 0)]] retain];
            [self stopAction: enemyHidgonWalkLeftAction];
            
            enemyHidgonAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:enemyHidgonResponseTime], [CCCallFunc actionWithTarget:self selector:@selector(enemyHidgonAdjustMovement)], nil]]];
            
            enemyHidgonAdjustMovementActionIsRunning = YES;
        }
    }
    
    //If it is not bulletTime and madAgentsAmount is 0, then increase Hidgon's response time to the default
    if (bulletTimeActive == YES && madAgentsAmount == 0) {
        
        for (self in enemyHidgonSpritesArray) {
            
            [self stopAction: enemyHidgonAdjustMovement];
            
            enemyHidgonResponseTime = 4.0;
            
            enemyHidgonAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:enemyHidgonResponseTime], [CCCallFunc actionWithTarget:self selector:@selector(enemyHidgonAdjustMovement)], nil]]];
            
            enemyHidgonAdjustMovementActionIsRunning = YES;
        }
    }
    
    //If it is not bulletTime and madAgentsAmount is 1, then increase Hidgon's response time
    if (bulletTimeActive == YES && madAgentsAmount == 1) {
        
        for (self in enemyHidgonSpritesArray) {
            
            [self stopAction: enemyHidgonAdjustMovement];
            
            [self makeHidgonStopWalkingBeforeMadAgentsMode];
            
            [self pauseSchedulerAndActions];
            
            [self performSelector:@selector(resumeSchedulerAndActions) withObject:nil afterDelay:2.2];
            
            //    [enemyHidgonWalkLeftAction release];
            //    [enemyHidgonWalkRightAction release];
            
            enemyHidgonResponseTime = 2.0;
            
            enemyHidgonWalkRightAction = [[self runAction: [CCMoveBy actionWithDuration:5 position:ccp(1000, 0)]] retain];
            [self stopAction: enemyHidgonWalkRightAction];
            
            enemyHidgonWalkLeftAction = [[self runAction: [CCMoveBy actionWithDuration:5 position:ccp(-1000, 0)]] retain];
            [self stopAction: enemyHidgonWalkLeftAction];
            
            enemyHidgonAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:enemyHidgonResponseTime], [CCCallFunc actionWithTarget:self selector:@selector(enemyHidgonAdjustMovement)], nil]]];
            
            enemyHidgonAdjustMovementActionIsRunning = YES;
        }
    }
    /*
    //If bulletTimeActive is YES then increase SkeletonWhale's response time by a factor of how much slower it is
    if (bulletTimeActive == YES) {
                 
        for (self in enemyHidgonSpritesArray) {
            
            [self stopAction: enemyHidgonAdjustMovement];
            
            enemyHidgonResponseTime = 8.0;
            
            enemyHidgonAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:enemyHidgonResponseTime], [CCCallFunc actionWithTarget:self selector:@selector(enemyHidgonAdjustMovement)], nil]]];
            
            enemyHidgonAdjustMovementActionIsRunning = YES;
        }
    }
     */
}




-(void) increaseParkourJumperResponseTimeMethod {
    
    //If it is not bulletTime and madAgentsAmount is 0, then increase ParkourJumper's response time to the default
    if (bulletTimeActive == NO && madAgentsAmount == 0) {
        
        for (self in parkourJumperEnemySpritesArray) {
            
            [self stopAction: parkourJumperAdjustMovement];
            
            parkourJumperResponseTime = 0.5;
            
            parkourJumperAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:enemyHidgonResponseTime], [CCCallFunc actionWithTarget:self selector:@selector(parkourJumperAdjustMovement)], nil]]];
        }
    }
    
    //If it is not bulletTime and madAgentsAmount is 1, then increase Parkour's response time
    if (bulletTimeActive == NO && madAgentsAmount == 1) {
        
        for (self in parkourJumperEnemySpritesArray) {
            
            [self stopAction: parkourJumperAdjustMovement];
            
            [self makeParkourJumperStopWalkingBeforeMadAgentsMode];
            
            [self pauseSchedulerAndActions];
            
            [self performSelector:@selector(resumeSchedulerAndActions) withObject:nil afterDelay:2.2];
            
            //    [parkourJumperWalkLeftAction release];
            //    [parkourJumperWalkRightAction release];
            
            parkourJumperResponseTime = 0.5;
            
            parkourJumperWalkRightAction = [[self runAction: [CCMoveBy actionWithDuration:5 position:ccp(1000, 0)]] retain];
            [self stopAction: parkourJumperWalkRightAction];
            
            parkourJumperWalkLeftAction = [[self runAction: [CCMoveBy actionWithDuration:5 position:ccp(-1000, 0)]] retain];
            [self stopAction: parkourJumperWalkLeftAction];
            
            parkourJumperAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:parkourJumperResponseTime], [CCCallFunc actionWithTarget:self selector:@selector(parkourJumperAdjustMovement)], nil]]];
        }
    }
    
    //If bulletTimeActive is YES then increase SkeletonWhale's response time by a factor of how much slower it is
    if (bulletTimeActive == YES) {
        
        for (self in parkourJumperEnemySpritesArray) {
            
            [self stopAction: parkourJumperAdjustMovement];
            
            parkourJumperResponseTime = 4.0;
            
            parkourJumperAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCDelayTime actionWithDuration:parkourJumperResponseTime], [CCCallFunc actionWithTarget:self selector:@selector(parkourJumperAdjustMovement)], nil]]];
        }
    }
}






-(void) pauseSchedulerAndActionsForSkeletonWhaleClass {
    
    [self pauseSchedulerAndActions];
}



-(void) enemySkeletonWhaleAdjustMovement
{
    if (enemyType == SKELETON_WHALE_TYPE) {
    
        if (isPaused == NO && isCurrentlyTeleportingIn == NO) {
            
            if (enemySkeletonWhaleMovingRight && stunTimeValue == 0) {
                
            }
            

            //Determine whether SkeletonWhale is closer to firstPlayerSprite or secondPlayerSprite
            float skeletonWhaleDistanceFromPlayer1;
            float skeletonWhaleDistanceFromPlayer2;
            
            skeletonWhaleDistanceFromPlayer1 = sqrt(pow((self.position.x - firstPlayerSprite.position.x), 2) + pow((self.position.y - firstPlayerSprite.position.y), 2));
            
            skeletonWhaleDistanceFromPlayer2 = sqrt(pow((self.position.x - secondPlayerSprite.position.x), 2) + pow((self.position.y - secondPlayerSprite.position.y), 2));
            
          //     NSLog (@"skeletonWhaleDistanceFromPlayer1 = %f", skeletonWhaleDistanceFromPlayer1);
          //     NSLog (@"skeletonWhaleDistanceFromPlayer2 = %f", skeletonWhaleDistanceFromPlayer2);
            
            if (skeletonWhaleDistanceFromPlayer1 > skeletonWhaleDistanceFromPlayer2) {
                
                skeletonWhaleCloserToPlayer1 = NO;
            //    NSLog (@"skeletonWhale is closer to Player2");
            }
            
            else {
                
                skeletonWhaleCloserToPlayer1 = YES;
            //    NSLog (@"skeletonWhale is closer to Player1");
            }
            
            
            
            //If it's singlePlayer, skeleton whale will always follow firstPlayersprite
            if (isSinglePlayer) {
            
                if (enemySkeletonWhaleMovingHorizontally == NO) {
                    
                    enemySkeletonWhaleMovingHorizontally = YES;
                }
                
                else {
                    
                    enemySkeletonWhaleMovingHorizontally = NO;
                }
                
                //If player's y position is greater than SkeletonWhale's, increase chance of SkeletonWhale moving up.
                if (firstPlayerSprite.position.y >= self.position.y && !enemySkeletonWhaleMovingHorizontally) {
                    
                    self.enemySkeletonWhaleStopped = NO;
                    self.enemySkeletonWhaleMovingRight = NO;
                    self.enemySkeletonWhaleMovingLeft = NO;
                    self.enemySkeletonWhaleMovingDown = NO;
                    self.enemySkeletonWhaleMovingUp = YES;
                }
                
                //If player's y position is less than SkeletonWhale's, increase chance of SkeletonWhale moving down.
                else if (firstPlayerSprite.position.y < self.position.y && !enemySkeletonWhaleMovingHorizontally) {
                    
                    self.enemySkeletonWhaleStopped = NO;
                    self.enemySkeletonWhaleMovingRight = NO;
                    self.enemySkeletonWhaleMovingLeft = NO;
                    self.enemySkeletonWhaleMovingDown = YES;
                    self.enemySkeletonWhaleMovingUp = NO;
                }
                
                //If player's x position is greater than SkeletonWhale's, then SkeletonWhale has a higher chance of moving right
                else if (firstPlayerSprite.position.x >= self.position.x && enemySkeletonWhaleMovingHorizontally) {
                    
                    int randomNumber;
                    
                    randomNumber = arc4random()%3;
                    
                    //Set to -1 to make the skeletonWhale always follow the player
                    if (randomNumber == -1) {
                        
                        //Move left
                        self.enemySkeletonWhaleStopped = NO;
                        self.enemySkeletonWhaleMovingRight = NO;
                        self.enemySkeletonWhaleMovingLeft = YES;
                        self.enemySkeletonWhaleMovingDown = NO;
                        self.enemySkeletonWhaleMovingUp = NO;
                    }
                    
                    else {
                        
                        //Move right
                        self.enemySkeletonWhaleStopped = NO;
                        self.enemySkeletonWhaleMovingRight = YES;
                        self.enemySkeletonWhaleMovingLeft = NO;
                        self.enemySkeletonWhaleMovingDown = NO;
                        self.enemySkeletonWhaleMovingUp = NO;
                    }
                }
                
                //If player's x position is less than SkeletonWhale's, then SkeletonWhale has a higher chance of moving left
                else if (firstPlayerSprite.position.x < self.position.x && enemySkeletonWhaleMovingHorizontally) {
                    
                    int randomNumber;
                    
                    randomNumber = arc4random()%3;
                    
                    //Set to -1 to make the skeletonWhale always follow the player
                    if (randomNumber == -1) {
                        
                        //Walk right
                        self.enemySkeletonWhaleStopped = NO;
                        self.enemySkeletonWhaleMovingRight = YES;
                        self.enemySkeletonWhaleMovingLeft = NO;
                        self.enemySkeletonWhaleMovingDown = NO;
                        self.enemySkeletonWhaleMovingUp = NO;
                    }
                    
                    else {
                        
                        //Walk left
                        self.enemySkeletonWhaleStopped = NO;
                        self.enemySkeletonWhaleMovingRight = NO;
                        self.enemySkeletonWhaleMovingLeft = YES;
                        self.enemySkeletonWhaleMovingDown = NO;
                        self.enemySkeletonWhaleMovingUp = NO;
                    }
                }
            }
            
            
            
            //If it's multiplayer, have the skeleton whale follow the player that's closest to it
            else if (!isSinglePlayer) {
                
                if (enemySkeletonWhaleMovingHorizontally == NO) {
                    
                    enemySkeletonWhaleMovingHorizontally = YES;
                }
                
                else {
                    
                    enemySkeletonWhaleMovingHorizontally = NO;
                }
                
                if (skeletonWhaleCloserToPlayer1) {
                
                    //If player's y position is greater than SkeletonWhale's, increase chance of SkeletonWhale moving up.
                    if (firstPlayerSprite.position.y >= self.position.y && !enemySkeletonWhaleMovingHorizontally) {
                        
                        self.enemySkeletonWhaleStopped = NO;
                        self.enemySkeletonWhaleMovingRight = NO;
                        self.enemySkeletonWhaleMovingLeft = NO;
                        self.enemySkeletonWhaleMovingDown = NO;
                        self.enemySkeletonWhaleMovingUp = YES;
                    }
                }
                
                if (!skeletonWhaleCloserToPlayer1) {
                    
                    //If seconPlayer's y position is greater than SkeletonWhale's, increase chance of SkeletonWhale moving up.
                    if (secondPlayerSprite.position.y >= self.position.y && !enemySkeletonWhaleMovingHorizontally) {
                        
                        self.enemySkeletonWhaleStopped = NO;
                        self.enemySkeletonWhaleMovingRight = NO;
                        self.enemySkeletonWhaleMovingLeft = NO;
                        self.enemySkeletonWhaleMovingDown = NO;
                        self.enemySkeletonWhaleMovingUp = YES;
                    }
                }
                
                if (skeletonWhaleCloserToPlayer1) {
                
                    //If player's y position is less than SkeletonWhale's, increase chance of SkeletonWhale moving down.
                    if (firstPlayerSprite.position.y < self.position.y && !enemySkeletonWhaleMovingHorizontally) {
                        
                        self.enemySkeletonWhaleStopped = NO;
                        self.enemySkeletonWhaleMovingRight = NO;
                        self.enemySkeletonWhaleMovingLeft = NO;
                        self.enemySkeletonWhaleMovingDown = YES;
                        self.enemySkeletonWhaleMovingUp = NO;
                    }
                }
                
                if (!skeletonWhaleCloserToPlayer1) {
                    
                    //If secondPlayer's y position is less than SkeletonWhale's, increase chance of SkeletonWhale moving down.
                    if (secondPlayerSprite.position.y < self.position.y && !enemySkeletonWhaleMovingHorizontally) {
                        
                        self.enemySkeletonWhaleStopped = NO;
                        self.enemySkeletonWhaleMovingRight = NO;
                        self.enemySkeletonWhaleMovingLeft = NO;
                        self.enemySkeletonWhaleMovingDown = YES;
                        self.enemySkeletonWhaleMovingUp = NO;
                    }
                }
                
                if (skeletonWhaleCloserToPlayer1) {
                
                    //If player's x position is greater than SkeletonWhale's, then SkeletonWhale has a higher chance of moving right
                    if (firstPlayerSprite.position.x >= self.position.x && enemySkeletonWhaleMovingHorizontally) {
                        
                        int randomNumber;
                        
                        randomNumber = arc4random()%3;
                        
                        //Set to -1 to make the skeletonWhale always follow the player
                        if (randomNumber == -1) {
                            
                            //Move left
                            self.enemySkeletonWhaleStopped = NO;
                            self.enemySkeletonWhaleMovingRight = NO;
                            self.enemySkeletonWhaleMovingLeft = YES;
                            self.enemySkeletonWhaleMovingDown = NO;
                            self.enemySkeletonWhaleMovingUp = NO;
                        }
                        
                        else {
                            
                            //Move right
                            self.enemySkeletonWhaleStopped = NO;
                            self.enemySkeletonWhaleMovingRight = YES;
                            self.enemySkeletonWhaleMovingLeft = NO;
                            self.enemySkeletonWhaleMovingDown = NO;
                            self.enemySkeletonWhaleMovingUp = NO;
                        }
                    }
                }
                
                if (!skeletonWhaleCloserToPlayer1) {
                    
                    //If seconPlayer's x position is greater than SkeletonWhale's, then SkeletonWhale has a higher chance of moving right
                    if (secondPlayerSprite.position.x >= self.position.x && enemySkeletonWhaleMovingHorizontally) {
                        
                        int randomNumber;
                        
                        randomNumber = arc4random()%3;
                        
                        //Set to -1 to make the skeletonWhale always follow the player
                        if (randomNumber == -1) {
                            
                            //Move left
                            self.enemySkeletonWhaleStopped = NO;
                            self.enemySkeletonWhaleMovingRight = NO;
                            self.enemySkeletonWhaleMovingLeft = YES;
                            self.enemySkeletonWhaleMovingDown = NO;
                            self.enemySkeletonWhaleMovingUp = NO;
                        }
                        
                        else {
                            
                            //Move right
                            self.enemySkeletonWhaleStopped = NO;
                            self.enemySkeletonWhaleMovingRight = YES;
                            self.enemySkeletonWhaleMovingLeft = NO;
                            self.enemySkeletonWhaleMovingDown = NO;
                            self.enemySkeletonWhaleMovingUp = NO;
                        }
                    }
                }
                
                if (skeletonWhaleCloserToPlayer1) {
                
                    //If player's x position is less than SkeletonWhale's, then SkeletonWhale has a higher chance of moving left
                    if (firstPlayerSprite.position.x < self.position.x && enemySkeletonWhaleMovingHorizontally) {
                        
                        int randomNumber;
                        
                        randomNumber = arc4random()%3;
                        
                        //Set to -1 to make the skeletonWhale always follow the player
                        if (randomNumber == -1) {
                            
                            //Walk right
                            self.enemySkeletonWhaleStopped = NO;
                            self.enemySkeletonWhaleMovingRight = YES;
                            self.enemySkeletonWhaleMovingLeft = NO;
                            self.enemySkeletonWhaleMovingDown = NO;
                            self.enemySkeletonWhaleMovingUp = NO;
                        }
                        
                        else {
                            
                            //Walk left
                            self.enemySkeletonWhaleStopped = NO;
                            self.enemySkeletonWhaleMovingRight = NO;
                            self.enemySkeletonWhaleMovingLeft = YES;
                            self.enemySkeletonWhaleMovingDown = NO;
                            self.enemySkeletonWhaleMovingUp = NO;
                        }
                    }
                }
                
                if (!skeletonWhaleCloserToPlayer1) {
                    
                    //If secondPlayer's x position is less than SkeletonWhale's, then SkeletonWhale has a higher chance of moving left
                    if (secondPlayerSprite.position.x < self.position.x && enemySkeletonWhaleMovingHorizontally) {
                        
                        int randomNumber;
                        
                        randomNumber = arc4random()%3;
                        
                        //Set to -1 to make the skeletonWhale always follow the player
                        if (randomNumber == -1) {
                            
                            //Walk right
                            self.enemySkeletonWhaleStopped = NO;
                            self.enemySkeletonWhaleMovingRight = YES;
                            self.enemySkeletonWhaleMovingLeft = NO;
                            self.enemySkeletonWhaleMovingDown = NO;
                            self.enemySkeletonWhaleMovingUp = NO;
                        }
                        
                        else {
                            
                            //Walk left
                            self.enemySkeletonWhaleStopped = NO;
                            self.enemySkeletonWhaleMovingRight = NO;
                            self.enemySkeletonWhaleMovingLeft = YES;
                            self.enemySkeletonWhaleMovingDown = NO;
                            self.enemySkeletonWhaleMovingUp = NO;
                        }
                    }
                }
            }
        }
    }
}

-(void) hidgonInitialArrayPopulation
{
    //Create 2 random integers, put them in hidgonMovementsArray
    NSNumber *firstMove = [NSNumber numberWithInt: 0];
    [self.hidgonMovementsArray addObject: firstMove];
    
    if (self.enemyReferenceNumber == totalEnemyReferenceNumbersGlobal - 1) {
    
        [hidgonMovementsArrayForPlayer2 addObject: firstMove];
    }
    
    NSNumber *secondMove = [NSNumber numberWithInt: 1];
    [self.hidgonMovementsArray addObject: secondMove];
    
    if (self.enemyReferenceNumber == totalEnemyReferenceNumbersGlobal - 1) {
    
        [hidgonMovementsArrayForPlayer2 addObject: secondMove];
    }
    
    NSNumber *thirdMove = [NSNumber numberWithInt: 0];
    [self.hidgonMovementsArray addObject: thirdMove];
    
    if (self.enemyReferenceNumber == totalEnemyReferenceNumbersGlobal - 1) {
    
        [hidgonMovementsArrayForPlayer2 addObject: thirdMove];
    }
    
    NSNumber *fourthMove = [NSNumber numberWithInt: 0];
    [self.hidgonMovementsArray addObject: fourthMove];
    
    if (self.enemyReferenceNumber == totalEnemyReferenceNumbersGlobal - 1) {
        
        [hidgonMovementsArrayForPlayer2 addObject: fourthMove];
    }
    /*
    NSNumber *fifthMove = [NSNumber numberWithInt: 0];
    [self.hidgonMovementsArray addObject: fifthMove];
    
    if (self.enemyReferenceNumber == totalEnemyReferenceNumbersGlobal - 1) {
        
        [hidgonMovementsArrayForPlayer2 addObject: fifthMove];
    }
    
    NSNumber *sixthMove = [NSNumber numberWithInt: 0];
    [self.hidgonMovementsArray addObject: sixthMove];
    
    if (self.enemyReferenceNumber == totalEnemyReferenceNumbersGlobal - 1) {
        
        [hidgonMovementsArrayForPlayer2 addObject: sixthMove];
    }
     */
}

-(void) sendMessageToPlayer2HavingHidgonFaceRight
{
    [(HelloWorldLayer*)theGame sendMakeHidgonFaceRight: self.enemyReferenceNumber];
}

-(void) sendMessageToPlayer2HavingHidgonFaceLeft
{
    [(HelloWorldLayer*)theGame sendMakeHidgonFaceLeft: self.enemyReferenceNumber];
}

-(void) sendMessageToPlayer2HavingParkourJumperFaceRight
{
    [(HelloWorldLayer*)theGame sendMakeParkourJumperFaceRight: self.enemyReferenceNumber];
}

-(void) sendMessageToPlayer2HavingParkourJumperFaceLeft
{
    [(HelloWorldLayer*)theGame sendMakeParkourJumperFaceLeft: self.enemyReferenceNumber];
}

-(void) makeHidgonJumpMethod
{    
    if (self.hidgonCurrentlyJumping == NO && self.hidgonAllowedToJump == YES) {
        
        enemyHidgonRunningVisibleMessageAlreadySent = NO;
        enemyHidgonStandingStillVisibleMessageAlreadySent = NO;
        
        //Send message to other player telling Hidgon's standing still sprite to be visible
        [(HelloWorldLayer*)theGame sendMakeHidgonStandingStillAnimationVisible: self.enemyReferenceNumber];
        
        gunnerWalking.visible = NO;
        gunnerStandingStill.visible = YES;
        
        self.hidgonCurrentlyJumping = YES;
        
        //Stop Hidgon
        [self makeHidgonNotWalkLeftOrRight];
        
        int lookLeftAndRightTimeDivider;
        
        if (madAgentsAmount == 0) {
            
            lookLeftAndRightTimeDivider = 1;
        }
        
        else if (madAgentsAmount == 1) {
            
            lookLeftAndRightTimeDivider = 2;
        }
                
        //Hidgon will look back and forth every 0.8 seconds for 2-3 seconds before he jumps.
        [self.gunnerStandingStill runAction: [CCSequence actions: [CCFlipX actionWithFlipX: YES], [CCCallFunc actionWithTarget:self selector:@selector(sendMessageToPlayer2HavingHidgonFaceLeft)], [CCDelayTime actionWithDuration: 0.8/lookLeftAndRightTimeDivider], [CCFlipX actionWithFlipX: NO], [CCCallFunc actionWithTarget:self selector:@selector(sendMessageToPlayer2HavingHidgonFaceRight)], [CCDelayTime actionWithDuration: 0.8/lookLeftAndRightTimeDivider],  [CCCallFunc actionWithTarget:self selector:@selector(makeHidgonJump)],  nil]];
    }
    
    else {
                
        //If Hidgon isn't allowed to jump then have him walk towards the player closest to them
        if ((self.enemyHidgonTouchingWallOnLeftSide || self.enemyHidgonTouchingWallOnRightSide) && self.enemyHidgonTouchingFloor == NO) {
            
            enemyHidgonTouchingFloor = NO;
        }
        
        else if ((isSinglePlayer && firstPlayerSprite.position.x >= self.position.x) || (!isSinglePlayer && hidgonCloserToPlayer1 && firstPlayerSprite.position.x >= self.position.x)) {
            
            enemyHidgonWalkingRight = YES;
            enemyHidgonWalkingLeft = NO;
        }
        
        else if ((isSinglePlayer && firstPlayerSprite.position.x < self.position.x) || (!isSinglePlayer && hidgonCloserToPlayer1 && firstPlayerSprite.position.x < self.position.x)) {
            
            enemyHidgonWalkingRight = NO;
            enemyHidgonWalkingLeft = YES;
        }
        
        else if (!isSinglePlayer && !hidgonCloserToPlayer1 && secondPlayerSprite.position.x >= self.position.x) {
            
            enemyHidgonWalkingRight = YES;
            enemyHidgonWalkingLeft = NO;
        }
        
        else if (!isSinglePlayer && !hidgonCloserToPlayer1 && secondPlayerSprite.position.x < self.position.x) {
            
            enemyHidgonWalkingRight = NO;
            enemyHidgonWalkingLeft = YES;
        }
    }
}





-(void) makeParkourJumperJumpMethod
{
    if (self.parkourJumperCurrentlyJumping == NO && self.parkourJumperAllowedToJump == YES) {
        
        
        self.parkourJumperCurrentlyJumping = YES;
        
        ninjaRunning.visible = NO;
        ninjaStandingStill.visible = YES;
        ninjaJumping.visible = NO;
        ninjaStunned.visible = NO;
        
        //Stop ParkourJumper
        [self makeParkourJumperNotWalkLeftOrRight];
        
        int lookLeftAndRightTimeDivider;
        
        if (madAgentsAmount == 0) {
            
            lookLeftAndRightTimeDivider = 1;
        }
        
        else if (madAgentsAmount == 1) {
            
            lookLeftAndRightTimeDivider = 2;
        }
        
        //ParkourJumper will look back and forth every 0.8 seconds for 2-3 seconds before he jumps.
        [self.ninjaStandingStill runAction: [CCSequence actions: [CCFlipX actionWithFlipX: YES], [CCCallFunc actionWithTarget:self selector:@selector(sendMessageToPlayer2HavingParkourJumperFaceLeft)], [CCDelayTime actionWithDuration: 0.8/lookLeftAndRightTimeDivider], [CCFlipX actionWithFlipX: NO], [CCCallFunc actionWithTarget:self selector:@selector(sendMessageToPlayer2HavingParkourJumperFaceRight)], [CCDelayTime actionWithDuration: 0.8/lookLeftAndRightTimeDivider],  [CCCallFunc actionWithTarget:self selector:@selector(makeParkourJumperJump)],  nil]];
    }
    
    else {
        
        //If ParkourJumper isn't allowed to jump then have him walk towards the player closest to them
        if ((isSinglePlayer && firstPlayerSprite.position.x >= self.position.x) || (!isSinglePlayer && parkourJumperCloserToPlayer1 && firstPlayerSprite.position.x >= self.position.x)) {
            
            parkourJumperWalkingRight = YES;
            parkourJumperWalkingLeft = NO;
        }
        
        else if ((isSinglePlayer && firstPlayerSprite.position.x < self.position.x) || (!isSinglePlayer && parkourJumperCloserToPlayer1 && firstPlayerSprite.position.x < self.position.x)) {
            
            parkourJumperWalkingRight = NO;
            parkourJumperWalkingLeft = YES;
        }
        
        else if (!isSinglePlayer && !parkourJumperCloserToPlayer1 && secondPlayerSprite.position.x >= self.position.x) {
            
            parkourJumperWalkingRight = YES;
            parkourJumperWalkingLeft = NO;
        }
        
        else if (!isSinglePlayer && !parkourJumperCloserToPlayer1 && secondPlayerSprite.position.x < self.position.x) {
            
            parkourJumperWalkingRight = NO;
            parkourJumperWalkingLeft = YES;
        }
    }
}


-(void) makeLocalHidgonShootFireballRightMethod
{
    if (self.stunTimeValue == 0 && self.friendlyTimerLabel == 0) {
    
        enemyHidgonWalkingRight = YES;
        enemyHidgonWalkingLeft = NO;
        
        //Make local Hidgon shoot fireball
        [(HelloWorldLayer*)theGame shootFireballRight:self.position.x y:self.position.y isBoss: isBoss];
    }
}

-(void) sendMessageMakeHidgonShootFireballRightMethod
{
    if (self.stunTimeValue == 0 && self.friendlyTimerLabel == 0) {
    
        //Send message to make Hidgon shoot fireball
        [(HelloWorldLayer*)theGame sendMakeHidgonShootFireballRight: self.enemyReferenceNumber];
    }
}

-(void) makeLocalHidgonShootFireballLeftMethod
{
    if (self.stunTimeValue == 0 && self.friendlyTimerLabel == 0) {
    
        enemyHidgonWalkingRight = NO;
        enemyHidgonWalkingLeft = YES;
        
        [(HelloWorldLayer*)theGame shootFireballLeft:self.position.x y:self.position.y isBoss: isBoss];
    }
}

-(void) sendMessageMakeHidgonShootFireballLeftMethod
{
    if (self.stunTimeValue == 0 && self.friendlyTimerLabel == 0) {
    
        //Send message to make Hidgon shoot fireball
        [(HelloWorldLayer*)theGame sendMakeHidgonShootFireballLeft: self.enemyReferenceNumber];
    }
}

-(void) makeLocalHidgonWalkLeft {
    
    enemyHidgonWalkingRight = NO;
    enemyHidgonWalkingLeft = YES;
}

-(void) makeLocalHidgonWalkRight {
    
    enemyHidgonWalkingRight = YES;
    enemyHidgonWalkingLeft = NO;
}

-(void) makeLocalHidgonStandStillAndFaceLeft {
    
    enemyHidgonWalkingRight = NO;
    enemyHidgonWalkingLeft = NO;
    
    gunnerWalking.visible = NO;
    gunnerStandingStill.visible = YES;
    gunnerStunned.visible = NO;
    
    gunnerWalking.flipX = YES;
    gunnerStandingStill.flipX = YES;
    gunnerStunned.flipX = YES;
}

-(void) makeLocalHidgonStandStillAndFaceRight {
    
    enemyHidgonWalkingRight = NO;
    enemyHidgonWalkingLeft = NO;
    
    gunnerWalking.visible = NO;
    gunnerStandingStill.visible = YES;
    gunnerStunned.visible = NO;
    
    gunnerWalking.flipX = NO;
    gunnerStandingStill.flipX = NO;
    gunnerStunned.flipX = NO;
}



-(void) enemyHidgonAdjustMovement
{
    //Hidgon
    if (enemyType == HIDGON_ENEMY_TYPE) {
        
        if (isPaused == NO && self.stunTimeValue == 0 && isCurrentlyTeleportingIn == NO) {

                if (isPlayer1) {
                    
                    float movementDelay;
                    
                    if (madAgentsAmount == 0) {
                        
                        movementDelay = 1.0;
                    }
                    
                    else if (madAgentsAmount >= 1) {
                        
                        movementDelay = 0.5;
                    }
                    
                    if ([[self.hidgonMovementsArray lastObject] intValue] == 0 && !self.hidgonCurrentlyJumping) {

                        //[self makeLocalHidgonWalkLeft];
                        [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(makeLocalHidgonStandStillAndFaceLeft)], [CCDelayTime actionWithDuration:movementDelay], [CCCallFunc actionWithTarget:self selector:@selector(makeLocalHidgonWalkLeft)], nil]];
                    }
                    
                    else if ([[self.hidgonMovementsArray lastObject] intValue] == 1 && !self.hidgonCurrentlyJumping) {

                       // [self makeLocalHidgonWalkRight];
                        [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(makeLocalHidgonStandStillAndFaceRight)], [CCDelayTime actionWithDuration:movementDelay], [CCCallFunc actionWithTarget:self selector:@selector(makeLocalHidgonWalkRight)], nil]];
                    }
                    
                    else if ([[self.hidgonMovementsArray lastObject] intValue] == 2 && !self.hidgonCurrentlyJumping) {

                        [self runAction: [CCSequence actions:  [CCCallFunc actionWithTarget:self selector:@selector(makeHidgonJumpMethod)], nil]];
                    }
                
                    else if ([[self.hidgonMovementsArray lastObject] intValue] == 3 && !self.hidgonCurrentlyJumping && self.friendlyTimeValue == 0 && self.stunTimeValue == 0) {
                        
                        [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(makeLocalHidgonStandStillAndFaceLeft)], [CCDelayTime actionWithDuration:movementDelay], [CCCallFunc actionWithTarget:self selector:@selector(makeLocalHidgonShootFireballLeftMethod)], nil]];
                        [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(sendMessageMakeHidgonShootFireballLeftMethod)], nil]];
                    }
                
                    else if ([[self.hidgonMovementsArray lastObject] intValue] == 4 && !self.hidgonCurrentlyJumping && self.friendlyTimeValue == 0 && self.stunTimeValue == 0) {

                        [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(makeLocalHidgonStandStillAndFaceRight)], [CCDelayTime actionWithDuration:movementDelay], [CCCallFunc actionWithTarget:self selector:@selector(makeLocalHidgonShootFireballRightMethod)], nil]];
                        [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(sendMessageMakeHidgonShootFireballRightMethod)], nil]];
                    }
                
                    [hidgonMovementsArray removeLastObject];
                    
                    
                    
                    
                    
                    //This subroutine decides which way hidgon will walk for single player only
                    if (isSinglePlayer == YES) {
                                    
                        //Determine whether or not Hidgon should jump through randomization
                        int hidgonWillJumpRandomNumber;
                        
                        if (madAgentsAmount == 0 && !(firstPlayerSprite.position.y > self.position.y + 6)) {
                            
                            hidgonWillJumpRandomNumber = arc4random()%5;
                        }
                        
                        else if (madAgentsAmount == 1 && timeInt >= 35 && !(firstPlayerSprite.position.y > self.position.y + 6)) {
                            
                            hidgonWillJumpRandomNumber = arc4random()%3;
                        }
                        
                        else if ((firstPlayerSprite.position.y > self.position.y + 6)) {
                            
                            hidgonWillJumpRandomNumber = 0;
                        }
                        
                        
                        //If player's y position is greater than Hidgon's AND a landable platform is within range above Hidgon, increase chance of Hidgon jumping.  One out of five chances of Hidgon jumping just because he feels like it.  Make sure he only jumps if there's a platform within landing range above him.
                        if (hidgonWillJumpRandomNumber == 0) {
                            
                        //    NSLog (@"hidgon Will Jump");
                            
                            NSNumber *twoNumber = [NSNumber numberWithInt: 2];
                            [self.hidgonMovementsArray insertObject: twoNumber atIndex:0];
                        }
                        
                        //If player's x position is greater than Hidgon's, then Hidgon has a higher chance of walking right
                        else if (firstPlayerSprite.position.x >= self.position.x) {
                            
                            int randomNumber;
                            
                            //If player is above Hidgon AND closestJumpableTile is to Hidgon's right, then give Hidgon a higher chance of walking right
                            if ((firstPlayerSprite.position.y > self.position.y + 6) && (closestJumpableTileLocation.x >firstPlayerSprite.position.x)) {
                                
                                randomNumber = arc4random()%3;
                            }
                            
                            //If player's x position is greater than Hidgon's, then Hidgon has a higher chance of walking right
                            else if (firstPlayerSprite.position.x > self.position.x) {
                                
                                randomNumber = arc4random()%3;
                            }
                            
                            //If no jumpable tile exists OR player is below Hidgon, give Hidgon a higher chance of walking towards Player's x-direction
                            else {
                                
                                randomNumber = arc4random()%3;
                            }
                            
                            //If randomNumber equals 0 then walk LEFT 
                            if (randomNumber == 0) {
                                
                                //Save to local array
                                NSNumber *random = [NSNumber numberWithInt: 0];
                                [self.hidgonMovementsArray insertObject: random atIndex:0];
                            }
                            
                            //If randomNumber is greater or equal to 1 then walk RIGHT
                            else if (randomNumber >= 1) {
                                
                          //      NSLog (@"hidgon Will walk right");
                                
                                //Save to local array
                                NSNumber *random = [NSNumber numberWithInt: 1];
                                [self.hidgonMovementsArray insertObject: random atIndex:0];
                            }
                        }
                        
                        //If player's x position is less than Hidgon's, then Hidgon has a higher chance of walking left
                        else if (firstPlayerSprite.position.x < self.position.x) {
                            
                            int randomNumber;
                            
                            //If player is above Hidgon AND closesJumpableTile is to Hidgon's left, then give Hidgon a higher chance of walking left
                            if ((firstPlayerSprite.position.y < self.position.y + 6) && (closestJumpableTileLocation.x <firstPlayerSprite.position.x)) {
                                
                                randomNumber = arc4random()%3;
                            }
                            
                            //If player's x position is greater than Hidgon's, then Hidgon has a higher chance of walking	right
                            else if (firstPlayerSprite.position.x < self.position.x)  {
                                
                                randomNumber = arc4random()%3;
                            }
                            
                            //If no jumpable tile exists OR player is blow Hidgon, give Hidgon a higher chance of walking towards Player's x-direction
                            else {
                                
                                randomNumber = arc4random()%3;
                            }

                            
                            //If randomNumber equals 0 then walk RIGHT
                            if (randomNumber == 0) {
                                
                            //    NSLog (@"hidgon Will walk right");
     
                                NSNumber *random = [NSNumber numberWithInt: 1];
                                [self.hidgonMovementsArray insertObject: random atIndex:0];
                            }
                            
                            //If randomNumber is greater or equal to 1 then walk LEFT
                            else if (randomNumber >= 1) {
                                                            
                                //Save to local array
                                NSNumber *random = [NSNumber numberWithInt: 0];
                                [self.hidgonMovementsArray insertObject: random atIndex:0];
                            }
                        }
                        
                        
                        
                        
                        
                        int randomChanceOfFireball = arc4random()%3;
                        
                        //hidgon should shoot if he's within sight of player
                        if (randomChanceOfFireball == 0 && firstPlayerSprite.position.y > self.position.y - 22 && firstPlayerSprite.position.y < self.position.y + 22 && firstPlayerSprite.position.x > self.position.x && enemyHidgonWalkingRight && self.stunTimeValue == 0) {
                            
                            //Send message to player 2 telling them to have hidgon move right and shoot fireball right
                            //Save to local array
                           // NSNumber *random = [NSNumber numberWithInt: 4];
                           // [self.hidgonMovementsArray insertObject: random atIndex:0];
                           // [(HelloWorldLayer*)theGame shootFireballRight:self.position.x y:self.position.y isBoss: isBoss];
                            [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.75], [CCCallFunc actionWithTarget:self selector:@selector(makeLocalHidgonShootFireballRightMethod)], nil]];
                        }
                        
                        else {
                            
                            //If Hidgon doesn't shoot a fireball, just send a message to player2 having hidgon move right
                            //Save to local array
                            NSNumber *random = [NSNumber numberWithInt: 1];
                            [self.hidgonMovementsArray insertObject: random atIndex:0];
                        }
                        
                        int randomChanceOfFireball2 = arc4random()%3;
                        
                        if (randomChanceOfFireball2 == 0 && firstPlayerSprite.position.y > self.position.y - 22 && firstPlayerSprite.position.y < self.position.y + 22 && firstPlayerSprite.position.x < self.position.x && enemyHidgonWalkingLeft && self.stunTimeValue == 0) {
                            
                            //Send message to player 2 telling them to have hidgon move left and shoot fireball left
                         //   NSNumber *random = [NSNumber numberWithInt: 3];
                         //   [self.hidgonMovementsArray insertObject: random atIndex:0];
                         //   [(HelloWorldLayer*)theGame shootFireballLeft:self.position.x y:self.position.y isBoss: isBoss];
                            [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration:0.75], [CCCallFunc actionWithTarget:self selector:@selector(makeLocalHidgonShootFireballLeftMethod)], nil]];
                        }
                        
                        else {
                            //If Hidgon doesn't shoot a fireball, just send a message to player2 having hidgon move left
                            //Save to local array
                            NSNumber *random = [NSNumber numberWithInt: 0];
                            [self.hidgonMovementsArray insertObject: random atIndex:0];
                        }
                    }
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    //This subroutine decides which way hidgon will walk for MULTIPLAYER only
                    if (!isSinglePlayer) {
                        
                        //Determine whether hidgon is closer to firstPlayerSprite or secondPlayerSprite
                        float hidgonDistanceFromPlayer1;
                        float hidgonDistanceFromPlayer2;
                                                
                        hidgonDistanceFromPlayer1 = sqrt(pow((self.position.x - firstPlayerSprite.position.x), 2) + pow((self.position.y - firstPlayerSprite.position.y), 2));
                        
                        hidgonDistanceFromPlayer2 = sqrt(pow((self.position.x - secondPlayerSprite.position.x), 2) + pow((self.position.y - secondPlayerSprite.position.y), 2));

                        if (hidgonDistanceFromPlayer1 > hidgonDistanceFromPlayer2) {
                            
                            hidgonCloserToPlayer1 = NO;
                        //    NSLog (@"Hidgon is closer to Player2");
                        }
                        
                        else {
                            
                            hidgonCloserToPlayer1 = YES;
                        //    NSLog (@"Hidgon is closer to Player1");
                        }
    
                    
                        //Determine whether or not Hidgon should jump through randomization
                        int hidgonWillJumpRandomNumber;
                        
                        if (madAgentsAmount == 0 && !(firstPlayerSprite.position.y > self.position.y + 6)) {
                            
                            hidgonWillJumpRandomNumber = arc4random()%5;
                        }
                        
                        else if (madAgentsAmount == 1 && timeInt >= 35 && !(firstPlayerSprite.position.y > self.position.y + 6)) {
                            
                            hidgonWillJumpRandomNumber = arc4random()%3;
                        }
                        
                        //If hidgon is closer to Player1
                        else if (hidgonCloserToPlayer1 && (firstPlayerSprite.position.y > self.position.y + 6)) {
                            
                            hidgonWillJumpRandomNumber = 0;
                        }
                        
                        //If hidgon is closer to Player2
                        else if (!hidgonCloserToPlayer1 && (secondPlayerSprite.position.y > self.position.y + 6)) {
                            
                            hidgonWillJumpRandomNumber = 0;
                        }
                        
                        
                        //If Player1's y position is greater than Hidgon's AND a landable platform is within range above Hidgon, increase chance of Hidgon jumping.  One out of five chances of Hidgon jumping just because he feels like it.  Make sure he only jumps if there's a platform within landing range above him.
                        if (hidgonWillJumpRandomNumber == 0) {
                            
                            //    NSLog (@"hidgon Will Jump");
                            
                            NSNumber *twoNumber = [NSNumber numberWithInt: 2];
                            [self.hidgonMovementsArray insertObject: twoNumber atIndex:0];
                            
                            NSNumber *number = [NSNumber numberWithInt: 2];
                            [hidgonMovementsArrayForPlayer2 addObject: number];
                        }
                        
                        //If player's x position is greater than Hidgon's, then Hidgon has a higher chance of walking right
                        else if ((hidgonCloserToPlayer1 && firstPlayerSprite.position.x >= self.position.x) || (!hidgonCloserToPlayer1 && secondPlayerSprite.position.x >= self.position.x)) {
                            
                            int randomNumber;
                            
                            //If player is above enemy then enemy has an equal chance of walking right
                            if ((hidgonCloserToPlayer1 && firstPlayerSprite.position.y > self.position.y + 6) || (!hidgonCloserToPlayer1 && secondPlayerSprite.position.y > self.position.y + 6)) {
                                
                                randomNumber = arc4random()%2;
                            }
                            
                            //If player's x position is greater than Hidgon's, then Hidgon has a higher chance of walking right
                            else {
                                
                                randomNumber = arc4random()%3;
                            }
                            
                            //If randomNumber equals 0 then walk LEFT
                            if (randomNumber == 0) {
                                
                                int randomChanceOfFireball = 0;
                                
                                if (randomChanceOfFireball == 0 && firstPlayerSprite.position.y > self.position.y - 22 && firstPlayerSprite.position.y < self.position.y + 22 && firstPlayerSprite.position.x < self.position.x) {
                                    
                                    //Send message to player 2 telling them to have hidgon move left and shoot fireball left
                                    NSNumber *random = [NSNumber numberWithInt: 3];
                                    [self.hidgonMovementsArray insertObject: random atIndex:0];
                                }
                                
                                else {
                                    //If Hidgon doesn't shoot a fireball, just send a message to player2 having hidgon move left
                                    //Save to local array
                                    NSNumber *random = [NSNumber numberWithInt: 0];
                                    [self.hidgonMovementsArray insertObject: random atIndex:0];
                                }
                            }
                            
                            //If randomNumber is greater or equal to 1 then walk RIGHT
                            else if (randomNumber >= 1) {
                                
                                //      NSLog (@"hidgon Will walk right");
                                
                                //Save to local array
                                NSNumber *random = [NSNumber numberWithInt: 1];
                                [self.hidgonMovementsArray insertObject: random atIndex:0];
                            }
                        }
                        
                        //If player's x position is less than Hidgon's, then Hidgon has a higher chance of walking left
                        else if ((hidgonCloserToPlayer1 && firstPlayerSprite.position.x < self.position.x) || (!hidgonCloserToPlayer1 && secondPlayerSprite.position.x < self.position.x)) {
                            
                            int randomNumber;
                            
                            //If player is above enemy then enemy has an equal chance of walking right
                            if ((hidgonCloserToPlayer1 && firstPlayerSprite.position.y > self.position.y + 6) || (!hidgonCloserToPlayer1 && secondPlayerSprite.position.y > self.position.y + 6)) {
                                
                                randomNumber = arc4random()%2;
                            }
                            
                            //If player's x position is less than Hidgon's, then Hidgon has a higher chance of walking left
                            else {
                                
                                randomNumber = arc4random()%3;
                            }
                            
                            //If randomNumber equals 0 then walk RIGHT
                            if (randomNumber == 0) {
                                
                                //    NSLog (@"hidgon Will walk right");
                                
                                int randomChanceOfFireball = 0;
                                
                                if (randomChanceOfFireball == 0 && firstPlayerSprite.position.y > self.position.y - 22 && firstPlayerSprite.position.y < self.position.y + 22 && firstPlayerSprite.position.x > self.position.x) {
                                    
                                    //Send message to player 2 telling them to have hidgon move right and shoot fireball right
                                    //Save to local array
                                    NSNumber *random = [NSNumber numberWithInt: 4];
                                    [self.hidgonMovementsArray insertObject: random atIndex:0];
                                }
                                
                                else {
                                    
                                    //If Hidgon doesn't shoot a fireball, just send a message to player2 having hidgon move right
                                    //Save to local array
                                    NSNumber *random = [NSNumber numberWithInt: 1];
                                    [self.hidgonMovementsArray insertObject: random atIndex:0];
                                }
                            }
                            
                            //If randomNumber is greater or equal to 1 then walk LEFT
                            else if (randomNumber >= 1) {
                                
                                //Save to local array
                                NSNumber *random = [NSNumber numberWithInt: 0];
                                [self.hidgonMovementsArray insertObject: random atIndex:0];
                            }
                        }
                    }
                }
            }
        }
}


-(void) parkourJumperAdjustMovement
{
    //ParkourJumper
    if (enemyType == PARKOUR_JUMPER_TYPE) {
        
        if (isPaused == NO && self.stunTimeValue == 0 && isCurrentlyTeleportingIn == NO) {
            
            if (isPlayer1 || isSinglePlayer) {
                
                NSLog (@"I'm Player1");
                
                for (Enemy *parkourJumper in parkourJumperEnemySpritesArray) {
                    
                    NSLog (@"parkourJumper.parkourJumperMovementsArray count = %i", [parkourJumper.parkourJumperMovementsArray count]);
                }
            }
            
            else if (!isPlayer1) {
                
                NSLog (@"I'm Player2");
                
                for (Enemy *parkourJumper in parkourJumperEnemySpritesArray) {
                    
                    NSLog (@"parkourJumper.parkourJumperMovementsArray count = %i", [parkourJumper.parkourJumperMovementsArray count]);                    
                }
            }
            
            if (isPlayer1) {
                
                if ([[self.parkourJumperMovementsArray lastObject] intValue] == 0 && !self.parkourJumperCurrentlyJumping) {

                    parkourJumperWalkingLeft = YES;
                    parkourJumperWalkingRight = NO;
                }
                
                else if ([[self.parkourJumperMovementsArray lastObject] intValue] == 1 && !self.parkourJumperCurrentlyJumping) {

                    parkourJumperWalkingLeft = NO;
                    parkourJumperWalkingRight = YES;
                }
                
                else if ([[self.parkourJumperMovementsArray lastObject] intValue] == 2 && !self.parkourJumperCurrentlyJumping) {
                    
                    [self makeParkourJumperJumpMethod];
                }
                
                [parkourJumperMovementsArray removeLastObject];
                
                
                
                //This subroutine decides which way ParkourJumper will walk for single player only
                if (isSinglePlayer == YES) {
                    
                    //Determine whether or not Hidgon should jump based on where Player is
                    int parkourJumperWillJumpRandomNumber;
                   
                    if (!(firstPlayerSprite.position.y > self.position.y + 6)) {
                        
                        parkourJumperWillJumpRandomNumber = arc4random()%50;
                    }
                    
                    if ((firstPlayerSprite.position.y > self.position.y + 6)) {
                        
                        parkourJumperWillJumpRandomNumber = 0;
                    }
                    
                    
                    //If player's y position is greater than ParkourJumper's AND a landable platform is within range above ParkourJumper, increase chance of ParkourJumper jumping.  One out of five chances of ParkourJumper jumping just because he feels like it.  Make sure he only jumps if there's a platform within landing range above him.
                    if (parkourJumperWillJumpRandomNumber == 0) {
                        
                        NSNumber *twoNumber = [NSNumber numberWithInt: 2];
                        [self.parkourJumperMovementsArray insertObject: twoNumber atIndex:0];
                        
                        NSNumber *number = [NSNumber numberWithInt: 2];
                        [parkourJumperMovementsArray addObject: number];
                    }
                    
                    //If player's x position is greater than ParkourJumper's, then ParkourJumper has a higher chance of walking right
                    else if (firstPlayerSprite.position.x >= self.position.x) {
                        
                        int randomNumber;
                        
                        //If player is above Ninja AND closesJumpableTile is to Ninja's right, then have Ninja walk right 
                        if ((firstPlayerSprite.position.y > self.position.y + 6) && (closestJumpableTileLocation.x > firstPlayerSprite.position.x)) {
                            
                            randomNumber = 1;
                        }
                        
                        //If player's x position is greater than ParkourJumper's, then ParkourJumper has a higher chance of walking right
                        else if (firstPlayerSprite.position.x > self.position.x) {
                            
                            randomNumber = 1;
                        }
                        
                        //If no jumpable tile exists OR player is blow Ninja, have Ninja run towards firstPlayer's x-direction
                        else {
                            
                            randomNumber = 1;
                        }
                        
                        //If randomNumber equals 0 then walk LEFT
                        if (randomNumber == 0) {
                            
                            //Send a message to player2 having ParkourJumper's move left
                            //Save to local array
                            NSNumber *random = [NSNumber numberWithInt: 0];
                            [self.parkourJumperMovementsArray insertObject: random atIndex:0];
                            
                            //Save to array that will be sent to player 2
                            NSNumber *number = [NSNumber numberWithInt: 0];
                            [parkourJumperMovementsArrayForPlayer2 addObject: number];
                        }
                        
                        //If randomNumber is greater or equal to 1 then walk RIGHT
                        else if (randomNumber >= 1) {
                            
                            //      NSLog (@"ParkourJumper Will walk right");
                            
                            //Save to local array
                            NSNumber *random = [NSNumber numberWithInt: 1];
                            [self.parkourJumperMovementsArray insertObject: random atIndex:0];
                            
                            //Save to array that will be sent to player 2
                            NSNumber *number = [NSNumber numberWithInt: 1];
                            [parkourJumperMovementsArrayForPlayer2 addObject: number];
                        }
                    }
                    
                    //If player's x position is less than ParkourJumper's, then ParkourJumper has a higher chance of walking left
                    else if (firstPlayerSprite.position.x < self.position.x) {
                        
                        int randomNumber;
                        
                        //If player is above Ninja, and closestJumpableTile is closer to Ninja's left side, then have ninja walk left
                        if ((firstPlayerSprite.position.y < self.position.y + 6) && (closestJumpableTileLocation.x < firstPlayerSprite.position.x)) {
                            
                            randomNumber = 1;
                        }
                        
                        //If player's x position is less than ParkourJumper's, then ParkourJumper has a higher chance of walking left
                        else if (firstPlayerSprite.position.x < self.position.x) {
                            
                            randomNumber = 1;
                        }
                        
                        //If no jumpable tile exists OR player is blow Ninja, have Ninja run towards firstPlayer's x-direction
                        else {
                            
                            randomNumber = 1;
                        }
                        
                        //If randomNumber equals 0 then walk RIGHT
                        if (randomNumber == 0) {
                                
                            //Send a message to player2 having ParkourJumper move right
                            //Save to local array
                            NSNumber *random = [NSNumber numberWithInt: 1];
                            [self.parkourJumperMovementsArray insertObject: random atIndex:0];
                            
                            //Save to array that will be sent to player 2
                            NSNumber *number = [NSNumber numberWithInt: 1];
                            [parkourJumperMovementsArrayForPlayer2 addObject: number];
                        }
                        
                        //If randomNumber is greater or equal to 1 then walk LEFT
                        else if (randomNumber >= 1) {
                            
                            //Save to local array
                            NSNumber *random = [NSNumber numberWithInt: 0];
                            [self.parkourJumperMovementsArray insertObject: random atIndex:0];
                            
                            //Save to array that will be sent to player 2
                            NSNumber *number = [NSNumber numberWithInt: 0];
                            [parkourJumperMovementsArrayForPlayer2 addObject: number];
                        }
                    }
                }
                
                
                
                //This subroutine decides which way ParkourJumper will walk for MULTIPLAYER only
                if (!isSinglePlayer) {
                    
                    //Determine whether ParkourJumper is closer to firstPlayerSprite or secondPlayerSprite
                    float parkourJumperDistanceFromPlayer1;
                    float parkourJumperDistanceFromPlayer2;
                    
                    parkourJumperDistanceFromPlayer1 = sqrt(pow((self.position.x - firstPlayerSprite.position.x), 2) + pow((self.position.y - firstPlayerSprite.position.y), 2));
                    
                    parkourJumperDistanceFromPlayer2 = sqrt(pow((self.position.x - secondPlayerSprite.position.x), 2) + pow((self.position.y - secondPlayerSprite.position.y), 2));
                    
                    //   NSLog (@"parkourJumperDistanceFromPlayer1 = %f", parkourJumperDistanceFromPlayer1);
                    //   NSLog (@"parkourJumperDistanceFromPlayer2 = %f", parkourJumperDistanceFromPlayer2);
                    
                    if (parkourJumperDistanceFromPlayer1 > parkourJumperDistanceFromPlayer2) {
                        
                        parkourJumperCloserToPlayer1 = NO;
                        NSLog (@"ParkourJumper is closer to Player2");
                    }
                    
                    else {
                        
                        parkourJumperCloserToPlayer1 = YES;
                        NSLog (@"ParkourJumper is closer to Player1");
                    }
                    
                    
                    //Determine whether or not ParkourJumper should jump based on where Players are
                    int parkourJumperWillJumpRandomNumber;
                    
                    if (!(firstPlayerSprite.position.y > self.position.y + 6)) {
                        
                        parkourJumperWillJumpRandomNumber = arc4random()%50;
                    }
                    
                    //If ParkourJumper is closer to Player1
                    else if (parkourJumperCloserToPlayer1 && (firstPlayerSprite.position.y > self.position.y + 6)) {
                        
                        parkourJumperCloserToPlayer1 = 0;
                    }
                    
                    //If ParkourJumper is closer to Player2
                    else if (!parkourJumperCloserToPlayer1 && (secondPlayerSprite.position.y > self.position.y + 6)) {
                        
                        parkourJumperCloserToPlayer1 = 0;
                    }
                    
                    
                    //If Player1's y position is greater than ParkourJumper's AND a landable platform is within range above ParkourJumper, increase chance of ParkourJumper jumping.  One out of five chances of ParkourJumper jumping just because he feels like it.  Make sure he only jumps if there's a platform within landing range above him.
                    if (parkourJumperWillJumpRandomNumber == 0) {
                        
                        //    NSLog (@"parkourJumper Will Jump");
                        
                        NSNumber *twoNumber = [NSNumber numberWithInt: 2];
                        [self.parkourJumperMovementsArray insertObject: twoNumber atIndex:0];
                        
                        NSNumber *number = [NSNumber numberWithInt: 2];
                        [parkourJumperMovementsArrayForPlayer2 addObject: number];
                    }
                    
                    //If player's x position is greater than ParkourJumper's, then ParkourJumper has a higher chance of walking right
                    else if ((parkourJumperCloserToPlayer1 && firstPlayerSprite.position.x >= self.position.x) || (!parkourJumperCloserToPlayer1 && secondPlayerSprite.position.x >= self.position.x)) {
                        
                        int randomNumber;
                        
                        //If player is above enemy then enemy has an equal chance of walking right
                        if ((parkourJumperCloserToPlayer1 && firstPlayerSprite.position.y > self.position.y + 6) || (!parkourJumperCloserToPlayer1 && secondPlayerSprite.position.y > self.position.y + 6)) {
                            
                            randomNumber = arc4random()%2;
                        }
                        
                        //If player's x position is greater than ParkourJumper's, then ParkourJumper has a higher chance of walking right
                        else {
                            
                            randomNumber = arc4random()%3;
                        }
                        
                        //If randomNumber equals 0 then walk LEFT
                        if (randomNumber == 0) {

                            //If ParkourJumper doesn't shoot a fireball, just send a message to player2 having ParkourJumper move left
                            //Save to local array
                            NSNumber *random = [NSNumber numberWithInt: 0];
                            [self.parkourJumperMovementsArray insertObject: random atIndex:0];
                            
                            //Save to array that will be sent to player 2
                            NSNumber *number = [NSNumber numberWithInt: 0];
                            [parkourJumperMovementsArrayForPlayer2 addObject: number];
                        }
                        
                        //If randomNumber is greater or equal to 1 then walk RIGHT
                        else if (randomNumber >= 1) {
                            
                            //NSLog (@"ParkourJumper Will walk right");
                            
                            //Save to local array
                            NSNumber *random = [NSNumber numberWithInt: 1];
                            [self.parkourJumperMovementsArray insertObject: random atIndex:0];
                            
                            //Save to array that will be sent to player 2
                            NSNumber *number = [NSNumber numberWithInt: 1];
                            [parkourJumperMovementsArrayForPlayer2 addObject: number];
                        }
                    }
                    
                    //If player's x position is less than ParkourJumper's, then ParkourJumper has a higher chance of walking left
                    else if ((parkourJumperCloserToPlayer1 && firstPlayerSprite.position.x < self.position.x) || (!parkourJumperCloserToPlayer1 && secondPlayerSprite.position.x < self.position.x)) {
                        
                        int randomNumber;
                        
                        //If player is above enemy then enemy has an equal chance of walking right
                        if ((parkourJumperCloserToPlayer1 && firstPlayerSprite.position.y > self.position.y + 6) || (!parkourJumperCloserToPlayer1 && secondPlayerSprite.position.y > self.position.y + 6)) {
                            
                            randomNumber = arc4random()%2;
                        }
                        
                        //If player's x position is less than ParkourJumper's, then ParkourJumper has a higher chance of walking left
                        else {
                            
                            randomNumber = arc4random()%3;
                        }
                        
                        //If randomNumber equals 0 then walk RIGHT
                        if (randomNumber == 0) {
                            
                            //If ParkourJumper doesn't shoot a fireball, just send a message to player2 having ParkourJumper move right
                            //Save to local array
                            NSNumber *random = [NSNumber numberWithInt: 1];
                            [self.parkourJumperMovementsArray insertObject: random atIndex:0];
                            
                            //Save to array that will be sent to player 2
                            NSNumber *number = [NSNumber numberWithInt: 1];
                            [parkourJumperMovementsArrayForPlayer2 addObject: number];
                        }
                        
                        //If randomNumber is greater or equal to 1 then walk LEFT
                        else if (randomNumber >= 1) {
                            
                            //Save to local array
                            NSNumber *random = [NSNumber numberWithInt: 0];
                            [self.parkourJumperMovementsArray insertObject: random atIndex:0];
                            
                            //Save to array that will be sent to player 2
                            NSNumber *number = [NSNumber numberWithInt: 0];
                            [parkourJumperMovementsArrayForPlayer2 addObject: number];
                        }
                    }
                }
            }
        }
    }
    
    
    if (self.enemyReferenceNumber == totalEnemyReferenceNumbersGlobal - 1) {
        
        NSLog (@"parkourJumperAdjustMovement loop break");
        
        if (isSinglePlayer == NO && isPlayer1 == YES && isPaused == NO) {
            
            //send hidgonMovementsArrayForPlayer2 array now
            //   [(HelloWorldLayer*)theGame sendHidgonMovementsArrayForPlayer2];
        }
    }
}

-(void) setEnemySkeletonWhaleStopped
{
    self.enemySkeletonWhaleStopped = YES;
    self.enemySkeletonWhaleMovingRight = NO;
    self.enemySkeletonWhaleMovingLeft = NO;
    self.enemySkeletonWhaleMovingDown = NO;
    self.enemySkeletonWhaleMovingUp = NO;
}

-(void) downwardShooterShootingMethod
{
    if (self.stunTimeValue == 0 && self.friendlyTimeValue == 0 && isCurrentlyTeleportingIn == NO) {
    
        [(HelloWorldLayer*)theGame shootFireballDownward:self.position.x y:self.position.y];
    }
}

-(void) setParkourJumperJumpingOverLedgeOnLeftSideToNo
{
    parkourJumperJumpingOverLedgeOnLeftSide = NO;
}

-(void) setParkourJumperJumpingOverLedgeOnRightSideToNo
{
    parkourJumperJumpingOverLedgeOnRightSide = NO;
}

-(BOOL)doesLineStart:(CGPoint)lineStart andLineEnd:(CGPoint)lineEnd rectangleLocation: (CGPoint) tmpgidlocation {
    
    // Work out all corners of the rectangle
	CGPoint bottomLeftCorner = ccp(tmpgidlocation.x - 11, tmpgidlocation.y - 11);
	CGPoint bottomRightCorner = ccp(tmpgidlocation.x + 11, tmpgidlocation.y - 11);
	CGPoint topLeftCorner = ccp(tmpgidlocation.x - 11, tmpgidlocation.y - 11);
	CGPoint topRightCorner = ccp(tmpgidlocation.x + 11, tmpgidlocation.y + 11);
    
	int numberOfIntersections = 0;
	CGFloat s;
	CGFloat t;
    
	// Check if top side intersects
	if (ccpLineIntersect(lineStart, lineEnd, topLeftCorner, topRightCorner, &s, &t) && s >= 0 && s <= 1 && t >= 0 && t <= 1) {
		numberOfIntersections++;
	}
    
	// Check if bottom side intersects
	if (ccpLineIntersect(lineStart, lineEnd, bottomLeftCorner, bottomRightCorner, &s, &t) && s >= 0 && s <= 1 && t >= 0 && t <= 1) {
		numberOfIntersections++;
	}
    
	// Check if left side intersects
	if (numberOfIntersections < 2 && ccpLineIntersect(lineStart, lineEnd, bottomLeftCorner, topLeftCorner, &s, &t) && s >= 0 && s <= 1 && t >= 0 && t <= 1) {
		numberOfIntersections++;
	}
    
	// Check if right side intersects
	if (numberOfIntersections < 2 && ccpLineIntersect(lineStart, lineEnd, bottomRightCorner, topRightCorner, &s, &t) && s >= 0 && s <= 1 && t >= 0 && t <= 1) {
		numberOfIntersections++;
	}
    
	if (numberOfIntersections == 2) {
		return YES;
	}
    
	return NO;
}

-(void) setIsCurrentlYTeleportingInToNo
{
    isCurrentlyTeleportingIn = NO;
            
    [self setZOrder: 200];
}

//Since Chaser's walkingSpeed = 0 the moment he teleports in, this will set his initial speed appropriately the moment he teleports in.
-(void) setChaserInitialWalkingSpeedAfterTeleportation
{    
    if (madAgentsAmount == 0) {
        
        if (!isBoss) {
            
            walkingSpeed = 1.0;
        }
        
        else if (isBoss) {
            
            walkingSpeed = 1.5;
        }
        
        if (bulletTimeActive == YES) {
            
            if (!isBoss) {
                
                walkingSpeed = 0.25;
            }
            
            else if (isBoss) {
                
                walkingSpeed = 0.375;
            }
        }
    }
    
    else if (madAgentsAmount == 1) {
        
        if (!isBoss) {
            
            walkingSpeed = 2.0;
        }
        
        else if (isBoss) {
            
            walkingSpeed = 3.0;
        }
        
        if (bulletTimeActive == YES) {
            
            if (!isBoss) {
                
                walkingSpeed = 0.5;
            }
            
            else if (isBoss) {
                
                walkingSpeed = 0.75;
            }
        }
    }
}

-(void) pauseAllMotionFramesForMadAgentsNotification {
    
    if (self.enemyType == PARKOUR_JUMPER_TYPE) {
        
        [ninjaRunning pauseSchedulerAndActions];
        [ninjaStunned pauseSchedulerAndActions];
    }
    
    if (enemyType == HIDGON_ENEMY_TYPE) {
        
        [gunnerWalking pauseSchedulerAndActions];
        [gunnerStunned pauseSchedulerAndActions];
    }
    
    if (self.enemyType == SKELETON_WHALE_TYPE) {
        
        [jetmanFlying pauseSchedulerAndActions];
        [jetmanStunned pauseSchedulerAndActions];
    }
    
    if (self.enemyType == DIAGONAL_FLYER_TYPE) {
        
        [diagonalFlyerStunned pauseSchedulerAndActions];
    }
    
    if (self.enemyType == FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE) {
        
        //To Do: Place flythroughwalls diagonal flyer stunned animation on pause
    }
    
    if (self.enemyType == CHASER_ENEMY_TYPE) {
        
        [chaserWalking pauseSchedulerAndActions];
        [chaserRunning pauseSchedulerAndActions];
        [chaserStunned pauseSchedulerAndActions];
    }
    
    if (self.enemyType == DOWNWARD_SHOOTER_TYPE) {
        
        [saucerFlying pauseSchedulerAndActions];
    }
}

-(void) resumeAllMotionFramesForMadAgentsNotification {
    
    if (self.enemyType == PARKOUR_JUMPER_TYPE) {
        
        [ninjaRunning resumeSchedulerAndActions];
        [ninjaStunned resumeSchedulerAndActions];
    }
    
    if (enemyType == HIDGON_ENEMY_TYPE) {
        
        [gunnerWalking resumeSchedulerAndActions];
        [gunnerStunned resumeSchedulerAndActions];
    }
    
    if (self.enemyType == SKELETON_WHALE_TYPE) {
        
        [jetmanFlying resumeSchedulerAndActions];
        [jetmanStunned resumeSchedulerAndActions];
    }
    
    if (self.enemyType == DIAGONAL_FLYER_TYPE) {
        
        [diagonalFlyerStunned resumeSchedulerAndActions];
    }
    
    if (self.enemyType == FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE) {
        
        //To Do: Resume flythroughwalls diagonal flyer stunned animation
    }
    
    if (self.enemyType == CHASER_ENEMY_TYPE) {
        
        [chaserWalking resumeSchedulerAndActions];
        [chaserRunning resumeSchedulerAndActions];
        [chaserStunned resumeSchedulerAndActions];
    }
    
    if (self.enemyType == DOWNWARD_SHOOTER_TYPE) {
        
        [saucerFlying resumeSchedulerAndActions];
    }
}

-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        if (globalEnemyType == HIDGON_ENEMY_TYPE) {
            
            self.enemyType = HIDGON_ENEMY_TYPE;
            
            theGame = _game;
            /*
            mySprite = [CCSprite spriteWithFile:@"EnemyHidgon.png"];
            self.scale = 0.9;
            [self addChild:mySprite];
            
            [theGame addChild:self];
            */
            
            //pass in the name of the property list
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"GunnerWalking.plist"];
            
            //create the sprite sheet
            CCSpriteBatchNode *spriteSheetGunnerWalking = [CCSpriteBatchNode batchNodeWithFile: @"GunnerWalking.png"];
            [self addChild: spriteSheetGunnerWalking z: 150];
            
            //Create array of cairostance frames
            NSMutableArray *gunnerWalkingAnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 5; ++i) {
                [gunnerWalkingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Gunner%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *gunnerWalkingAnim = [CCAnimation animationWithFrames:gunnerWalkingAnimFrames delay:0.12f];
            
            //Create sprite and run the animation
            gunnerWalking = [CCSprite spriteWithSpriteFrameName:@"Gunner1.png"];
            gunnerWalking.anchorPoint = ccp(0.5, 0.4);
            CCAction *_gunnerWalkingAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: gunnerWalkingAnim restoreOriginalFrame:NO]];
            [gunnerWalking runAction: _gunnerWalkingAction];
            gunnerWalking.visible = NO;
            
            
            //Create array of gunnerStunned frames
            NSMutableArray *gunnerStunnedAnimFrames = [NSMutableArray array];
            for(int i = 10; i <= 12; ++i) {
                [gunnerStunnedAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Gunner%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *gunnerStunnedAnim = [CCAnimation animationWithFrames:gunnerStunnedAnimFrames delay:0.16f];
            
            //Create sprite and run the animation
            gunnerStunned = [CCSprite spriteWithSpriteFrameName:@"Gunner10.png"];
            gunnerStunned.anchorPoint = ccp(0.5, 0.4);
            CCAction *gunnerStunnedAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: gunnerStunnedAnim restoreOriginalFrame:NO]];
            [gunnerStunned runAction: gunnerStunnedAction];
            gunnerStunned.visible = NO;
            
            
            gunnerStandingStill = [CCSprite spriteWithSpriteFrameName:@"Gunner5.png"];
            gunnerStandingStill.anchorPoint = ccp(0.5, 0.4);
            [self addChild: gunnerStandingStill];
            
            [spriteSheetGunnerWalking addChild: gunnerWalking z: 150];
            [spriteSheetGunnerWalking addChild: gunnerStunned z: 150];

            [theGame addChild:self];
            
            self.enemyHidgonFaceLeftMessageAlreadySent = NO;
            self.enemyHidgonFaceRightMessageAlreadySent = NO;
            self.enemyHidgonRunningVisibleMessageAlreadySent = NO;
            self.enemyHidgonStandingStillVisibleMessageAlreadySent = NO;
            
            
            self.shootingFireBall = NO;
            self.enemyHidgonWalkingRight = NO;
            self.enemyHidgonWalkingLeft = NO;
            self.enemyHidgonFalling = YES;
            
            enemyHidgonResponseTime = 2.0;
            
            self.stunTimeValue = 0;
            self.friendlyTimeValue = 0;
            
            stunTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.stunTimeValue] fntFile:@"PixelArtFont.fnt"];
            [stunTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            stunTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            stunTimerLabel.scale = 0.9;
            stunTimerLabel.visible = NO;
            [self addChild:stunTimerLabel z: 5];
            
            friendlyTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.friendlyTimeValue] fntFile:@"PixelArtFont.fnt"];
            [friendlyTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            friendlyTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            friendlyTimerLabel.scale = 0.9;
            friendlyTimerLabel.visible = NO;
            friendlyTimerLabel.color = ccGREEN;
            [self addChild:friendlyTimerLabel z: 5];
            
            [enemyHidgonSpritesArray addObject: self];
            [enemySpritesArray addObject: self];
            

            //If Hidgon is a boss
            if (helloWorldIsBoss == YES) {
                
                isBoss = YES;
                gunnerStandingStill.scale = 0.7;
                gunnerStunned.scale = 0.7;
                gunnerWalking.scale = 0.7;
            }
            
            else if (helloWorldIsBoss == NO) {
                
                isBoss = NO;
                gunnerStandingStill.scale = 0.5;
                gunnerStunned.scale = 0.5;
                gunnerWalking.scale = 0.5;
            }
            
            if (helloWorldHitPoints > 0) {
                
                self.hitPointsLeft = 3;
            }
            
            //Reset helloWorldIsBoss and helloWorldHitPoints
            helloWorldIsBoss = NO;
            helloWorldHitPoints = 0;
            
            if (isBoss) {
                
                bossAlreadyPunched = NO;
            }

            [self scheduleUpdate];
            
            enemyReferenceNumber = enemyReferenceNumberGlobal;
                        
            hidgonMovementsArray = [[NSMutableArray alloc] init];
            
          //  [self hidgonInitialArrayPopulation];
            
            enemyHidgonWalkRightAction = [[self runAction: [CCMoveBy actionWithDuration:9 position:ccp(1000, 0)]] retain];
            enemyHidgonWalkLeftAction = [[self runAction: [CCMoveBy actionWithDuration:9 position:ccp(-1000, 0)]] retain];
            
            enemyHidgonFallAction = [[self runAction: [CCMoveBy actionWithDuration:9 position:ccp(0, -1000)]] retain];
            
            [self stopAllActions];
                        
            enemyHidgonAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(enemyHidgonAdjustMovement)], [CCDelayTime actionWithDuration:enemyHidgonResponseTime], nil]]];
            
            enemyHidgonAdjustMovementActionIsRunning = YES;
        }
        
        if (globalEnemyType == PARKOUR_JUMPER_TYPE) {
            
            self.enemyType = PARKOUR_JUMPER_TYPE;
            
            theGame = _game;
            /*
            mySprite = [CCSprite spriteWithFile:@"PlatformJumper.png"];
            self.scale = 0.9;
            mySprite.position = ccp(mySprite.position.x, mySprite.position.y + 2);
            [self addChild:mySprite];
            */
            
            //pass in the name of the property list
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"Ninja.plist"];
            
            //create the sprite sheet
            CCSpriteBatchNode *spriteSheetNinjaRunning = [CCSpriteBatchNode batchNodeWithFile: @"Ninja.png"];
            [self addChild: spriteSheetNinjaRunning z: 150];
            
            //Create array of cairostance frames
            NSMutableArray *ninjaRunningAnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 5; ++i) {
                [ninjaRunningAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Ninja%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *ninjaRunningAnim = [CCAnimation animationWithFrames:ninjaRunningAnimFrames delay:0.08f];
            
            //Create sprite and run the animation
            ninjaRunning = [CCSprite spriteWithSpriteFrameName:@"Ninja1.png"];
            ninjaRunning.anchorPoint = ccp(0.5, 0.45);
            ninjaRunning.scale = 0.85;
            CCAction *ninjaRunningAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: ninjaRunningAnim restoreOriginalFrame:NO]];
            [ninjaRunning runAction: ninjaRunningAction];
            ninjaRunning.visible = NO;

            
            //Create array of cairostance frames
            NSMutableArray *ninjaStunnedAnimFrames = [NSMutableArray array];
            for(int i = 7; i <= 9; ++i) {
                [ninjaStunnedAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Ninja%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *ninjaStunnedAnim = [CCAnimation animationWithFrames:ninjaStunnedAnimFrames delay:0.16f];
            
            //Create sprite and run the animation
            ninjaStunned = [CCSprite spriteWithSpriteFrameName:@"Ninja7.png"];
            ninjaStunned.anchorPoint = ccp(0.5, 0.45);
            ninjaStunned.scale = 0.85;
            CCAction *ninjaStunnedAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: ninjaStunnedAnim restoreOriginalFrame:NO]];
            [ninjaStunned runAction: ninjaStunnedAction];
            ninjaStunned.visible = NO;


            ninjaJumping = [CCSprite spriteWithSpriteFrameName:@"Ninja6.png"];
            ninjaJumping.anchorPoint = ccp(0.5, 0.45);
            ninjaJumping.scale = 0.85;
            [self addChild: ninjaJumping];
            
            
            ninjaStandingStill = [CCSprite spriteWithSpriteFrameName:@"Ninja5.png"];
            ninjaStandingStill.anchorPoint = ccp(0.5, 0.45);
            ninjaStandingStill.scale = 0.85;
            [self addChild: ninjaStandingStill];
            
            [spriteSheetNinjaRunning addChild: ninjaRunning z: 150];
            [spriteSheetNinjaRunning addChild: ninjaStunned z: 150];

            
            //If Hidgon is a boss
            if (helloWorldIsBoss == YES) {
                
                isBoss = YES;
                ninjaRunning.scale = 1.4;
                ninjaJumping.scale = 1.4;
                ninjaStunned.scale = 1.4;
                ninjaStandingStill.scale = 1.4;
            }
            
            if (helloWorldHitPoints > 0) {
                
                self.hitPointsLeft = 3;
            }
            
            //Reset helloWorldIsBoss and helloWorldHitPoints
            helloWorldIsBoss = NO;
            helloWorldHitPoints = 0;
            
            if (isBoss) {
                
                bossAlreadyPunched = NO;
            }
            
            [theGame addChild:self];
            
            
            self.parkourJumperWalkingRight = NO;
            self.parkourJumperWalkingLeft = NO;
            self.parkourJumperFalling = YES;
            
            parkourJumperResponseTime = 0.5;
            
            self.stunTimeValue = 0;
            self.friendlyTimeValue = 0;
            
            stunTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.stunTimeValue] fntFile:@"PixelArtFont.fnt"];
            [stunTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            stunTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            stunTimerLabel.scale = 0.9;
            stunTimerLabel.visible = NO;
            [self addChild:stunTimerLabel z: 5];
            
            friendlyTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.friendlyTimeValue] fntFile:@"PixelArtFont.fnt"];
            [friendlyTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            friendlyTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            friendlyTimerLabel.scale = 0.9;
            friendlyTimerLabel.visible = NO;
            friendlyTimerLabel.color = ccGREEN;
            [self addChild:friendlyTimerLabel z: 5];
            
            parkourJumperDistanceToLedgeOnLeftSide = 0;
            parkourJumperDistanceToLedgeOnRightSide = 0;
            
            [enemySpritesArray addObject: self];
            [parkourJumperEnemySpritesArray addObject: self];
            
            [self scheduleUpdate];
            
            enemyReferenceNumber = enemyReferenceNumberGlobal;

            parkourJumperMovementsArray = [[NSMutableArray alloc] init];
            
            //  [self hidgonInitialArrayPopulation];
            
            parkourJumperWalkRightAction = [[self runAction: [CCMoveBy actionWithDuration:9 position:ccp(1000, 0)]] retain];
            parkourJumperWalkLeftAction = [[self runAction: [CCMoveBy actionWithDuration:9 position:ccp(-1000, 0)]] retain];

            parkourJumperFallAction = [[self runAction: [CCMoveBy actionWithDuration:9 position:ccp(0, -1000)]] retain];
            
            [self stopAllActions];
            
            parkourJumperAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(parkourJumperAdjustMovement)], [CCDelayTime actionWithDuration:parkourJumperResponseTime], nil]]];
        }
        
        else if (globalEnemyType == DIAGONAL_FLYER_TYPE) {
            
            self.enemyType = DIAGONAL_FLYER_TYPE;
            
            theGame = _game;
            
            //pass in the name of the property list
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"DiagonalFlyerStunned.plist"];
            
            //create the sprite sheet
            CCSpriteBatchNode *spriteSheetDiagonalFlyerStunned= [CCSpriteBatchNode batchNodeWithFile: @"DiagonalFlyerStunned.png"];
            [self addChild: spriteSheetDiagonalFlyerStunned z: 150];
            
            //Create array of cairostance frames
            NSMutableArray *diagonalFlyerStunnedAnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 2; ++i) {
                [diagonalFlyerStunnedAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"DiagonalFlyerStunned%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *diagonalFlyerStunnedAnim = [CCAnimation animationWithFrames:diagonalFlyerStunnedAnimFrames delay:0.4f];
            
            //Create sprite and run the animation
            diagonalFlyerStunned = [CCSprite spriteWithSpriteFrameName:@"DiagonalFlyerStunned1.png"];
            diagonalFlyerStunned.anchorPoint = ccp(0.5, 0.4);
            CCAction *diagonalFlyerStunnedAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: diagonalFlyerStunnedAnim restoreOriginalFrame:NO]];
            [diagonalFlyerStunned runAction: diagonalFlyerStunnedAction];
            diagonalFlyerStunned.visible = NO;

            [spriteSheetDiagonalFlyerStunned addChild: diagonalFlyerStunned z: 150];

            
            flyingDownLeft = [CCSprite spriteWithFile:@"DiagonalFlyerDownLeft.png"];
            self.scale = 0.9;
            [self addChild:flyingDownLeft];
            
            flyingUpLeft = [CCSprite spriteWithFile:@"DiagonalFlyerUpLeft.png"];
            self.scale = 0.9;
            [self addChild:flyingUpLeft];
            
            flyingDownRight = [CCSprite spriteWithFile:@"DiagonalFlyerDownRight.png"];
            self.scale = 0.9;
            [self addChild:flyingDownRight];
            
            flyingUpRight = [CCSprite spriteWithFile:@"DiagonalFlyerUpRight.png"];
            self.scale = 0.9;
            [self addChild:flyingUpRight];
            
            [theGame addChild:self];

            
            [self scheduleUpdate];
            
            
            stunTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.stunTimeValue] fntFile:@"PixelArtFont.fnt"];
            [stunTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            stunTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            stunTimerLabel.scale = 0.9;
            stunTimerLabel.visible = NO;
            [self addChild:stunTimerLabel z: 5];
            
            friendlyTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.friendlyTimeValue] fntFile:@"PixelArtFont.fnt"];
            [friendlyTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            friendlyTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            friendlyTimerLabel.scale = 0.9;
            friendlyTimerLabel.visible = NO;
            friendlyTimerLabel.color = ccGREEN;
            [self addChild:friendlyTimerLabel z: 5];
            
            [enemySpritesArray addObject: self];
            [enemyDiagonalFlyerEnemySpritesArray addObject: self];
            
            enemyDiagonalFlyerEnemyResponseTime = 1.0;
            enemyDiagonalFlyerMovingDown = YES;
            enemyDiagonalFlyerMovingLeft = YES;
            enemyDiagonalFlyerMovingUp = NO;
            enemyDiagonalFlyerMovingRight = NO;
        }
        
        
        
        else if (globalEnemyType == FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE) {
            
            self.enemyType = FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE;
            
            theGame = _game;
            /*
            mySprite = [CCSprite spriteWithFile:@"FlyThroughWallsDiagonalFlyer.png"];
            self.scale = 0.9;
            [self addChild:mySprite];
             */
            
            /*FlyThroughWalls Flying Up-Left*/
            //pass in the name of the property list
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"FlyThroughWallsDiagonalFlyer.plist"];
            
            //create the sprite sheet
            CCSpriteBatchNode *spriteSheetFlyThroughWallsDiagonalFlyer = [CCSpriteBatchNode batchNodeWithFile: @"FlyThroughWallsDiagonalFlyer.png"];
            [self addChild: spriteSheetFlyThroughWallsDiagonalFlyer z: 150];
            
            //Create array of cairostance frames
            NSMutableArray *flyThroughWallsDiagonalFlyerFlyingUpLeftAnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 2; ++i) {
                [flyThroughWallsDiagonalFlyerFlyingUpLeftAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"FlyThroughWallsRobot%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *flyThroughWallsDiagonalFlyerFlyingUpLeftAnim = [CCAnimation animationWithFrames:flyThroughWallsDiagonalFlyerFlyingUpLeftAnimFrames delay:0.08f];
            
            //Create sprite and run the animation
            flyingUpLeft = [CCSprite spriteWithSpriteFrameName:@"FlyThroughWallsRobot1.png"];
            flyingUpLeft.anchorPoint = ccp(0.5, 0.35);
            CCAction *flyThroughWallsDiagonalFlyerFlyingUpLeftAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: flyThroughWallsDiagonalFlyerFlyingUpLeftAnim restoreOriginalFrame:NO]];
            [flyingUpLeft runAction: flyThroughWallsDiagonalFlyerFlyingUpLeftAction];
            
            [spriteSheetFlyThroughWallsDiagonalFlyer addChild: flyingUpLeft z: 150];

            
            /*FlyThroughWalls Flying Up-Left*/
            //Create array of cairostance frames
            NSMutableArray *flyThroughWallsDiagonalFlyerFlyingUpRightAnimFrames = [NSMutableArray array];
            for(int i = 3; i <= 4; ++i) {
                [flyThroughWallsDiagonalFlyerFlyingUpRightAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"FlyThroughWallsRobot%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *flyThroughWallsDiagonalFlyerFlyingUpRightAnim = [CCAnimation animationWithFrames:flyThroughWallsDiagonalFlyerFlyingUpRightAnimFrames delay:0.08f];
            
            //Create sprite and run the animation
            flyingUpRight = [CCSprite spriteWithSpriteFrameName:@"FlyThroughWallsRobot3.png"];
            flyingUpRight.anchorPoint = ccp(0.5, 0.35);
            CCAction *flyThroughWallsDiagonalFlyerFlyingUpRightAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: flyThroughWallsDiagonalFlyerFlyingUpRightAnim restoreOriginalFrame:NO]];
            [flyingUpRight runAction: flyThroughWallsDiagonalFlyerFlyingUpRightAction];
        
            [spriteSheetFlyThroughWallsDiagonalFlyer addChild: flyingUpRight z: 150];
            
            
            /*FlyThroughWalls Flying Down-Right*/
            //Create array of cairostance frames
            NSMutableArray *flyThroughWallsDiagonalFlyerFlyingDownRightAnimFrames = [NSMutableArray array];
            for(int i = 5; i <= 6; ++i) {
                [flyThroughWallsDiagonalFlyerFlyingDownRightAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"FlyThroughWallsRobot%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *flyThroughWallsDiagonalFlyerFlyingDownRightAnim = [CCAnimation animationWithFrames:flyThroughWallsDiagonalFlyerFlyingDownRightAnimFrames delay:0.08f];
            
            //Create sprite and run the animation
            flyingDownRight = [CCSprite spriteWithSpriteFrameName:@"FlyThroughWallsRobot5.png"];
            flyingDownRight.anchorPoint = ccp(0.5, 0.35);
            CCAction *flyThroughWallsDiagonalFlyerFlyingDownRightAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: flyThroughWallsDiagonalFlyerFlyingDownRightAnim restoreOriginalFrame:NO]];
            [flyingDownRight runAction: flyThroughWallsDiagonalFlyerFlyingDownRightAction];
            
            [spriteSheetFlyThroughWallsDiagonalFlyer addChild: flyingDownRight z: 150];
            
            
            /*FlyThroughWalls Flying Down-Left*/
            //Create array of cairostance frames
            NSMutableArray *flyThroughWallsDiagonalFlyerFlyingDownLeftAnimFrames = [NSMutableArray array];
            for(int i = 7; i <= 8; ++i) {
                [flyThroughWallsDiagonalFlyerFlyingDownLeftAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"FlyThroughWallsRobot%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *flyThroughWallsDiagonalFlyerFlyingDownLeftAnim = [CCAnimation animationWithFrames:flyThroughWallsDiagonalFlyerFlyingDownLeftAnimFrames delay:0.08f];
            
            //Create sprite and run the animation
            flyingDownLeft = [CCSprite spriteWithSpriteFrameName:@"FlyThroughWallsRobot7.png"];
            flyingDownLeft.anchorPoint = ccp(0.5, 0.35);
            CCAction *flyThroughWallsDiagonalFlyerFlyingDownLeftAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: flyThroughWallsDiagonalFlyerFlyingDownLeftAnim restoreOriginalFrame:NO]];
            [flyingDownLeft runAction: flyThroughWallsDiagonalFlyerFlyingDownLeftAction];
            
            [spriteSheetFlyThroughWallsDiagonalFlyer addChild: flyingDownLeft z: 150];
            

            //Create array of cairostance frames
            NSMutableArray *flyThroughWallsDiagonalFlyerStunnedAnimFrames = [NSMutableArray array];
            for(int i = 9; i <= 10; ++i) {
                [flyThroughWallsDiagonalFlyerStunnedAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"FlyThroughWallsRobot%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *flyThroughWallsDiagonalFlyerStunnedAnim = [CCAnimation animationWithFrames:flyThroughWallsDiagonalFlyerStunnedAnimFrames delay:0.4f];
            
            //Create sprite and run the animation
            flyThroughWallsDiagonalFlyerStunned = [CCSprite spriteWithSpriteFrameName:@"FlyThroughWallsRobot9.png"];
            flyThroughWallsDiagonalFlyerStunned.anchorPoint = ccp(0.5, 0.4);
            CCAction *flyThroughWallsDiagonalFlyerStunnedAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: flyThroughWallsDiagonalFlyerStunnedAnim restoreOriginalFrame:NO]];
            [flyThroughWallsDiagonalFlyerStunned runAction: flyThroughWallsDiagonalFlyerStunnedAction];
            flyThroughWallsDiagonalFlyerStunned.visible = NO;
            
            [spriteSheetFlyThroughWallsDiagonalFlyer addChild: flyThroughWallsDiagonalFlyerStunned z: 150];
            
            
            [theGame addChild:self];

            
            

            //Pull from the Tileset's properties and set initial Chaser's properties
            if (helloWorldIsBoss == YES) {
                
                isBoss = YES;
                flyingDownLeft.scale = 2.0;
                flyingUpLeft.scale = 2.0;
                flyingUpRight.scale = 2.0;
                flyingDownRight.scale = 2.0;
            }
            
            if (helloWorldHitPoints > 0) {
                
                self.hitPointsLeft = 3;
            }
            
            //Reset helloWorldIsBoss and helloWorldHitPoints
            helloWorldIsBoss = NO;
            helloWorldHitPoints = 0;
            
            if (isBoss) {
                
                bossAlreadyPunched = NO;
            }

            [self scheduleUpdate];
            
            
            stunTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.stunTimeValue] fntFile:@"PixelArtFont.fnt"];
            [stunTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            stunTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            stunTimerLabel.scale = 0.9;
            stunTimerLabel.visible = NO;
            [self addChild:stunTimerLabel z: 5];
            
            friendlyTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.friendlyTimeValue] fntFile:@"PixelArtFont.fnt"];
            [friendlyTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            friendlyTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            friendlyTimerLabel.scale = 0.9;
            friendlyTimerLabel.visible = NO;
            friendlyTimerLabel.color = ccGREEN;
            [self addChild:friendlyTimerLabel z: 5];
            
            [enemySpritesArray addObject: self];
            [flyThroughWallsDiagonalFlyerEnemySpritesArray addObject: self];
            
            flyThroughWallsDiagonalFlyerEnemyResponseTime = 1.0;
            
            int randomNumber1 = arc4random()%4;
            
            if (randomNumber1 == 0) {
                
                //Down, Right
                flyThroughWallsDiagonalFlyerMovingDown = YES;
                flyThroughWallsDiagonalFlyerMovingRight = YES;
            }
            
            else if (randomNumber1 == 1) {
                
                //Down, Left
                flyThroughWallsDiagonalFlyerMovingDown = YES;
                flyThroughWallsDiagonalFlyerMovingLeft = YES;
            }
                        
            else if (randomNumber1== 2) {
                
                //Up, Left
                flyThroughWallsDiagonalFlyerMovingUp = YES;
                flyThroughWallsDiagonalFlyerMovingLeft = YES;
            }
            
            else if (randomNumber1 == 3) {
                
                //Up, Right
                flyThroughWallsDiagonalFlyerMovingUp = YES;
                flyThroughWallsDiagonalFlyerMovingRight = YES;
            }
        }
        
        
        else if (globalEnemyType == SKELETON_WHALE_TYPE) {
            
            self.enemyType = SKELETON_WHALE_TYPE;
            
            theGame = _game;
            /*
            mySprite = [CCSprite spriteWithFile:@"SkeletonWhale.png"];
            self.scale = 0.9;
            [self addChild:mySprite];
            
            [theGame addChild:self];
             */
            
            /*Jetman Flying Animation*/
            //pass in the name of the property list
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"Jetman.plist"];
            
            //create the sprite sheet
            CCSpriteBatchNode *spriteSheetJetman = [CCSpriteBatchNode batchNodeWithFile: @"Jetman.png"];
            [self addChild: spriteSheetJetman z: 150];
            
            //Create array of cairostance frames
            NSMutableArray *jetmanFlyingAnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 3; ++i) {
                [jetmanFlyingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Jetman%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *jetmanFlyingAnim = [CCAnimation animationWithFrames:jetmanFlyingAnimFrames delay:0.08f];
            
            //Create sprite and run the animation
            jetmanFlying = [CCSprite spriteWithSpriteFrameName:@"Jetman1.png"];
            jetmanFlying.anchorPoint = ccp(0.5, 0.35);
            CCAction *jetmanFlyingAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: jetmanFlyingAnim restoreOriginalFrame:NO]];
            [jetmanFlying runAction: jetmanFlyingAction];
            jetmanFlying.scale = 0.9;
            

            //Create array of gunnerStunned frames
            NSMutableArray *jetmanStunnedAnimFrames = [NSMutableArray array];
            for(int i = 4; i <= 6; ++i) {
                [jetmanStunnedAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Jetman%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *jetmanStunnedAnim = [CCAnimation animationWithFrames:jetmanStunnedAnimFrames delay:0.16f];
            
            //Create sprite and run the animation
            jetmanStunned = [CCSprite spriteWithSpriteFrameName:@"Jetman4.png"];
            jetmanStunned.anchorPoint = ccp(0.5, 0.4);
            CCAction *jetmanStunnedAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: jetmanStunnedAnim restoreOriginalFrame:NO]];
            [jetmanStunned runAction: jetmanStunnedAction];
            jetmanStunned.visible = NO;

            [spriteSheetJetman addChild: jetmanFlying z: 150];
            [spriteSheetJetman addChild: jetmanStunned z: 150];

            
            [self.jetmanFlying runAction: [CCRepeatForever actionWithAction:[CCSequence actions: [CCMoveBy actionWithDuration:0.3 position:ccp(0, 3)],[CCMoveBy actionWithDuration:0.3 position:ccp(0, -3)], nil]]];
            [self.jetmanStunned runAction: [CCRepeatForever actionWithAction:[CCSequence actions: [CCMoveBy actionWithDuration:0.3 position:ccp(0, 3)],[CCMoveBy actionWithDuration:0.3 position:ccp(0, -3)], nil]]];

            
            [theGame addChild:self];
            
            [enemySpritesArray addObject: self];
            [enemySkeletonWhaleSpritesArray addObject: self];
            
            stunTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.stunTimeValue] fntFile:@"PixelArtFont.fnt"];
            [stunTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            stunTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            stunTimerLabel.scale = 0.9;
            stunTimerLabel.visible = NO;
            [self addChild:stunTimerLabel z: 5];
            
            friendlyTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.friendlyTimeValue] fntFile:@"PixelArtFont.fnt"];
            [friendlyTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            friendlyTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            friendlyTimerLabel.scale = 0.9;
            friendlyTimerLabel.visible = NO;
            friendlyTimerLabel.color = ccGREEN;
            [self addChild:friendlyTimerLabel z: 5];
            
            //enemySkeletonWhaleMovingHorizontally should be set randomly
            int randomNumber = arc4random()%2;
            
            if (!isSinglePlayer) {
                
                enemySkeletonWhaleMovingHorizontally = NO;
            }
            
            else if (randomNumber == 0) {
                
                enemySkeletonWhaleMovingHorizontally = NO;
            }
            
            else if (randomNumber != 0) {
                
                enemySkeletonWhaleMovingHorizontally = YES;
            }
        
            
            //If Hidgon is a boss
            if (helloWorldIsBoss == YES) {
                
                isBoss = YES;
                jetmanFlying.scale = 1.4;
                jetmanStunned.scale = 1.4;
            }
            
            if (helloWorldHitPoints > 0) {
                
                self.hitPointsLeft = 3;
            }
            
            //Reset helloWorldIsBoss and helloWorldHitPoints
            helloWorldIsBoss = NO;
            helloWorldHitPoints = 0;
            
            if (isBoss) {
                
                bossAlreadyPunched = NO;
            }
            
            [self scheduleUpdate];
            
            self.skeletonWhaleFaceLeftMessageAlreadySent = NO;
            self.skeletonWhaleFaceRightMessageAlreadySent = NO;
            
            enemyReferenceNumber = enemyReferenceNumberGlobal;
            
            enemySkeletonWhaleResponseTime = 1.0;
            
            enemySkeletonWhaleAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(enemySkeletonWhaleAdjustMovement)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],[CCCallFunc actionWithTarget:self selector:@selector(setEnemySkeletonWhaleStopped)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],  nil]]];
        }
        
        if (globalEnemyType == CHASER_ENEMY_TYPE) {
            
            self.enemyType = CHASER_ENEMY_TYPE;
            
            theGame = _game;
           /*
            mySprite = [CCSprite spriteWithFile:@"RunningChaserEnemy.png"];
            self.scale = 0.9;
            mySprite.position = ccp(mySprite.position.x, mySprite.position.y + 2);
            [self addChild:mySprite];
            */
            
            /*Chaser Walking*/
            //pass in the name of the property list
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"Chaser.plist"];
            
            //create the sprite sheet
            CCSpriteBatchNode *spriteSheetChaser = [CCSpriteBatchNode batchNodeWithFile: @"Chaser.png"];
            [self addChild: spriteSheetChaser z: 150];
            
            //Create array of cairostance frames
            NSMutableArray *chaserWalkingAnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [chaserWalkingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Chaser%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *chaserWalkingAnim = [CCAnimation animationWithFrames:chaserWalkingAnimFrames delay:0.19f];
            
            //Create sprite and run the animation
            chaserWalking = [CCSprite spriteWithSpriteFrameName:@"Chaser1.png"];
            chaserWalking.anchorPoint = ccp(0.5, 0.35);
            CCAction *chaserWalkingAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: chaserWalkingAnim restoreOriginalFrame:NO]];
            [chaserWalking runAction: chaserWalkingAction];
            
            [spriteSheetChaser addChild: chaserWalking z: 150];

            
            
            //Create array of cairostance frames
            NSMutableArray *chaserRunningAnimFrames = [NSMutableArray array];
            for(int i = 5; i <= 8; ++i) {
                [chaserRunningAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Chaser%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *chaserRunningAnim = [CCAnimation animationWithFrames:chaserRunningAnimFrames delay:0.08f];
            
            //Create sprite and run the animation
            chaserRunning = [CCSprite spriteWithSpriteFrameName:@"Chaser5.png"];
            chaserRunning.anchorPoint = ccp(0.5, 0.35);
            CCAction *chaserRunningAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: chaserRunningAnim restoreOriginalFrame:NO]];
            [chaserRunning runAction: chaserRunningAction];
            
            [spriteSheetChaser addChild: chaserRunning z: 150];
            
            
            
            
            
            //Create array of cairostance frames
            NSMutableArray *chaserStunnedAnimFrames = [NSMutableArray array];
            for(int i = 9; i <= 11; ++i) {
                [chaserStunnedAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Chaser%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *chaserStunnedAnim = [CCAnimation animationWithFrames:chaserStunnedAnimFrames delay:0.16f];
            
            //Create sprite and run the animation
            chaserStunned = [CCSprite spriteWithSpriteFrameName:@"Chaser9.png"];
            chaserStunned.anchorPoint = ccp(0.5, 0.35);
            CCAction *chaserStunnedAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: chaserStunnedAnim restoreOriginalFrame:NO]];
            [chaserStunned runAction: chaserStunnedAction];
            
            [spriteSheetChaser addChild: chaserStunned z: 150];
            
            
            chaserStandingStillBored = [CCSprite spriteWithSpriteFrameName:@"Chaser1.png"];
            chaserStandingStillBored.anchorPoint = ccp(0.5, 0.35);
            [self addChild: chaserStandingStillBored];
            
            chaserStandingStillAngry = [CCSprite spriteWithSpriteFrameName:@"Chaser1.png"];
            chaserStandingStillAngry.anchorPoint = ccp(0.5, 0.35);
            [self addChild: chaserStandingStillAngry];
            
            chaserStandingStillAngry.visible = NO;
            chaserStandingStillBored.visible = NO;
            chaserStunned.visible = NO;
            chaserRunning.visible = NO;
            chaserWalking.visible = YES;
            
            
            [theGame addChild:self];
            
            
            stunTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.stunTimeValue] fntFile:@"PixelArtFont.fnt"];
            [stunTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            stunTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            stunTimerLabel.scale = 0.9;
            stunTimerLabel.visible = NO;
            [self addChild:stunTimerLabel z: 5];
            
            friendlyTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.friendlyTimeValue] fntFile:@"PixelArtFont.fnt"];
            [friendlyTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            friendlyTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            friendlyTimerLabel.scale = 0.9;
            friendlyTimerLabel.visible = NO;
            friendlyTimerLabel.color = ccGREEN;
            [self addChild:friendlyTimerLabel z: 5];
            
            [enemySpritesArray addObject: self];
            [runningChaserEnemySpritesArray addObject: self];

            runningChaserIsChasingPlayer = NO;
            
            //Pull from the Tileset's properties and set initial Chaser's properties
            if (helloWorldIsBoss == YES) {
            
                isBoss = YES;
                chaserRunning.scale = 1.4;
                chaserWalking.scale = 1.4;
                chaserStunned.scale = 1.4;
                chaserStandingStillBored.scale = 1.4;
                chaserStandingStillAngry.scale = 1.4;
            }
            
            if (helloWorldHitPoints > 0) {
                
                self.hitPointsLeft = 3;
            }
            
            if (helloWorldChaserWalkingLeft) {
                
                helloWorldChaserWalkingRight = NO;
                helloWorldChaserWalkingLeft = YES;
            }
            
            else if (helloWorldChaserWalkingRight) {
                
                helloWorldChaserWalkingRight = YES;
                helloWorldChaserWalkingLeft = NO;
            }
            
            //Reset helloWorldIsBoss and helloWorldHitPoints
            helloWorldIsBoss = NO;
            helloWorldHitPoints = 0;
            helloWorldChaserWalkingRight = NO;
            helloWorldChaserWalkingLeft = NO;
            
            if (isBoss) {
                
                bossAlreadyPunched = NO;
            }
            
            runningChaserEnemyWalkingRight = YES;
            
            [self scheduleUpdate];            
        }
        
        if (globalEnemyType == DOWNWARD_SHOOTER_TYPE) {
            
            self.enemyType = DOWNWARD_SHOOTER_TYPE;
            
            theGame = _game;
            /*
            mySprite = [CCSprite spriteWithFile:@"DownwardShooter.png"];
            self.scale = 0.9;
            mySprite.position = ccp(mySprite.position.x, mySprite.position.y + 2);
            [self addChild:mySprite];
            
            [theGame addChild:self];
             */
            
            /*Saucer Flying Animation*/
            //pass in the name of the property list
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"Saucer.plist"];
            
            //create the sprite sheet
            CCSpriteBatchNode *spriteSheetSaucer = [CCSpriteBatchNode batchNodeWithFile: @"Saucer.png"];
            [self addChild: spriteSheetSaucer z: 150];
            
            //Create array of cairostance frames
            NSMutableArray *saucerFlyingAnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 2; ++i) {
                [saucerFlyingAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Saucer%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *saucerFlyingAnim = [CCAnimation animationWithFrames:saucerFlyingAnimFrames delay:0.08f];
            
            //Create sprite and run the animation
            saucerFlying = [CCSprite spriteWithSpriteFrameName:@"Saucer1.png"];
            saucerFlying.anchorPoint = ccp(0.5, 0.35);
            CCAction *saucerFlyingAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: saucerFlyingAnim restoreOriginalFrame:NO]];
            [saucerFlying runAction: saucerFlyingAction];
            saucerFlying.scale = 0.9;
            
            [spriteSheetSaucer addChild: saucerFlying z: 150];
            
            
            
            
            
            //Create array of saucer stunned frames
            NSMutableArray *saucerStunnedAnimFrames = [NSMutableArray array];
            for(int i = 3; i <= 5; ++i) {
                [saucerStunnedAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Saucer%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *saucerStunnedAnim = [CCAnimation animationWithFrames:saucerStunnedAnimFrames delay:0.16f];
            
            //Create sprite and run the animation
            saucerStunned = [CCSprite spriteWithSpriteFrameName:@"Saucer1.png"];
            saucerStunned.anchorPoint = ccp(0.5, 0.35);
            CCAction *saucerStunnedAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: saucerStunnedAnim restoreOriginalFrame:NO]];
            [saucerStunned runAction: saucerStunnedAction];
            saucerStunned.scale = 0.9;
            saucerStunned.visible = NO;

            [spriteSheetSaucer addChild: saucerStunned z: 150];

            
            
            [theGame addChild: self];

            //Make saucerFlying animation bob up and down slightly
            [self.saucerFlying runAction: [CCRepeatForever actionWithAction:[CCSequence actions: [CCMoveBy actionWithDuration:0.5 position:ccp(0, 1.5)],[CCMoveBy actionWithDuration:0.5 position:ccp(0, -1.5)], nil]]];
            
            stunTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.stunTimeValue] fntFile:@"PixelArtFont.fnt"];
            [stunTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            stunTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            stunTimerLabel.scale = 0.9;
            stunTimerLabel.visible = NO;
            [self addChild:stunTimerLabel z: 5];
            
            friendlyTimerLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%i", self.friendlyTimeValue] fntFile:@"PixelArtFont.fnt"];
            [friendlyTimerLabel setAnchorPoint:ccp(0.5, 0.5)];
            friendlyTimerLabel.position = ccp(self.position.x + 0, self.position.y + 25);
            friendlyTimerLabel.scale = 0.9;
            friendlyTimerLabel.visible = NO;
            friendlyTimerLabel.color = ccGREEN;
            [self addChild:friendlyTimerLabel z: 5];
            
            [enemySpritesArray addObject: self];
            [downwardShooterEnemySpritesArray addObject: self];

            [self scheduleUpdate];
            
            [self adjustDownwardShooterResponseTimeMethod];
        }
    }
    
    self.isCurrentlyTeleportingIn = NO;
    self.enemyKnockedOutOfTheArena = NO;
    
    if (isBossLevel) {
        
        self.isCurrentlyTeleportingIn = YES;
        
        //Make all sprite children black and then fade to white over the course of however long it takes for the whiteSphere to fade out 
        if (self.enemyType == PARKOUR_JUMPER_TYPE) {
            
            ninjaJumping.color = ccBLACK;
            ninjaRunning.color = ccBLACK;
            ninjaStandingStill.color = ccBLACK;
            ninjaStunned.color = ccBLACK;
            
            //Fade sprites to white over the course of the amount of time it takes for the sphere to fade out
            [ninjaJumping runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [ninjaRunning runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [ninjaStandingStill runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [ninjaStunned runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            
            if (self.isBoss) {
                
                //White teleportation sphere animation for enemy teleportation
                whiteTeleportationSphere = [CCSprite spriteWithFile: @"WhiteCircle.png"];
                whiteTeleportationSphere.position = ccp(self.position.x, self.position.y);
                [self addChild: whiteTeleportationSphere z: -10];
                [whiteTeleportationSphere runAction: [CCFadeOut actionWithDuration:0.0]];
                
                //Scale to tiny dot, grow over 1 second, FadeOut over 1 second, remove and clean up.
                [whiteTeleportationSphere runAction: [CCSequence actions: [CCMoveTo actionWithDuration:0.0 position:ccp(self.position.x, self.position.y)], [CCFadeIn actionWithDuration:0.0], [CCScaleTo actionWithDuration:0.0 scale:0.01], [CCScaleTo actionWithDuration:1.5 scale:1.3], [CCDelayTime actionWithDuration:1.0], [CCFadeOut actionWithDuration:2.0], [CCCallFuncND actionWithTarget:whiteTeleportationSphere selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
            }
        }
        
        if (self.enemyType == HIDGON_ENEMY_TYPE) {
            
            gunnerWalking.color = ccBLACK;
            gunnerStandingStill.color = ccBLACK;
            gunnerStunned.color = ccBLACK;
            
            [gunnerWalking runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [gunnerStandingStill runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [gunnerStunned runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            
            if (self.isBoss) {
                
                //White teleportation sphere animation for enemy teleportation
                whiteTeleportationSphere = [CCSprite spriteWithFile: @"WhiteCircle.png"];
                whiteTeleportationSphere.position = ccp(self.position.x, self.position.y);
                [self addChild: whiteTeleportationSphere z: -10];
                [whiteTeleportationSphere runAction: [CCFadeOut actionWithDuration:0.0]];
                
                //Scale to tiny dot, grow over 1 second, FadeOut over 1 second, remove and clean up.
                [whiteTeleportationSphere runAction: [CCSequence actions: [CCMoveTo actionWithDuration:0.0 position:ccp(self.position.x, self.position.y)], [CCFadeIn actionWithDuration:0.0], [CCScaleTo actionWithDuration:0.0 scale:0.01], [CCScaleTo actionWithDuration:1.5 scale:1.3], [CCDelayTime actionWithDuration:1.0], [CCFadeOut actionWithDuration:2.0], [CCCallFuncND actionWithTarget:whiteTeleportationSphere selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
            }
        }
        
        if (self.enemyType == SKELETON_WHALE_TYPE) {
            
            jetmanFlying.color = ccBLACK;
            jetmanStunned.color = ccBLACK;
            
            [jetmanFlying runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [jetmanStunned runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            
            if (self.isBoss) {
                
                //White teleportation sphere animation for enemy teleportation
                whiteTeleportationSphere = [CCSprite spriteWithFile: @"WhiteCircle.png"];
                whiteTeleportationSphere.position = ccp(self.position.x, self.position.y);
                [self addChild: whiteTeleportationSphere z: -10];
                [whiteTeleportationSphere runAction: [CCFadeOut actionWithDuration:0.0]];
                
                //Scale to tiny dot, grow over 1 second, FadeOut over 1 second, remove and clean up.
                [whiteTeleportationSphere runAction: [CCSequence actions: [CCMoveTo actionWithDuration:0.0 position:ccp(self.position.x, self.position.y)], [CCFadeIn actionWithDuration:0.0], [CCScaleTo actionWithDuration:0.0 scale:0.01], [CCScaleTo actionWithDuration:1.5 scale:1.3], [CCDelayTime actionWithDuration:1.0], [CCFadeOut actionWithDuration:2.0], [CCCallFuncND actionWithTarget:whiteTeleportationSphere selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
            }
        }
        
        if (self.enemyType == DIAGONAL_FLYER_TYPE) {
            
            flyingDownLeft.color = ccBLACK;
            flyingDownRight.color = ccBLACK;
            flyingUpLeft.color = ccBLACK;
            flyingUpRight.color = ccBLACK;
            
            [flyingDownLeft runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [flyingDownRight runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [flyingUpLeft runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [flyingUpRight runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
        }
        
        if (self.enemyType == FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE) {
            
            flyingDownLeft.color = ccBLACK;
            flyingDownRight.color = ccBLACK;
            flyingUpLeft.color = ccBLACK;
            flyingUpRight.color = ccBLACK;
            
            [flyingDownLeft runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [flyingDownRight runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [flyingUpLeft runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [flyingUpRight runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            
            if (self.isBoss) {
                
                //White teleportation sphere animation for enemy teleportation
                whiteTeleportationSphere = [CCSprite spriteWithFile: @"WhiteCircle.png"];
                whiteTeleportationSphere.position = ccp(self.position.x, self.position.y);
                [self addChild: whiteTeleportationSphere z: -10];
                [whiteTeleportationSphere runAction: [CCFadeOut actionWithDuration:0.0]];
                
                //Scale to tiny dot, grow over 1 second, FadeOut over 1 second, remove and clean up.
                [whiteTeleportationSphere runAction: [CCSequence actions: [CCMoveTo actionWithDuration:0.0 position:ccp(self.position.x, self.position.y)], [CCFadeIn actionWithDuration:0.0], [CCScaleTo actionWithDuration:0.0 scale:0.01], [CCScaleTo actionWithDuration:1.5 scale:2.0], [CCDelayTime actionWithDuration:1.0], [CCFadeOut actionWithDuration:2.0], [CCCallFuncND actionWithTarget:whiteTeleportationSphere selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
            }
        }
        
        if (self.enemyType == CHASER_ENEMY_TYPE) {
            
            chaserWalking.color = ccBLACK;
            chaserRunning.color = ccBLACK;
            chaserStunned.color = ccBLACK;
            chaserStandingStillBored.color = ccBLACK;
            chaserStandingStillAngry.color = ccBLACK;
            
            [chaserWalking runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [chaserRunning runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [chaserStunned runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [chaserStandingStillBored runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [chaserStandingStillAngry runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], [CCCallFunc actionWithTarget:self selector:@selector(setChaserInitialWalkingSpeedAfterTeleportation)], nil]];
            
            if (self.isBoss) {
            
                //White teleportation sphere animation for enemy teleportation
                whiteTeleportationSphere = [CCSprite spriteWithFile: @"WhiteCircle.png"];
                whiteTeleportationSphere.position = ccp(self.position.x, self.position.y);
                [self addChild: whiteTeleportationSphere z: -10];
                [whiteTeleportationSphere runAction: [CCFadeOut actionWithDuration:0.0]];
                
                //Scale to tiny dot, grow over 1 second, FadeOut over 1 second, remove and clean up.
                [whiteTeleportationSphere runAction: [CCSequence actions: [CCMoveTo actionWithDuration:0.0 position:ccp(self.position.x, self.position.y)], [CCFadeIn actionWithDuration:0.0], [CCScaleTo actionWithDuration:0.0 scale:0.01], [CCScaleTo actionWithDuration:1.5 scale:1.3], [CCDelayTime actionWithDuration:1.0], [CCFadeOut actionWithDuration:2.0], [CCCallFuncND actionWithTarget:whiteTeleportationSphere selector:@selector(removeFromParentAndCleanup:) data:(void*)YES], nil]];
            }
        }
        
        if (self.enemyType == DOWNWARD_SHOOTER_TYPE) {
            
            saucerFlying.color = ccBLACK;
            saucerStunned.color = ccBLACK;
            
            [saucerFlying runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
            [saucerStunned runAction: [CCSequence actions: [CCDelayTime actionWithDuration:2.5], [CCTintTo actionWithDuration:2 red:255 green:255 blue:255], [CCCallFunc actionWithTarget:self selector:@selector(setIsCurrentlYTeleportingInToNo)], nil]];
        }
    }
    
    //Run method which decreases the timer every second
    decreaseStunTimerAction = [[self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(decreaseStunTimer)], [CCDelayTime actionWithDuration:1.0], nil]]] retain];
    [self stopAction: decreaseStunTimerAction];
    decreaseStunTimerActionAlreadyRunning = NO;
    
    decreaseFriendlyTimerAction = [[self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(decreaseFriendlyTimerValue)], [CCDelayTime actionWithDuration:1.0], nil]]] retain];
    [self stopAction: decreaseFriendlyTimerAction];
    decreaseFriendlyTimerActionAlreadyRunning = NO;
    
    return self;
}

-(void) decreaseStunTimer
{    
    if (self.stunTimeValue > 0 && !isPaused) {
        
        NSLog (@"Decreasing Hidgon's stunTimeValue");
        
        decreaseStunTimerActionAlreadyRunning = YES;
        
        self.stunTimeValue = self.stunTimeValue - 1;
        
        [self.stunTimerLabel setString:[NSString stringWithFormat:@"%i", self.stunTimeValue]];
    }
}

-(void) decreaseFriendlyTimerValue
{
    if (self.friendlyTimeValue > 0 && !isPaused) {
                
        friendlyTimerLabel.visible = YES;
        
        self.friendlyTimeValue = self.friendlyTimeValue - 1;
        
        NSLog (@"self.friendlyTimeValue = %i", self.friendlyTimeValue);
        
        [self.friendlyTimerLabel setString:[NSString stringWithFormat:@"%i", self.friendlyTimeValue]];
    }
}

-(void) makeParkourJumperNotWalkLeftOrRight
{
//    NSLog (@"makeParkourJumperNotWalkLeftOrRight method running");
    
    ninjaRunning.visible = NO;
    ninjaStandingStill.visible = YES;
    ninjaJumping.visible = NO;
    ninjaStunned.visible = NO;
    
    if (parkourJumperWalkingLeft) {
        
        [self stopAction: parkourJumperWalkLeftAction];
    }
    
    if (parkourJumperWalkingRight) {
        
        [self stopAction: parkourJumperWalkRightAction];
    }
    
  /*  if (parkourJumperFalling) {
        
        [self stopAction: parkourJumperFallAction];
    }
   */
    
    ninjaRunning.visible = NO;
    ninjaStandingStill.visible = YES;
    ninjaJumping.visible = NO;
    ninjaStunned.visible = NO;
    
    self.parkourJumperWalkingRight = NO;
    self.parkourJumperWalkingLeft = NO;
//    self.parkourJumperFalling = NO;
}
/*
-(void) makeHidgonWalkRight
{
    if (self.enemyHidgonWalkingRight == NO) {
    
   //     NSLog (@"make hidgon walk right");
        
        gunnerWalking.visible = YES;
        gunnerStandingStill.visible = NO;
        
        if (enemyHidgonWalkingLeft) {
            
            [self stopAction: enemyHidgonWalkLeftAction];
        }
        
        if (enemyHidgonWalkingRight) {
            
            [self stopAction: enemyHidgonWalkRightAction];
        }

        if (enemyHidgonFalling) {
            
            [self stopAction: enemyHidgonFallAction];
        }
        
        self.enemyHidgonWalkingRight = YES;
        self.enemyHidgonWalkingLeft = NO;
        self.enemyHidgonFalling = NO;
        
        gunnerWalking.flipX = NO;
        
        [(HelloWorldLayer*)theGame sendMakeHidgonFaceRight: self.enemyReferenceNumber];
        [self runAction: enemyHidgonWalkRightAction];
    }
}

-(void) makeHidgonWalkLeft
{
    if (self.enemyHidgonWalkingLeft == NO) {
    
     //   NSLog (@"make hidgon walk left");
        
        gunnerWalking.visible = YES;
        gunnerStandingStill.visible = NO;
        
        if (enemyHidgonWalkingLeft) {
            
            [self stopAction: enemyHidgonWalkLeftAction];
        }
        
        if (enemyHidgonWalkingRight) {
            
            [self stopAction: enemyHidgonWalkRightAction];
        }

        if (enemyHidgonFalling) {
            
            [self stopAction: enemyHidgonFallAction];
        }
        
        self.enemyHidgonWalkingRight = NO;
        self.enemyHidgonWalkingLeft = YES;
        self.enemyHidgonFalling = NO;
            
        gunnerWalking.flipX = YES;
        
        [(HelloWorldLayer*)theGame sendMakeHidgonFaceLeft: self.enemyReferenceNumber];
        [self runAction: enemyHidgonWalkLeftAction];
    }
}
*/
-(void) makeParkourJumperLeapLeftBetweenPlatforms {

    if (self.parkourJumperJumpingOverLedgeOnLeftSide == NO && self.parkourJumperJumpingOverLedgeOnRightSide == NO) {
        
        self.parkourJumperWalkingRight = NO;
        self.parkourJumperWalkingLeft = NO;
        self.parkourJumperFalling = NO;
        self.parkourJumperJumpingOverLedgeOnRightSide = NO;
        self.parkourJumperJumpingOverLedgeOnLeftSide = YES;
        
        self.parkourJumperTouchingJumpableLedgeOnLeftSide = NO;
        self.parkourJumperTouchingJumpableLedgeOnRightSide = NO;
        
        ninjaRunning.visible = NO;
        ninjaStandingStill.visible = NO;
        ninjaJumping.visible = YES;
        ninjaStunned.visible = NO;
        
        /*
        if (enemyHidgonWalkingLeft) {
            
            [self stopAction: enemyHidgonWalkLeftAction];
        }
        
        if (enemyHidgonWalkingRight) {
            
            [self stopAction: enemyHidgonWalkRightAction];
        }
        
        if (enemyHidgonFalling) {
            
            [self stopAction: enemyHidgonFallAction];
        }
        */
        int parkourJumperJumpDistanceForThisJump = parkourJumperDistanceToLedgeOnLeftSide;
        
        //If it's the level with the layers of short platforms then make ninja jump a bit higher in that level in order to reach the platform
        if (currentLevel == 57) {
        
            [[self runAction: [CCSequence actions: [CCJumpBy actionWithDuration:0.5 position:ccp(parkourJumperJumpDistanceForThisJump/2, 5 + 44) height:22 jumps:1], [CCCallFunc actionWithTarget:self selector:@selector(setParkourJumperJumpingOverLedgeOnLeftSideToNo)], nil]] retain];
            [self runAction: [CCRotateBy actionWithDuration:0.5 angle:-360]];
        }
        
        else {
            
            [[self runAction: [CCSequence actions: [CCJumpBy actionWithDuration:0.5 position:ccp(parkourJumperJumpDistanceForThisJump, 5 + 22) height:22 jumps:1], [CCCallFunc actionWithTarget:self selector:@selector(setParkourJumperJumpingOverLedgeOnLeftSideToNo)], nil]] retain];
            [self runAction: [CCRotateBy actionWithDuration:0.5 angle:-360]];
        }
    }
}

-(void) makeParkourJumperLeapRightBetweenPlatforms {
    
    if (self.parkourJumperJumpingOverLedgeOnRightSide == NO && self.parkourJumperJumpingOverLedgeOnLeftSide == NO) {
        
        self.parkourJumperWalkingRight = NO;
        self.parkourJumperWalkingLeft = NO;
        self.parkourJumperFalling = NO;
        self.parkourJumperJumpingOverLedgeOnRightSide = YES;
        self.parkourJumperJumpingOverLedgeOnLeftSide = NO;
        
        self.parkourJumperTouchingJumpableLedgeOnLeftSide = NO;
        self.parkourJumperTouchingJumpableLedgeOnRightSide = NO;
        
        ninjaRunning.visible = NO;
        ninjaStandingStill.visible = NO;
        ninjaJumping.visible = YES;
        ninjaStunned.visible = NO;
        
        /*
        if (enemyHidgonWalkingLeft) {
            
            [self stopAction: enemyHidgonWalkLeftAction];
        }
        
        if (enemyHidgonWalkingRight) {
            
            [self stopAction: enemyHidgonWalkRightAction];
        }
        
        if (enemyHidgonFalling) {
            
            [self stopAction: enemyHidgonFallAction];
        }
        */
        int parkourJumperJumpDistanceForThisJump = parkourJumperDistanceToLedgeOnRightSide;
        
        //If it's the level with the layers of short platforms then make ninja jump a bit higher in that level in order to reach the platform
        if (currentLevel == 57) {
        
            [[self runAction: [CCSequence actions: [CCJumpBy actionWithDuration:0.5 position:ccp(parkourJumperJumpDistanceForThisJump/2, 5 + 44) height:22 jumps:1], [CCCallFunc actionWithTarget:self selector:@selector(setParkourJumperJumpingOverLedgeOnRightSideToNo)], nil]] retain];
            [self runAction: [CCRotateBy actionWithDuration:0.5 angle:360]];
        }
        
        else {
            
            [[self runAction: [CCSequence actions: [CCJumpBy actionWithDuration:0.5 position:ccp(parkourJumperJumpDistanceForThisJump, 5 + 22) height:22 jumps:1], [CCCallFunc actionWithTarget:self selector:@selector(setParkourJumperJumpingOverLedgeOnRightSideToNo)], nil]] retain];
            [self runAction: [CCRotateBy actionWithDuration:0.5 angle:360]];
        }
    }
}


-(void) makeHidgonFall
{
    if (self.enemyHidgonTouchingFloor == NO && self.enemyHidgonFalling == NO) {
    
  //      NSLog (@"make Hidgon Fall");
        
        gunnerWalking.visible = NO;
        gunnerStandingStill.visible = YES;
        gunnerStunned.visible = NO;
        
        if (enemyHidgonWalkingLeft) {
            
            [self stopAction: enemyHidgonWalkLeftAction];
        }
        
        if (enemyHidgonWalkingRight) {
            
            [self stopAction: enemyHidgonWalkRightAction];
        }

        if (enemyHidgonFalling) {
            
            [self stopAction: enemyHidgonFallAction];
        }
        
        self.enemyHidgonWalkingRight = NO;
        self.enemyHidgonWalkingLeft = NO;
        self.enemyHidgonFalling = YES;
        
        self.enemyHidgonTouchingWallOnLeftSide = NO;
        self.enemyHidgonTouchingWallOnRightSide = NO;
        
        [self runAction: enemyHidgonFallAction];
    }
}
/*
-(void) makeHidgonStopFalling
{
    if (self.enemyHidgonTouchingFloor == YES && self.enemyHidgonFalling == YES) {
        
    //    NSLog (@"make Hidgon STOP Falling");
        
        gunnerWalking.visible = NO;
        gunnerStandingStill.visible = YES;
        gunnerStunned.visible = NO;
        
        if (enemyHidgonWalkingLeft) {
            
            [self stopAction: enemyHidgonWalkLeftAction];
        }
        
        if (enemyHidgonWalkingRight) {
            
            [self stopAction: enemyHidgonWalkRightAction];
        }
   
        if (enemyHidgonFalling) {
            
            [self stopAction: enemyHidgonFallAction];
        }
        
        self.enemyHidgonWalkingRight = NO;
        self.enemyHidgonWalkingLeft = NO;
        self.enemyHidgonFalling = NO;
        
        [self runAction: [CCSequence actions:  [CCCallFunc actionWithTarget:self selector:@selector(makeHidgonStopAllActionsAndThenRestartEnemyHidgonAdjustMovementMethod)], nil]];
    }
}
*/
-(void) makeHidgonStopWalkingBeforeMadAgentsMode
{
    if (enemyHidgonWalkingLeft) {
        
        [self stopAction: enemyHidgonWalkLeftAction];
    }
    
    if (enemyHidgonWalkingRight) {
        
        [self stopAction: enemyHidgonWalkRightAction];
    }
    
    self.enemyHidgonWalkingRight = NO;
    self.enemyHidgonWalkingLeft = NO;
}

-(void) makeParkourJumperFall
{
    if (self.parkourJumperTouchingFloor == NO && self.parkourJumperFalling == NO) {
        
  //      NSLog (@"make ParkourJumper Fall");
        
        ninjaRunning.visible = NO;
        ninjaStandingStill.visible = YES;
        ninjaJumping.visible = NO;
        ninjaStunned.visible = NO;
        
        if (parkourJumperWalkingLeft) {
            
            [self stopAction: parkourJumperWalkLeftAction];
        }
        
        if (parkourJumperWalkingRight) {
            
            [self stopAction: parkourJumperWalkRightAction];
        }
        
        if (parkourJumperFalling) {
            
            [self stopAction: parkourJumperFallAction];
        }
        
        self.parkourJumperWalkingRight = NO;
        self.parkourJumperWalkingLeft = NO;
        self.parkourJumperFalling = YES;
        
        [self runAction: parkourJumperFallAction];
    }
}

-(void) makeParkourJumperStopFalling
{
    if (self.parkourJumperTouchingFloor == YES && self.parkourJumperFalling == YES) {
        
        ninjaRunning.visible = NO;
        ninjaStandingStill.visible = YES;
        ninjaJumping.visible = NO;
        ninjaStunned.visible = NO;
        
        if (parkourJumperWalkingLeft) {
            
            [self stopAction: parkourJumperWalkLeftAction];
        }
        
        if (parkourJumperWalkingRight) {
            
            [self stopAction: parkourJumperWalkRightAction];
        }
        
        if (parkourJumperFalling) {
            
            [self stopAction: parkourJumperFallAction];
        }
        
        self.parkourJumperWalkingRight = NO;
        self.parkourJumperWalkingLeft = NO;
        self.parkourJumperFalling = NO;
        
        [self runAction: [CCSequence actions:  [CCCallFunc actionWithTarget:self selector:@selector(makeParkourJumperStopAllActionsAndThenRestartParkourJumpersAdjustMovementMethod)], nil]];
    }
}

-(void) makeParkourJumperStopAllActionsAndThenRestartParkourJumpersAdjustMovementMethod
{
    NSLog (@"makeParkourJumperStopAllActionsAndThenRestartParkourJumpersAdjustMovementMethod");
    
    [self makeParkourJumperNotWalkLeftOrRight];
    
    ninjaRunning.visible = NO;
    ninjaStandingStill.visible = YES;
    ninjaJumping.visible = NO;
    ninjaStunned.visible = NO;
    
    if (parkourJumperAdjustMovementActionIsRunning) {
        
        [self stopAction: parkourJumperAdjustMovement];
        
        parkourJumperAdjustMovementActionIsRunning = YES;
        
        parkourJumperAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(parkourJumperAdjustMovement)], [CCDelayTime actionWithDuration:parkourJumperResponseTime], nil]]];
    }
}

-(void) makeParkourJumperStopWalkingBeforeMadAgentsMode
{
    if (parkourJumperWalkingLeft) {
        
        NSLog (@"Parkourjumper should stop walking left");
        
        [self stopAction: parkourJumperWalkLeftAction];
    }
    
    if (parkourJumperWalkingRight) {
        
        NSLog (@"Parkourjumper should stop walking right");
        
        [self stopAction: parkourJumperWalkRightAction];
    }
    
    self.parkourJumperWalkingRight = NO;
    self.parkourJumperWalkingLeft = NO;
}

-(void) makeParkourJumperJump
{
 //   NSLog (@"makeParkourJumperJump method running");
    
    if (isPaused == YES || self.stunTimeValue > 0) {
        
        self.parkourJumperCurrentlyJumping = NO;
    }
    
    else if (isPaused == NO) {
        
        if (self.parkourJumperAllowedToJump) {
            
            ninjaRunning.visible = NO;
            ninjaStandingStill.visible = NO;
            ninjaJumping.visible = YES;
            ninjaStunned.visible = NO;
            
            self.parkourJumperCurrentlyJumping = YES;
            
            //If bulletTime is not active, ParkourJumper jumps at normal rate
            if (bulletTimeActive == NO) {
                
                [self runAction: [CCSequence actions: [CCMoveBy actionWithDuration:0.5 position:ccp(0, 64)], [CCCallFunc actionWithTarget:self selector:@selector(setParkourJumperCurrentlyJumpingToNo)], [CCCallFunc actionWithTarget:self selector:@selector(makeParkourJumperNotWalkLeftOrRight)], nil]];
            }
            
            //If bulletTime is active, ParkourJumper jumps at slower rate
            else if (bulletTimeActive == YES) {
                
                [self runAction: [CCSequence actions: [CCMoveBy actionWithDuration:2.0 position:ccp(0, 64)], [CCCallFunc actionWithTarget:self selector:@selector(setParkourJumperCurrentlyJumpingToNo)], [CCCallFunc actionWithTarget:self selector:@selector(makeParkourJumperNotWalkLeftOrRight)], nil]];
            }
        }
    }
}



-(void)update:(ccTime)dt {
    
    //Stop decreaseStunTimerAction if it's already running and stunTimeValue is 0
    if (stunTimeValue == 0 && decreaseStunTimerActionAlreadyRunning) {
        
        decreaseStunTimerActionAlreadyRunning = NO;
        
        [self stopAction: decreaseStunTimerAction];
    }
    
    //Stop decreaseFriendlyTimerAction if it's already running and friendlyTimeValue is 0
    if (friendlyTimeValue == 0 && decreaseFriendlyTimerActionAlreadyRunning) {
        
        decreaseFriendlyTimerActionAlreadyRunning = NO;
        
        [self stopAction: decreaseFriendlyTimerAction];
    }
    
    //Run decreaseStunTimerAction if stunTimeValue is greater than 0 and it's not already running
    if (stunTimeValue > 0 && !decreaseStunTimerActionAlreadyRunning) {
        
        decreaseStunTimerActionAlreadyRunning = YES;
        
        [self runAction: decreaseStunTimerAction];
    }
    
    //Run decreaseFriendlyTimerAction if friendlyTimeValue is greater than 0 and it's not already running
    if (friendlyTimeValue > 0 && !decreaseFriendlyTimerActionAlreadyRunning) {
        
        decreaseFriendlyTimerActionAlreadyRunning = YES;
        
        [self runAction: decreaseFriendlyTimerAction];
    }
    
    //If enemy touches stunProjectile it gets stunned
    for (StunProjectilePowerUp *stunProjectilePowerUp in stunProjectileArray) {
        
        if ((self.position.x < stunProjectilePowerUp.position.x + 26 && self.position.x > stunProjectilePowerUp.position.x - 26) && (self.position.y < stunProjectilePowerUp.position.y + 26 && self.position.y > stunProjectilePowerUp.position.y - 26) && self.stunTimeValue == 0 && !self.isCurrentlyTeleportingIn) {
            
            NSLog (@"decreaseStunTimerAction running");
            
            self.stunTimeValue = 3;
            self.friendlyTimeValue = 0;
            
            stunTimerLabel.visible = YES;
            
            [self runAction: decreaseStunTimerAction];
            
            [[SimpleAudioEngine sharedEngine] playEffect:@"BulbBreaking.caf"];
            
            [stunProjectilePowerUp removeFromParentAndCleanup: YES];
            [stunProjectileArray removeObject: stunProjectilePowerUp];
            
            return;
        }
    }
    
    //If enemy touches deployed stunPowferUp it gets stunned
    for (StunPowerUp *stunPowerUp in stunPowerUpArray) {
        
        if ((self.position.x < stunPowerUp.position.x + 26 && self.position.x > stunPowerUp.position.x - 26) && (self.position.y < stunPowerUp.position.y + 26 && self.position.y > stunPowerUp.position.y - 26) && self.stunTimeValue == 0 && stunPowerUp.visible == YES && !self.isCurrentlyTeleportingIn) {
            
            self.stunTimeValue = 7;
            self.friendlyTimeValue = 0;
            
            [self runAction: decreaseStunTimerAction];
            
            [(StunPowerUp *)stunPowerUp bombExploding];
            
         //   [stunPowerUp removeFromParentAndCleanup: YES];
         //   [stunPowerUpArray removeObject: stunPowerUp];
            
            return;
        }
    }
    
    //If enemy touches deployed stunPowerUp it gets stunned
    for (MindControlPowerUp *mindControlPowerUp in mindControlPowerUpArray) {
        
        if ((self.position.x < mindControlPowerUp.position.x + 26 && self.position.x > mindControlPowerUp.position.x - 26) && (self.position.y < mindControlPowerUp.position.y + 26 && self.position.y > mindControlPowerUp.position.y - 26) && self.friendlyTimeValue == 0 && !self.isCurrentlyTeleportingIn) {
            
            self.friendlyTimeValue = 7;
            self.stunTimeValue = 0;
            
            if (!decreaseFriendlyTimerActionAlreadyRunning) {
            
                decreaseFriendlyTimerActionAlreadyRunning = YES;
                
                [self runAction: decreaseFriendlyTimerAction];
            }
            
            [[SimpleAudioEngine sharedEngine] playEffect:@"BulbBreaking.caf"];
            
            [mindControlPowerUp removeFromParentAndCleanup: YES];
            [mindControlPowerUpArray removeObject: mindControlPowerUp];
            
            return;
        }
    }

    
    if ((isSinglePlayer || (!isSinglePlayer && isPlayer1)) && self.enemyKnockedOutOfTheArena == NO) {
    
       // NSLog (@"walkingSpeed = %f", walkingSpeed);
        
        if (bulletTimeActive == NO) {
            
            bulletTimeSpeedReduction = 0;
        }
        
        else if (bulletTimeActive == YES) {
            
            bulletTimeSpeedReduction = bulletTimeSpeedReduction + 0.01;
        }
        
        //Hidgon
        if (self.enemyType == HIDGON_ENEMY_TYPE && isPlayer1) {
            
            if (stunTimeValue > 0) {
                
            //    [self makeHidgonNotWalkLeftOrRight];
                gunnerWalking.visible = NO;
                gunnerStandingStill.visible = NO;
                gunnerStunned.visible = YES;
                
                self.position = ccp(self.position.x, self.position.y);
            }
            
            if (isPaused == NO || (isPaused == NO && !isSinglePlayer && isPlayer1)) {
         
                if (madAgentsAmount == 0) {
                    
                    walkingSpeed = 2.0 - 2.0*0.2;
                }
                
                else if (madAgentsAmount == 1) {
                    
                    walkingSpeed = 3.0 - 3.0*0.2;
                }
                
                if (madAgentsAmount == 0) {
                    
                    if (bulletTimeActive == NO) {
                        
                        walkingSpeed = 2.0 - 2.0*0.2;
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        walkingSpeed = walkingSpeed - bulletTimeSpeedReduction;
                        
                        if (walkingSpeed - bulletTimeSpeedReduction < 1) {
                            
                            walkingSpeed = 0.5 - 0.5*0.2;
                        }
                    }
                }
                
                else if (madAgentsAmount == 1) {
                    
                    if (bulletTimeActive == NO) {
                        
                        walkingSpeed = 3.0 - 3.0*0.2;
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        walkingSpeed = walkingSpeed - bulletTimeSpeedReduction;
                        
                        if (walkingSpeed - bulletTimeSpeedReduction < 2) {
                            
                            walkingSpeed = 1.3 - 1.3*0.2;
                        }
                    }
                }
                
                if (isCurrentlyTeleportingIn) {
                
                    walkingSpeed = 0;
                    
                    gunnerStandingStill.visible = YES;
                    gunnerStunned.visible = NO;
                    gunnerWalking.visible = NO;
                }
                
                //Subroutine which makes enemyHidgon walk back and forth and jump at random times
                if ([self enemyHidgonWalkingRight] && stunTimeValue == 0 && enemyHidgonTouchingFloor) {
                    
                    self.position = ccp(self.position.x + walkingSpeed, self.position.y);
                    
                    gunnerWalking.visible = YES;
                    gunnerStandingStill.visible = NO;
                    gunnerStunned.visible = NO;
                    
                    gunnerWalking.flipX = NO;
                    gunnerStandingStill.flipX = NO;
                    gunnerStunned.flipX = NO;
                    
                    if (enemyHidgonFaceRightMessageAlreadySent == NO) {
                     
                    //    NSLog (@"Sending enemyHidgonFaceRightMessageAlreadySent");
                        
                        enemyHidgonFaceRightMessageAlreadySent = YES;
                        enemyHidgonFaceLeftMessageAlreadySent = NO;
                        
                        [(HelloWorldLayer*)theGame sendMakeHidgonFaceRight: self.enemyReferenceNumber];
                    }
                   
                    if (enemyHidgonRunningVisibleMessageAlreadySent == NO) {
                    
                    //    NSLog (@"Sending enemyHidgonRunningVisibleMessageAlreadySent");
                        
                        enemyHidgonRunningVisibleMessageAlreadySent = YES;
                        enemyHidgonStandingStillVisibleMessageAlreadySent = NO;
                        
                        [(HelloWorldLayer*)theGame sendMakeHidgonRunningAnimationVisible: self.enemyReferenceNumber];
                    }
                }
                
                if ([self enemyHidgonWalkingLeft] && stunTimeValue == 0 && enemyHidgonTouchingFloor) {
                                        
                    self.position = ccp(self.position.x - walkingSpeed, self.position.y);
                    
                    gunnerWalking.visible = YES;
                    gunnerStandingStill.visible = NO;
                    gunnerStunned.visible = NO;
                    
                    gunnerWalking.flipX = YES;
                    gunnerStandingStill.flipX = YES;
                    gunnerStunned.flipX = YES;
                    
                    if (enemyHidgonFaceLeftMessageAlreadySent == NO) {
                        
                    //    NSLog (@"Sending enemyHidgonFaceLeftMessageAlreadySent");
                        
                        enemyHidgonFaceRightMessageAlreadySent = NO;
                        enemyHidgonFaceLeftMessageAlreadySent = YES;
                    
                        [(HelloWorldLayer*)theGame sendMakeHidgonFaceLeft: self.enemyReferenceNumber];
                    }
                    
                    if (enemyHidgonRunningVisibleMessageAlreadySent == NO) {
                        
                    //    NSLog (@"Sending enemyHidgonRunningVisibleMessageAlreadySent");
                        
                        enemyHidgonRunningVisibleMessageAlreadySent = YES;
                        enemyHidgonStandingStillVisibleMessageAlreadySent = NO;
                    
                        [(HelloWorldLayer*)theGame sendMakeHidgonRunningAnimationVisible: self.enemyReferenceNumber];
                    }
                }

                
                if (self.enemyHidgonTouchingFloor == NO && self.hidgonCurrentlyJumping == NO) {
                    
                    gunnerWalking.visible = NO;
                    gunnerStandingStill.visible = YES;
                    gunnerStunned.visible = NO;
                    
                    if (bulletTimeActive == NO) {
                                        
                        self.position = ccp(self.position.x, self.position.y - 2.0);
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        self.position = ccp(self.position.x, self.position.y - 0.5);
                    }
                    
                    if (enemyHidgonStandingStillVisibleMessageAlreadySent == NO) {
                        
                     //   NSLog (@"Sending enemyHidgonStandingStillVisibleMessageAlreadySent");
                        
                        enemyHidgonRunningVisibleMessageAlreadySent = NO;
                        enemyHidgonStandingStillVisibleMessageAlreadySent = YES;
                    
                        [(HelloWorldLayer*)theGame sendMakeHidgonStandingStillAnimationVisible: self.enemyReferenceNumber];
                    }
                }

                
                if (self.enemyHidgonTouchingFloor && self.enemyHidgonTouchingWallOnRightSide == YES && !self.enemyHidgonTouchingWallOnLeftSide && self.hidgonCurrentlyJumping == NO) {
                    
                    enemyHidgonWalkingLeft = YES;
                    enemyHidgonWalkingRight = NO;
                    
                    if (enemyHidgonFaceLeftMessageAlreadySent == NO) {
                        
                    //    NSLog (@"Sending enemyHidgonFaceLeftMessageAlreadySent");
                        
                        enemyHidgonFaceRightMessageAlreadySent = NO;
                        enemyHidgonFaceLeftMessageAlreadySent = YES;
                    
                        [(HelloWorldLayer*)theGame sendMakeHidgonFaceLeft: self.enemyReferenceNumber];
                    }
                    
                    if (enemyHidgonRunningVisibleMessageAlreadySent == NO) {
                        
                    //    NSLog (@"Sending enemyHidgonRunningVisibleMessageAlreadySent");
                        
                        enemyHidgonRunningVisibleMessageAlreadySent = YES;
                        enemyHidgonStandingStillVisibleMessageAlreadySent = NO;
                    
                        [(HelloWorldLayer*)theGame sendMakeHidgonRunningAnimationVisible: self.enemyReferenceNumber];
                    }
                }
                
                else if (self.enemyHidgonTouchingFloor && self.enemyHidgonTouchingWallOnLeftSide == YES && !self.enemyHidgonTouchingWallOnRightSide && self.hidgonCurrentlyJumping == NO) {
                    
                    enemyHidgonWalkingLeft = NO;
                    enemyHidgonWalkingRight = YES;
                    
                    if (enemyHidgonFaceRightMessageAlreadySent == NO) {
                        
                    //    NSLog (@"Sending enemyHidgonFaceRightMessageAlreadySent");
                        
                        enemyHidgonFaceRightMessageAlreadySent = YES;
                        enemyHidgonFaceLeftMessageAlreadySent = NO;
                    
                        [(HelloWorldLayer*)theGame sendMakeHidgonFaceRight: self.enemyReferenceNumber];
                    }
                   
                    if (enemyHidgonRunningVisibleMessageAlreadySent == NO) {
                        
                    //    NSLog (@"Sending enemyHidgonRunningVisibleMessageAlreadySent");
                        
                        enemyHidgonRunningVisibleMessageAlreadySent = YES;
                        enemyHidgonStandingStillVisibleMessageAlreadySent = NO;
                    
                        [(HelloWorldLayer*)theGame sendMakeHidgonRunningAnimationVisible: self.enemyReferenceNumber];
                    }
                }
                
                /*
                else if (!self.hidgonCurrentlyJumping && self.enemyHidgonTouchingWallOnLeftSide == YES && self.enemyHidgonTouchingWallOnRightSide == YES) {
                    
                    [self makeHidgonFall];
                }
                 */

                
                self.enemyHidgonTouchingFloor = NO;
                self.enemyHidgonTouchingWallOnRightSide = NO;
                self.enemyHidgonTouchingWallOnLeftSide = NO;
                self.hidgonAllowedToJump = NO;
                
                
                //Different bottom collision boundary for boss
                int collisionBoundaryFeet;
                
                if (!isBoss) {
                    
                    collisionBoundaryFeet = 11;
                }
                
                else if (isBoss) {
                    
                    collisionBoundaryFeet = 17;
                }
                
                //Check to see if enemy is touching a solid tile, which would make him stop falling
                for (int row=0; row < [foreground layerSize].width; row++) {
                    
                    for (int col=0; col < [foreground layerSize].height; col++) {
                        
                        int tmpgid = [foreground tileGIDAt:ccp(row,col)];
                        
                        CGPoint tmpgidlocation = [foreground positionAt: ccp((row + 0.52), (col - 0.49))];
                        
                        if (tmpgid != 0) {
                            
                            if ((self.position.y - collisionBoundaryFeet < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y + 20) && (self.position.x - 10 < tmpgidlocation.x + 11) && (self.position.x + 10 > tmpgidlocation.x - 11)) {
                                
                                if (col != 0 && ([foreground tileGIDAt:ccp(row,col - 1)] == 0)) {
                                    
                                    //stop enemy's falling
                                    self.enemyHidgonTouchingFloor = YES;
                                }
                            }
                            
                            //check if enemy's right side is touching wall
                            if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11) && !self.hidgonCurrentlyJumping) {
                                
                                self.enemyHidgonTouchingWallOnRightSide = YES;
                            }
                            
                            //check if enemy's left side is touching wall
                            if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x - 11 > tmpgidlocation.x - 11) && !self.hidgonCurrentlyJumping) {
                                
                             //   NSLog (@"hidgon touching wall on left side");
                                
                                self.enemyHidgonTouchingWallOnLeftSide = YES;
                            }
                            
                            //Determine nearest jumpable tile to Hidgon
                            if (tmpgidlocation.y <= self.position.y + 44 && ((tmpgidlocation.x) < fabs(closestJumpableTileLocation.x))) {
                                
                                closestJumpableTileLocation = tmpgidlocation;
                            }
                            
                            if (self.enemyHidgonTouchingFloor == NO && (self.enemyHidgonTouchingWallOnLeftSide || self.enemyHidgonTouchingWallOnRightSide)) {
                                
                            //    self.enemyHidgonTouchingWallOnLeftSide = NO;
                            //    self.enemyHidgonTouchingWallOnRightSide = NO;
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
                            
                            if ((self.position.y - collisionBoundaryFeet < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y + 10) && (self.position.x - 10 < tmpgidlocation.x + 11) && (self.position.x + 10 > tmpgidlocation.x - 11)) {
                                
                                if (col != 0 && ([solidBricks tileGIDAt:ccp(row,col - 1)] == 0)) {
                                    
                                    //stop enemy's falling
                                    self.enemyHidgonTouchingFloor = YES;
                                    
                                //    [self makeHidgonStopFalling];
                                }
                            }
                            
                            //check if enemy's right side is touching wall
                            if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                                
                                self.enemyHidgonTouchingWallOnRightSide = YES;
                                self.enemyHidgonWalkingRight = NO;
                                self.enemyHidgonWalkingLeft = YES;
                                
                              //  [self makeHidgonWalkLeft];
                            }
                            
                            //check if enemy's left side is touching wall
                            if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x - 11 > tmpgidlocation.x - 11)) {
                                
                                self.enemyHidgonTouchingWallOnLeftSide = YES;
                                self.enemyHidgonWalkingRight = YES;
                                self.enemyHidgonWalkingLeft = NO;
                                
                              //  [self makeHidgonWalkRight];
                            }
                            
                            //check if hidgon is allowed to jump
                            if ((self.position.y < tmpgidlocation.y) && (self.position.y + 44 > tmpgidlocation.y) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                                
                                self.hidgonAllowedToJump = NO;
                            }
                            
                            //Determine nearest jumpable tile to Hidgon
                            if (tmpgidlocation.y <= self.position.y + 44 && ((tmpgidlocation.x) < fabs(closestJumpableTileLocation.x))) {
                                
                                closestJumpableTileLocation = tmpgidlocation;
                            }
                            
                            if (self.enemyHidgonTouchingFloor == NO && (self.enemyHidgonTouchingWallOnLeftSide || self.enemyHidgonTouchingWallOnRightSide)) {
                                
                            //    self.enemyHidgonTouchingWallOnLeftSide = NO;
                            //    self.enemyHidgonTouchingWallOnRightSide = NO;
                            }
                        }
                    }
                }
                
                //Check to see if enemy is touching a solid tile, which would make him stop falling
                for (int row=0; row < [foreground layerSize].width; row++) {
                    
                    for (int col=0; col < [foreground layerSize].height; col++) {
                        
                        int tmpgid = [foreground tileGIDAt:ccp(row,col)];
                        
                        CGPoint tmpgidlocation = [foreground positionAt: ccp((row + 0.52), (col - 0.49))];
                        
                        if (tmpgid != 0) {
                
                            //check if hidgon is allowed to jump
                            if ((self.position.y < tmpgidlocation.y) && (self.position.y + 44 > tmpgidlocation.y) && enemyHidgonTouchingFloor && (self.position.x + 10 < tmpgidlocation.x + 11) && (self.position.x + 10 > tmpgidlocation.x - 11) && col > 0) {
                                
                                //     NSLog (@"Hidgon allowed to Jump subroutine hit");
                                
                                self.hidgonAllowedToJump = YES;
                            }
                        }
                    }
                }
                
                /*Check if Hidgon is touching Door*/
                /*
                for (MovingDoors *movingDoor in movingDoorArray) {
                    
                    //Check if hidgon's bottom is touching door
                    if ((self.position.y - 11 < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y + 11 > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                                            
                        //stop enemy's falling
                        self.enemyHidgonTouchingFloor = YES;
                    }
                    
                    //Hidgon touching door on top
                    if ((self.position.y + 11 > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y - 11 < movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                        
                    }
                    
                    //Check if Hidgon's left side is touching door
                    if ((self.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x - 11 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x - 11 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                        
                        self.enemyHidgonTouchingWallOnLeftSide = YES;
                        self.enemyHidgonWalkingRight = YES;
                        self.enemyHidgonWalkingLeft = NO;
                    }
                    
                    //Check if Hidgon's right side is touching door
                    if ((self.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x + 11 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x + 11 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                        
                        self.enemyHidgonTouchingWallOnRightSide = YES;
                        self.enemyHidgonWalkingRight = NO;
                        self.enemyHidgonWalkingLeft = YES;
                    }
                }
                 */
            }
        }
        
        
        
        
        
        
        //Beginning of ParkourJumper update method
        if (self.enemyType == PARKOUR_JUMPER_TYPE && isPlayer1) {

            if (stunTimeValue > 0) {
                
                //    [self makeHidgonNotWalkLeftOrRight];
                ninjaJumping.visible = NO;
                ninjaStandingStill.visible = NO;
                ninjaRunning.visible = NO;
                ninjaStunned.visible = YES;
                
                self.position = ccp(self.position.x, self.position.y);
                
                if (self.parkourJumperJumpingOverLedgeOnLeftSide) {
                    
                    [self setParkourJumperJumpingOverLedgeOnLeftSideToNo];
                }
                
                if (self.parkourJumperJumpingOverLedgeOnRightSide) {
                    
                    [self setParkourJumperJumpingOverLedgeOnRightSideToNo];
                }
            }
            
            if (isPaused == NO || (isPaused == NO && !isSinglePlayer && isPlayer1)) {
                
                if (madAgentsAmount == 0) {
                    
                    walkingSpeed = 2.0;
                }
                
                else if (madAgentsAmount == 1) {
                    
                    walkingSpeed = 3.0;
                }
                
                //If bullet time is active, and ninja is in the middle of a leap, make them stop leaping.  They also aren't allowed to leap during bullet time
                if (bulletTimeActive) {
                    
                    if (self.parkourJumperJumpingOverLedgeOnLeftSide) {
                        
                        [self setParkourJumperJumpingOverLedgeOnLeftSideToNo];
                    }
                    
                    if (self.parkourJumperJumpingOverLedgeOnRightSide) {
                        
                        [self setParkourJumperJumpingOverLedgeOnRightSideToNo];
                    }
                }
                
                if (madAgentsAmount == 0) {
                    
                    if (bulletTimeActive == NO) {
                        
                        walkingSpeed = 2.0;
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        walkingSpeed = walkingSpeed - bulletTimeSpeedReduction;
                        
                        if (walkingSpeed - bulletTimeSpeedReduction < 1) {
                            
                            walkingSpeed = 0.5;
                        }
                    }
                }
                
                else if (madAgentsAmount == 1) {
                    
                    if (bulletTimeActive == NO) {
                        
                        walkingSpeed = 3.0;
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        walkingSpeed = walkingSpeed - bulletTimeSpeedReduction;
                        
                        if (walkingSpeed - bulletTimeSpeedReduction < 2) {
                            
                            walkingSpeed = 1.3;
                        }
                    }
                }
                
                if (isCurrentlyTeleportingIn) {
                    
                    walkingSpeed = 0;
                    
                    ninjaJumping.visible = NO;
                    ninjaStandingStill.visible = YES;
                    ninjaRunning.visible = NO;
                    ninjaStunned.visible = NO;
                }
                
                
                //Subroutine which makes enemyHidgon walk back and forth and jump at random times
                if ([self parkourJumperWalkingRight] && stunTimeValue == 0 && parkourJumperTouchingFloor) {
                    
                    self.position = ccp(self.position.x + walkingSpeed, self.position.y);
                    
                    ninjaRunning.visible = YES;
                    ninjaStandingStill.visible = NO;
                    ninjaJumping.visible = NO;
                    ninjaStunned.visible = NO;
                    
                    ninjaRunning.flipX = NO;
                    ninjaStandingStill.flipX = NO;
                    ninjaJumping.flipX = NO;
                    ninjaStunned.flipX = NO;
                }
                
                if ([self parkourJumperWalkingLeft] && stunTimeValue == 0 && parkourJumperTouchingFloor) {
                    
                    self.position = ccp(self.position.x - walkingSpeed, self.position.y);
                    
                    ninjaRunning.visible = YES;
                    ninjaStandingStill.visible = NO;
                    ninjaJumping.visible = NO;
                    ninjaStunned.visible = NO;
                    
                    ninjaRunning.flipX = YES;
                    ninjaStandingStill.flipX = YES;
                    ninjaJumping.flipX = YES;
                    ninjaStunned.flipX = YES;
                }
                
                
                if (self.parkourJumperTouchingFloor == NO && self.parkourJumperCurrentlyJumping == NO && self.parkourJumperJumpingOverLedgeOnLeftSide == NO && self.parkourJumperJumpingOverLedgeOnRightSide == NO) {
                    
                    ninjaRunning.visible = NO;
                    ninjaJumping.visible = NO;
                    ninjaStandingStill.visible = YES;
                    ninjaStunned.visible = NO;
                    
                    if (bulletTimeActive == NO) {
                        
                        self.position = ccp(self.position.x, self.position.y - 2.0);
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        self.position = ccp(self.position.x, self.position.y - 0.5);
                    }
                }
                
                /*
                 if (self.enemyHidgonTouchingFloor && self.hidgonCurrentlyJumping == NO) {
                 
                 [self makeHidgonStopFalling];
                 }
                 */
                
                if (self.parkourJumperTouchingFloor && self.parkourJumperTouchingWallOnRightSide == YES && !self.parkourJumperTouchingWallOnLeftSide && self.parkourJumperCurrentlyJumping == NO) {
                    
                    parkourJumperWalkingLeft = YES;
                    parkourJumperWalkingRight = NO;
                }
                
                else if (self.parkourJumperTouchingFloor && !self.parkourJumperTouchingWallOnRightSide && self.parkourJumperTouchingWallOnLeftSide == YES && self.parkourJumperCurrentlyJumping == NO) {
                    
                    parkourJumperWalkingLeft = NO;
                    parkourJumperWalkingRight = YES;
                }
                //Everything above here is copied from Hidgon's update method
                
                
                
                if (self.parkourJumperTouchingFloor && self.parkourJumperTouchingJumpableLedgeOnRightSide == YES && self.parkourJumperCurrentlyJumping == NO && self.parkourJumperJumpingOverLedgeOnRightSide == NO && self.parkourJumperJumpingOverLedgeOnLeftSide == NO) {
                    
                    //Make ParkourJumper leap if Player's y-position is about equal or greater than ParkourJumper's
                    if ((firstPlayerSprite.position.y >= self.position.y || firstPlayerSprite.position.y + 7 >= self.position.y) && bulletTimeActive == NO) {
                    
                        [self makeParkourJumperLeapRightBetweenPlatforms];
                    }
                }
                
                else if (self.parkourJumperTouchingFloor && self.parkourJumperTouchingJumpableLedgeOnLeftSide == YES && self.parkourJumperCurrentlyJumping == NO && self.parkourJumperJumpingOverLedgeOnRightSide == NO && self.parkourJumperJumpingOverLedgeOnLeftSide == NO) {
                    
                    //Make ParkourJumper leap if Player's y-position is about equal or greater than ParkourJumper's
                    if ((firstPlayerSprite.position.y >= self.position.y || firstPlayerSprite.position.y + 7 >= self.position.y) && bulletTimeActive == NO) {
                    
                        [self makeParkourJumperLeapLeftBetweenPlatforms];
                    }
                }
                
             /*
                if (self.parkourJumperTouchingFloor && self.parkourJumperTouchingWallOnRightSide == YES && self.parkourJumperCurrentlyJumping == NO) {
                    
                    if (self.parkourJumperJumpingOverLedgeOnRightSide == YES) {
                        
                        [self stopAction: parkourJumperJumpingOverLedgeOnRightSideAction];
                    }
                    
                    else if (self.parkourJumperJumpingOverLedgeOnLeftSide == YES) {
                        
                        [self stopAction: parkourJumperJumpingOverLedgeOnLeftSideAction];
                    }
                    
                    parkourJumperWalkingLeft = YES;
                    parkourJumperWalkingRight = NO;
                }
                
                else if (self.parkourJumperTouchingFloor && self.parkourJumperTouchingWallOnLeftSide == YES && self.parkourJumperCurrentlyJumping == NO) {
                    
                    if (self.parkourJumperJumpingOverLedgeOnRightSide == YES) {
                        
                        [self stopAction: parkourJumperJumpingOverLedgeOnRightSideAction];
                    }
                    
                    else if (self.parkourJumperJumpingOverLedgeOnLeftSide == YES) {
                        
                        [self stopAction: parkourJumperJumpingOverLedgeOnLeftSideAction];
                    }
                    
                    parkourJumperWalkingLeft = NO;
                    parkourJumperWalkingRight = YES;
                }
               */ 
                
                self.parkourJumperTouchingFloor = NO;
                self.parkourJumperTouchingWallOnRightSide = NO;
                self.parkourJumperTouchingWallOnLeftSide = NO;
                self.parkourJumperAllowedToJump = NO;
                self.parkourJumperTouchingJumpableLedgeOnLeftSide = NO;
                self.parkourJumperTouchingJumpableLedgeOnRightSide = NO;
                
                
                //Different bottom collision boundary for boss
                int collisionBoundaryFeet;
                int collisionBoundaryLeftAndRightSideForLedgeDetection;
                
                if (!isBoss) {
                    
                    collisionBoundaryFeet = 11;
                    collisionBoundaryLeftAndRightSideForLedgeDetection = 4;
                }
                
                else if (isBoss) {
                    
                    collisionBoundaryFeet = 19;
                    collisionBoundaryLeftAndRightSideForLedgeDetection = -4;
                }
                
                //Check to see if enemy is touching a solid tile, which would make him stop falling
                for (int row=0; row < [foreground layerSize].width; row++) {
                    
                    for (int col=0; col < [foreground layerSize].height; col++) {
                        
                        int tmpgid = [foreground tileGIDAt:ccp(row,col)];
                        
                        CGPoint tmpgidlocation = [foreground positionAt: ccp((row + 0.52), (col - 0.49))];
                        
                        if (tmpgid != 0) {
                            
                            if ((self.position.y - collisionBoundaryFeet < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y + 10) && (self.position.x - 10 < tmpgidlocation.x + 11) && (self.position.x + 10 > tmpgidlocation.x - 11)) {
                                
                                if (col != 0 && ([foreground tileGIDAt:ccp(row,col - 1)] == 0)) {
                                    
                                    if (self.parkourJumperJumpingOverLedgeOnRightSide == NO && self.parkourJumperJumpingOverLedgeOnLeftSide == NO) {
                                    
                                        //stop enemy's falling
                                        self.parkourJumperTouchingFloor = YES;
                                        
                                    //    [self makeParkourJumperStopFalling];
                                    }
                                }
                            }
                            
                            //check if enemy's right side is touching wall
                            if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11) && !self.parkourJumperCurrentlyJumping) {
                                
                                self.parkourJumperTouchingWallOnRightSide = YES;
                            }
                            
                            //check if enemy's left side is touching wall
                            if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x - 11 > tmpgidlocation.x - 11) && !self.parkourJumperCurrentlyJumping) {
                                
                                //   NSLog (@"parkourJumper touching wall on left side");
                                
                                self.parkourJumperTouchingWallOnLeftSide = YES;
                            }
     
                            /*Under Construction
                            //Create conditional to check if ParkourJumper is approaching Edge of ledge
                             //If YES to Parkour Jumper is approaching edge of ledge, check if tmpgidlocations several tiles (say, 5 squares) to the right of left of ledge (dpending on which way ParkourJumper is facing).  Take the distance between the edge of the ledge to the next closest adjacent tile and use that number to have ParkourJumper jump that distance to get to the next ledge.
                             
                             //The makeParkourJumperLeapBetweenPlatforms method will basically use the distance between the ledges to have him 'CCJump' that distance
                             
                             */
                            
                            if ((self.position.y - collisionBoundaryFeet < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - (-collisionBoundaryLeftAndRightSideForLedgeDetection) < tmpgidlocation.x + 11) && (self.position.x + (-collisionBoundaryLeftAndRightSideForLedgeDetection) > tmpgidlocation.x - 11)) {

                                if (self.parkourJumperWalkingRight && (row + 1 < 29) && [foreground tileGIDAt:ccp(row + 1,col)] == 0 && [solidBricks tileGIDAt:ccp(row + 1,col)] == 0) {
                                    
                                    int tileWidth = 25;
                                    
                                    if ((row + 3 <= 29) && [foreground tileGIDAt:ccp(row + 2,col)] != 0 && [foreground tileGIDAt:ccp(row + 3,col)] != 0) {

                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else if ((row + 4 <= 29) && [foreground tileGIDAt:ccp(row + 3,col)] != 0 && [foreground tileGIDAt:ccp(row + 4,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth*2;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else if ((row + 5 <= 29) && [foreground tileGIDAt:ccp(row + 4,col)] != 0 && [foreground tileGIDAt:ccp(row + 5,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth*3;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else if ((row + 6 <= 29) && [foreground tileGIDAt:ccp(row + 5,col)] != 0 && [foreground tileGIDAt:ccp(row + 6,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth*4;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else if ((row + 7 <= 29) && [foreground tileGIDAt:ccp(row + 6,col)] != 0 && [foreground tileGIDAt:ccp(row + 7,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth*5;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else if ((row + 8 <= 29) && [foreground tileGIDAt:ccp(row + 7,col)] != 0 && [foreground tileGIDAt:ccp(row + 8,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth*6;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else if ((row + 9 <= 29) && [foreground tileGIDAt:ccp(row + 8,col)] != 0 && [foreground tileGIDAt:ccp(row + 9,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth*7;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else if ((row + 10 <= 29) && [foreground tileGIDAt:ccp(row + 9,col)] != 0 && [foreground tileGIDAt:ccp(row + 10,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth*8;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else {
                                        
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = NO;
                                    }
                                }
                                
                                else if (self.parkourJumperWalkingLeft && (row + 1 < 29) && [foreground tileGIDAt:ccp(row - 1,col)] == 0 && [solidBricks tileGIDAt:ccp(row - 1,col)] == 0) {
                                    
                                    int tileWidth = -25;
                                    
                                    if ((row - 3 >= 0) && [foreground tileGIDAt:ccp(row - 2,col)] != 0 && [foreground tileGIDAt:ccp(row - 3,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else if ((row - 4 >= 0) && [foreground tileGIDAt:ccp(row - 3,col)] != 0 && [foreground tileGIDAt:ccp(row - 4,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth*2;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else if ((row - 5 >= 0) && [foreground tileGIDAt:ccp(row - 4,col)] != 0 && [foreground tileGIDAt:ccp(row - 5,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth*3;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else if ((row - 6 >= 0) && [foreground tileGIDAt:ccp(row - 5,col)] != 0 && [foreground tileGIDAt:ccp(row - 6,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth*4;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else if ((row - 7 >= 0) && [foreground tileGIDAt:ccp(row - 6,col)] != 0 && [foreground tileGIDAt:ccp(row - 7,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth*5;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else if ((row - 8 >= 0) && [foreground tileGIDAt:ccp(row - 7,col)] != 0 && [foreground tileGIDAt:ccp(row - 8,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth*6;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else if ((row - 9 >= 0) && [foreground tileGIDAt:ccp(row - 8,col)] != 0 && [foreground tileGIDAt:ccp(row - 9,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth*7;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else if ((row - 10 >= 0) && [foreground tileGIDAt:ccp(row - 9,col)] != 0 && [foreground tileGIDAt:ccp(row - 10,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth*8;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else {
                                        
                                        parkourJumperTouchingJumpableLedgeOnLeftSide = NO;
                                    }
                                }
                            }
                            
                            //Determine nearest jumpable tile to Ninja
                            if (tmpgidlocation.y <= self.position.y + 44 && ((tmpgidlocation.x) < fabs(closestJumpableTileLocation.x))) {
                                
                                closestJumpableTileLocation = tmpgidlocation;
                            }
                            
                            if (self.parkourJumperTouchingFloor == NO && (self.parkourJumperTouchingWallOnLeftSide || self.parkourJumperTouchingWallOnRightSide)) {
                                
                              //  self.parkourJumperTouchingWallOnLeftSide = NO;
                              //  self.parkourJumperTouchingWallOnRightSide = NO;
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
                            
                            if ((self.position.y - collisionBoundaryFeet < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y + 10) && (self.position.x - 10 < tmpgidlocation.x + 11) && (self.position.x + 10 > tmpgidlocation.x - 11)) {
                                
                                if (col != 0 && ([solidBricks tileGIDAt:ccp(row,col - 1)] == 0)) {
                                    
                                    //stop enemy's falling
                                    self.parkourJumperTouchingFloor = YES;
                                    
                                //    [self makeParkourJumperStopFalling];
                                }
                            }
                            
                            //check if enemy's right side is touching wall
                            if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                                
                                self.parkourJumperTouchingWallOnRightSide = YES;
                            }
                            
                            //check if enemy's left side is touching wall
                            if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x - 11 > tmpgidlocation.x - 11)) {
                                
                                self.parkourJumperTouchingWallOnLeftSide = YES;
                            }
                            
                            if ((self.position.y - collisionBoundaryFeet < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - (-collisionBoundaryLeftAndRightSideForLedgeDetection) < tmpgidlocation.x + 11) && (self.position.x + (-collisionBoundaryLeftAndRightSideForLedgeDetection) > tmpgidlocation.x - 11)) {
                                
                                if (self.parkourJumperWalkingRight && (row + 1 < 29) && [solidBricks tileGIDAt:ccp(row + 1,col)] == 0) {
                                    
                                    int tileWidth = 25;
                                    
                                    if ((row + 2 <= 29) && [solidBricks tileGIDAt:ccp(row + 2,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else if ((row + 3 <= 29) && [solidBricks tileGIDAt:ccp(row + 3,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth*2;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else if ((row + 4 <= 29) && [solidBricks tileGIDAt:ccp(row + 4,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth*3;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else if ((row + 5 <= 29) && [solidBricks tileGIDAt:ccp(row + 5,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth*4;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else if ((row + 6 <= 29) && [solidBricks tileGIDAt:ccp(row + 6,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth*5;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else if ((row + 7 <= 29) && [solidBricks tileGIDAt:ccp(row + 7,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnRightSide = tileWidth*6;
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = YES;
                                    }
                                    
                                    else {
                                        
                                        self.parkourJumperTouchingJumpableLedgeOnRightSide = NO;
                                    }
                                }
                                
                                else if (self.parkourJumperWalkingLeft && (row - 1 > 0) && [solidBricks tileGIDAt:ccp(row - 1,col)] == 0) {
                                    
                                    int tileWidth = -25;
                                    
                                    if ((row - 2 >= 0) && [solidBricks tileGIDAt:ccp(row - 2,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else if ((row - 3 >= 0) && [solidBricks tileGIDAt:ccp(row - 3,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth*2;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else if ((row - 4 >= 0) && [solidBricks tileGIDAt:ccp(row - 4,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth*3;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else if ((row - 5 >= 0) && [solidBricks tileGIDAt:ccp(row - 5,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth*4;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else if ((row - 6 >= 0) && [solidBricks tileGIDAt:ccp(row - 6,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth*5;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else if ((row - 7 >= 0) && [solidBricks tileGIDAt:ccp(row - 7,col)] != 0) {
                                        
                                        parkourJumperDistanceToLedgeOnLeftSide = tileWidth*6;
                                        self.parkourJumperTouchingJumpableLedgeOnLeftSide = YES;
                                    }
                                    
                                    else {
                                        
                                        parkourJumperTouchingJumpableLedgeOnLeftSide = NO;
                                    }
                                }
                            }
                            /*
                            //check if ParkourJumper is allowed to jump
                            if ((self.position.y < tmpgidlocation.y) && (self.position.y + 44 > tmpgidlocation.y) && (self.position.x + 0 >= tmpgidlocation.x - 11) && (self.position.x + 0 <= tmpgidlocation.x + 11) && col > 0) {
                                
                                self.parkourJumperAllowedToJump = NO;
                            }
                            */
                            //Determine nearest jumpable tile to Ninja
                            if (tmpgidlocation.y <= self.position.y + 44 && ((tmpgidlocation.x) < fabs(closestJumpableTileLocation.x))) {
                                
                                closestJumpableTileLocation = tmpgidlocation;
                            }
                            
                            if (self.parkourJumperTouchingFloor == NO && (self.parkourJumperTouchingWallOnLeftSide || self.parkourJumperTouchingWallOnRightSide)) {
                                
                           //     self.parkourJumperTouchingWallOnLeftSide = NO;
                           //     self.parkourJumperTouchingWallOnRightSide = NO;
                            }
                        }
                    }
                }
                
                for (int row=0; row < [foreground layerSize].width; row++) {
                    
                    for (int col=0; col < [foreground layerSize].height; col++) {
                        
                        int tmpgid = [foreground tileGIDAt:ccp(row,col)];
                        
                        CGPoint tmpgidlocation = [foreground positionAt: ccp((row + 0.52), (col - 0.49))];
                        
                        if (tmpgid != 0) {
                
                            //check if ParkourJumper is allowed to jump
                            if ((self.position.y < tmpgidlocation.y) && (self.position.y + 44 > tmpgidlocation.y) && parkourJumperTouchingFloor && (self.position.x + 0 >= tmpgidlocation.x - 11) && (self.position.x + 0 <= tmpgidlocation.x + 11) && col > 0) {
                                
                                self.parkourJumperAllowedToJump = YES;
                            }
                        }
                    }
                }
                
                                
                /*Check if ParkourJumper is touching Door*/
                /*
                 for (MovingDoors *movingDoor in movingDoorArray) {
                 
                 //Check if hidgon's bottom is touching door
                 if ((self.position.y - 11 < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y + 11 > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                 
                 //stop enemy's falling
                 self.enemyHidgonTouchingFloor = YES;
                 }
                 
                 //Hidgon touching door on top
                 if ((self.position.y + 11 > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y - 11 < movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                 
                 }
                 
                 //Check if Hidgon's left side is touching door
                 if ((self.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x - 11 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x - 11 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                 
                 self.enemyHidgonTouchingWallOnLeftSide = YES;
                 self.enemyHidgonWalkingRight = YES;
                 self.enemyHidgonWalkingLeft = NO;
                 }
                 
                 //Check if Hidgon's right side is touching door
                 if ((self.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x + 11 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x + 11 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                 
                 self.enemyHidgonTouchingWallOnRightSide = YES;
                 self.enemyHidgonWalkingRight = NO;
                 self.enemyHidgonWalkingLeft = YES;
                 }
                 }
                 */
            }
        }
        //End of ParkourJumper update methodf
        
        
        
        
        
        
        
        
        //Diagonal Flyer
        else if (enemyType == FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE) {
            
            if (isPaused == NO) {
                
                if (madAgentsAmount == 0) {
                    
                    walkingSpeed = 1.0;
                }
                
                else if (madAgentsAmount == 1) {
                    
                    walkingSpeed = 2.0;
                }
                
                if (madAgentsAmount == 0) {
                    
                    if (bulletTimeActive == NO) {
                        
                        walkingSpeed = 1.0;
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        walkingSpeed = walkingSpeed - bulletTimeSpeedReduction;
                        
                        if (walkingSpeed - bulletTimeSpeedReduction < 1) {
                            
                            walkingSpeed = 0.25;
                        }
                    }
                }
                
                else if (madAgentsAmount == 1) {
                    
                    if (bulletTimeActive == NO) {
                        
                        walkingSpeed = 2.0;
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        walkingSpeed = walkingSpeed - bulletTimeSpeedReduction;
                        
                        if (walkingSpeed - bulletTimeSpeedReduction < 2) {
                            
                            walkingSpeed = 0.5;
                        }
                    }
                }
                
                if (isCurrentlyTeleportingIn) {
                    
                    walkingSpeed = 0;
                }

                
                //Subroutine which makes DiagonalFlyer fly up, down, left, and right appropriately
                if ([self flyThroughWallsDiagonalFlyerMovingRight] && stunTimeValue == 0) {
                    
                    if (self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide == NO) {
                        
                        self.position = ccp(self.position.x + walkingSpeed, self.position.y);
                       // mySprite.flipX = NO;
                    }
                }
                
                if ([self flyThroughWallsDiagonalFlyerMovingLeft] && stunTimeValue == 0) {
                    
                    if (self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide == NO) {
                        
                        self.position = ccp(self.position.x - walkingSpeed, self.position.y);
                      //  mySprite.flipX = YES;
                    }
                }
                
                if ([self flyThroughWallsDiagonalFlyerMovingDown] && stunTimeValue == 0) {
                    
                    if (self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom == NO) {
                        
                        self.position = ccp(self.position.x, self.position.y - walkingSpeed);
                    }
                }
                
                if ([self flyThroughWallsDiagonalFlyerMovingUp] && stunTimeValue == 0) {
                    
                    if (self.flyThroughWallsDiagonalFlyerTouchingWallOnTop == NO) {
                        
                        self.position = ccp(self.position.x, self.position.y + walkingSpeed);
                    }
                }
                
                if (self.flyThroughWallsDiagonalFlyerStopped) {
                    
                    self.position = ccp(self.position.x, self.position.y);
                }
                
                //Determine which Fly-Through-Walls Diagonal Flyer Animation should be showing
                if ([self flyThroughWallsDiagonalFlyerMovingDown] && [self flyThroughWallsDiagonalFlyerMovingLeft]) {
                    
                    flyingDownLeft.visible = YES;
                    flyingDownRight.visible = NO;
                    flyingUpLeft.visible = NO;
                    flyingUpRight.visible = NO;
                    flyThroughWallsDiagonalFlyerStunned.visible = NO;
                }
                
                if ([self flyThroughWallsDiagonalFlyerMovingUp] && [self flyThroughWallsDiagonalFlyerMovingLeft]) {
                    
                    flyingDownLeft.visible = NO;
                    flyingDownRight.visible = NO;
                    flyingUpLeft.visible = YES;
                    flyingUpRight.visible = NO;
                    flyThroughWallsDiagonalFlyerStunned.visible = NO;
                }
                
                if ([self flyThroughWallsDiagonalFlyerMovingUp] && [self flyThroughWallsDiagonalFlyerMovingRight]) {
                    
                    flyingDownLeft.visible = NO;
                    flyingDownRight.visible = NO;
                    flyingUpLeft.visible = NO;
                    flyingUpRight.visible = YES;
                    flyThroughWallsDiagonalFlyerStunned.visible = NO;
                }
                
                if ([self flyThroughWallsDiagonalFlyerMovingDown] && [self flyThroughWallsDiagonalFlyerMovingRight]) {
                    
                    flyingDownLeft.visible = NO;
                    flyingDownRight.visible = YES;
                    flyingUpLeft.visible = NO;
                    flyingUpRight.visible = NO;
                    flyThroughWallsDiagonalFlyerStunned.visible = NO;
                }
                
                if (stunTimeValue > 0) {
                    
                    flyingDownLeft.visible = NO;
                    flyingDownRight.visible = NO;
                    flyingUpLeft.visible = NO;
                    flyingUpLeft.visible = NO;
                    flyThroughWallsDiagonalFlyerStunned.visible = YES;
                }
                
                
                self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = NO;
                self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = NO;
                self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = NO;
                self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = NO;
                
                
                //Check to see if enemy is touching a solid tile, which would make go in the opposite direction
                for (int row=0; row < [foreground layerSize].width; row++) {
                    
                    for (int col=0; col < [foreground layerSize].height; col++) {
                        
                        int tmpgid = [foreground tileGIDAt:ccp(row,col)];
                        
                        CGPoint tmpgidlocation = [foreground positionAt: ccp((row + 0.52), (col - 0.49))];
                        /*
                        if (tmpgid != 0 && (col == 0 || col == 19 || row == 0 || row == 29)) {
                            
                            float flyThroughWallsDiagonalFlyerCollisionBoxSize = 11.0;
                            
                            if ((self.position.y - flyThroughWallsDiagonalFlyerCollisionBoxSize < tmpgidlocation.y + 11) && (self.position.y + flyThroughWallsDiagonalFlyerCollisionBoxSize > tmpgidlocation.y - 11) && (self.position.x - 0 < tmpgidlocation.x + 11) && (self.position.x + 0 > tmpgidlocation.x - 11)) {
                                
                                //Diagonal Flyer touching wall on bottom
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = NO;
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = YES;
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = NO;
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = NO;
                                
                                self.flyThroughWallsDiagonalFlyerMovingUp = YES;
                                self.flyThroughWallsDiagonalFlyerMovingDown = NO;
                            }
                            
                            //Diagonal Flyer touching wall on top
                            if ((self.position.y + flyThroughWallsDiagonalFlyerCollisionBoxSize > tmpgidlocation.y - 11) && (self.position.y - flyThroughWallsDiagonalFlyerCollisionBoxSize < tmpgidlocation.y - 11) && (self.position.x - 0 < tmpgidlocation.x + 11) && (self.position.x + 0 > tmpgidlocation.x - 11)) {
                                
                                //Diagonal Flyer touching wall on top
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = YES;
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = NO;
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = NO;
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = NO;
                                
                                self.flyThroughWallsDiagonalFlyerMovingUp = NO;
                                self.flyThroughWallsDiagonalFlyerMovingDown = YES;
                            }
                            
                            //check if enemy's right side is touching wall
                            if ((self.position.y < tmpgidlocation.y + 11) && (self.position.y  > tmpgidlocation.y - 11) && (self.position.x + flyThroughWallsDiagonalFlyerCollisionBoxSize < tmpgidlocation.x + 11) && (self.position.x + flyThroughWallsDiagonalFlyerCollisionBoxSize > tmpgidlocation.x - 11)) {
                                
                                //Diagonal Flyer touching wall on right side
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = NO;
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = NO;
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = YES;
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = NO;
                                
                                self.flyThroughWallsDiagonalFlyerMovingRight = NO;
                                self.flyThroughWallsDiagonalFlyerMovingLeft = YES;
                            }
                            
                            //check if enemy's left side is touching wall
                            if ((self.position.y  < tmpgidlocation.y + 11) && (self.position.y  > tmpgidlocation.y - 11) && (self.position.x - flyThroughWallsDiagonalFlyerCollisionBoxSize < tmpgidlocation.x + 11) && (self.position.x - flyThroughWallsDiagonalFlyerCollisionBoxSize > tmpgidlocation.x - 11)) {
                                
                                //Diagonal Flyer touching wall on left side
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = NO;
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = NO;
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = NO;
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = YES;
                                
                                self.flyThroughWallsDiagonalFlyerMovingRight = YES;
                                self.flyThroughWallsDiagonalFlyerMovingLeft = NO;
                            }
                        }
                         */
                    }
                }
                
                //Check to see if enemy is touching a solid tile, which would make go in the opposite direction
                for (int row=0; row < [solidBricks layerSize].width; row++) {
                    
                    for (int col=0; col < [solidBricks layerSize].height; col++) {
                        
                        int tmpgid = [solidBricks tileGIDAt:ccp(row,col)];
                        
                        CGPoint tmpgidlocation = [solidBricks positionAt: ccp((row + 0.52), (col - 0.49))];
                        
                        if (tmpgid != 0) {
                            
                            float flyThroughWallsDiagonalFlyerCollisionBoxSize = 11.0;
                            
                            if ((self.position.y - flyThroughWallsDiagonalFlyerCollisionBoxSize < tmpgidlocation.y + 11) && (self.position.y + flyThroughWallsDiagonalFlyerCollisionBoxSize > tmpgidlocation.y - 11) && (self.position.x - 0 < tmpgidlocation.x + 11) && (self.position.x + 0 > tmpgidlocation.x - 11)) {
                                
                                //FlyThroughWalls Diagonal Flyer touching wall on bottom
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = NO;
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = YES;
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = NO;
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = NO;
                                
                                self.flyThroughWallsDiagonalFlyerMovingUp = YES;
                                self.flyThroughWallsDiagonalFlyerMovingDown = NO;
                            }
                            
                            //Diagonal Flyer touching wall on top
                            if ((self.position.y + flyThroughWallsDiagonalFlyerCollisionBoxSize > tmpgidlocation.y - 11) && (self.position.y - flyThroughWallsDiagonalFlyerCollisionBoxSize < tmpgidlocation.y - 11) && (self.position.x - 0 < tmpgidlocation.x + 11) && (self.position.x + 0 > tmpgidlocation.x - 11)) {
                                
                                //FlyThroughWalls Diagonal Flyer touching wall on top
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = YES;
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = NO;
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = NO;
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = NO;
                                
                                self.flyThroughWallsDiagonalFlyerMovingUp = NO;
                                self.flyThroughWallsDiagonalFlyerMovingDown = YES;
                            }
                            
                            //check if enemy's right side is touching wall
                            if ((self.position.y < tmpgidlocation.y + 11) && (self.position.y  > tmpgidlocation.y - 11) && (self.position.x + flyThroughWallsDiagonalFlyerCollisionBoxSize < tmpgidlocation.x + 11) && (self.position.x + flyThroughWallsDiagonalFlyerCollisionBoxSize > tmpgidlocation.x - 11)) {
                                
                                //FlyThroughWalls Diagonal Flyer touching wall on right side
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = NO;
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = NO;
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = YES;
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = NO;
                                
                                self.flyThroughWallsDiagonalFlyerMovingRight = NO;
                                self.flyThroughWallsDiagonalFlyerMovingLeft = YES;
                            }
                            
                            //check if enemy's left side is touching wall
                            if ((self.position.y  < tmpgidlocation.y + 11) && (self.position.y  > tmpgidlocation.y - 11) && (self.position.x - flyThroughWallsDiagonalFlyerCollisionBoxSize < tmpgidlocation.x + 11) && (self.position.x - flyThroughWallsDiagonalFlyerCollisionBoxSize > tmpgidlocation.x - 11)) {
                                
                                //FlyThroughWalls Diagonal Flyer touching wall on left side
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = NO;
                                //self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = NO;
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = NO;
                                self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = YES;
                                
                                self.flyThroughWallsDiagonalFlyerMovingRight = YES;
                                self.flyThroughWallsDiagonalFlyerMovingLeft = NO;
                            }
                        }
                    }
                }
                /*
                //Check if fly-through-walls-diagonal-flyer is touching door
                //Check if fly-through-walls-diagonal-flyer bottom is touching door
                for (MovingDoors *movingDoor in movingDoorArray) {
                    
                    if ((self.position.y - 11 < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y + 11 > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                                            
                        //FlyThroughWalls Diagonal Flyer touching door on bottom
                        self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = NO;
                        self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = YES;
                        //self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = NO;
                        //self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = NO;
                        
                        self.flyThroughWallsDiagonalFlyerMovingUp = YES;
                        self.flyThroughWallsDiagonalFlyerMovingDown = NO;
                    }
                    
                    //Check if fly-through-walls-diagonal-flyer's top is touching a door
                    if ((self.position.y + 11 > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y - 11 < movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                        
                        NSLog (@"2");
                        
                        //FlyThroughWalls Diagonal Flyer touching wall on top
                        self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = YES;
                        self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = NO;
                        //self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = NO;
                        //self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = NO;
                        
                        self.flyThroughWallsDiagonalFlyerMovingUp = NO;
                        self.flyThroughWallsDiagonalFlyerMovingDown = YES;
                    }
                    
                    //Check if fly-through-walls-diagonal-flyer's left side is touching door
                    if ((self.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x - 11 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x - 11 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                                            
                        //FlyThroughWalls Diagonal Flyer touching door on right side
                        //self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = NO;
                        //self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = NO;
                        self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = YES;
                        self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = NO;
                        
                        self.flyThroughWallsDiagonalFlyerMovingRight = NO;
                        self.flyThroughWallsDiagonalFlyerMovingLeft = YES;
                    }
                    
                    //Check if fly-through-walls-diagonal-flyer's right side is touching door
                    if ((self.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x + 11 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x + 11 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                                            
                        //FlyThroughWalls Diagonal Flyer touching door on left side
                        //self.flyThroughWallsDiagonalFlyerTouchingWallOnTop = NO;
                        //self.flyThroughWallsDiagonalFlyerTouchingWallOnBottom = NO;
                        self.flyThroughWallsDiagonalFlyerTouchingWallOnRightSide = NO;
                        self.flyThroughWallsDiagonalFlyerTouchingWallOnLeftSide = YES;
                        
                        self.flyThroughWallsDiagonalFlyerMovingRight = YES;
                        self.flyThroughWallsDiagonalFlyerMovingLeft = NO;
                    }
                }
                 */
            }
        }
        
        
        
        //FlyThroughWalls Diagonal Flyer
        else if (enemyType == DIAGONAL_FLYER_TYPE) {
            
            if (isPaused == NO) {
                
                if (madAgentsAmount == 0) {
                    
                    walkingSpeed = 1.0;
                }
                
                else if (madAgentsAmount == 1) {
                    
                    walkingSpeed = 2.0;
                }
                
                if (madAgentsAmount == 0) {
                    
                    if (bulletTimeActive == NO) {
                        
                        walkingSpeed = 1.0;
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        walkingSpeed = walkingSpeed - bulletTimeSpeedReduction;
                        
                        if (walkingSpeed - bulletTimeSpeedReduction < 1) {
                            
                            walkingSpeed = 0.25;
                        }
                    }
                }
                
                else if (madAgentsAmount == 1) {
                    
                    if (bulletTimeActive == NO) {
                        
                        walkingSpeed = 2.0;
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        walkingSpeed = walkingSpeed - bulletTimeSpeedReduction;
                        
                        if (walkingSpeed - bulletTimeSpeedReduction < 2) {
                            
                            walkingSpeed = 0.5;
                        }
                    }
                }

                if (isCurrentlyTeleportingIn) {
                    
                    walkingSpeed = 0;
                }
                
                //Subroutine which makes DiagonalFlyer fly up, down, left, and right appropriately
                if ([self enemyDiagonalFlyerMovingRight] && stunTimeValue == 0) {
                    
                    if (self.enemyDiagonalFlyerTouchingWallOnRightSide == NO) {
                        
                        self.position = ccp(self.position.x + walkingSpeed, self.position.y);
                        //    mySprite.flipX = NO;
                    }
                }
                
                if ([self enemyDiagonalFlyerMovingLeft] && stunTimeValue == 0) {
                    
                    if (self.enemyDiagonalFlyerTouchingWallOnLeftSide == NO) {
                        
                        self.position = ccp(self.position.x - walkingSpeed, self.position.y);
                        //    mySprite.flipX = YES;
                    }
                }
                
                if ([self enemyDiagonalFlyerMovingDown] && stunTimeValue == 0) {
                    
                    if (self.enemyDiagonalFlyerTouchingWallOnBottom == NO) {
                        
                        self.position = ccp(self.position.x, self.position.y - walkingSpeed);
                    }
                }
                
                if ([self enemyDiagonalFlyerMovingUp] && stunTimeValue == 0) {
                    
                    if (self.enemyDiagonalFlyerTouchingWallOnTop == NO) {
                        
                        self.position = ccp(self.position.x, self.position.y + walkingSpeed);
                    }
                }
                
                
                
                //Determine which Diagonal Flyer Sprite should be showing
                if ([self enemyDiagonalFlyerMovingDown] && [self enemyDiagonalFlyerMovingLeft] && stunTimeValue == 0) {
                    
                    flyingDownLeft.visible = YES;
                    flyingDownRight.visible = NO;
                    flyingUpLeft.visible = NO;
                    flyingUpRight.visible = NO;
                    diagonalFlyerStunned.visible = NO;
                }
                
                if ([self enemyDiagonalFlyerMovingUp] && [self enemyDiagonalFlyerMovingLeft] && stunTimeValue == 0) {
                    
                    flyingDownLeft.visible = NO;
                    flyingDownRight.visible = NO;
                    flyingUpLeft.visible = YES;
                    flyingUpRight.visible = NO;
                    diagonalFlyerStunned.visible = NO;
                }
                
                if ([self enemyDiagonalFlyerMovingUp] && [self enemyDiagonalFlyerMovingRight] && stunTimeValue == 0) {
                    
                    flyingDownLeft.visible = NO;
                    flyingDownRight.visible = NO;
                    flyingUpLeft.visible = NO;
                    flyingUpRight.visible = YES;
                    diagonalFlyerStunned.visible = NO;
                }
                
                if ([self enemyDiagonalFlyerMovingDown] && [self enemyDiagonalFlyerMovingRight] && stunTimeValue == 0) {
                    
                    flyingDownLeft.visible = NO;
                    flyingDownRight.visible = YES;
                    flyingUpLeft.visible = NO;
                    flyingUpRight.visible = NO;
                    diagonalFlyerStunned.visible = NO;
                }
                
                if (stunTimeValue > 0) {
                    
                    diagonalFlyerStunned.visible = YES;
                    flyingDownLeft.visible = NO;
                    flyingDownRight.visible = NO;
                    flyingUpLeft.visible = NO;
                    flyingUpLeft.visible = NO;
                }
                
                
                if (self.enemyDiagonalFlyerStopped) {
                    
                    self.position = ccp(self.position.x, self.position.y);
                }
                
                self.enemyDiagonalFlyerTouchingWallOnTop = NO;
                self.enemyDiagonalFlyerTouchingWallOnBottom = NO;
                self.enemyDiagonalFlyerTouchingWallOnRightSide = NO;
                self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                
                
                //Check to see if enemy is touching a solid tile, which would make go in the opposite direction
                for (int row=0; row < [foreground layerSize].width; row++) {
                    
                    for (int col=0; col < [foreground layerSize].height; col++) {
                        
                        int tmpgid = [foreground tileGIDAt:ccp(row,col)];
                        
                        CGPoint tmpgidlocation = [foreground positionAt: ccp((row + 0.52), (col - 0.49))];
                        
                        if (tmpgid != 0) {
                            
                            float diagonalFlyerCollisionBoxSize = 11.0;
                            
                            if ((self.position.y - diagonalFlyerCollisionBoxSize < tmpgidlocation.y + 11) && (self.position.y + diagonalFlyerCollisionBoxSize > tmpgidlocation.y - 11) && (self.position.x - 0 < tmpgidlocation.x + 11) && (self.position.x + 0 > tmpgidlocation.x - 11)) {
                                
                                //Diagonal Flyer touching wall on bottom
                                self.enemyDiagonalFlyerTouchingWallOnTop = NO;
                                self.enemyDiagonalFlyerTouchingWallOnBottom = YES;
                                //self.enemyDiagonalFlyerTouchingWallOnRightSide = NO;
                                //self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                                
                                self.enemyDiagonalFlyerMovingUp = YES;
                                self.enemyDiagonalFlyerMovingDown = NO;
                            }
                            
                            //Diagonal Flyer touching wall on top
                            if ((self.position.y + diagonalFlyerCollisionBoxSize > tmpgidlocation.y - 11) && (self.position.y - diagonalFlyerCollisionBoxSize < tmpgidlocation.y - 11) && (self.position.x - 0 < tmpgidlocation.x + 11) && (self.position.x + 0 > tmpgidlocation.x - 11)) {
                                
                                //Diagonal Flyer touching wall on top
                                self.enemyDiagonalFlyerTouchingWallOnTop = YES;
                                self.enemyDiagonalFlyerTouchingWallOnBottom = NO;
                                //self.enemyDiagonalFlyerTouchingWallOnRightSide = NO;
                                //self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                                
                                self.enemyDiagonalFlyerMovingUp = NO;
                                self.enemyDiagonalFlyerMovingDown = YES;
                            }
                            
                            //check if enemy's right side is touching wall
                            if ((self.position.y < tmpgidlocation.y + 11) && (self.position.y  > tmpgidlocation.y - 11) && (self.position.x + diagonalFlyerCollisionBoxSize < tmpgidlocation.x + 11) && (self.position.x + diagonalFlyerCollisionBoxSize > tmpgidlocation.x - 11)) {
                                
                                //Diagonal Flyer touching wall on right side
                                //self.enemyDiagonalFlyerTouchingWallOnTop = NO;
                                //self.enemyDiagonalFlyerTouchingWallOnBottom = NO;
                                self.enemyDiagonalFlyerTouchingWallOnRightSide = YES;
                                self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                                
                                self.enemyDiagonalFlyerMovingRight = NO;
                                self.enemyDiagonalFlyerMovingLeft = YES;
                            }
                            
                            //check if enemy's left side is touching wall
                            if ((self.position.y  < tmpgidlocation.y + 11) && (self.position.y  > tmpgidlocation.y - 11) && (self.position.x - diagonalFlyerCollisionBoxSize < tmpgidlocation.x + 11) && (self.position.x - diagonalFlyerCollisionBoxSize > tmpgidlocation.x - 11)) {
                                
                                //Diagonal Flyer touching wall on left side
                                //self.enemyDiagonalFlyerTouchingWallOnTop = NO;
                                //self.enemyDiagonalFlyerTouchingWallOnBottom = NO;
                                self.enemyDiagonalFlyerTouchingWallOnRightSide = NO;
                                self.enemyDiagonalFlyerTouchingWallOnLeftSide = YES;
                                
                                self.enemyDiagonalFlyerMovingRight = YES;
                                self.enemyDiagonalFlyerMovingLeft = NO;
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
                            
                            if ((self.position.y - 11 < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x < tmpgidlocation.x + 11) && (self.position.x > tmpgidlocation.x - 11)) {
                                
                                //Diagonal Flyer touching wall on bottom
                                self.enemyDiagonalFlyerTouchingWallOnTop = NO;
                                self.enemyDiagonalFlyerTouchingWallOnBottom = YES;
                                self.enemyDiagonalFlyerTouchingWallOnRightSide = NO;
                                self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                                
                                self.enemyDiagonalFlyerMovingUp = YES;
                                self.enemyDiagonalFlyerMovingDown = NO;
                            }
                            
                            //Diagonal Flyer touching wall on top
                            if ((self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.y - 11 < tmpgidlocation.y - 11) && (self.position.x < tmpgidlocation.x + 11) && (self.position.x > tmpgidlocation.x - 11)) {
                                
                                //Diagonal Flyer touching wall on top
                                self.enemyDiagonalFlyerTouchingWallOnTop = YES;
                                self.enemyDiagonalFlyerTouchingWallOnBottom = NO;
                                self.enemyDiagonalFlyerTouchingWallOnRightSide = NO;
                                self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                                
                                self.enemyDiagonalFlyerMovingUp = NO;
                                self.enemyDiagonalFlyerMovingDown = YES;
                            }
                            
                            //check if enemy's right side is touching wall
                            if ((self.position.y < tmpgidlocation.y + 11) && (self.position.y > tmpgidlocation.y - 11) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                                
                                //Diagonal Flyer touching wall on right side
                                self.enemyDiagonalFlyerTouchingWallOnTop = NO;
                                self.enemyDiagonalFlyerTouchingWallOnBottom = NO;
                                self.enemyDiagonalFlyerTouchingWallOnRightSide = YES;
                                self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                                
                                self.enemyDiagonalFlyerMovingRight = NO;
                                self.enemyDiagonalFlyerMovingLeft = YES;
                            }
                            
                            //check if enemy's left side is touching wall
                            if ((self.position.y < tmpgidlocation.y + 11) && (self.position.y > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x - 11 > tmpgidlocation.x - 11)) {
                                
                                //Diagonal Flyer touching wall on left side
                                self.enemyDiagonalFlyerTouchingWallOnTop = NO;
                                self.enemyDiagonalFlyerTouchingWallOnBottom = NO;
                                self.enemyDiagonalFlyerTouchingWallOnRightSide = NO;
                                self.enemyDiagonalFlyerTouchingWallOnLeftSide = YES;
                                
                                self.enemyDiagonalFlyerMovingRight = YES;
                                self.enemyDiagonalFlyerMovingLeft = NO;
                            }
                        }
                    }
                }
                
                /*Check if Diagonal_Flyer is going to collide with door*/
                //Check if Diagonal_flyer's bottom is touching door
                for (MovingDoors *movingDoor in movingDoorArray) {
                
                    if ((self.position.y - 11 < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y + 11 > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                        
                        NSLog (@"1");
                        
                        //Diagonal Flyer touching door on bottom
                        self.enemyDiagonalFlyerTouchingWallOnTop = NO;
                        self.enemyDiagonalFlyerTouchingWallOnBottom = YES;
                        self.enemyDiagonalFlyerTouchingWallOnRightSide = NO;
                        self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                        
                        self.enemyDiagonalFlyerMovingUp = YES;
                        self.enemyDiagonalFlyerMovingDown = NO;
                    }
                    
                    //Check if DiagonalFlyer's top is touching a door
                    if ((self.position.y + 11 > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y - 11 < movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                        
                        NSLog (@"2");
                        
                        //Diagonal Flyer touching door on top
                        self.enemyDiagonalFlyerTouchingWallOnTop = YES;
                        self.enemyDiagonalFlyerTouchingWallOnBottom = NO;
                        self.enemyDiagonalFlyerTouchingWallOnRightSide = NO;
                        self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                        
                        self.enemyDiagonalFlyerMovingUp = NO;
                        self.enemyDiagonalFlyerMovingDown = YES;
                    }
                    
                    //Check if DiagonalFlyer's left side is touching door
                    if ((self.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x - 11 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x - 11 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                        
                        NSLog (@"3");
                        
                        //Diagonal Flyer touching door on left side
                        self.enemyDiagonalFlyerTouchingWallOnTop = NO;
                        self.enemyDiagonalFlyerTouchingWallOnBottom = NO;
                        self.enemyDiagonalFlyerTouchingWallOnRightSide = NO;
                        self.enemyDiagonalFlyerTouchingWallOnLeftSide = YES;
                        
                        self.enemyDiagonalFlyerMovingRight = YES;
                        self.enemyDiagonalFlyerMovingLeft = NO;
                    }
                    
                    //Check if DiagonalFlyer's right side is touching door
                    if ((self.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x + 11 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x + 11 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                        
                        NSLog (@"4");
                        
                        //Diagonal Flyer touching door on right side
                        self.enemyDiagonalFlyerTouchingWallOnTop = NO;
                        self.enemyDiagonalFlyerTouchingWallOnBottom = NO;
                        self.enemyDiagonalFlyerTouchingWallOnRightSide = YES;
                        self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                        
                        self.enemyDiagonalFlyerMovingRight = NO;
                        self.enemyDiagonalFlyerMovingLeft = YES;
                    }
                }
            }
        }
        
        
        
        //Skeleton Whale
        if (enemyType == SKELETON_WHALE_TYPE) {
            
            if (isPaused == NO) {
                
                if (madAgentsAmount == 0 && bulletTimeActive == NO) {
                    
                    walkingSpeed = 2.0;
                }
                
                else if (madAgentsAmount == 1 && bulletTimeActive == NO) {
                    
                    walkingSpeed = 3.0;
                }
                
                else if (madAgentsAmount == 0 && bulletTimeActive == YES) {
                                            
                    walkingSpeed = 1.0;
                }
                
                else if (madAgentsAmount == 1 && bulletTimeActive == YES) {
                    
                    walkingSpeed = 1.5;
                
                    /*else if (bulletTimeActive == YES) {
                        
                        walkingSpeed = walkingSpeed - bulletTimeSpeedReduction;
                        
                        if (walkingSpeed - bulletTimeSpeedReduction < 1) {
                            
                            walkingSpeed = 0.5;
                        }
                    }*/
                }
                
                else if (madAgentsAmount == 1) {
                    
                    if (bulletTimeActive == NO) {
                        
                        walkingSpeed = 3.0;
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        walkingSpeed = walkingSpeed - bulletTimeSpeedReduction;
                        
                        if (walkingSpeed - bulletTimeSpeedReduction < 2) {
                            
                            walkingSpeed = 1.3;
                        }
                    }
                }
                
                if (isCurrentlyTeleportingIn) {
                    
                    walkingSpeed = 0;
                }
                
                if (stunTimeValue > 0) {
                    
                    jetmanFlying.visible = NO;
                    jetmanStunned.visible = YES;
                }
                
                else if (stunTimeValue == 0) {
                    
                    jetmanFlying.visible = YES;
                    jetmanStunned.visible = NO;
                }
                
                //Subroutine which makes enemyHidgon walk back and forth and jump at random times
                if ([self enemySkeletonWhaleMovingRight] && stunTimeValue == 0) {
                    
                    self.position = ccp(self.position.x + walkingSpeed, self.position.y);
                    jetmanFlying.flipX = NO;
                    jetmanStunned.flipX = NO;
                    
                    if (skeletonWhaleFaceRightMessageAlreadySent == NO) {
                    
                        skeletonWhaleFaceRightMessageAlreadySent = YES;
                        skeletonWhaleFaceLeftMessageAlreadySent = NO;
                        
                        [(HelloWorldLayer*)theGame sendMakeSkeletonWhaleFaceRight: self.enemyReferenceNumber];
                    }
                }
                
                if ([self enemySkeletonWhaleMovingLeft] && stunTimeValue == 0) {
                    
                    self.position = ccp(self.position.x - walkingSpeed, self.position.y);
                    jetmanFlying.flipX = YES;
                    jetmanStunned.flipX = YES;
                    
                    if (skeletonWhaleFaceLeftMessageAlreadySent == NO) {
                        
                        skeletonWhaleFaceRightMessageAlreadySent = NO;
                        skeletonWhaleFaceLeftMessageAlreadySent = YES;
                    
                        [(HelloWorldLayer*)theGame sendMakeSkeletonWhaleFaceLeft: self.enemyReferenceNumber];
                    }
                }
                
                if ([self enemySkeletonWhaleMovingUp] && stunTimeValue == 0) {
                    
                    self.position = ccp(self.position.x, self.position.y + walkingSpeed);                    
                }
                
                if ([self enemySkeletonWhaleMovingDown] && stunTimeValue == 0) {
                    
                    self.position = ccp(self.position.x, self.position.y - walkingSpeed);                    
                }
                
                if (self.enemySkeletonWhaleStopped) {
                    
                    self.position = ccp(self.position.x, self.position.y);
                }
            }
        }
        
        //Chaser Enemy
        if (enemyType == CHASER_ENEMY_TYPE) {
            
            if (isPaused == NO) {
                
                if (!self.runningChaserEnemyTouchingFloor) {
                    
                    self.position = ccp(self.position.x, self.position.y - 2.0);
                }
                
                if (runningChaserIsChasingPlayer == NO) {
                    
                    if (madAgentsAmount == 0) {
                        
                        if (!isBoss) {
                        
                            walkingSpeed = 1.0;
                        }
                        
                        else if (isBoss) {
                            
                        //    walkingSpeed = 1.5;
                            walkingSpeed = 1.8;
                        }
                        
                        if (bulletTimeActive == YES) {
                            
                            if (!isBoss) {
                            
                                walkingSpeed = 0.25;
                            }
                            
                            else if (isBoss) {
                                
                                walkingSpeed = 0.375;
                            }
                        }
                    }
                    
                    else if (madAgentsAmount == 1) {
                        
                        if (!isBoss) {
                        
                            walkingSpeed = 2.0;
                        }
                        
                        else if (isBoss) {
                            
                            walkingSpeed = 3.0;
                        }
                        
                        if (bulletTimeActive == YES) {
                            
                            if (!isBoss) {
                            
                                walkingSpeed = 0.5;
                            }
                            
                            else if (isBoss) {
                                
                                walkingSpeed = 0.75;
                            }
                        }
                    }
                }
                
                if (isCurrentlyTeleportingIn) {
                    
                    walkingSpeed = 0;
                    
                    chaserRunning.visible = NO;
                    chaserWalking.visible = NO;
                    chaserStunned.visible = NO;
                    chaserStandingStillBored.visible = YES;
                    chaserStandingStillAngry.visible = NO;
                }
                
                if (chaserCanSeePlayer && stunTimeValue == 0) {
                    
                    chaserRunning.visible = YES;
                    chaserWalking.visible = NO;
                    chaserStunned.visible = NO;
                    chaserStandingStillBored.visible = NO;
                    chaserStandingStillAngry.visible = NO;
                }
                
                else if (!chaserCanSeePlayer && stunTimeValue == 0) {
                    
                    chaserRunning.visible = NO;
                    chaserWalking.visible = YES;
                    chaserStunned.visible = NO;
                    chaserStandingStillBored.visible = NO;
                    chaserStandingStillAngry.visible = NO;
                }
                
                else if (stunTimeValue > 0) {
                    
                    chaserRunning.visible = NO;
                    chaserWalking.visible = NO;
                    chaserStunned.visible = YES;
                    chaserStandingStillBored.visible = NO;
                    chaserStandingStillAngry.visible = NO;
                }
                
                //Subroutine which makes enemyHidgon walk back and forth
                if (self.runningChaserEnemyTouchingFloor == YES) {
                    
                    if ([self runningChaserEnemyWalkingRight] && stunTimeValue == 0) {
                        
                        if (self.runningChaserEnemyTouchingWallOnRightSide == NO) {
                            
                            self.position = ccp(self.position.x + walkingSpeed, self.position.y);
                            chaserRunning.flipX = NO;
                            chaserWalking.flipX = NO;
                            chaserStunned.flipX = NO;
                        }
                    }
                    
                    if ([self runningChaserEnemyWalkingLeft] && stunTimeValue == 0) {
                        
                        if (self.runningChaserEnemyTouchingWallOnLeftSide == NO) {
                            
                            self.position = ccp(self.position.x - walkingSpeed, self.position.y);
                            chaserRunning.flipX = YES;
                            chaserWalking.flipX = YES;
                            chaserStunned.flipX = YES;
                        }
                    }
                    
                    if (self.runningChaserEnemyStopped) {
                        
                        self.position = ccp(self.position.x, self.position.y);
                    }
                }
                
                
                self.runningChaserEnemyTouchingFloor = NO;
                self.runningChaserEnemyTouchingWallOnRightSide = NO;
                self.runningChaserEnemyTouchingWallOnLeftSide = NO;
                runningChaserIsChasingPlayer = NO;
                
                if (((runningChaserEnemyWalkingLeft && firstPlayerSprite.position.x < self.position.x) || (runningChaserEnemyWalkingRight && firstPlayerSprite.position.x > self.position.x)) && firstPlayerSprite.position.y < self.position.y + 70) {
                
                    chaserCanSeePlayer = YES;
                }
                
                else {
                    
                    chaserCanSeePlayer = NO;
                }

                
                //Check to see if enemy is touching a solid tile, which would make him stop falling
                for (int row=0; row < [foreground layerSize].width; row++) {
                    
                    for (int col=0; col < [foreground layerSize].height; col++) {
                        
                        int tmpgid = [foreground tileGIDAt:ccp(row,col)];
                        
                        CGPoint tmpgidlocation = [foreground positionAt: ccp((row + 0.52), (col - 0.49))];
 
                        
                        if (tmpgid != 0) {

                            //Determine if Chaser can see Player
                            if ([self doesLineStart:firstPlayerSprite.position andLineEnd:self.position rectangleLocation:tmpgidlocation]) {
                                
                                chaserCanSeePlayer = NO;
                            }

                            //Different bottom collision boundary for boss
                            int collisionBoundaryFeet;
                            
                            if (!isBoss) {
                                
                                collisionBoundaryFeet = 11;
                            }
                            
                            else if (isBoss) {
                                
                                collisionBoundaryFeet = 17;
                            }
                            
                            if ((self.position.y - collisionBoundaryFeet < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                                
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
                            if ((self.position.y - collisionBoundaryFeet < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - (-4) < tmpgidlocation.x + 11) && (self.position.x + (-4) > tmpgidlocation.x - 11)) {
                                
                                if (self.runningChaserEnemyWalkingRight && (row + 1 < 29) && [foreground tileGIDAt:ccp(row + 1,col)] == 0 && [solidBricks tileGIDAt:ccp(row + 1,col)] == 0) {
                                    
                                    self.runningChaserEnemyTouchingWallOnRightSide = YES;
                                    self.runningChaserEnemyWalkingRight = NO;
                                    self.runningChaserEnemyWalkingLeft = YES;
                                }
                                
                                else if (self.runningChaserEnemyWalkingLeft && (row + 1 < 29) && [foreground tileGIDAt:ccp(row - 1,col)] == 0 && [solidBricks tileGIDAt:ccp(row - 1,col)] == 0) {
                                    
                                    self.runningChaserEnemyTouchingWallOnLeftSide = YES;
                                    self.runningChaserEnemyWalkingRight = YES;
                                    self.runningChaserEnemyWalkingLeft = NO;
                                }
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
                            
                            if ([self doesLineStart:firstPlayerSprite.position andLineEnd:self.position rectangleLocation:tmpgidlocation]) {
                                
                                chaserCanSeePlayer = NO;
                            }

                            //Different bottom collision boundary for boss
                            int collisionBoundaryFeet;
                            
                            if (!isBoss) {
                                
                                collisionBoundaryFeet = 11;
                            }
                            
                            else if (isBoss) {
                                
                                collisionBoundaryFeet = 17;
                            }
                            
                            if ((self.position.y - collisionBoundaryFeet < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                                
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
                            if ((self.position.y - collisionBoundaryFeet < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - (-4) < tmpgidlocation.x + 11) && (self.position.x + (-4) > tmpgidlocation.x - 11)) {
                                
                                if (self.runningChaserEnemyWalkingRight && (row + 1 < 29) && [solidBricks tileGIDAt:ccp(row + 1,col)] == 0 && [foreground tileGIDAt:ccp(row + 1,col)] == 0) {
                                    
                                    self.runningChaserEnemyTouchingWallOnRightSide = YES;
                                    self.runningChaserEnemyWalkingRight = NO;
                                    self.runningChaserEnemyWalkingLeft = YES;
                                }
                                
                                else if (self.runningChaserEnemyWalkingLeft && (row + 1 < 29) && [solidBricks tileGIDAt:ccp(row - 1,col)] == 0 && [foreground tileGIDAt:ccp(row - 1,col)] == 0) {
                                    
                                    self.runningChaserEnemyTouchingWallOnLeftSide = YES;
                                    self.runningChaserEnemyWalkingRight = YES;
                                    self.runningChaserEnemyWalkingLeft = NO;
                                }
                            }
                        }
                    }
                }
                            
                //If player's sprite is within 'sight' range of runningChaser (on the right) then runningChaser's speed will increase
                if (chaserCanSeePlayer && self.stunTimeValue == 0) {
                    
                    runningChaserIsChasingPlayer = YES;
                    
                    if (madAgentsAmount == 0) {
                        
                        if (walkingSpeed < 2*walkingSpeed) {
                            
                            if (bulletTimeActive == NO) {
                                
                                walkingSpeed = walkingSpeed + 0.03;
                            }
                            
                            else if (bulletTimeActive == YES) {
                                
                                walkingSpeed = walkingSpeed + 0.015;
                            }
                        }
                    }
                    
                    else if (madAgentsAmount == 1) {
                        
                        if (walkingSpeed < 2*walkingSpeed) {
                            
                            if (bulletTimeActive == NO) {
                                
                                walkingSpeed = walkingSpeed + 0.06;
                            }
                            
                            else if (bulletTimeActive == YES) {
                                
                                walkingSpeed = walkingSpeed + 0.03;
                            }
                        }
                    }
                }
                
                //If player's sprite is within 'sight' range of runningChaser (on the left) then runningChaser's speed will increase
                if (chaserCanSeePlayer && self.stunTimeValue == 0) {
                    
                    runningChaserIsChasingPlayer = YES;
                    
                    if (madAgentsAmount == 0) {
                        
                        if (walkingSpeed < 2*walkingSpeed) {
                            
                            if (bulletTimeActive == NO) {
                                
                                walkingSpeed = walkingSpeed + 0.03;
                            }
                            
                            else if (bulletTimeActive == YES) {
                                
                                walkingSpeed = walkingSpeed + 0.015;
                            }
                        }
                    }
                    
                    else if (madAgentsAmount == 1) {
                        
                        if (walkingSpeed < 2*walkingSpeed) {
                            
                            if (bulletTimeActive == NO) {
                                
                                walkingSpeed = walkingSpeed + 0.06;
                            }
                            
                            else if (bulletTimeActive == YES) {
                                
                                walkingSpeed = walkingSpeed + 0.03;
                            }
                        }
                    }
                }
                
                if (isCurrentlyTeleportingIn) {
                    
                    walkingSpeed = 0;
                    
                    chaserRunning.visible = NO;
                    chaserWalking.visible = NO;
                    chaserStunned.visible = NO;
                    chaserStandingStillBored.visible = YES;
                    chaserStandingStillAngry.visible = NO;
                }
            }
        }
        
        
        //Downward shooter Enemy
        if (enemyType == DOWNWARD_SHOOTER_TYPE) {
            
            if (isPaused == NO) {
                
                if (!self.downwardShooterEnemyTouchingFloor) {
                    
                    self.position = ccp(self.position.x, self.position.y - 2.0);
                }
                
                if (madAgentsAmount == 0) {
                    
                    walkingSpeed = 1.5;
                }
                
                else if (madAgentsAmount == 1) {
                    
                    walkingSpeed = 3.0;
                }
                
                
                if (madAgentsAmount == 0) {
                    
                    if (bulletTimeActive == NO) {
                        
                        walkingSpeed = 1.5;
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        walkingSpeed = walkingSpeed - bulletTimeSpeedReduction;
                        
                        if (walkingSpeed - bulletTimeSpeedReduction < 1) {
                            
                            walkingSpeed = 0.375;
                        }
                    }
                }
                
                else if (madAgentsAmount == 1) {
                    
                    if (bulletTimeActive == NO) {
                        
                        walkingSpeed = 3.0;
                    }
                    
                    else if (bulletTimeActive == YES) {
                        
                        walkingSpeed = walkingSpeed - bulletTimeSpeedReduction;
                        
                        if (walkingSpeed - bulletTimeSpeedReduction < 2) {
                            
                            walkingSpeed = 0.75;
                        }
                    }
                }

                if (isCurrentlyTeleportingIn) {
                    
                    walkingSpeed = 0;                    
                }
                
                if (stunTimeValue > 0) {
                    
                    saucerFlying.visible = NO;
                    saucerStunned.visible = YES;
                }
                
                else if (stunTimeValue == 0) {
                    
                    saucerFlying.visible = YES;
                    saucerStunned.visible = NO;
                }
                
                //Subroutine which makes downwardShooter walk back and forth
                if (self.downwardShooterEnemyTouchingFloor == YES) {
                    
                    if ([self downwardShooterEnemyWalkingRight] && stunTimeValue == 0) {
                        
                        if (self.downwardShooterEnemyTouchingWallOnRightSide == NO) {
                            
                            self.position = ccp(self.position.x + walkingSpeed, self.position.y);
                            //mySprite.flipX = NO;
                        }
                    }
                    
                    if ([self downwardShooterEnemyWalkingLeft] && stunTimeValue == 0) {
                        
                        if (self.downwardShooterEnemyTouchingWallOnLeftSide == NO) {
                            
                            self.position = ccp(self.position.x - walkingSpeed, self.position.y);
                            //mySprite.flipX = YES;
                        }
                    }
                    
                    if (self.downwardShooterEnemyStopped) {
                        
                        self.position = ccp(self.position.x, self.position.y);
                    }
                }
                
                
                self.downwardShooterEnemyTouchingFloor = NO;
                self.downwardShooterEnemyTouchingWallOnRightSide = NO;
                self.downwardShooterEnemyTouchingWallOnLeftSide = NO;
                
                
                //Check to see if enemy is touching a solid tile, which would make him stop falling
                for (int row=0; row < [foreground layerSize].width; row++) {
                    
                    for (int col=0; col < [foreground layerSize].height; col++) {
                        
                        int tmpgid = [foreground tileGIDAt:ccp(row,col)];
                        
                        CGPoint tmpgidlocation = [foreground positionAt: ccp((row + 0.52), (col - 0.49))];
                        
                        if (tmpgid != 0) {
                            
                            if ((self.position.y - 11 < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                                
                                //stop enemy's falling
                                self.downwardShooterEnemyTouchingFloor = YES;
                            }
                            
                            //check if enemy's right side is touching wall
                            if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                                
                                self.downwardShooterEnemyTouchingWallOnRightSide = YES;
                                self.downwardShooterEnemyWalkingRight = NO;
                                self.downwardShooterEnemyWalkingLeft = YES;
                            }
                            
                            //check if enemy's left side is touching wall
                            if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x - 11 > tmpgidlocation.x - 11)) {
                                
                                self.downwardShooterEnemyTouchingWallOnLeftSide = YES;
                                self.downwardShooterEnemyWalkingRight = YES;
                                self.downwardShooterEnemyWalkingLeft = NO;
                            }
                        }
                    }
                }
                
                
                
                //Check to see if DownwardShooter is touching an impenetrable solidbrick tile, which would make him stop falling
                for (int row=0; row < [solidBricks layerSize].width; row++) {
                    
                    for (int col=0; col < [solidBricks layerSize].height; col++) {
                        
                        int tmpgid = [solidBricks tileGIDAt:ccp(row,col)];
                        
                        CGPoint tmpgidlocation = [solidBricks positionAt: ccp((row + 0.52), (col - 0.49))];
                        
                        if (tmpgid != 0) {
                            
                            if ((self.position.y - 11 < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                                
                                //stop enemy's falling
                                self.downwardShooterEnemyTouchingFloor = YES;
                            }
                            
                            //check if enemy's right side is touching wall
                            if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                                
                                self.downwardShooterEnemyTouchingWallOnRightSide = YES;
                                self.downwardShooterEnemyWalkingRight = NO;
                                self.downwardShooterEnemyWalkingLeft = YES;
                            }
                            
                            //check if enemy's left side is touching wall
                            if ((self.position.y - 0 < tmpgidlocation.y + 11) && (self.position.y + 0 > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x - 11 > tmpgidlocation.x - 11)) {
                                
                                self.downwardShooterEnemyTouchingWallOnLeftSide = YES;
                                self.downwardShooterEnemyWalkingRight = YES;
                                self.downwardShooterEnemyWalkingLeft = NO;
                            }
                        }
                    }
                }
                
                //Check if downward shooter is touching door
                /*Check if Downward Shooter is touching Door*/
                for (MovingDoors *movingDoor in movingDoorArray) {
                    
                    //Check if Downward Shooter's bottom is touching door
                    if ((self.position.y - 11 < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y + 11 > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                        
                        //stop enemy's falling
                        self.downwardShooterEnemyTouchingFloor = YES;
                    }
                    /*
                     //Downward Shooter touching door on top
                     if ((self.position.y + 11 > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y - 11 < movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                     
                     }
                     */
                    //Check if Downward Shooter's left side is touching door
                    if ((self.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x - 11 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x - 11 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                        
                        self.downwardShooterEnemyTouchingWallOnLeftSide = YES;
                        self.downwardShooterEnemyWalkingRight = YES;
                        self.downwardShooterEnemyWalkingLeft = NO;
                    }
                    
                    //Check if Downward Shooter's right side is touching door
                    if ((self.position.y < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x + 11 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x + 11 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                        
                        self.downwardShooterEnemyTouchingWallOnRightSide = YES;
                        self.downwardShooterEnemyWalkingRight = NO;
                        self.downwardShooterEnemyWalkingLeft = YES;
                    }
                }
            }
        }

        
        
        if (self.stunTimeValue == 0) {
            
            stunTimerLabel.visible = NO;
            
            //If enemy is boss and stunTimeValue is zero, then set boss to be 'punchable' again
            if (isBoss) {
                
                bossAlreadyPunched = NO;
            }
        }
        
        if (self.friendlyTimeValue == 0) {
            
            friendlyTimerLabel.visible = NO;
        }
        
        if (stunTimeValue == 0 & friendlyTimeValue == 0 && isCurrentlyTeleportingIn == NO) {
            
            if (madAgentsAmount == 0) {
            
                if (self.enemyType == PARKOUR_JUMPER_TYPE) {
                    
                    ninjaJumping.color = ccWHITE;
                    ninjaRunning.color = ccWHITE;
                    ninjaStandingStill.color = ccWHITE;
                    ninjaStunned.color = ccWHITE;
                }
                
                if (self.enemyType == HIDGON_ENEMY_TYPE) {
                    
                    gunnerWalking.color = ccWHITE;
                    gunnerStandingStill.color = ccWHITE;
                    gunnerStunned.color = ccWHITE;
                }
                
                if (self.enemyType == SKELETON_WHALE_TYPE) {
                    
                    jetmanFlying.color = ccWHITE;
                    jetmanStunned.color = ccWHITE;
                }
                
                if (self.enemyType == DIAGONAL_FLYER_TYPE) {
                    
                    flyingDownLeft.color = ccWHITE;
                    flyingDownRight.color = ccWHITE;
                    flyingUpLeft.color = ccWHITE;
                    flyingUpRight.color = ccWHITE;
                }
                
                if (self.enemyType == FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE) {
                    
                    flyingDownLeft.color = ccWHITE;
                    flyingDownRight.color = ccWHITE;
                    flyingUpLeft.color = ccWHITE;
                    flyingUpRight.color = ccWHITE;
                }
                
                if (self.enemyType == CHASER_ENEMY_TYPE) {
                    
                    chaserWalking.color = ccWHITE;
                    chaserRunning.color = ccWHITE;
                    chaserStunned.color = ccWHITE;
                    chaserStandingStillBored.color = ccWHITE;
                    chaserStandingStillAngry.color = ccWHITE;
                }
                
                if (self.enemyType == DOWNWARD_SHOOTER_TYPE) {
                    
                    saucerFlying.color = ccWHITE;
                }
            }
            
            else if (madAgentsAmount == 1) {
                
                
                if (self.enemyType == PARKOUR_JUMPER_TYPE) {
                    
                    ninjaJumping.color = ccc3(255, 69, 0);
                    ninjaRunning.color = ccc3(255, 69, 0);
                    ninjaStandingStill.color = ccc3(255, 69, 0);
                    ninjaStunned.color = ccc3(255, 69, 0);
                }
                
                if (self.enemyType == HIDGON_ENEMY_TYPE) {
                    
                    gunnerWalking.color = ccc3(255, 69, 0);
                    gunnerStandingStill.color = ccc3(255, 69, 0);
                    gunnerStunned.color = ccc3(255, 69, 0);
                }
                
                if (self.enemyType == SKELETON_WHALE_TYPE) {
                    
                    jetmanFlying.color = ccc3(255, 69, 0);
                    jetmanStunned.color = ccc3(255, 69, 0);
                }
                
                if (self.enemyType == DIAGONAL_FLYER_TYPE) {
                    
                    flyingDownLeft.color = ccc3(255, 69, 0);
                    flyingDownRight.color = ccc3(255, 69, 0);
                    flyingUpLeft.color = ccc3(255, 69, 0);
                    flyingUpRight.color = ccc3(255, 69, 0);
                }
                
                if (self.enemyType == FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE) {
                    
                    flyingDownLeft.color = ccc3(255, 69, 0);
                    flyingDownRight.color = ccc3(255, 69, 0);
                    flyingUpLeft.color = ccc3(255, 69, 0);
                    flyingUpRight.color = ccc3(255, 69, 0);
                }
                
                if (self.enemyType == CHASER_ENEMY_TYPE) {
                    
                    chaserWalking.color = ccc3(255, 69, 0);
                    chaserRunning.color = ccc3(255, 69, 0);
                    chaserStunned.color = ccc3(255, 69, 0);
                    chaserStandingStillBored.color = ccc3(255, 69, 0);
                    chaserStandingStillAngry.color = ccc3(255, 69, 0);
                }
                
                if (self.enemyType == DOWNWARD_SHOOTER_TYPE) {
                    
                    saucerFlying.color = ccc3(255, 69, 0);
                    saucerStunned.color = ccc3(255, 69, 0);
                }
            }
        }

        
        //If enemy is stunned, then it turns blue and can't move
        if (self.stunTimeValue > 0) {
            
            self.position = ccp(self.position.x, self.position.y);
            
            self.mySprite.color = ccc3(30, 144, 255);
            self.stunTimerLabel.visible = YES;
            self.friendlyTimerLabel.visible = NO;
            
            if (enemyKnockedOutOfTheArena) {
                
                self.stunTimerLabel.visible = NO;
                self.friendlyTimerLabel.visible = NO;
            }
            
            self.friendlyTimeValue = 0;
            
            
            if (self.enemyType == PARKOUR_JUMPER_TYPE) {
                
                ninjaJumping.color = ccc3(30, 144, 255);
                ninjaRunning.color = ccc3(30, 144, 255);
                ninjaStandingStill.color = ccc3(30, 144, 255);
                ninjaStunned.color = ccc3(30, 144, 255);
            }
            
            if (self.enemyType == HIDGON_ENEMY_TYPE) {
                
                gunnerWalking.color = ccc3(30, 144, 255);
                gunnerStandingStill.color = ccc3(30, 144, 255);
                gunnerStunned.color = ccc3(30, 144, 255);
            }
            
            if (self.enemyType == SKELETON_WHALE_TYPE) {
                
                jetmanFlying.color = ccc3(30, 144, 255);
                jetmanStunned.color = ccc3(30, 144, 255);
            }
            
            if (self.enemyType == DIAGONAL_FLYER_TYPE) {
                
                flyingDownLeft.color = ccc3(30, 144, 255);
                flyingDownRight.color = ccc3(30, 144, 255);
                flyingUpLeft.color = ccc3(30, 144, 255);
                flyingUpRight.color = ccc3(30, 144, 255);
                diagonalFlyerStunned.color = ccc3(150, 0, 255);
            }
            
            if (self.enemyType == FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE) {
                
                flyingDownLeft.color = ccc3(30, 144, 255);
                flyingDownRight.color = ccc3(30, 144, 255);
                flyingUpLeft.color = ccc3(30, 144, 255);
                flyingUpRight.color = ccc3(30, 144, 255);
                flyThroughWallsDiagonalFlyerStunned.color = ccc3(150, 0, 255);
            }
            
            if (self.enemyType == CHASER_ENEMY_TYPE) {
                
                chaserWalking.color = ccc3(30, 144, 255);
                chaserRunning.color = ccc3(30, 144, 255);
                
                if (!isBoss) {
                
                    chaserStunned.color = ccc3(125, 75, 255);
                }
                
                else if (isBoss) {
                    
                    //Boss should be blue if he's stunned with one punch left to die, or if he's already dead and flying off screen
                    if ((self.hitPointsLeft == 1 && !bossAlreadyPunched) || (self.hitPointsLeft == 0)) {
                        
                        chaserStunned.color = ccc3(125, 75, 255);
                    }
                    
                    else {
                    
                        chaserStunned.color = ccWHITE;
                    }
                }
                
                chaserStandingStillBored.color = ccc3(30, 144, 255);
                chaserStandingStillAngry.color = ccc3(30, 144, 255);
            }
            
            if (self.enemyType == DOWNWARD_SHOOTER_TYPE) {
                
                saucerFlying.color = ccc3(30, 144, 255);
                saucerStunned.color = ccc3(30, 144, 255);
            }
        }
        
        //If enemy is friendly, it turns green. 
        if (self.friendlyTimeValue > 0) {
            
            self.mySprite.color = ccGREEN;
            self.friendlyTimerLabel.visible = YES;
            self.stunTimerLabel.visible = NO;
            
            self.stunTimeValue = 0;
            
            if (enemyKnockedOutOfTheArena) {
                
                self.stunTimerLabel.visible = NO;
                self.friendlyTimerLabel.visible = NO;
            }
            
            if (self.enemyType == PARKOUR_JUMPER_TYPE) {
                
                ninjaJumping.color = ccGREEN;
                ninjaRunning.color = ccGREEN;
                ninjaStandingStill.color = ccGREEN;
                ninjaStunned.color = ccGREEN;
            }
            
            if (self.enemyType == HIDGON_ENEMY_TYPE) {
                
                gunnerWalking.color = ccGREEN;
                gunnerStandingStill.color = ccGREEN;
                gunnerStunned.color = ccGREEN;
            }
            
            if (self.enemyType == SKELETON_WHALE_TYPE) {
                
                jetmanFlying.color = ccGREEN;
                jetmanStunned.color = ccGREEN;
            }
            
            if (self.enemyType == DIAGONAL_FLYER_TYPE) {
                
                flyingDownLeft.color = ccGREEN;
                flyingDownRight.color = ccGREEN;
                flyingUpLeft.color = ccGREEN;
                flyingUpRight.color = ccGREEN;
            }
            
            if (self.enemyType == FLY_THROUGH_WALLS_DIAGONAL_FLYER_TYPE) {
                
                flyingDownLeft.color = ccGREEN;
                flyingDownRight.color = ccGREEN;
                flyingUpLeft.color = ccGREEN;
                flyingUpRight.color = ccGREEN;
            }
            
            if (self.enemyType == CHASER_ENEMY_TYPE) {
                
                chaserWalking.color = ccGREEN;
                chaserRunning.color = ccGREEN;
                chaserStunned.color = ccGREEN;
                chaserStandingStillBored.color = ccGREEN;
                chaserStandingStillAngry.color = ccGREEN;
            }
            
            if (self.enemyType == DOWNWARD_SHOOTER_TYPE) {
                
                saucerFlying.color = ccGREEN;
                saucerStunned.color = ccGREEN;
            }
        }
        

                
        //If enemy touches another enemy who is green (friendly) they become friendly themselves
        for (Enemy *friendlyEnemySprite in enemySpritesArray) {
            
            for (Enemy *self in enemySpritesArray) {
            
                if (friendlyEnemySprite.friendlyTimeValue > 0) {
                
                    //If friendly enemy touches non-friendly enemy, then non-friendly enemy becomes friendly
                    if ((self.position.x < friendlyEnemySprite.position.x + 22 && self.position.x > friendlyEnemySprite.position.x - 22) && (self.position.y < friendlyEnemySprite.position.y + 22 && self.position.y > friendlyEnemySprite.position.y - 22)) {

                        if (self.friendlyTimeValue == 0) {
                        
                            self.friendlyTimeValue = 10;
                            self.stunTimeValue = 0;
                        }
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
