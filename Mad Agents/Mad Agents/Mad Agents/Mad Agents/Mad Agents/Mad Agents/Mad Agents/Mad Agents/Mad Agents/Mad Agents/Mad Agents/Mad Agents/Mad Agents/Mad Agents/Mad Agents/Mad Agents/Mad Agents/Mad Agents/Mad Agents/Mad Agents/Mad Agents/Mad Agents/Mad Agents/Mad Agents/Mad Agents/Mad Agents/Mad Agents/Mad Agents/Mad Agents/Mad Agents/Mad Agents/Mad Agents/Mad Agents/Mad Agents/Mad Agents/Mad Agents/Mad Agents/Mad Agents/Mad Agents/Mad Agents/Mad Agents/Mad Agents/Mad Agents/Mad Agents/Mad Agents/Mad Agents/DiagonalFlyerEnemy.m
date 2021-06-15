//
//  SkeletonWhale.m
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "DiagonalFlyerEnemy.h"

@implementation DiagonalFlyerEnemy


float enemyDiagonalFlyerEnemyResponseTime;


@synthesize theGame;
@synthesize mySprite;
@synthesize enemyDiagonalFlyerMovingUp;
@synthesize enemyDiagonalFlyerMovingLeft;
@synthesize enemyDiagonalFlyerMovingRight;
@synthesize enemyDiagonalFlyerMovingDown;
@synthesize enemyDiagonalFlyerStopped;
@synthesize enemyDiagonalFlyerTouchingWallOnTop;
@synthesize enemyDiagonalFlyerTouchingWallOnBottom;
@synthesize enemyDiagonalFlyerTouchingWallOnRightSide;
@synthesize enemyDiagonalFlyerTouchingWallOnLeftSide;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}

-(void) enemyDiagonalFlyerEnemyAdjustMovement
{
    if (isPaused == NO) {
        
        
    }
}

-(void) pauseSchedulerAndActionsForSkeletonWhaleClass {
    
    [self pauseSchedulerAndActions];
}

-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        theGame = _game;
        
        mySprite = [CCSprite spriteWithFile:@"DiagonalFlyer.png"];
        self.scale = 0.9;
        [self addChild:mySprite];
        
        [theGame addChild:self];
        
        [self scheduleUpdate];
    }
    
    enemyDiagonalFlyerEnemyResponseTime = 1.0;
    enemyDiagonalFlyerMovingDown = YES;
    enemyDiagonalFlyerMovingLeft = YES;
    enemyDiagonalFlyerMovingUp = NO;
    enemyDiagonalFlyerMovingRight = NO;
        
    return self;
}
/*
-(void) setDiagonalFlyerStunnedToYes
{
    self.stunned = YES;
}

-(void) setDiagonalFlyerStunnedToNo
{
    self.stunned = NO;
    self.mySprite.color = ccWHITE;
}
*/
-(void) setEnemyDiagonalFlyerEnemyStopped
{
    self.enemyDiagonalFlyerStopped = YES;
    self.enemyDiagonalFlyerMovingDown = NO;
    self.enemyDiagonalFlyerMovingLeft = NO;
    self.enemyDiagonalFlyerMovingUp = NO;
    self.enemyDiagonalFlyerMovingRight = NO;
}

