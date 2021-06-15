//
//  LevelSelectorMenus.h
//  Mad Agents
//
//  Created by Long Le on 1/24/13.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Enemy.h"
#import "CCScrollLayer.h"



CCLayerColor *menuLayer;
int levelSelectionMenuCurrentPage;
int currentLevel;
CCLayer *levelSectionPage1;
CCLayer *levelSectionPage2;
CCLayer *levelSectionPage3;
int currentSaveSlot;



@interface LevelSelectorMenus : CCNode {

    NSMutableArray *menuItemsArray;
    NSMutableArray *menusArray;
    
    CCSprite *whiteArrow;
    
    CCMenuItemFont *menuItem1;
    CCMenuItemFont *menuItem2;
    CCMenuItemFont *menuItem3;
    CCMenuItemFont *menuItem4;
    CCMenuItemFont *menuItem5;
    CCMenuItemFont *menuItem6;
    CCMenuItemFont *menuItem7;
    CCMenuItemFont *menuItem8;
    CCMenuItemFont *menuItem9;
    CCMenuItemFont *menuItem10;
    
    CCMenuItemFont *menuItem11;
    CCMenuItemFont *menuItem12;
    CCMenuItemFont *menuItem13;
    CCMenuItemFont *menuItem14;
    CCMenuItemFont *menuItem15;
    CCMenuItemFont *menuItem16;
    CCMenuItemFont *menuItem17;
    CCMenuItemFont *menuItem18;
    CCMenuItemFont *menuItem19;
    CCMenuItemFont *menuItem20;
    
    CCMenuItemFont *menuItem21;
    CCMenuItemFont *menuItem22;
    CCMenuItemFont *menuItem23;
    CCMenuItemFont *menuItem24;
    CCMenuItemFont *menuItem25;
    CCMenuItemFont *menuItem26;
    CCMenuItemFont *menuItem27;
    CCMenuItemFont *menuItem28;
    CCMenuItemFont *menuItem29;
    CCMenuItemFont *menuItem30;
    
    CCMenuItemFont *menuItem31;
    CCMenuItemFont *menuItem32;
    CCMenuItemFont *menuItem33;
    CCMenuItemFont *menuItem34;
    CCMenuItemFont *menuItem35;
    CCMenuItemFont *menuItem36;
    CCMenuItemFont *menuItem37;
    CCMenuItemFont *menuItem38;
    CCMenuItemFont *menuItem39;
    CCMenuItemFont *menuItem40;
    
    CCMenuItemFont *menuItem41;
    CCMenuItemFont *menuItem42;
    CCMenuItemFont *menuItem43;
    CCMenuItemFont *menuItem44;
    CCMenuItemFont *menuItem45;
    CCMenuItemFont *menuItem46;
    CCMenuItemFont *menuItem47;
    CCMenuItemFont *menuItem48;
    CCMenuItemFont *menuItem49;
    CCMenuItemFont *menuItem50;
    
    CCMenuItemFont *menuItem51;
    CCMenuItemFont *menuItem52;
    CCMenuItemFont *menuItem53;
    CCMenuItemFont *menuItem54;
    CCMenuItemFont *menuItem55;
    CCMenuItemFont *menuItem56;
    CCMenuItemFont *menuItem57;
    CCMenuItemFont *menuItem58;
    CCMenuItemFont *menuItem59;
    CCMenuItemFont *menuItem60;
}

@property (nonatomic, assign) NSMutableArray *menuItemsArray;
@property (nonatomic, assign) NSMutableArray *menusArray;
@property (nonatomic, assign) HelloWorldLayer *theGame;
@property (nonatomic, assign) CCMenuItemFont *menuItem1;
@property (nonatomic, assign) CCMenuItemFont *menuItem2;
@property (nonatomic, assign) CCMenuItemFont *menuItem3;
@property (nonatomic, assign) CCMenuItemFont *menuItem4;
@property (nonatomic, assign) CCMenuItemFont *menuItem5;
@property (nonatomic, assign) CCMenuItemFont *menuItem6;
@property (nonatomic, assign) CCMenuItemFont *menuItem7;
@property (nonatomic, assign) CCMenuItemFont *menuItem8;
@property (nonatomic, assign) CCMenuItemFont *menuItem9;
@property (nonatomic, assign) CCMenuItemFont *menuItem10;

