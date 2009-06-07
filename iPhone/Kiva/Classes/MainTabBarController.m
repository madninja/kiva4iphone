//
//  MainTabBarController.m
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MainTabBarController.h"
#import "RegisterViewController.h"

@implementation MainTabBarController


@synthesize registerView;



-(id)initWithCoder:(NSCoder *)coder {
	if (self = [super initWithCoder:coder]) {
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		if ([defaults objectForKey:@"Kiva.Username"] == nil) {
			//[self setRegisterView:[[RegisterViewController alloc] init]];
			//[registerView addObserver:self forKeyPath:@"dismissed" options:NSKeyValueObservingOptionNew context:@"register"];
			//[[self view] addSubview:[registerView view]];
		}
	}
	return self;
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == @"register") {
		[[registerView view] removeFromSuperview];
	} else {
		[super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
	}
}



@end
