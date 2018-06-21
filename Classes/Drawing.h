//
//  Drawing.h
//  Sierpinski
//
//  Created by CS212 on 11-03-28.
//  Copyright 2011 __Pierre Chen__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SierpinskiAppDelegate.h"

// A view shows Sierpinski Gasket with a slider to controll the level of
// the graph. Level from 0 to 8.
@interface Drawing : UIView {
	IBOutlet UISlider *slider;
	int level;
	CGContextRef ctx;
}

@property (nonatomic, retain)IBOutlet UISlider *slider;

-(IBAction)slider:(id)sender;

@end