@property (nonatomic, assign) CCMenuItemFont *menuItem11;
@property (nonatomic, assign) CCMenuItemFont *menuItem12;
@property (nonatomic, assign) CCMenuItemFont *menuItem13;
@property (nonatomic, assign) CCMenuItemFont *menuItem14;
@property (nonatomic, assign) CCMenuItemFont *menuItem15;
@property (nonatomic, assign) CCMenuItemFont *menuItem16;
@property (nonatomic, assign) CCMenuItemFont *menuItem17;
@property (nonatomic, assign) CCMenuItemFont *menuItem18;
@property (nonatomic, assign) CCMenuItemFont *menuItem19;
@property (nonatomic, assign) CCMenuItemFont *menuItem20;

@property (nonatomic, assign) CCMenuItemFont *menuItem21;
@property (nonatomic, assign) CCMenuItemFont *menuItem22;
@property (nonatomic, assign) CCMenuItemFont *menuItem23;
@property (nonatomic, assign) CCMenuItemFont *menuItem24;
@property (nonatomic, assign) CCMenuItemFont *menuItem25;
@property (nonatomic, assign) CCMenuItemFont *menuItem26;
@property (nonatomic, assign) CCMenuItemFont *menuItem27;
@property (nonatomic, assign) CCMenuItemFont *menuItem28;
@property (nonatomic, assign) CCMenuItemFont *menuItem29;
@property (nonatomic, assign) CCMenuItemFont *menuItem30;

@property (nonatomic, assign) CCMenuItemFont *menuItem31;
@property (nonatomic, assign) CCMenuItemFont *menuItem32;
@property (nonatomic, assign) CCMenuItemFont *menuItem33;
@property (nonatomic, assign) CCMenuItemFont *menuItem34;
@property (nonatomic, assign) CCMenuItemFont *menuItem35;
@property (nonatomic, assign) CCMenuItemFont *menuItem36;
@property (nonatomic, assign) CCMenuItemFont *menuItem37;
@property (nonatomic, assign) CCMenuItemFont *menuItem38;
@property (nonatomic, assign) CCMenuItemFont *menuItem39;
@property (nonatomic, assign) CCMenuItemFont *menuItem40;

@property (nonatomic, assign) CCMenuItemFont *menuItem41;
@property (nonatomic, assign) CCMenuItemFont *menuItem42;
@property (nonatomic, assign) CCMenuItemFont *menuItem43;
@property (nonatomic, assign) CCMenuItemFont *menuItem44;
@property (nonatomic, assign) CCMenuItemFont *menuItem45;
@property (nonatomic, assign) CCMenuItemFont *menuItem46;
@property (nonatomic, assign) CCMenuItemFont *menuItem47;
@property (nonatomic, assign) CCMenuItemFont *menuItem48;
@property (nonatomic, assign) CCMenuItemFont *menuItem49;
@property (nonatomic, assign) CCMenuItemFont *menuItem50;

@property (nonatomic, assign) CCMenuItemFont *menuItem51;
@property (nonatomic, assign) CCMenuItemFont *menuItem52;
@property (nonatomic, assign) CCMenuItemFont *menuItem53;
@property (nonatomic, assign) CCMenuItemFont *menuItem54;
@property (nonatomic, assign) CCMenuItemFont *menuItem55;
@property (nonatomic, assign) CCMenuItemFont *menuItem56;
@property (nonatomic, assign) CCMenuItemFont *menuItem57;
@property (nonatomic, assign) CCMenuItemFont *menuItem58;
@property (nonatomic, assign) CCMenuItemFont *menuItem59;
@property (nonatomic, assign) CCMenuItemFont *menuItem60;

@property (nonatomic, assign) CCSprite *whiteArrow;

+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;
-(void) updateDisplayedStars;



@end
