//
//  InGameButton.m
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "InGameButton.h"

@implementation InGameButton


@synthesize theGame;
@synthesize mySprite;
@synthesize buttonColor;
@synthesize leftAndRightButton;
@synthesize upAndDownButton;
@synthesize buttonReadyToBePushed;



+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}

-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        theGame = _game;
        
        self.visible = YES;
        
        mySprite = [CCSprite spriteWithFile:@"InGameButton.png"];
        
        self.anchorPoint = ccp(0.5, 0.5);
        mySprite.scale = 0.3;
        [self addChild:mySprite];

        [theGame addChild:self z: -10];
        
        buttonReadyToBePushed = YES;

        
        [self scheduleUpdate];
    }
    
    return self;
}

-(void) activateButton
{    
    if (leftAndRightButton == YES) {
        
        for (MovingDoors *movingDoors in movingDoorArray) {
            
            //If button is green, then move green doors only
            if (self.buttonColor == GREEN_BUTTON && movingDoors.doorColor == GREEN_DOOR) {
            
                if (movingDoors.movingDoorTouchingWallOnLeft) {
                    
                    movingDoors.movingRight = YES;
                    movingDoors.movingLeft = NO;
                }
                
                else if (movingDoors.movingDoorTouchingWallOnRight) {
                    
                    movingDoors.movingLeft = YES;
                    movingDoors.movingRight = NO;
                }
                
                //If door is not touching any wall give it a default behavior
                else {
                    
                    movingDoors.movingRight = YES;
                    movingDoors.movingLeft = NO;
                }
            }
            
            //If buttons are red, then move red doors only
            if (self.buttonColor == RED_BUTTON && movingDoors.doorColor == RED_DOOR) {
                
                if (movingDoors.movingDoorTouchingWallOnLeft) {
                    
                    movingDoors.movingRight = YES;
                    movingDoors.movingLeft = NO;
                }
                
                else if (movingDoors.movingDoorTouchingWallOnRight) {
                    
                    movingDoors.movingLeft = YES;
                    movingDoors.movingRight = NO;
                }
                
                //If door is not touching any wall give it a default behavior
                else {
                    
                    movingDoors.movingRight = YES;
                    movingDoors.movingLeft = NO;
                }
            }
        }
    }
    
    else if (upAndDownButton == YES) {
        
        for (MovingDoors *movingDoors in movingDoorArray) {
            
            //If button is green, then move green doors only
            if (self.buttonColor == GREEN_BUTTON && movingDoors.doorColor == GREEN_DOOR) {
            
                if (movingDoors.movingDoorTouchingWallOnBottom) {
                    
                   // NSLog (@"Green doors moving up");
                    
                    movingDoors.movingUp = YES;
                    movingDoors.movingDown = NO;
                }
                
                else if (movingDoors.movingDoorTouchingWallOnTop) {
                    
                   // NSLog (@"Green doors moving down");
                    
                    movingDoors.movingUp = NO;
                    movingDoors.movingDown = YES;
                }
                
                //If door is not touching any wall give it a default behavior
                else {
                    
                   // NSLog (@"Green doors ELSE subroutine running");
                    
                    movingDoors.movingUp = YES;
                    movingDoors.movingDown = NO;
                }
            }
            
            //If buttons are red, then move red doors only
            if (self.buttonColor == RED_BUTTON && movingDoors.doorColor == RED_BUTTON) {
                             
                if (movingDoors.movingDoorTouchingWallOnBottom) {
                                        
                    movingDoors.movingUp = YES;
                    movingDoors.movingDown = NO;
                }
                
                else if (movingDoors.movingDoorTouchingWallOnTop) {
                                        
                    movingDoors.movingUp = NO;
                    movingDoors.movingDown = YES;
                }
                
                //If door is not touching any wall give it a default behavior
                else {
                                        
                    movingDoors.movingUp = YES;
                    movingDoors.movingDown = NO;
                }
            }
        }
    }
}

-(void)update:(ccTime)dt {

}


-(void) dealloc
{
    [super dealloc];
}

@end
