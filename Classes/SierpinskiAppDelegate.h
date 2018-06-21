//
//  SierpinskiAppDelegate.h
//  Sierpinski
//
//  Created by CS212 on 11-03-28.
//  Copyright 2011 __Pierre Chen__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Drawing.h"

@interface SierpinskiAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