-(void)update:(ccTime)dt {
        
    if (isPaused == NO) {
        
        if (madAgentsAmount == 0) {
            
            walkingSpeed = 2.0;
        }
        
        else if (madAgentsAmount == 1) {
            
            walkingSpeed = 4.0;
        }
        
        
        //Subroutine which makes DiagonalFlyer fly up, down, left, and right appropriately
        if ([self enemyDiagonalFlyerMovingRight]) {
            
            if (self.enemyDiagonalFlyerTouchingWallOnRightSide == NO) {
            
                self.position = ccp(self.position.x + walkingSpeed, self.position.y);
                //    mySprite.flipX = NO;
            }
        }
        
        if ([self enemyDiagonalFlyerMovingLeft]) {
            
            if (self.enemyDiagonalFlyerTouchingWallOnLeftSide == NO) {
            
                self.position = ccp(self.position.x - walkingSpeed, self.position.y);
                //    mySprite.flipX = YES;
            }
        }
        
        if ([self enemyDiagonalFlyerMovingDown]) {
            
            if (self.enemyDiagonalFlyerTouchingWallOnBottom == NO) {
            
                self.position = ccp(self.position.x, self.position.y - walkingSpeed);
            }
        }
        
        if ([self enemyDiagonalFlyerMovingUp]) {
            
            if (self.enemyDiagonalFlyerTouchingWallOnTop == NO) {
            
                self.position = ccp(self.position.x, self.position.y + walkingSpeed);
            }
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
                                        
                    if ((self.position.y - 11 < tmpgidlocation.y + 11) && (self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.x - 0 < tmpgidlocation.x + 11) && (self.position.x + 0 > tmpgidlocation.x - 11)) {
                        
                        //Diagonal Flyer touching wall on bottom
                        self.enemyDiagonalFlyerTouchingWallOnTop = NO;
                        self.enemyDiagonalFlyerTouchingWallOnBottom = YES;
                        //self.enemyDiagonalFlyerTouchingWallOnRightSide = NO;
                        //self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                        
                        self.enemyDiagonalFlyerMovingUp = YES;
                        self.enemyDiagonalFlyerMovingDown = NO;
                    }
                    
                    //Diagonal Flyer touching wall on top
                    if ((self.position.y + 11 > tmpgidlocation.y - 11) && (self.position.y - 11 < tmpgidlocation.y - 11) && (self.position.x - 0 < tmpgidlocation.x + 11) && (self.position.x + 0 > tmpgidlocation.x - 11)) {
                        
                        //Diagonal Flyer touching wall on top
                        self.enemyDiagonalFlyerTouchingWallOnTop = YES;
                        self.enemyDiagonalFlyerTouchingWallOnBottom = NO;
                        //self.enemyDiagonalFlyerTouchingWallOnRightSide = NO;
                        //self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                        
                        self.enemyDiagonalFlyerMovingUp = NO;
                        self.enemyDiagonalFlyerMovingDown = YES;
                    }
                    
                    //check if enemy's right side is touching wall
                    if ((self.position.y < tmpgidlocation.y + 11) && (self.position.y  > tmpgidlocation.y - 11) && (self.position.x + 11 < tmpgidlocation.x + 11) && (self.position.x + 11 > tmpgidlocation.x - 11)) {
                        
                        //Diagonal Flyer touching wall on right side
                        //self.enemyDiagonalFlyerTouchingWallOnTop = NO;
                        //self.enemyDiagonalFlyerTouchingWallOnBottom = NO;
                        self.enemyDiagonalFlyerTouchingWallOnRightSide = YES;
                        self.enemyDiagonalFlyerTouchingWallOnLeftSide = NO;
                        
                        self.enemyDiagonalFlyerMovingRight = NO;
                        self.enemyDiagonalFlyerMovingLeft = YES;
                    }
                    
                    //check if enemy's left side is touching wall
                    if ((self.position.y  < tmpgidlocation.y + 11) && (self.position.y  > tmpgidlocation.y - 11) && (self.position.x - 11 < tmpgidlocation.x + 11) && (self.position.x - 11 > tmpgidlocation.x - 11)) {
                        
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
        /*
        //If DiagonalFlyer touches deployed stunPowerUp it gets stunned
        for (self in enemyDiagonalFlyerEnemySpritesArray) {
            
            for (StunPowerUp *stunPowerUp in stunPowerUpArray) {
                
                if ((self.position.x < stunPowerUp.position.x + 22 && self.position.x > stunPowerUp.position.x - 22) && (self.position.y < stunPowerUp.position.y + 22 && self.position.y > stunPowerUp.position.y - 22) && self.stunned == NO) {
                    
                    [[SimpleAudioEngine sharedEngine] playEffect:@"BulbBreaking.caf"];
                    
                    [stunPowerUpArray removeObject: stunPowerUp];
                    [stunPowerUp removeFromParentAndCleanup: YES];
                    
                    [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(setDiagonalFlyerStunnedToYes)], [CCDelayTime actionWithDuration: enemyTotalStunTime], [CCCallFunc actionWithTarget:self selector:@selector(setDiagonalFlyerStunnedToNo)], nil]];
                    
                    return;
                }
            }
        }
         */
    }
}


-(void) dealloc
{
    [super dealloc];
}

@end
