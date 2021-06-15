//
//  CharacterSelectionScreen.m
//  Mad Agents
//
//  Created by Long Le on 3/12/13.
//
//

#import "CharacterSelectionScreen.h"

@implementation CharacterSelectionScreen



@synthesize theGame;
@synthesize touchDispatcherAddedToCharacterSelectionScreen;
@synthesize blueBoy;
@synthesize greenBoy;
@synthesize beigeGirl;
@synthesize purpleGirl;




+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    
    return [[[self alloc] initWithTheGame:_game] autorelease];
}

-(id)initWithTheGame:(HelloWorldLayer *)_game
{
    self = [super init];
    
    if (self != nil) {
    
        theGame = _game;
                
        blueBoy = [CCSprite spriteWithFile:@"MainCharacterBlueBoyStandingStill.png"];
        blueBoy.position = ccp([[CCDirector sharedDirector] winSize].width/2 - [[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 50);
        blueBoy.scale = 1.5;
        [self addChild: blueBoy];
        
        greenBoy = [CCSprite spriteWithFile:@"MainCharacterGreenBoyRaisingHand.png"];
        greenBoy.position = ccp([[CCDirector sharedDirector] winSize].width/2 - [[CCDirector sharedDirector] winSize].width/6, [[CCDirector sharedDirector] winSize].height/2 - 50);
        greenBoy.scale = 1.5;
        [self addChild: greenBoy];
        
        beigeGirl = [CCSprite spriteWithFile:@"MainCharacterBeigeGirlStandingStill.png"];
        beigeGirl.position = ccp([[CCDirector sharedDirector] winSize].width/2 + [[CCDirector sharedDirector] winSize].width/2.1, [[CCDirector sharedDirector] winSize].height/2 - 50);
        beigeGirl.scale = 1.5;
        beigeGirl.flipX = YES;
        [self addChild: beigeGirl];
        
        purpleGirl = [CCSprite spriteWithFile:@"MainCharacterPurpleGirlStandingStill.png"];
        purpleGirl.position = ccp([[CCDirector sharedDirector] winSize].width/2 + [[CCDirector sharedDirector] winSize].width/6, [[CCDirector sharedDirector] winSize].height/2 - 50);
        purpleGirl.scale = 1.5;
        beigeGirl.flipX = YES;
        [self addChild: purpleGirl];

        CCLabelBMFont *chooseYourCharacterLabel = [CCLabelBMFont labelWithString:[NSString stringWithFormat:@"Choose Your Character"] fntFile:@"PixelArtFont.fnt"];
        chooseYourCharacterLabel.position = ccp([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 + 100);
        [self addChild: chooseYourCharacterLabel];

        
        return self;
    }
}


@end
