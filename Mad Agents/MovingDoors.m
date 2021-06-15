//
//  Movingdoors.m
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import "MovingDoors.h"

@implementation MovingDoors


@synthesize theGame;
@synthesize mySprite;
@synthesize movingRight;
@synthesize movingLeft;
@synthesize movingUp;
@synthesize movingDown;
@synthesize movingSpeed;
@synthesize doorColor;
@synthesize movingDoorTouchingWallOnTop;
@synthesize movingDoorTouchingWallOnBottom;
@synthesize movingDoorTouchingWallOnRight;
@synthesize movingDoorTouchingWallOnLeft;
@synthesize firstPlayerStandingOnDoor;
@synthesize secondPlayerStandingOnDoor;


+(id)nodeWithTheGame:(HelloWorldLayer*)_game {
    return [[[self alloc] initWithTheGame:_game] autorelease];
}

-(id) initWithTheGame:(HelloWorldLayer *)_game {
    
    if( (self=[super init])) {
        
        theGame = _game;
        
        self.visible = YES;

        mySprite = [CCSprite spriteWithFile:@"TileSetTemplate.png"];
        
        [self addChild:mySprite];
        
        [theGame addChild:self];
        
        [movingDoorArray addObject: self];
        
        movingSpeed = 1.0;
        
        //Set default properties
        movingUp = NO;
        movingDown = NO;
        movingRight = NO;
        movingLeft = NO;
        firstPlayerStandingOnDoor = NO;
        secondPlayerStandingOnDoor = NO;
    }
    
    [self scheduleUpdate];
    
    return self;
}


