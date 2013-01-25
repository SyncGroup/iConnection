//
//  Connection.m
//  Carnaval
//
//  Created by Gabriel Vincent on 11/22/12.
//  Copyright (c) 2012 Syncmobile. All rights reserved.
//

#import "Connection.h"

@implementation Connection

static Connection *sharedInstance = nil;

// Get the shared instance and create it if necessary.
+ (Connection *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
    }
    
    return sharedInstance;
}

- (id)init
{
    self = [super init];
    
    if (self) {
        // Work your initialising magic here as you normally would
    }
    
    return self;
}

- (void) startCheckingForNetwork {
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNetworkChange:) name:kReachabilityChangedNotification object:nil];
	
	reachability = [Reachability reachabilityForInternetConnection];
	[reachability startNotifier];
	
	NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
	
	if(remoteHostStatus == NotReachable) {
        isConnected = NO;
        NSLog(@"Not connected");
    }
	else if (remoteHostStatus == ReachableViaWiFi) {
        isConnected = YES;
        NSLog(@"Connected");
    }
	else if (remoteHostStatus == ReachableViaWWAN) {
        isConnected = YES;
        NSLog(@"Connected");
    }
}

- (void) handleNetworkChange:(NSNotification *)notice
{
	
	NetworkStatus remoteHostStatus = [reachability currentReachabilityStatus];
	
	if(remoteHostStatus == NotReachable) {
        isConnected = NO;
        NSLog(@"Not connected");
    }
	else if (remoteHostStatus == ReachableViaWiFi) {
        isConnected = YES;
        NSLog(@"Connected");
    }
	else if (remoteHostStatus == ReachableViaWWAN) {
        isConnected = YES;
        NSLog(@"Connected");
    }
}

- (BOOL) isConnected {
	
	return isConnected;
	
}

@end
