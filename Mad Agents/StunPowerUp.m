//
//  StunPowerUp
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "StunPowerUp.h"

@implementation StunPowerUp


@synthesize theGame;
@synthesize mySprite;
@synthesize glow;
@synthesize stunPowerUpBelongsToPlayer1;
@synthesize stunBombExplosion;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}

-(void) setSelfToNotVisible
{
    self.visible = NO;
}

-(void) bombExploding
{
    stunBombExplosion.visible = YES;
    
    [self.stunBombExplosion runAction: [CCSequence actions: [CCFadeIn actionWithDuration:0.0], [CCDelayTime actionWithDuration: 0.04], [CCFadeOut actionWithDuration:0.0], [CCCallFunc actionWithTarget:self selector:@selector(setSelfToNotVisible)], nil]];
    
    self.mySprite.visible = NO;
    self.glow.visible = NO;
        
    [[SimpleAudioEngine sharedEngine] playEffect:@"BlackBombExploding.caf" pitch:2.0f pan:0.5f gain:1.0f];
}

-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        theGame = _game;
        
        self.visible = YES;
        
        mySprite = [CCSprite spriteWithFile:@"StunBomb.png"];
        
        glow = [CCSprite spriteWithFile: @"GlowInTheDarkAura.png"];
        [self addChild: glow z:100];
        glow.scale = 0.7;
        glow.opacity = 180;
        glow.scaleY = 1.3;
        glow.scaleX = 1.8;
        glow.color = ccYELLOW;
        [glow runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCScaleTo actionWithDuration:0.05 scaleX:1.5 scaleY:1.0], [CCScaleTo actionWithDuration:0.05 scaleX:1.8 scaleY:1.3], nil]]];
        
        stunBombExplosion = [CCSprite spriteWithFile:@"StunBombExplosion.png"];
        stunBombExplosion.scale = 0.7;
        stunBombExplosion.visible = NO;
        stunBombExplosion.opacity = 145;
        [self addChild: stunBombExplosion z:500];
        [stunBombExplosion runAction: [CCFadeOut actionWithDuration:0.0]];
        
        self.scale = 0.9;
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
