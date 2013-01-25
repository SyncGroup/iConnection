//
//  Connection.h
//  Carnaval
//
//  Created by Gabriel Vincent on 11/22/12.
//  Copyright (c) 2012 Syncmobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface Connection : NSObject {
	Reachability *reachability;
	BOOL isConnected;
}

+ (id)sharedInstance;

- (BOOL) isConnected;
- (void) startCheckingForNetwork;

@end
