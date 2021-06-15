//
//  CharacterSelectionScreen.h
//  Mad Agents
//
//  Created by Long Le on 3/12/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"




#define CHARACTER_SELECTION_SCREEN          7

#define BLUE_BOY                            0
#define GREEN_BOY                           1
#define BEIGE_GIRL                          2
#define PURPLE_GIRL                         3


CCLayerColor *characterSelectionLayer;
int playerColorAndGender;



@interface CharacterSelectionScreen : CCNode {
    
    CCSprite *blueBoy;
    CCSprite *greenBoy;
    CCSprite *beigeGirl;
    CCSprite *purpleGirl;
    BOOL touchDispatcherAddedToCharacterSelectionScreen;
}


@property (nonatomic, assign) CCSprite *blueBoy;
@property (nonatomic, assign) CCSprite *greenBoy;
@property (nonatomic, assign) CCSprite *beigeGirl;
@property (nonatomic, assign) CCSprite *purpleGirl;
@property (nonatomic, assign) HelloWorldLayer *theGame;
@property BOOL touchDispatcherAddedToCharacterSelectionScreen;;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;
-(void) addTouchDispatcherToCharacterSelectionScreen;
-(void) removeTouchDispatcherToCharacterSelectionScreen;

@end
