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
    
    CCMenuItemLabel *menuItem1;
    CCMenuItemLabel *menuItem2;
    CCMenuItemLabel *menuItem3;
    CCMenuItemLabel *menuItem4;
    CCMenuItemLabel *menuItem5;
    CCMenuItemLabel *menuItem6;
    CCMenuItemLabel *menuItem7;
    CCMenuItemLabel *menuItem8;
    CCMenuItemLabel *menuItem9;
    CCMenuItemLabel *menuItem10;
    
    CCMenuItemLabel *menuItem11;
    CCMenuItemLabel *menuItem12;
    CCMenuItemLabel *menuItem13;
    CCMenuItemLabel *menuItem14;
    CCMenuItemLabel *menuItem15;
    CCMenuItemLabel *menuItem16;
    CCMenuItemLabel *menuItem17;
    CCMenuItemLabel *menuItem18;
    CCMenuItemLabel *menuItem19;
    CCMenuItemLabel *menuItem20;
    
    CCMenuItemLabel *menuItem21;
    CCMenuItemLabel *menuItem22;
    CCMenuItemLabel *menuItem23;
    CCMenuItemLabel *menuItem24;
    CCMenuItemLabel *menuItem25;
    CCMenuItemLabel *menuItem26;
    CCMenuItemLabel *menuItem27;
    CCMenuItemLabel *menuItem28;
    CCMenuItemLabel *menuItem29;
    CCMenuItemLabel *menuItem30;
    
    CCMenuItemLabel *menuItem31;
    CCMenuItemLabel *menuItem32;
    CCMenuItemLabel *menuItem33;
    CCMenuItemLabel *menuItem34;
    CCMenuItemLabel *menuItem35;
    CCMenuItemLabel *menuItem36;
    CCMenuItemLabel *menuItem37;
    CCMenuItemLabel *menuItem38;
    CCMenuItemLabel *menuItem39;
    CCMenuItemLabel *menuItem40;
    
    CCMenuItemLabel *menuItem41;
    CCMenuItemLabel *menuItem42;
    CCMenuItemLabel *menuItem43;
    CCMenuItemLabel *menuItem44;
    CCMenuItemLabel *menuItem45;
    CCMenuItemLabel *menuItem46;
    CCMenuItemLabel *menuItem47;
    CCMenuItemLabel *menuItem48;
    CCMenuItemLabel *menuItem49;
    CCMenuItemLabel *menuItem50;
    
    CCMenuItemLabel *menuItem51;
    CCMenuItemLabel *menuItem52;
    CCMenuItemLabel *menuItem53;
    CCMenuItemLabel *menuItem54;
    CCMenuItemLabel *menuItem55;
    CCMenuItemLabel *menuItem56;
    CCMenuItemLabel *menuItem57;
    CCMenuItemLabel *menuItem58;
    CCMenuItemLabel *menuItem59;
    CCMenuItemLabel *menuItem60;
}

@property (nonatomic, assign) NSMutableArray *menuItemsArray;
@property (nonatomic, assign) NSMutableArray *menusArray;
@property (nonatomic, assign) HelloWorldLayer *theGame;
@property (nonatomic, assign) CCMenuItemLabel *menuItem1;
@property (nonatomic, assign) CCMenuItemLabel *menuItem2;
@property (nonatomic, assign) CCMenuItemLabel *menuItem3;
@property (nonatomic, assign) CCMenuItemLabel *menuItem4;
@property (nonatomic, assign) CCMenuItemLabel *menuItem5;
@property (nonatomic, assign) CCMenuItemLabel *menuItem6;
@property (nonatomic, assign) CCMenuItemLabel *menuItem7;
@property (nonatomic, assign) CCMenuItemLabel *menuItem8;
@property (nonatomic, assign) CCMenuItemLabel *menuItem9;
@property (nonatomic, assign) CCMenuItemLabel *menuItem10;

