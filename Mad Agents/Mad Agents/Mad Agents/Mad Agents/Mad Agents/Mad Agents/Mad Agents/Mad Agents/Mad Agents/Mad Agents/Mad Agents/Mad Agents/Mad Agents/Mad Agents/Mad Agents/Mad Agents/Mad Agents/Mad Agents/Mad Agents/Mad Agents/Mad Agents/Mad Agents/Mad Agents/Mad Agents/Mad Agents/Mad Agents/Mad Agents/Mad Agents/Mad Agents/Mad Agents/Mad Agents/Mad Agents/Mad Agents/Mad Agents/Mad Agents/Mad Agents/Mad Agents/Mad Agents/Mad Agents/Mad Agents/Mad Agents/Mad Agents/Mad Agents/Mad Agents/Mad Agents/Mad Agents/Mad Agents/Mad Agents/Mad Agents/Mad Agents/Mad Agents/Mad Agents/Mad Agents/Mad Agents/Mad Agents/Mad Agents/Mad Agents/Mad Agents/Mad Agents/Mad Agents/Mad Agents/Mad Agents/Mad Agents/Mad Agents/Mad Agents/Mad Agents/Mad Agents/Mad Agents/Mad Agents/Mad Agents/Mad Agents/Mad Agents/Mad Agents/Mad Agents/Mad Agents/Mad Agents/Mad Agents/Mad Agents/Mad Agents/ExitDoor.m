//
//  ExitDoor.m
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "ExitDoor.h"

@implementation ExitDoor


@synthesize theGame;
@synthesize mySprite;
@synthesize blackSquare;



+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}

-(void) exitDoorBlownUp
{
    blackSquare.visible = YES;
}

-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        if (isSinglePlayer) {
        
            theGame = _game;
            
            self.visible = YES;
                
            mySprite = [CCSprite spriteWithFile:@"DoorClosed.png"];
            
            mySprite.scale = 0.45;
            self.anchorPoint = ccp(0.5, 0.5);
            [self addChild:mySprite z: 0];
            
            blackSquare = [CCSprite spriteWithFile:@"DoorBlown.png"];
            blackSquare.scale = 0.45;
            blackSquare.anchorPoint = ccp(0.5, 0.5);
            blackSquare.visible = NO;
            [self addChild: blackSquare z: 3];
            
            
            [gameLayer addChild:self z: 0];
            
            [self scheduleUpdate];
        }
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
