//
//  UploadProgressView.m
//  Weddine
//
//  Created by Guilherme Moura on 24/02/2013.
//  Copyright (c) 2013 Reefactor, Inc. All rights reserved.
//

#import "WDActivityIndicator.h"

@interface WDActivityIndicator ()

@property (nonatomic) CGFloat angle;
@property (strong, nonatomic) UIImageView *activityImageView;

@end

@implementation WDActivityIndicator

- (id)init {
	return [self initWithFrame:CGRectZero];
}

- (id)initWithFrame:(CGRect)frame {
	CGRect fixedFrame = {frame.origin, {21, 21}};
	self = [super initWithFrame:fixedFrame];
	if (self) {
		[self setupView];
	}
	
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self setupView];
	}
	
	return self;
}

- (void)setupView {
	UIImage *initialImage = [UIImage imageNamed:@"WDActivityIndicator.bundle/activity_image"];
	self.activityImageView = [[UIImageView alloc] initWithImage:initialImage];
	
	NSTimer *timer;
	self.angle = 0.0f;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDuration:0.8];
	
	timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(handleTimer:) userInfo:nil repeats:YES];
	
	[UIView commitAnimations];
	
	[self addSubview:self.activityImageView];
}

- (void)handleTimer:(NSTimer *)timer {
	self.angle += 0.13f;
	
	if (self.angle > 6.283)
		self.angle = 0.0f;

	CGAffineTransform transform = CGAffineTransformMakeRotation(self.angle);
	self.activityImageView.transform = transform;
}

@end
