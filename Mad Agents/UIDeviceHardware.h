//
//  UIDeviceHardware.h
//
//  Used to determine EXACT version of device software is running on.

#import <Foundation/Foundation.h>

int deviceSpeed;

@interface UIDeviceHardware : NSObject 

- (NSString *) platform;
- (NSString *) platformString;

@end