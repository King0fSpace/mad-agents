//
//  TimeBomb.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "TimeBomb.h"

@implementation TimeBomb


@synthesize theGame;
@synthesize mySprite;
@synthesize explosion;
@synthesize timeBombTimeLabel;
@synthesize timeBombSecondsLeft;



+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}

-(void) bombExploding
{
    explosion.visible = YES;
    
    [self.explosion runAction: [CCSequence actions: [CCFadeIn actionWithDuration:0.0], [CCDelayTime actionWithDuration: 0.04], [CCFadeOut actionWithDuration:0.0], nil]];
    
    self.mySprite.visible = NO;
    
    exitDoorIsOpen = YES;
    
    timeBombTimeLabel.visible = NO;
    
    [[SimpleAudioEngine sharedEngine] playEffect:@"BlackBombExploding.caf"];
    
    //Stun all enemies for a second and make screen flash white
    //Solid White should flash in and then out almost immediately
    [solidWhiteFlashBang runAction: [CCSequence actions: [CCFadeIn actionWithDuration:0.0], [CCDelayTime actionWithDuration: 0.04], [CCFadeOut actionWithDuration:0.0], nil]];
}


-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        theGame = _game;
        
        self.visible = YES;
        
        mySprite = [CCSprite spriteWithFile:@"Dynamite.png"];        
        
        self.anchorPoint = ccp(0.5, 0.5);
        mySprite.scale = 0.8;
        [self addChild:mySprite];
        
        explosion = [CCSprite spriteWithFile:@"bombexplosion.png"];
        explosion.scale = 1.2;
        explosion.visible = NO;
        [self addChild: explosion];
        [explosion runAction: [CCFadeOut actionWithDuration:0.0]];
        
        timeBombSecondsLeft = 12;
        
        int secs = timeBombSecondsLeft % 60;
        
        timeBombTimeLabel = [[CCLabelBMFont labelWithString:[NSString stringWithFormat:@"%02i", secs] fntFile:@"PixelArtFont.fnt"] retain];
        [timeBombTimeLabel setAnchorPoint:ccp(0.5, 0.5)];
        timeBombTimeLabel.position = ccp(self.position.x, self.position.y + 25);
        timeBombTimeLabel.scale = 0.8;
        timeBombTimeLabel.color = ccORANGE;
        timeBombTimeLabel.visible = NO;
        [self addChild:timeBombTimeLabel z:100];
        
        //Add the white for the flashbang
        solidWhiteFlashBang = [CCSprite spriteWithFile:@"SolidWhiteFlashbang.png"];
        [self addChild: solidWhiteFlashBang];
        solidWhiteFlashBang.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2);
        solidWhiteFlashBang.scale = 7.0;
        [solidWhiteFlashBang runAction: [CCFadeOut actionWithDuration:0.0]];
        
        [theGame addChild:self z: 50];
        
        [self scheduleUpdate];
    }
    
    return self;
}


-(void)update:(ccTime)dt {
    
    if (isPaused == NO) {
        
        if (timeBombPlacedOnDoor) {
            
            int secs = timeBombSecondsLeft % 60;
            
            timeBombTimeLabel.visible = YES;
            [timeBombTimeLabel setString:[NSString stringWithFormat:@"%02i", secs]];
        }
    }
}


-(void) dealloc
{
    [super dealloc];
}

@end