@property (nonatomic, assign) CCMenuItemLabel *menuItem11;
@property (nonatomic, assign) CCMenuItemLabel *menuItem12;
@property (nonatomic, assign) CCMenuItemLabel *menuItem13;
@property (nonatomic, assign) CCMenuItemLabel *menuItem14;
@property (nonatomic, assign) CCMenuItemLabel *menuItem15;
@property (nonatomic, assign) CCMenuItemLabel *menuItem16;
@property (nonatomic, assign) CCMenuItemLabel *menuItem17;
@property (nonatomic, assign) CCMenuItemLabel *menuItem18;
@property (nonatomic, assign) CCMenuItemLabel *menuItem19;
@property (nonatomic, assign) CCMenuItemLabel *menuItem20;

@property (nonatomic, assign) CCMenuItemLabel *menuItem21;
@property (nonatomic, assign) CCMenuItemLabel *menuItem22;
@property (nonatomic, assign) CCMenuItemLabel *menuItem23;
@property (nonatomic, assign) CCMenuItemLabel *menuItem24;
@property (nonatomic, assign) CCMenuItemLabel *menuItem25;
@property (nonatomic, assign) CCMenuItemLabel *menuItem26;
@property (nonatomic, assign) CCMenuItemLabel *menuItem27;
@property (nonatomic, assign) CCMenuItemLabel *menuItem28;
@property (nonatomic, assign) CCMenuItemLabel *menuItem29;
@property (nonatomic, assign) CCMenuItemLabel *menuItem30;

@property (nonatomic, assign) CCMenuItemLabel *menuItem31;
@property (nonatomic, assign) CCMenuItemLabel *menuItem32;
@property (nonatomic, assign) CCMenuItemLabel *menuItem33;
@property (nonatomic, assign) CCMenuItemLabel *menuItem34;
@property (nonatomic, assign) CCMenuItemLabel *menuItem35;
@property (nonatomic, assign) CCMenuItemLabel *menuItem36;
@property (nonatomic, assign) CCMenuItemLabel *menuItem37;
@property (nonatomic, assign) CCMenuItemLabel *menuItem38;
@property (nonatomic, assign) CCMenuItemLabel *menuItem39;
@property (nonatomic, assign) CCMenuItemLabel *menuItem40;

@property (nonatomic, assign) CCMenuItemLabel *menuItem41;
@property (nonatomic, assign) CCMenuItemLabel *menuItem42;
@property (nonatomic, assign) CCMenuItemLabel *menuItem43;
@property (nonatomic, assign) CCMenuItemLabel *menuItem44;
@property (nonatomic, assign) CCMenuItemLabel *menuItem45;
@property (nonatomic, assign) CCMenuItemLabel *menuItem46;
@property (nonatomic, assign) CCMenuItemLabel *menuItem47;
@property (nonatomic, assign) CCMenuItemLabel *menuItem48;
@property (nonatomic, assign) CCMenuItemLabel *menuItem49;
@property (nonatomic, assign) CCMenuItemLabel *menuItem50;

@property (nonatomic, assign) CCMenuItemLabel *menuItem51;
@property (nonatomic, assign) CCMenuItemLabel *menuItem52;
@property (nonatomic, assign) CCMenuItemLabel *menuItem53;
@property (nonatomic, assign) CCMenuItemLabel *menuItem54;
@property (nonatomic, assign) CCMenuItemLabel *menuItem55;
@property (nonatomic, assign) CCMenuItemLabel *menuItem56;
@property (nonatomic, assign) CCMenuItemLabel *menuItem57;
@property (nonatomic, assign) CCMenuItemLabel *menuItem58;
@property (nonatomic, assign) CCMenuItemLabel *menuItem59;
@property (nonatomic, assign) CCMenuItemLabel *menuItem60;

@property (nonatomic, assign) CCSprite *whiteArrow;

+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;
-(void) updateDisplayedStars;



@end
