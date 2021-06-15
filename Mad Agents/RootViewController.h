//
//  RootViewController.h
//  GrenadeGame
//
//  Created by Robert Blackwood on 1/19/11.
//  Copyright Mobile Bros 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "HelloWorldLayer.h"
#import "MobclixFullScreenAdViewController.h"

//#import "GADBannerView.h"

//GADBannerView *bannerView_;

//DEBUG: Ad GADBannerViewDelegate to the following in order to allow AdMob to work
@interface RootViewController : UIViewController<UIGestureRecognizerDelegate, ADBannerViewDelegate, MobclixFullScreenAdDelegate> {

    ADBannerView *adView;
}

@property(nonatomic, retain) ADBannerView *adView;
//@property(nonatomic, retain) GADBannerView *bannerView_;


//-(void) gestures;
-(void) initGADBanner;

@end
