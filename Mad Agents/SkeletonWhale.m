//
//  SkeletonWhale.m
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "SkeletonWhale.h"

@implementation SkeletonWhale


float enemySkeletonWhaleResponseTime;


@synthesize theGame;
@synthesize mySprite;
@synthesize enemySkeletonWhaleMovingRight;
@synthesize enemySkeletonWhaleMovingLeft;
@synthesize enemySkeletonWhaleMovingUp;
@synthesize enemySkeletonWhaleMovingDown;
@synthesize enemySkeletonWhaleStopped;
@synthesize enemySkeletonWhaleMovingHorizontally;
@synthesize stunned;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}

-(void) readjustEnemySkeletonWhaleResponseTime {
        
    if (madAgentsAmount == 1 && enemySkeletonWhaleResponseTime != 0.5) {
                
        [self stopAction: enemySkeletonWhaleAdjustMovement];
        
        enemySkeletonWhaleResponseTime = 0.5;
        
        enemySkeletonWhaleAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(enemySkeletonWhaleAdjustMovement)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],[CCCallFunc actionWithTarget:self selector:@selector(setEnemySkeletonWhaleStopped)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],  nil]]];
    }
}

-(void) enemySkeletonWhaleAdjustMovement
{
    if (isPaused == NO) {
        
        for (SkeletonWhale *enemySkeletonWhaleSprite in enemySkeletonWhaleSpritesArray) {
            
            if (enemySkeletonWhaleMovingHorizontally == NO) {
                
                enemySkeletonWhaleMovingHorizontally = YES;
            }
            
            else {
                
                enemySkeletonWhaleMovingHorizontally = NO;
            }
            
            //If player's y position is greater than SkeletonWhale's, increase chance of SkeletonWhale moving up. 
            if (firstPlayerSprite.position.y >= enemySkeletonWhaleSprite.position.y && !enemySkeletonWhaleMovingHorizontally) {
                                
                enemySkeletonWhaleSprite.enemySkeletonWhaleStopped = NO;
                enemySkeletonWhaleSprite.enemySkeletonWhaleMovingRight = NO;
                enemySkeletonWhaleSprite.enemySkeletonWhaleMovingLeft = NO;
                enemySkeletonWhaleSprite.enemySkeletonWhaleMovingDown = NO;
                enemySkeletonWhaleSprite.enemySkeletonWhaleMovingUp = YES;
            }
            
            //If player's y position is less than SkeletonWhale's, increase chance of SkeletonWhale moving down.
            else if (firstPlayerSprite.position.y < enemySkeletonWhaleSprite.position.y && !enemySkeletonWhaleMovingHorizontally) {
                
                enemySkeletonWhaleSprite.enemySkeletonWhaleStopped = NO;
                enemySkeletonWhaleSprite.enemySkeletonWhaleMovingRight = NO;
                enemySkeletonWhaleSprite.enemySkeletonWhaleMovingLeft = NO;
                enemySkeletonWhaleSprite.enemySkeletonWhaleMovingDown = YES;
                enemySkeletonWhaleSprite.enemySkeletonWhaleMovingUp = NO;
            }
            
            //If player's x position is greater than SkeletonWhale's, then SkeletonWhale has a higher chance of moving right
            else if (firstPlayerSprite.position.x >= enemySkeletonWhaleSprite.position.x && enemySkeletonWhaleMovingHorizontally) {
                
                int randomNumber;
                
                randomNumber = arc4random()%3;
                
                //Set to -1 to make the skeletonWhale always follow the player
                if (randomNumber == -1) {
                    
                    //Move left
                    enemySkeletonWhaleSprite.enemySkeletonWhaleStopped = NO;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingRight = NO;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingLeft = YES;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingDown = NO;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingUp = NO;
                }
                
                else {
                    
                    //Move right
                    enemySkeletonWhaleSprite.enemySkeletonWhaleStopped = NO;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingRight = YES;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingLeft = NO;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingDown = NO;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingUp = NO;
                }
            }
            
            //If player's x position is less than SkeletonWhale's, then SkeletonWhale has a higher chance of moving left
            else if (firstPlayerSprite.position.x < enemySkeletonWhaleSprite.position.x && enemySkeletonWhaleMovingHorizontally) {
                
                int randomNumber;
                
                randomNumber = arc4random()%3;
                
                //Set to -1 to make the skeletonWhale always follow the player
                if (randomNumber == -1) {
                    
                    //Walk right
                    enemySkeletonWhaleSprite.enemySkeletonWhaleStopped = NO;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingRight = YES;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingLeft = NO;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingDown = NO;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingUp = NO;
                }
                
                else {
                    
                    //Walk left
                    enemySkeletonWhaleSprite.enemySkeletonWhaleStopped = NO;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingRight = NO;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingLeft = YES;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingDown = NO;
                    enemySkeletonWhaleSprite.enemySkeletonWhaleMovingUp = NO;
                }
            }
            
            //If SkeletonWhale touches deployed stunPowerUp it gets stunned
            for (self in enemySkeletonWhaleSpritesArray) {
                
                for (StunPowerUp *stunPowerUp in stunPowerUpArray) {
                    
                    if ((self.position.x < stunPowerUp.position.x + 22 && self.position.x > stunPowerUp.position.x - 22) && (self.position.y < stunPowerUp.position.y + 22 && self.position.y > stunPowerUp.position.y - 22) && self.stunned == NO) {
                        
                        [[SimpleAudioEngine sharedEngine] playEffect:@"BulbBreaking.caf"];
                        
                        [stunPowerUpArray removeObject: stunPowerUp];
                        [stunPowerUp removeFromParentAndCleanup: YES];
                        
                        [self runAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(setSkeletonWhaleStunnedToYes)], [CCDelayTime actionWithDuration:enemyTotalStunTime], [CCCallFunc actionWithTarget:self selector:@selector(setSkeletonWhaleStunnedToNo)], nil]];
                        
                        return;
                    }
                }
            }
        }
    }
}

