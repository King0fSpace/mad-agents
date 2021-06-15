//
//  LevelSelectorMenus.m
//  Mad Agents
//
//  Created by Long Le on 1/24/13.
//
//

#import "LevelSelectorMenus.h"


@implementation LevelSelectorMenus


@synthesize theGame;

@synthesize menuItemsArray;
@synthesize menusArray;
@synthesize whiteArrow;

@synthesize menuItem1;
@synthesize menuItem2;
@synthesize menuItem3;
@synthesize menuItem4;
@synthesize menuItem5;
@synthesize menuItem6;
@synthesize menuItem7;
@synthesize menuItem8;
@synthesize menuItem9;
@synthesize menuItem10;

@synthesize menuItem21;
@synthesize menuItem22;
@synthesize menuItem23;
@synthesize menuItem24;
@synthesize menuItem25;
@synthesize menuItem26;
@synthesize menuItem27;
@synthesize menuItem28;
@synthesize menuItem29;
@synthesize menuItem30;

@synthesize menuItem31;
@synthesize menuItem32;
@synthesize menuItem33;
@synthesize menuItem34;
@synthesize menuItem35;
@synthesize menuItem36;
@synthesize menuItem37;
@synthesize menuItem38;
@synthesize menuItem39;
@synthesize menuItem40;

@synthesize menuItem41;
@synthesize menuItem42;
@synthesize menuItem43;
@synthesize menuItem44;
@synthesize menuItem45;
@synthesize menuItem46;
@synthesize menuItem47;
@synthesize menuItem48;
@synthesize menuItem49;
@synthesize menuItem50;

@synthesize menuItem51;
@synthesize menuItem52;
@synthesize menuItem53;
@synthesize menuItem54;
@synthesize menuItem55;
@synthesize menuItem56;
@synthesize menuItem57;
@synthesize menuItem58;
@synthesize menuItem59;
@synthesize menuItem60;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    
    return [[[self alloc] initWithTheGame:_game] autorelease];
}


