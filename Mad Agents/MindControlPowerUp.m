//
//  MindControlPowerUp.m
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "MindControlPowerUp.h"

@implementation MindControlPowerUp


@synthesize theGame;
@synthesize mySprite;
@synthesize glow;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}


-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        theGame = _game;
        
        self.visible = YES;
        
        mySprite = [CCSprite spriteWithFile:@"LovePill.png"];
        
        glow = [CCSprite spriteWithFile: @"GlowInTheDarkAura.png"];
        [self addChild: glow z:12];
        glow.scale = 0.7;
        glow.opacity = 140;
        glow.scaleY = 1.3;
        glow.scaleX = 1.8;
        glow.color = ccYELLOW;
        [glow runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCScaleTo actionWithDuration:0.05 scaleX:1.5 scaleY:1.0], [CCScaleTo actionWithDuration:0.05 scaleX:1.8 scaleY:1.3], nil]]];
        
        self.scale = 0.9;
        [self addChild:mySprite];
        
        [theGame addChild:self];
        
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
