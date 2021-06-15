//
//  TimeBomb.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "SaveVideoButton.h"

@implementation SaveVideoButton


@synthesize theGame;
@synthesize shareGameplayLabel;
@synthesize videoLabel;




+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}

-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        theGame = _game;
        
        self.visible = YES;
        
        shareGameplayLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Share Game"] fntFile:@"PixelArtFont.fnt"];
        videoLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Video"] fntFile:@"PixelArtFont.fnt"];
        
        shareGameplayLabel.scale = 0.5;
        videoLabel.scale = 0.5;
        
        [self addChild: shareGameplayLabel];
        [self addChild: videoLabel];
        
        shareGameplayLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2);
        videoLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 17);
    }
    
    return self;
}

-(void) dealloc
{
    [super dealloc];
}

@end