-(id)initWithTheGame:(HelloWorldLayer *)_game
{
    self = [super init];
    
    if (self != nil) {
        
        theGame = _game;
        
        levelSelectionMenuCurrentPage = 1;    
        
        whiteArrow = [CCSprite spriteWithFile: @"WhiteArrow.png"];
        whiteArrow.position = ccp([[CCDirector sharedDirector] winSize].width/2 - [[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2 - 190);
        whiteArrow.scale = 1.5;
        [self addChild: whiteArrow];
        [whiteArrow runAction: [CCRepeatForever actionWithAction: [CCSequence actions: [CCFadeTo actionWithDuration:0.1 opacity:200], [CCDelayTime actionWithDuration: 0.2], [CCFadeIn actionWithDuration:0.1], [CCDelayTime actionWithDuration:1.4], nil]]];
        
        
        [CCMenuItemFont setFontName: @"PixelArtFont.fnt"];
        
        menuItem1 = [CCMenuItemFont itemWithString:@"1" target:self selector:@selector(level1Button:)];
        menuItem2 = [CCMenuItemFont itemWithString:@"2" target:self selector:@selector(level2Button:)];
        menuItem3 = [CCMenuItemFont itemWithString:@"3" target:self selector:@selector(level3Button:)];
        menuItem4 = [CCMenuItemFont itemWithString:@"4" target:self selector:@selector(level4Button:)];
        menuItem5 = [CCMenuItemFont itemWithString:@"5" target:self selector:@selector(level5Button:)];
        menuItem6 = [CCMenuItemFont itemWithString:@"6" target:self selector:@selector(level6Button:)];
        menuItem7 = [CCMenuItemFont itemWithString:@"7" target:self selector:@selector(level7Button:)];
        menuItem8 = [CCMenuItemFont itemWithString:@"8" target:self selector:@selector(level8Button:)];
        menuItem9 = [CCMenuItemFont itemWithString:@"9" target:self selector:@selector(level9Button:)];
        menuItem10 = [CCMenuItemFont itemWithString:@"10" target:self selector:@selector(level10Button:)];
        menuItem11 = [CCMenuItemFont itemWithString:@"11" target:self selector:@selector(level11Button:)];
        menuItem12 = [CCMenuItemFont itemWithString:@"12" target:self selector:@selector(level12Button:)];
        menuItem13 = [CCMenuItemFont itemWithString:@"13" target:self selector:@selector(level13Button:)];
        menuItem14 = [CCMenuItemFont itemWithString:@"14" target:self selector:@selector(level14Button:)];
        menuItem15 = [CCMenuItemFont itemWithString:@"15" target:self selector:@selector(level15Button:)];
        menuItem16 = [CCMenuItemFont itemWithString:@"16" target:self selector:@selector(level16Button:)];
        menuItem17 = [CCMenuItemFont itemWithString:@"17" target:self selector:@selector(level17Button:)];
        menuItem18 = [CCMenuItemFont itemWithString:@"18" target:self selector:@selector(level18Button:)];
        menuItem19 = [CCMenuItemFont itemWithString:@"19" target:self selector:@selector(level19Button:)];
        menuItem20 = [CCMenuItemFont itemWithString:@"20" target:self selector:@selector(level20Button:)];
        
        menuItem21 = [CCMenuItemFont itemWithString:@"21" target:self selector:@selector(level21Button:)];
        menuItem22 = [CCMenuItemFont itemWithString:@"22" target:self selector:@selector(level22Button:)];
        menuItem23 = [CCMenuItemFont itemWithString:@"23" target:self selector:@selector(level23Button:)];
        menuItem24 = [CCMenuItemFont itemWithString:@"24" target:self selector:@selector(level24Button:)];
        menuItem25 = [CCMenuItemFont itemWithString:@"25" target:self selector:@selector(level25Button:)];
        menuItem26 = [CCMenuItemFont itemWithString:@"26" target:self selector:@selector(level26Button:)];
        menuItem27 = [CCMenuItemFont itemWithString:@"27" target:self selector:@selector(level27Button:)];
        menuItem28 = [CCMenuItemFont itemWithString:@"28" target:self selector:@selector(level28Button:)];
        menuItem29 = [CCMenuItemFont itemWithString:@"29" target:self selector:@selector(level29Button:)];
        menuItem30 = [CCMenuItemFont itemWithString:@"30" target:self selector:@selector(level30Button:)];
        menuItem31 = [CCMenuItemFont itemWithString:@"31" target:self selector:@selector(level31Button:)];
        menuItem32 = [CCMenuItemFont itemWithString:@"32" target:self selector:@selector(level32Button:)];
        menuItem33 = [CCMenuItemFont itemWithString:@"33" target:self selector:@selector(level33Button:)];
        menuItem34 = [CCMenuItemFont itemWithString:@"34" target:self selector:@selector(level34Button:)];
        menuItem35 = [CCMenuItemFont itemWithString:@"35" target:self selector:@selector(level35Button:)];
        menuItem36 = [CCMenuItemFont itemWithString:@"36" target:self selector:@selector(level36Button:)];
        menuItem37 = [CCMenuItemFont itemWithString:@"37" target:self selector:@selector(level37Button:)];
        menuItem38 = [CCMenuItemFont itemWithString:@"38" target:self selector:@selector(level38Button:)];
        menuItem39 = [CCMenuItemFont itemWithString:@"39" target:self selector:@selector(level39Button:)];
        menuItem40 = [CCMenuItemFont itemWithString:@"40" target:self selector:@selector(level40Button:)];
        
        menuItem41 = [CCMenuItemFont itemWithString:@"41" target:self selector:@selector(level41Button:)];
        menuItem42 = [CCMenuItemFont itemWithString:@"42" target:self selector:@selector(level42Button:)];
        menuItem43 = [CCMenuItemFont itemWithString:@"43" target:self selector:@selector(level43Button:)];
        menuItem44 = [CCMenuItemFont itemWithString:@"44" target:self selector:@selector(level44Button:)];
        menuItem45 = [CCMenuItemFont itemWithString:@"45" target:self selector:@selector(level45Button:)];
        menuItem46 = [CCMenuItemFont itemWithString:@"46" target:self selector:@selector(level46Button:)];
        menuItem47 = [CCMenuItemFont itemWithString:@"47" target:self selector:@selector(level47Button:)];
        menuItem48 = [CCMenuItemFont itemWithString:@"48" target:self selector:@selector(level48Button:)];
        menuItem49 = [CCMenuItemFont itemWithString:@"49" target:self selector:@selector(level49Button:)];
        menuItem50 = [CCMenuItemFont itemWithString:@"50" target:self selector:@selector(level50Button:)];
        menuItem51 = [CCMenuItemFont itemWithString:@"51" target:self selector:@selector(level51Button:)];
        menuItem52 = [CCMenuItemFont itemWithString:@"52" target:self selector:@selector(level52Button:)];
        menuItem53 = [CCMenuItemFont itemWithString:@"53" target:self selector:@selector(level53Button:)];
        menuItem54 = [CCMenuItemFont itemWithString:@"54" target:self selector:@selector(level54Button:)];
        menuItem55 = [CCMenuItemFont itemWithString:@"55" target:self selector:@selector(level55Button:)];
        menuItem56 = [CCMenuItemFont itemWithString:@"56" target:self selector:@selector(level56Button:)];
        menuItem57 = [CCMenuItemFont itemWithString:@"57" target:self selector:@selector(level57Button:)];
        menuItem58 = [CCMenuItemFont itemWithString:@"58" target:self selector:@selector(level58Button:)];
        menuItem59 = [CCMenuItemFont itemWithString:@"59" target:self selector:@selector(level59Button:)];
        menuItem60 = [CCMenuItemFont itemWithString:@"60" target:self selector:@selector(level60Button:)];
        

        menuItem1.fontSize = 50;
        menuItem2.fontSize = 50;
        menuItem3.fontSize = 50;
        menuItem4.fontSize = 50;
        menuItem5.fontSize = 50;
        menuItem6.fontSize = 50;
        menuItem7.fontSize = 50;
        menuItem8.fontSize = 50;
        menuItem9.fontSize = 50;
        menuItem10.fontSize = 50;
        menuItem11.fontSize = 50;
        menuItem12.fontSize = 50;
        menuItem13.fontSize = 50;
        menuItem14.fontSize = 50;
        menuItem15.fontSize = 50;
        menuItem16.fontSize = 50;
        menuItem17.fontSize = 50;
        menuItem18.fontSize = 50;
        menuItem19.fontSize = 50;
        menuItem20.fontSize = 50;
        
        menuItem21.fontSize = 50;
        menuItem22.fontSize = 50;
        menuItem23.fontSize = 50;
        menuItem24.fontSize = 50;
        menuItem25.fontSize = 50;
        menuItem26.fontSize = 50;
        menuItem27.fontSize = 50;
        menuItem28.fontSize = 50;
        menuItem29.fontSize = 50;
        menuItem30.fontSize = 50;
        menuItem31.fontSize = 50;
        menuItem32.fontSize = 50;
        menuItem33.fontSize = 50;
        menuItem34.fontSize = 50;
        menuItem35.fontSize = 50;
        menuItem36.fontSize = 50;
        menuItem37.fontSize = 50;
        menuItem38.fontSize = 50;
        menuItem39.fontSize = 50;
        menuItem40.fontSize = 50;
        
        menuItem41.fontSize = 50;
        menuItem42.fontSize = 50;
        menuItem43.fontSize = 50;
        menuItem44.fontSize = 50;
        menuItem45.fontSize = 50;
        menuItem46.fontSize = 50;
        menuItem47.fontSize = 50;
        menuItem48.fontSize = 50;
        menuItem49.fontSize = 50;
        menuItem50.fontSize = 50;
        menuItem51.fontSize = 50;
        menuItem52.fontSize = 50;
        menuItem53.fontSize = 50;
        menuItem54.fontSize = 50;
        menuItem55.fontSize = 50;
        menuItem56.fontSize = 50;
        menuItem57.fontSize = 50;
        menuItem58.fontSize = 50;
        menuItem59.fontSize = 50;
        menuItem60.fontSize = 50;
                
        CCMenu *menu = [CCMenu menuWithItems:menuItem1, menuItem2, menuItem3, menuItem4, menuItem5, menuItem6, nil];
        CCMenu *menu2 = [CCMenu menuWithItems:menuItem7, menuItem8, menuItem9, menuItem10, menuItem11, menuItem12, nil];
        CCMenu *menu3 = [CCMenu menuWithItems:menuItem13, menuItem14, menuItem15, menuItem16, menuItem17, menuItem18, nil];
        CCMenu *menu4 = [CCMenu menuWithItems:menuItem19, menuItem20, nil];
        
        CCMenu *menu5 = [CCMenu menuWithItems:menuItem21, menuItem22, menuItem23, menuItem24, menuItem25, menuItem26, nil];
        CCMenu *menu6 = [CCMenu menuWithItems:menuItem27, menuItem28, menuItem29, menuItem30, menuItem31, menuItem32, nil];
        CCMenu *menu7 = [CCMenu menuWithItems:menuItem33, menuItem34, menuItem35, menuItem36, menuItem37, menuItem38, nil];
        CCMenu *menu8 = [CCMenu menuWithItems:menuItem39, menuItem40, nil];
        
        CCMenu *menu9 = [CCMenu menuWithItems:menuItem41, menuItem42, menuItem43, menuItem44, menuItem45, menuItem46, nil];
        CCMenu *menu10 = [CCMenu menuWithItems:menuItem47, menuItem48, menuItem49, menuItem50, menuItem51, menuItem52, nil];
        CCMenu *menu11 = [CCMenu menuWithItems:menuItem53, menuItem54, menuItem55, menuItem56, menuItem57, menuItem58, nil];
        CCMenu *menu12 = [CCMenu menuWithItems:menuItem59, menuItem60, nil];

        [menu alignItemsHorizontallyWithPadding: 60];
        [menu2 alignItemsHorizontallyWithPadding: 45];
        [menu3 alignItemsHorizontallyWithPadding: 30];
        [menu4 alignItemsHorizontallyWithPadding: 30];

        [menu5 alignItemsHorizontallyWithPadding: 30];
        [menu6 alignItemsHorizontallyWithPadding: 30];
        [menu7 alignItemsHorizontallyWithPadding: 30];
        [menu8 alignItemsHorizontallyWithPadding: 30];
        
        [menu9 alignItemsHorizontallyWithPadding: 30];
        [menu10 alignItemsHorizontallyWithPadding: 30];
        [menu11 alignItemsHorizontallyWithPadding: 30];
        [menu12 alignItemsHorizontallyWithPadding: 30];
        
        //Page1 Row 1
        menuItem1.position = ccp(menuItem1.position.x, menuItem1.position.y + 120);
        menuItem2.position = ccp(menuItem2.position.x, menuItem2.position.y + 120);
        menuItem3.position = ccp(menuItem3.position.x, menuItem3.position.y + 120);
        menuItem4.position = ccp(menuItem4.position.x, menuItem4.position.y + 120);
        menuItem5.position = ccp(menuItem5.position.x, menuItem5.position.y + 120);
        menuItem6.position = ccp(menuItem6.position.x, menuItem6.position.y + 120);
        
        //Page1 Row2
        menuItem7.position = ccp(menuItem7.position.x, menuItem7.position.y + 30);
        menuItem8.position = ccp(menuItem8.position.x, menuItem8.position.y + 30);
        menuItem9.position = ccp(menuItem9.position.x, menuItem9.position.y + 30);
        menuItem10.position = ccp(menuItem10.position.x, menuItem10.position.y + 30);
        menuItem11.position = ccp(menuItem11.position.x, menuItem11.position.y + 30);
        menuItem12.position = ccp(menuItem12.position.x, menuItem12.position.y + 30);
        
        //Page1 Row3
        menuItem13.position = ccp(menuItem13.position.x, menuItem13.position.y - 60);
        menuItem14.position = ccp(menuItem14.position.x, menuItem14.position.y - 60);
        menuItem15.position = ccp(menuItem15.position.x, menuItem15.position.y - 60);
        menuItem16.position = ccp(menuItem16.position.x, menuItem16.position.y - 60);
        menuItem17.position = ccp(menuItem17.position.x, menuItem17.position.y - 60);
        menuItem18.position = ccp(menuItem18.position.x, menuItem18.position.y - 60);
        
        //Page1 Row4
        menuItem19.position = ccp(menuItem19.position.x, menuItem19.position.y - 150);
        menuItem20.position = ccp(menuItem20.position.x, menuItem20.position.y - 150);
        

        
        int page2VeriticalOffset = 0;
        //Page2 Row 1
        menuItem21.position = ccp(menuItem21.position.x + page2VeriticalOffset, menuItem21.position.y + 120);
        menuItem22.position = ccp(menuItem22.position.x + page2VeriticalOffset, menuItem22.position.y + 120);
        menuItem23.position = ccp(menuItem23.position.x + page2VeriticalOffset, menuItem23.position.y + 120);
        menuItem24.position = ccp(menuItem24.position.x + page2VeriticalOffset, menuItem24.position.y + 120);
        menuItem25.position = ccp(menuItem25.position.x + page2VeriticalOffset, menuItem25.position.y + 120);
        menuItem26.position = ccp(menuItem26.position.x + page2VeriticalOffset, menuItem26.position.y + 120);
        
        //Page2 Row2
        menuItem27.position = ccp(menuItem27.position.x + page2VeriticalOffset, menuItem27.position.y + 30);
        menuItem28.position = ccp(menuItem28.position.x + page2VeriticalOffset, menuItem28.position.y + 30);
        menuItem29.position = ccp(menuItem29.position.x + page2VeriticalOffset, menuItem29.position.y + 30);
        menuItem30.position = ccp(menuItem30.position.x + page2VeriticalOffset, menuItem30.position.y + 30);
        menuItem31.position = ccp(menuItem31.position.x + page2VeriticalOffset, menuItem31.position.y + 30);
        menuItem32.position = ccp(menuItem32.position.x + page2VeriticalOffset, menuItem32.position.y + 30);
        
        //Page2 Row3
        menuItem33.position = ccp(menuItem33.position.x + page2VeriticalOffset, menuItem33.position.y - 60);
        menuItem34.position = ccp(menuItem34.position.x + page2VeriticalOffset, menuItem34.position.y - 60);
        menuItem35.position = ccp(menuItem35.position.x + page2VeriticalOffset, menuItem35.position.y - 60);
        menuItem36.position = ccp(menuItem36.position.x + page2VeriticalOffset, menuItem36.position.y - 60);
        menuItem37.position = ccp(menuItem37.position.x + page2VeriticalOffset, menuItem37.position.y - 60);
        menuItem38.position = ccp(menuItem38.position.x + page2VeriticalOffset, menuItem38.position.y - 60);
        
        //Page2 Row4
        menuItem39.position = ccp(menuItem39.position.x + page2VeriticalOffset, menuItem39.position.y - 150);
        menuItem40.position = ccp(menuItem40.position.x + page2VeriticalOffset, menuItem40.position.y - 150);
        
        
        
        
        int page3VeriticalOffset = 0;
        //Page3 Row 1
        menuItem41.position = ccp(menuItem41.position.x + page3VeriticalOffset, menuItem41.position.y + 120);
        menuItem42.position = ccp(menuItem42.position.x + page3VeriticalOffset, menuItem42.position.y + 120);
        menuItem43.position = ccp(menuItem43.position.x + page3VeriticalOffset, menuItem43.position.y + 120);
        menuItem44.position = ccp(menuItem44.position.x + page3VeriticalOffset, menuItem44.position.y + 120);
        menuItem45.position = ccp(menuItem45.position.x + page3VeriticalOffset, menuItem45.position.y + 120);
        menuItem46.position = ccp(menuItem46.position.x + page3VeriticalOffset, menuItem46.position.y + 120);
        
        //Page3 Row2
        menuItem47.position = ccp(menuItem47.position.x + page3VeriticalOffset, menuItem47.position.y + 30);
        menuItem48.position = ccp(menuItem48.position.x + page3VeriticalOffset, menuItem48.position.y + 30);
        menuItem49.position = ccp(menuItem49.position.x + page3VeriticalOffset, menuItem49.position.y + 30);
        menuItem50.position = ccp(menuItem50.position.x + page3VeriticalOffset, menuItem50.position.y + 30);
        menuItem51.position = ccp(menuItem51.position.x + page3VeriticalOffset, menuItem51.position.y + 30);
        menuItem52.position = ccp(menuItem52.position.x + page3VeriticalOffset, menuItem52.position.y + 30);
        
        //Page3 Row3
        menuItem53.position = ccp(menuItem53.position.x + page3VeriticalOffset, menuItem53.position.y - 60);
        menuItem54.position = ccp(menuItem54.position.x + page3VeriticalOffset, menuItem54.position.y - 60);
        menuItem55.position = ccp(menuItem55.position.x + page3VeriticalOffset, menuItem55.position.y - 60);
        menuItem56.position = ccp(menuItem56.position.x + page3VeriticalOffset, menuItem56.position.y - 60);
        menuItem57.position = ccp(menuItem57.position.x + page3VeriticalOffset, menuItem57.position.y - 60);
        menuItem58.position = ccp(menuItem58.position.x + page3VeriticalOffset, menuItem58.position.y - 60);
        
        //Page3 Row4
        menuItem59.position = ccp(menuItem59.position.x + page3VeriticalOffset, menuItem59.position.y - 150);
        menuItem60.position = ccp(menuItem60.position.x + page3VeriticalOffset, menuItem60.position.y - 150);
        
        levelSectionPage1 = [[CCLayer alloc] init];
        levelSectionPage2 = [[CCLayer alloc] init];
        levelSectionPage3 = [[CCLayer alloc] init];

        
        [levelSectionPage1 addChild: menu];
        [levelSectionPage1 addChild: menu2];
        [levelSectionPage1 addChild: menu3];
        [levelSectionPage1 addChild: menu4];
        
        [levelSectionPage2 addChild: menu5];
        [levelSectionPage2 addChild: menu6];
        [levelSectionPage2 addChild: menu7];
        [levelSectionPage2 addChild: menu8];
        
        [levelSectionPage3 addChild: menu9];
        [levelSectionPage3 addChild: menu10];
        [levelSectionPage3 addChild: menu11];
        [levelSectionPage3 addChild: menu12];
        
        //LEFT OFF AT: Put all menu objects into a new array called 'menusArray.'  Iterate through each of those arrays and add all of the chidlren of each menu object into a separate array called menuItemsArray.
        
        menuItemsArray = [[NSMutableArray alloc] init];
        menusArray = [[NSMutableArray alloc] init];
        
        for (CCMenu *menus in levelSectionPage1.children) {
            
            if ([menus isKindOfClass:[CCMenu class]]) {
                
                [menusArray addObject: menus];
            }
        }
        
        for (CCMenu *menus in levelSectionPage2.children) {
            
            if ([menus isKindOfClass:[CCMenu class]]) {
                
                [menusArray addObject: menus];
            }
        }
        
        for (CCMenu *menus in levelSectionPage3.children) {
            
            if ([menus isKindOfClass:[CCMenu class]]) {
                
                [menusArray addObject: menus];
            }
        }
        
        for (CCNode *menus in menusArray) {
            
            for (CCMenuItem *item in menus.children) {
                
                [menuItemsArray addObject: item];
            }
        }
    }
    
    NSLog (@"menuItemsArray count = %i", [menuItemsArray count]);
    
    [self updateDisplayedStars];
    
    // now create the scroller and pass-in the pages (set widthOffset to 0 for fullscreen pages)
    CCScrollLayer *scroller = [[CCScrollLayer alloc] initWithLayers:[NSMutableArray arrayWithObjects: levelSectionPage1, levelSectionPage2, levelSectionPage3, nil] widthOffset: -100];
    
    // finally add the scroller to your scene
    [self addChild:scroller];
    
    return self;
}

-(void) updateDisplayedStars
{
    prefs = [NSUserDefaults standardUserDefaults];
    
    int i = 1;
    
    //Assign the number of stars achieved to the object's property
    //Load prefs for which levels have achieved
    for (CCNode *menus in menusArray) {
        
        for (CCMenuItem *item in menus.children) {
            
            //Load number of stars achieved for each level
            item.numberOfStarsAchieved = [prefs integerForKey: [NSString stringWithFormat: @"menuItem%iNumberOfStarsAchievedForSaveSlot%i", i, currentSaveSlot]];
            
            //Save number of stars achieved for each level
            [prefs setInteger:item.numberOfStarsAchieved forKey: [NSString stringWithFormat: @"menuItem%iNumberOfStarsAchievedForSaveSlot%i", i, currentSaveSlot]];
            
            i = i + 1;            
        }
    }
    
    //Update the displayed stars for the object
    for (CCNode *menus in menusArray) {
        
        for (CCMenuItemFont *item in menus.children) {
            
            [item updateNumberOfStarsDisplayed];
        }
    }
}

- (void)level1Button:(id)sender
{
    currentLevel = 1;

  //  [theGame characterSelectionScreen];
    [theGame playElevatorIntro];
}

- (void)level2Button:(id)sender
{
    currentLevel = 2;
    
 //   [theGame characterSelectionScreen];
    [theGame characterSelectionScreen];
}

- (void)level3Button:(id)sender
{
    currentLevel = 3;
    
    [theGame characterSelectionScreen];
}

- (void)level4Button:(id)sender
{
    currentLevel = 4;
    
    [theGame characterSelectionScreen];
}

- (void)level5Button:(id)sender
{
    currentLevel = 5;
    
    [theGame characterSelectionScreen];
}

- (void)level6Button:(id)sender
{
    currentLevel = 6;
    
    [theGame characterSelectionScreen];
}

- (void)level7Button:(id)sender
{
    currentLevel = 7;
    
    [theGame characterSelectionScreen];
}

- (void)level8Button:(id)sender
{
    currentLevel = 8;
    
    [theGame characterSelectionScreen];
}

- (void)level9Button:(id)sender
{
    currentLevel = 9;
    
    [theGame characterSelectionScreen];
}

- (void)level10Button:(id)sender
{
    currentLevel = 10;
    
    [theGame characterSelectionScreen];
}

- (void)level11Button:(id)sender
{
    currentLevel = 11;
    
    [theGame characterSelectionScreen];
}

- (void)level12Button:(id)sender
{
    currentLevel = 12;
    
    [theGame characterSelectionScreen];
}

- (void)level13Button:(id)sender
{
    currentLevel = 13;
    
    [theGame characterSelectionScreen];
}

- (void)level14Button:(id)sender
{
    currentLevel = 14;
    
    [theGame characterSelectionScreen];
}

- (void)level15Button:(id)sender
{
    currentLevel = 15;
    
    [theGame characterSelectionScreen];
}

- (void)level16Button:(id)sender
{
    currentLevel = 16;
    
    [theGame characterSelectionScreen];
}

- (void)level17Button:(id)sender
{
    currentLevel = 17;
    
    [theGame characterSelectionScreen];
}

- (void)level18Button:(id)sender
{
    currentLevel = 18;
    
    [theGame characterSelectionScreen];
}

- (void)level19Button:(id)sender
{
    currentLevel = 19;
    
    [theGame characterSelectionScreen];
}

- (void)level20Button:(id)sender
{
    currentLevel = 20;
    
    [theGame characterSelectionScreen];
}

- (void)level21Button:(id)sender
{
    currentLevel = 21;
    
    [theGame characterSelectionScreen];
}

- (void)level22Button:(id)sender
{
    currentLevel = 22;
    
    [theGame characterSelectionScreen];
}

- (void)level23Button:(id)sender
{
    currentLevel = 23;
    
    [theGame characterSelectionScreen];
}

- (void)level24Button:(id)sender
{
    currentLevel = 24;
    
    [theGame characterSelectionScreen];
}

- (void)level25Button:(id)sender
{
    currentLevel = 25;
    
    [theGame characterSelectionScreen];
}

- (void)level26Button:(id)sender
{
    currentLevel = 26;
    
    [theGame characterSelectionScreen];
}

- (void)level27Button:(id)sender
{
    currentLevel = 27;
    
    [theGame characterSelectionScreen];
}

- (void)level28Button:(id)sender
{
    currentLevel = 28;
    
    [theGame characterSelectionScreen];
}

- (void)level29Button:(id)sender
{
    currentLevel = 29;
    
    [theGame characterSelectionScreen];
}

- (void)level30Button:(id)sender
{
    currentLevel = 30;
        
    [theGame characterSelectionScreen];
}

- (void)level31Button:(id)sender
{
    currentLevel = 31;
    
    [theGame characterSelectionScreen];
}

- (void)level32Button:(id)sender
{
    currentLevel = 32;
    
    [theGame characterSelectionScreen];
}

- (void)level33Button:(id)sender
{
    currentLevel = 33;
    
    [theGame characterSelectionScreen];
}

- (void)level34Button:(id)sender
{
    currentLevel = 34;
    
    [theGame characterSelectionScreen];
}

- (void)level35Button:(id)sender
{
    currentLevel = 35;
    
    [theGame characterSelectionScreen];
}

- (void)level36Button:(id)sender
{
    currentLevel = 36;
    
    [theGame characterSelectionScreen];
}

- (void)level37Button:(id)sender
{
    currentLevel = 37;
    
    [theGame characterSelectionScreen];
}

- (void)level38Button:(id)sender
{
    currentLevel = 38;
    
    [theGame characterSelectionScreen];
}

- (void)level39Button:(id)sender
{
    currentLevel = 39;
    
    [theGame characterSelectionScreen];
}

- (void)level40Button:(id)sender
{
    currentLevel = 40;
    
    [theGame characterSelectionScreen];
}

- (void)level41Button:(id)sender
{
    currentLevel = 41;
    
    [theGame characterSelectionScreen];
}

- (void)level42Button:(id)sender
{
    currentLevel = 42;
    
    [theGame characterSelectionScreen];
}

- (void)level43Button:(id)sender
{
    currentLevel = 43;
    
    [theGame characterSelectionScreen];
}

- (void)level44Button:(id)sender
{
    currentLevel = 44;
    
    [theGame characterSelectionScreen];
}

- (void)level45Button:(id)sender
{
    currentLevel = 45;
    
    [theGame characterSelectionScreen];
}

- (void)level46Button:(id)sender
{
    currentLevel = 46;
    
    [theGame characterSelectionScreen];
}

- (void)level47Button:(id)sender
{
    currentLevel = 47;
    
    [theGame characterSelectionScreen];
}

- (void)level48Button:(id)sender
{
    currentLevel = 48;
    
    [theGame characterSelectionScreen];
}

- (void)level49Button:(id)sender
{
    currentLevel = 49;
    
    [theGame characterSelectionScreen];
}

- (void)level50Button:(id)sender
{
    currentLevel = 50;
    
    [theGame characterSelectionScreen];
}

- (void)level51Button:(id)sender
{
    currentLevel = 51;
    
    [theGame characterSelectionScreen];
}

- (void)level52Button:(id)sender
{
    currentLevel = 52;
    
    [theGame characterSelectionScreen];
}

- (void)level53Button:(id)sender
{
    currentLevel = 53;
    
    [theGame characterSelectionScreen];
}

- (void)level54Button:(id)sender
{
    currentLevel = 54;
    
    [theGame characterSelectionScreen];
}

- (void)level55Button:(id)sender
{
    currentLevel = 55;
    
    [theGame characterSelectionScreen];
}

- (void)level56Button:(id)sender
{
    currentLevel = 56;
    
    [theGame characterSelectionScreen];
}

- (void)level57Button:(id)sender
{
    currentLevel = 57;
    
    [theGame characterSelectionScreen];
}

- (void)level58Button:(id)sender
{
    currentLevel = 58;
    
    [theGame characterSelectionScreen];
}

- (void)level59Button:(id)sender
{
    currentLevel = 59;
    
    [theGame characterSelectionScreen];
}

- (void)level60Button:(id)sender
{
    currentLevel = 60;
    
    [theGame characterSelectionScreen];
}










@end
