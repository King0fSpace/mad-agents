//
//  StunPowerUp
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "StunProjectilePowerUp.h"

@implementation StunProjectilePowerUp


@synthesize theGame;
@synthesize mySprite;
@synthesize glow;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}


-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        if (firstPlayerFacingRight) {
            
            shootingRight = YES;
        }
        
        if (firstPlayerFacingRight == NO) {
            
            shootingRight = NO;
        }
        
        theGame = _game;
        
        self.visible = YES;
        
        mySprite = [CCSprite spriteWithFile:@"StunProjectiles.png"];
        
        glow = [CCSprite spriteWithFile: @"GlowInTheDarkAura.png"];
        [self addChild: glow z:12];
        glow.scale = 0.7;
        glow.opacity = 80;
        glow.scaleY = 1.3;
        glow.scaleX = 1.8;
        glow.color = ccYELLOW;
        [glow runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCScaleTo actionWithDuration:0.05 scaleX:1.5 scaleY:1.0], [CCScaleTo actionWithDuration:0.05 scaleX:1.8 scaleY:1.3], nil]]];
        
        self.scale = 0.9;
        [self addChild:mySprite];
        
        [theGame addChild:self];
        
        if (shootingRight) {
            
            [mySprite runAction: [CCRepeatForever actionWithAction: [CCRotateBy actionWithDuration:0.3 angle:360]]];
        }
        
        else if (!shootingRight) {
            
            [mySprite runAction: [CCRepeatForever actionWithAction: [CCRotateBy actionWithDuration:0.3 angle:-360]]];
        }
        
        [self scheduleUpdate];
    }
    
    return self;
}


-(void)update:(ccTime)dt {
    
    if (isPaused == NO) {
                
        if (shootingRight) {
            
            self.position = ccp(self.position.x + 12.0, self.position.y);
        }
        
        else if (shootingRight == NO) {
            
            self.position = ccp(self.position.x - 10.0, self.position.y);
        }
    }
}


-(void) dealloc
{
    [super dealloc];
}

@end
