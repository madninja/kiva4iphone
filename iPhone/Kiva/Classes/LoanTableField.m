//
//  LoanTableCellView.m
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Three20/Three20.h>
#import "LoanTableField.h"


@implementation LoanTableField

@synthesize name = _name;
@synthesize location = _location;
@synthesize activity = _activity;
@synthesize amountNeeded = _amountNeeded;
@synthesize use = _use;

-(id)initWithName:(NSString *)theName andImageUrl:(NSString *)theImageUrl andLocation:(NSString *)theLocation andActivity:(NSString *)theActivity andAmountNeeded:(NSString *)theAmountNeeded andUse:(NSString *)theUse {
	if (self = [super init]) {
		self.use = theUse;
		self.name = theName;
		self.amountNeeded = theAmountNeeded;
		self.location = theLocation;
		self.activity = theActivity;
		self.image = theImageUrl;
		self.defaultImage = [UIImage imageNamed:@"Delay.png"];
	}
	return self;
}


@end