-(void) pauseSchedulerAndActionsForSkeletonWhaleClass {
    
    [self pauseSchedulerAndActions];
}

-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        theGame = _game;
        
        stunned = NO;
        
        mySprite = [CCSprite spriteWithFile:@"SkeletonWhale.png"];
        self.scale = 0.9;
        [self addChild:mySprite];
        
        [theGame addChild:self];
        
        //enemySkeletonWhaleMovingHorizontally should be set randomly
        int randomNumber = arc4random()%2;
        
        if (randomNumber == 0) {
            
            enemySkeletonWhaleMovingHorizontally = NO;
        }
        
        else {
            
            enemySkeletonWhaleMovingHorizontally = YES;
        }
        
        [self scheduleUpdate];
        
        enemySkeletonWhaleResponseTime = 1.0;
        
        enemySkeletonWhaleAdjustMovement = [self runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCCallFunc actionWithTarget:self selector:@selector(enemySkeletonWhaleAdjustMovement)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],[CCCallFunc actionWithTarget:self selector:@selector(setEnemySkeletonWhaleStopped)], [CCDelayTime actionWithDuration:enemySkeletonWhaleResponseTime],  nil]]];
    }
    
    return self;
}

-(void) setEnemySkeletonWhaleStopped
{
    self.enemySkeletonWhaleStopped = YES;
    self.enemySkeletonWhaleMovingRight = NO;
    self.enemySkeletonWhaleMovingLeft = NO;
    self.enemySkeletonWhaleMovingDown = NO;
    self.enemySkeletonWhaleMovingUp = NO;
}

-(void)update:(ccTime)dt {
    
    [self readjustEnemySkeletonWhaleResponseTime];
    
    if (isPaused == NO) {
        
        if (madAgentsAmount == 0) {
            
            walkingSpeed = 2.0;
        }
        
        else if (madAgentsAmount == 1) {
            
            walkingSpeed = 3.0;
        }
        
        //Subroutine which makes enemyHidgon walk back and forth and jump at random times
        if ([self enemySkeletonWhaleMovingRight]) {
            
            self.position = ccp(self.position.x + walkingSpeed, self.position.y);
            mySprite.flipX = NO;
        }
        
        if ([self enemySkeletonWhaleMovingLeft]) {

            self.position = ccp(self.position.x - walkingSpeed, self.position.y);
            mySprite.flipX = YES;
        }
        
        if ([self enemySkeletonWhaleMovingUp]) {
            
            self.position = ccp(self.position.x, self.position.y + walkingSpeed);
        }
        
        if ([self enemySkeletonWhaleMovingDown]) {
            
            self.position = ccp(self.position.x, self.position.y - walkingSpeed);
        }
        
        if (self.enemySkeletonWhaleStopped) {
                
            self.position = ccp(self.position.x, self.position.y);
        }
    }
}


-(void) dealloc
{
    [super dealloc];
}

@end
