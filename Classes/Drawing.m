//
//  Drawing.m
//  Sierpinski
//
//  Created by CS212 on 11-03-28.
//  Copyright 2011 __Pierre Chen__. All rights reserved.
//

#import "Drawing.h"


@implementation Drawing

@synthesize slider;


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
	
	if(super)
	{
		level = 0; // Initialize with level 0.
	}
	
    return self;
}


// Custom drawing.
- (void)drawRect:(CGRect)rect
{
	// Get the context of the view.
	ctx = UIGraphicsGetCurrentContext();
	// Set path color to blue.
	CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
	// Draw Sierpinski Gasket.
	[self drawGasketWithPoint1:CGPointMake(160, 50) withPoint2:CGPointMake(40, 350) withPoint3:CGPointMake(280, 350) withLevel:level];
}

// Recursively draw the triangles.
-(void)drawGasketWithPoint1:(CGPoint)p1 withPoint2:(CGPoint)p2 withPoint3:(CGPoint)p3 withLevel:(int)l
{
	CGPoint q1, q2, q3;
	
	// Move current point to one of the three points.
	CGContextMoveToPoint(ctx, p1.x , p1.y);
	
	// Draw lines to each other.
	CGContextAddLineToPoint(ctx, p2.x, p2.y);
	CGContextAddLineToPoint(ctx, p3.x, p3.y);
	CGContextAddLineToPoint(ctx, p1.x, p1.y);
	CGContextStrokePath(ctx);
	if (l > 0) 
	{
		q1.x = (p1.x + p2.x)/2;
		q1.y = (p1.y + p2.y)/2;
		q2.x = (p1.x + p3.x)/2;
		q2.y = (p1.y + p3.y)/2;
		q3.x = (p2.x + p3.x)/2;
		q3.y = (p2.y + p3.y)/2;
		[self drawGasketWithPoint1:p1 withPoint2:q1 withPoint3:q2 withLevel:l-1];
		[self drawGasketWithPoint1:p2 withPoint2:q1 withPoint3:q3 withLevel:l-1];
		[self drawGasketWithPoint1:p3 withPoint2:q2 withPoint3:q3 withLevel:l-1];
	}
}

-(IBAction)slider:(id)sender
{
	int numTemp = level;
	
	// Get the value from slider and change the value to integer form.
	if([slider value] >= 0 && [slider value] <1)
		level = 0;
	else if([slider value] >= 1 && [slider value] <2)
		level = 1;
	else if([slider value] >= 2 && [slider value] <3)
		level = 2;
	else if([slider value] >= 3 && [slider value] <4)
		level = 3;
	else if([slider value] >= 4 && [slider value] <5)
		level = 4;
	else if([slider value] >= 5 && [slider value] <6)
		level = 5;
	else if([slider value] >= 6 && [slider value] <7)
		level = 6;
	else if([slider value] >= 7 && [slider value] <8)
		level = 7;
	else if([slider value] == 8)
		level = 8;
	
	// If the level changed, repaint the view.
	if(numTemp != level)
		[self setNeedsDisplay];

}


- (void)dealloc {
    [super dealloc];
}


@end
