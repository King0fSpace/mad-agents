//
//  SaveVideoButton.h
//  Mad Agents
//
//  Created by Long Le on 10/30/12.
//
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
//#import "HelloWorldLayer.h"


@class HelloWorldLayer;


@interface SaveVideoButton : CCSprite
{
    CCLabelBMFont *shareGameplayLabel;
    CCLabelBMFont *videoLabel;
}

@property (nonatomic,assign) HelloWorldLayer *theGame;
@property (nonatomic,assign) CCLabelBMFont *shareGameplayLabel;
@property (nonatomic,assign) CCLabelBMFont *videoLabel;




+(id)nodeWithTheGame:(HelloWorldLayer*)_game;
-(id)initWithTheGame:(HelloWorldLayer *)_game;


@end
