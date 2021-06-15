//
//  UIDeviceHardware.m
//
//  Used to determine EXACT version of device software is running on.

#import "UIDeviceHardware.h"
#include <sys/types.h>
#include <sys/sysctl.h>

@implementation UIDeviceHardware

- (NSString *) platform{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *platform = [NSString stringWithUTF8String:machine];
    free(machine);
    return platform;
}

- (NSString *) platformString{
    
    NSString *platform = [self platform];
    
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])    return @"iPhone 4 CDMA";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 WiFi";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 GSM";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 CDMA";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2 CDMAS";
    if ([platform isEqualToString:@"iPad2,5"])      return @"iPad Mini Wifi";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad 3 WiFi";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad 3 CDMA";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad 3 GSM";
    if ([platform isEqualToString:@"iPad3,4"])      return @"iPad 4 Wifi";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    
    return platform;
}

-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
        
        if ([[self platformString] isEqualToString:@"iPod Touch 1G"]) {
            
            deviceSpeed = 0;
        }
        
        if ([[self platformString] isEqualToString:@"iPhone 1G"]) {
            
            deviceSpeed = 1;
        }
        
        if ([[self platformString] isEqualToString:@"iPod Touch 2G"]) {
            
            deviceSpeed = 2;
        }
        
        if ([[self platformString] isEqualToString:@"iPhone 3G"]) {
            
            deviceSpeed = 3;
        }
        
        if ([[self platformString] isEqualToString:@"iPod Touch 3G"]) {
            
            deviceSpeed = 4;
        }
        
        if ([[self platformString] isEqualToString:@"iPhone 3GS"]) {
            
            deviceSpeed = 5;
        }
        
        if ([[self platformString] isEqualToString:@"iPod Touch 4G"]) {
            
            deviceSpeed = 6;
        }
        
        if ([[self platformString] isEqualToString:@"iPhone 4"] || [[self platformString] isEqualToString:@"Verizon iPhone 4"]) {
            
            deviceSpeed = 7;
        }
        
        if ([[self platformString] isEqualToString:@"iPad"]) {
            
            deviceSpeed = 7;
        }
        
        if ([[self platformString] isEqualToString:@"iPad 2 (WiFi)"] || [[self platformString] isEqualToString:@"iPad 2 (GSM)"] || [[self platformString] isEqualToString:@"iPad 2 (CDMA)"] || [[self platformString] isEqualToString:@"iPad 3 GSM"]) {
            
            deviceSpeed = 8;
        }
        
        if ([[self platformString] isEqualToString:@"iPhone 4S"] || [[self platformString] isEqualToString:@"iPad Mini Wifi"]) {
            
            deviceSpeed = 9;
        }
        
        if ([[self platformString] isEqualToString:@"iPad 3 WiFi"] || [[self platformString] isEqualToString:@"iPad 3 CDMA"] || [[self platformString] isEqualToString:@"iPad 3 GSM"]) {
            
            deviceSpeed = 10;
        }
        
        if ([[self platformString] isEqualToString:@"iPhone 5 (GSM/LTE)"] || [[self platformString] isEqualToString:@"iPhone 5 (CDMA/LTE)"]) {
            
            deviceSpeed = 11;
        }
        
        else {
            
            deviceSpeed = 0;
        }
    }
    
    return self;
}

@end