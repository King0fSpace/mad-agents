//
//  SkeletonWhale.m
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "PowerUps.h"

@implementation PowerUps


@synthesize theGame;
@synthesize mySprite;
@synthesize powerUpType;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}

-(void) setSelfToNotVisible
{
    if (self.visible == YES) {
    
        self.visible = NO;
        
        powerUpAlreadyExists = NO;
                
        //If multiplayer, send message to player2 telling them that powerup should be set to not visible
        if (!isSinglePlayer) {
            
            [(HelloWorldLayer*)theGame sendSetPowerUpToNotVisible];
        }
    }
    
    [powerUpsArray removeObject: self];
    [self removeFromParentAndCleanup: YES];
}

-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        theGame = _game;
                
        if (randomPowerUp != STAR_IN_GAME_CURRENCY) {
          
            if (!isSinglePlayer) {
                
                powerUpType = STUN_POWER_UP;
            }
        }
                            
        if (randomPowerUp != STAR_IN_GAME_CURRENCY && randomPowerUp != BOXING_GLOVE) {
            
            //Global variable
            powerUpAlreadyExists = YES;
            
            if (!isBossLevel) {
            
                powerUpAlreadyAppearedInThisLevel = YES;
            }
        }
    
        if (randomPowerUp == SNEAKER_POWER_UP && !firstPlayerHasSneakers) {
            
            int randomNumber = arc4random()%9;
            
            if (randomNumber == 0) {
                
                mySprite = [CCSprite spriteWithFile:@"Sneaker.png"];
                self.scale = 0.9;
                powerUpType = SNEAKER_POWER_UP;
            }
            
            else if (randomNumber != 0){
                
                int randomNumber = arc4random()%2;
                
                //Chance of stun bomb
                if (randomNumber == 0 || isBossLevel) {
                    
                    if (currentLevel == 10 || currentLevel == 30 || currentLevel == 50 || currentLevel == 60) {
                    
                        mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                        self.scale = 0.9;
                        powerUpType = STUN_POWER_UP;
                    }
                    
                    else if (currentLevel == 20 || currentLevel == 40) {
                        
                        mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
                        self.scale = 0.9;
                        powerUpType = STUN_PROJECTILE_POWER_UP;
                    }
                    
                    else {
                        
                        mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                        self.scale = 0.9;
                        powerUpType = STUN_POWER_UP;
                    }
                }
                
                //Chance of stun projectile
                else if (randomNumber == 1) {
                    
                    mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_PROJECTILE_POWER_UP;
                }
            }
        }
        
        if (randomPowerUp == STUN_POWER_UP) {
            
            if (!isBossLevel) {
            
                mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                self.scale = 0.9;
                powerUpType = STUN_POWER_UP;
            }
            
            else if (isBossLevel) {
                
                if (currentLevel == 10 || currentLevel == 30 || currentLevel == 50 || currentLevel == 60) {
                    
                    mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_POWER_UP;
                }
                
                else if (currentLevel == 20 || currentLevel == 40) {
                    
                    mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_PROJECTILE_POWER_UP;
                }
                
                else {
                    
                    mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_POWER_UP;
                }
            }
        }
    
        if (randomPowerUp == STUN_PROJECTILE_POWER_UP) {
            
            if (!isBossLevel) {
                            
                mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
                self.scale = 0.9;
                powerUpType = STUN_PROJECTILE_POWER_UP;
            }
            
            else if (isBossLevel) {
                
                if (currentLevel == 10 || currentLevel == 30 || currentLevel == 50 || currentLevel == 60) {
                
                    mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_POWER_UP;
                }
                
                else if (currentLevel == 20 || currentLevel == 40) {
                    
                    mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_PROJECTILE_POWER_UP;
                }
                
                else {
                    
                    mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_POWER_UP;
                }
            }
        }
        
        if (randomPowerUp == MIND_CONTROL_POWER_UP) {
            
            if (!isBossLevel) {
            
                mySprite = [CCSprite spriteWithFile:@"LovePill.png"];
                self.scale = 0.9;
                powerUpType = MIND_CONTROL_POWER_UP;
            }
    
            else if (isBossLevel) {
                
                if (currentLevel == 10 || currentLevel == 30 || currentLevel == 50 || currentLevel == 60) {
                
                    mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_POWER_UP;
                }
                
                else if (currentLevel == 20 || currentLevel == 40) {
                    
                    mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_PROJECTILE_POWER_UP;
                }
                
                else {
                    
                    mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_POWER_UP;
                }
            }
        }

        if (randomPowerUp == INVINCIBILITY_POWER_UP) {
            
            int randomNumber = arc4random()%5;
            
            //If it's a boss level create a lower chance of Invincibility being created
            if (randomNumber == 0) {
            
                mySprite = [CCSprite spriteWithFile:@"Invincibility.png"];
                self.scale = 0.45;
                powerUpType = INVINCIBILITY_POWER_UP;
            }
            
            else if (randomNumber != 0){
                
                int randomNumber = arc4random()%2;
                
                //Chance of stun bomb
                if (randomNumber == 0 || isBossLevel) {
                    
                    if (currentLevel == 10 || currentLevel == 30 || currentLevel == 50 || currentLevel == 60) {
                    
                        mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                        self.scale = 0.9;
                        powerUpType = STUN_POWER_UP;
                    }
                    
                    else if (currentLevel == 20 || currentLevel == 40) {
                        
                        mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
                        self.scale = 0.9;
                        powerUpType = STUN_PROJECTILE_POWER_UP;
                    }
                    
                    else {
                        
                        mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                        self.scale = 0.9;
                        powerUpType = STUN_POWER_UP;
                    }
                }
                
                //Chance of stun projectile
                else if (randomNumber == 1) {
                    
                    mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_PROJECTILE_POWER_UP;
                }
            }
        }
        
        if (randomPowerUp == BULLET_TIME_POWER_UP) {
            
            int randomNumber = arc4random()%3;
            
            if (randomNumber == 0) {
            
                mySprite = [CCSprite spriteWithFile:@"Watch.png"];
                self.scale = 0.9;
                powerUpType = BULLET_TIME_POWER_UP;
            }
            
            else if (randomNumber != 0) {
                
                int randomNumber = arc4random()%2;
                
                //Chance of stun bomb
                if (randomNumber == 0 || isBossLevel) {
                    
                    if (currentLevel == 10 || currentLevel == 30 || currentLevel == 50 || currentLevel == 60) {
                    
                        mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                        self.scale = 0.9;
                        powerUpType = STUN_POWER_UP;
                    }
                    
                    else if (currentLevel == 20 || currentLevel == 40) {
                        
                        mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
                        self.scale = 0.9;
                        powerUpType = STUN_PROJECTILE_POWER_UP;
                    }
                    
                    else {
                        
                        mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                        self.scale = 0.9;
                        powerUpType = STUN_POWER_UP;
                    }
                }
            
                //Chance of stun projectile
                else if (randomNumber == 1) {
                    
                    mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_PROJECTILE_POWER_UP;
                }
            }
        }

        if (randomPowerUp == STAR_IN_GAME_CURRENCY) {
                        
            //mySprite = [CCSprite spriteWithFile:@"Star.png"];
            //self.scale = 0.35;
            
            
            
            powerUpType = STAR_IN_GAME_CURRENCY;
        
            /*Gem Spinning Animation*/
            //pass in the name of the property list
            [[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile: @"Gem.plist"];
            
            //create the sprite sheet
            CCSpriteBatchNode *spriteSheetGemSpinning = [CCSpriteBatchNode batchNodeWithFile: @"Gem.png"];
            [self addChild: spriteSheetGemSpinning z: 150];
            
            //Create array of cairostance frames
            NSMutableArray *gemSpinningAnimFrames = [NSMutableArray array];
            for(int i = 1; i <= 4; ++i) {
                [gemSpinningAnimFrames addObject: [[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName: [NSString stringWithFormat:@"Gem%d.png", i]]];
            }
            
            //Create the animation object
            CCAnimation *gemSpinningAnim = [CCAnimation animationWithFrames:gemSpinningAnimFrames delay:0.25f];
            
            //Create sprite and run the animation
            mySprite = [CCSprite spriteWithSpriteFrameName:@"Gem1.png"];
           // mySprite.anchorPoint = ccp(0.5, 0.35);
            CCAction *gemSpinningAction = [CCRepeatForever actionWithAction:[CCAnimate actionWithAnimation: gemSpinningAnim restoreOriginalFrame:NO]];
            [mySprite runAction: gemSpinningAction];
            mySprite.scale = 0.48;
            
        //    [spriteSheetGemSpinning addChild: mySprite z: 150];
        }
        
        if (randomPowerUp == BOXING_GLOVE) {
            
            mySprite = [CCSprite spriteWithFile:@"BoxingGlove.png"];
            self.scale = 1.0;
            powerUpType = BOXING_GLOVE;
        }
        
        if (randomPowerUp == GLOBAL_STUN_POWER_UP) {
            
            int randomNumber = arc4random()%5;
            
                if (randomNumber == 0) {
                
                mySprite = [CCSprite spriteWithFile:@"MushroomCloud.png"];
                self.scale = 1.0;
                powerUpType = GLOBAL_STUN_POWER_UP;
            }
            
            else if (randomNumber != 0) {
                
                int randomNumber = arc4random()%2;
                
                //Chance of stun bomb
                if (randomNumber == 0 || isBossLevel) {
                    
                    if (currentLevel == 10 || currentLevel == 30 || currentLevel == 50 || currentLevel == 60) {
                    
                        mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                        self.scale = 0.9;
                        powerUpType = STUN_POWER_UP;
                    }
                    
                    else if (currentLevel == 20 || currentLevel == 40) {
                        
                        mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
                        self.scale = 0.9;
                        powerUpType = STUN_PROJECTILE_POWER_UP;
                    }
                    
                    else {
                        
                        mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
                        self.scale = 0.9;
                        powerUpType = STUN_POWER_UP;
                    }
                }
                
                //Chance of stun projectile
                else if (randomNumber == 1) {
                    
                    mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
                    self.scale = 0.9;
                    powerUpType = STUN_PROJECTILE_POWER_UP;
                }
            }
        }
        
        if (randomPowerUp != STAR_IN_GAME_CURRENCY && randomPowerUp != BOXING_GLOVE) {
        
            if (isSinglePlayer || (!isSinglePlayer && isPlayer1)) {
            
                int powerUpTimeToLiveExtraSeconds = arc4random()%13;
                int powerUpTimeToLiveTotal = 12 + powerUpTimeToLiveExtraSeconds;
                
                //Run method that makes power-up disappear after a certain amount of time if the power-up is not a STAR
                [self runAction: [CCSequence actions: [CCDelayTime actionWithDuration: powerUpTimeToLiveTotal], [CCCallFunc actionWithTarget:self selector:@selector(setSelfToNotVisible)], nil]];
            }
        }
                
        [self addChild:mySprite];
        
        [theGame addChild:self z: 500];
        
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