-(void)update:(ccTime)dt {
        
    for (self in movingDoorArray) {
                
        if (movingUp) {
         
            self.position = ccp(self.position.x, self.position.y + movingSpeed);
            
            //If firstPlayerSprite is standing on door then move them along with the door speed
            if (self.firstPlayerStandingOnDoor) {
                
                firstPlayerSprite.position = ccp(firstPlayerSprite.position.x, firstPlayerSprite.position.y + movingSpeed);
            }
        }
        
        if (movingDown) {
            
            self.position = ccp(self.position.x, self.position.y - movingSpeed);
            
            //If firstPlayerSprite is standing on door then move them along with the door speed
            if (self.firstPlayerStandingOnDoor) {
                
                firstPlayerSprite.position = ccp(firstPlayerSprite.position.x, firstPlayerSprite.position.y - movingSpeed);
            }
        }
        
        if (movingRight) {
            
            self.position = ccp(self.position.x + movingSpeed, self.position.y);
            
            //If firstPlayerSprite is standing on door then move them along with the door speed
            if (self.firstPlayerStandingOnDoor) {
                
                firstPlayerSprite.position = ccp(firstPlayerSprite.position.x + movingSpeed, firstPlayerSprite.position.y);
            }
        }
        
        if (movingLeft) {
            
            self.position = ccp(self.position.x - movingSpeed, self.position.y);
            
            //If firstPlayerSprite is standing on door then move them along with the door speed
            if (self.firstPlayerStandingOnDoor) {
                
                firstPlayerSprite.position = ccp(firstPlayerSprite.position.x - movingSpeed, firstPlayerSprite.position.y);
            }
        }
        
        
        //Check to see if door is touching another door            
        for (MovingDoors *movingDoor in movingDoorArray) {
        
            if (movingDoor != self) {
            
                //check if door's top side is touching another door
                if ((self.position.y - [self.mySprite boundingBox].size.height/2 < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y + [self.mySprite boundingBox].size.height/2  > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x - [self.mySprite boundingBox].size.width/2  < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x + [self.mySprite boundingBox].size.width/2  > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {

                    //stop door from moving up
                    self.movingUp = NO;
                    self.movingDoorTouchingWallOnTop = YES;
                    self.movingDoorTouchingWallOnBottom = NO;
                }
                
                //check if door's bottom is touching another door
                if ((self.position.y - [self.mySprite boundingBox].size.height/2 < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y + [self.mySprite boundingBox].size.height/2 > movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x - [self.mySprite boundingBox].size.width/2 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x + [self.mySprite boundingBox].size.width/2 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                    
                    //stop door from moving down
                    self.movingDown = NO;
                    self.movingDoorTouchingWallOnTop = NO;
                    self.movingDoorTouchingWallOnBottom = YES;
                }
                
                //check if right side of door is touching another door
                if ((self.position.y - [self.mySprite boundingBox].size.height/2 < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y + [self.mySprite boundingBox].size.height/2 > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x + [self.mySprite boundingBox].size.width/2 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x + [self.mySprite boundingBox].size.width/2 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                                    
                    self.movingRight = NO;
                    self.movingDoorTouchingWallOnLeft = NO;
                    self.movingDoorTouchingWallOnRight = YES;
                }
                
                //check if left side of door is touching another door
                if ((self.position.y - [self.mySprite boundingBox].size.height/2 < movingDoor.position.y + [movingDoor.mySprite boundingBox].size.height/2) && (self.position.y + [self.mySprite boundingBox].size.height/2 > movingDoor.position.y - [movingDoor.mySprite boundingBox].size.height/2) && (self.position.x - [self.mySprite boundingBox].size.width/2 < movingDoor.position.x + [movingDoor.mySprite boundingBox].size.width/2) && (self.position.x - [self.mySprite boundingBox].size.width/2 > movingDoor.position.x - [movingDoor.mySprite boundingBox].size.width/2)) {
                    
                    self.movingLeft = NO;
                    self.movingDoorTouchingWallOnLeft = YES;
                    self.movingDoorTouchingWallOnRight = NO;
                }
            }
        }
        
        //Check to see if door is touching a solid tile
        for (int row=0; row < [foreground layerSize].width; row++) {
            
            for (int col=0; col < [foreground layerSize].height; col++) {
                
                int tmpgid = [foreground tileGIDAt:ccp(row,col)];
                
                CGPoint tmpgidlocation = [foreground positionAt: ccp((row + 0.52), (col - 0.49))];
                
                if (tmpgid != 0) {
                    
                    //check if door's top is touching wall
                    if ((self.position.y - [self.mySprite boundingBox].size.height/2 < tmpgidlocation.y + 8) && (self.position.y + [self.mySprite boundingBox].size.height/2  > tmpgidlocation.y - 8) && (self.position.x - [self.mySprite boundingBox].size.width/2  < tmpgidlocation.x + 8) && (self.position.x + [self.mySprite boundingBox].size.width/2  > tmpgidlocation.x - 8)) {

                        //stop door from moving up
                        self.movingUp = NO;
                        self.movingDoorTouchingWallOnTop = YES;
                        self.movingDoorTouchingWallOnBottom = NO;
                    }
                    
                    //check if door's bottom is touching wall
                    if ((self.position.y - [self.mySprite boundingBox].size.height/2 < tmpgidlocation.y + 8) && (self.position.y + [self.mySprite boundingBox].size.height/2 > tmpgidlocation.y + 8) && (self.position.x - [self.mySprite boundingBox].size.width/2 < tmpgidlocation.x + 8) && (self.position.x + [self.mySprite boundingBox].size.width/2 > tmpgidlocation.x - 8)) {
  
                        //stop door from moving down
                        self.movingDown = NO;
                        self.movingDoorTouchingWallOnTop = NO;
                        self.movingDoorTouchingWallOnBottom = YES;
                    }
                    
                    //check if door's right side is touching wall
                    if ((self.position.y - 0 < tmpgidlocation.y + 8) && (self.position.y + 0 > tmpgidlocation.y - 8) && (self.position.x + [self.mySprite boundingBox].size.width/2 < tmpgidlocation.x + 8) && (self.position.x + [self.mySprite boundingBox].size.width/2 > tmpgidlocation.x - 8)) {
                        
                        self.movingRight = NO;
                        self.movingDoorTouchingWallOnLeft = NO;
                        self.movingDoorTouchingWallOnRight = YES;
                    }
                    
                    //check if door's left side is touching wall
                    if ((self.position.y - 0 < tmpgidlocation.y + 8) && (self.position.y + 0 > tmpgidlocation.y - 8) && (self.position.x - [self.mySprite boundingBox].size.width/2 < tmpgidlocation.x + 8) && (self.position.x - [self.mySprite boundingBox].size.width/2 > tmpgidlocation.x - 8)) {
                        
                        self.movingLeft = NO;
                        self.movingDoorTouchingWallOnLeft = YES;
                        self.movingDoorTouchingWallOnRight = NO;
                    }
                }
            }
        }
        
        //Check to see if enemy is touching a solid tile, which would make him stop falling
        for (int row=0; row < [solidBricks layerSize].width; row++) {
            
            for (int col=0; col < [solidBricks layerSize].height; col++) {
                
                int tmpgid = [solidBricks tileGIDAt:ccp(row,col)];
                
                CGPoint tmpgidlocation = [solidBricks positionAt: ccp((row + 0.52), (col - 0.49))];
                
                if (tmpgid != 0) {
                    
                    //check if door's top is touching wall
                    if ((self.position.y - [self.mySprite boundingBox].size.height/2 < tmpgidlocation.y + 8) && (self.position.y + [self.mySprite boundingBox].size.height/2  > tmpgidlocation.y - 8) && (self.position.x - [self.mySprite boundingBox].size.width/2  < tmpgidlocation.x + 8) && (self.position.x + [self.mySprite boundingBox].size.width/2  > tmpgidlocation.x - 8)) {
                        
                        //         if (col != 0 && ([solidBrick tileGIDAt:ccp(row,col - 1)] == 0)) {
                        
                        //stop door from moving up
                        self.movingUp = NO;
                        //        }
                    }
                    
                    //check if door's bottom is touching wall
                    if ((self.position.y - [self.mySprite boundingBox].size.height/2 < tmpgidlocation.y + 8) && (self.position.y + [self.mySprite boundingBox].size.height/2 > tmpgidlocation.y + 8) && (self.position.x - [self.mySprite boundingBox].size.width/2 < tmpgidlocation.x + 8) && (self.position.x + [self.mySprite boundingBox].size.width/2 > tmpgidlocation.x - 8)) {
                        
                        //   if (col != 0 && ([solidBrick tileGIDAt:ccp(row,col - 1)] == 0)) {
                        
                        //stop door from moving down
                        self.movingDown = NO;
                        //    }
                    }
                    
                    //check if door's right side is touching wall
                    if ((self.position.y - 0 < tmpgidlocation.y + 8) && (self.position.y + 0 > tmpgidlocation.y - 8) && (self.position.x + [self.mySprite boundingBox].size.width/2 < tmpgidlocation.x + 8) && (self.position.x + [self.mySprite boundingBox].size.width/2 > tmpgidlocation.x - 8)) {
                        
                        self.movingRight = NO;
                    }
                    
                    //check if door's left side is touching wall
                    if ((self.position.y - 0 < tmpgidlocation.y + 8) && (self.position.y + 0 > tmpgidlocation.y - 8) && (self.position.x - [self.mySprite boundingBox].size.width/2 < tmpgidlocation.x + 8) && (self.position.x - [self.mySprite boundingBox].size.width/2 > tmpgidlocation.x - 8)) {
                        
                        self.movingLeft = NO;
                    }
                }
            }
        }
    }
}


-(void) dealloc
{
    [super dealloc];
}

@end
