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
#import "LendingActionTableField.h"


@implementation LendingActionTableField


@synthesize lenderName = _lenderName;
@synthesize lenderImageUrl = _lenderImageUrl;
@synthesize amount = _amount;
@synthesize loanName = _loanName;
@synthesize loanImageUrl = _loanImageUrl;


-(id)initWithLenderName:(NSString *)theLenderName andLenderImageUrl:(NSString *)theLenderImageUrl andAmount:(NSString *)theAmount andLoanName:(NSString *)theLoanName andLoanImageUrl:(NSString *)theLoanImageUrl {
	if (self = [super init]) {
		self.lenderName = theLenderName;
		self.lenderImageUrl = theLenderImageUrl;
		self.amount = theAmount;
		self.loanName = theLoanName;
		self.loanImageUrl = theLoanImageUrl;
		self.defaultImage = [UIImage imageNamed:@"Delay.png"];
	}
	return self;
}

-(void)dealloc {
	[_lenderName release];
	[_lenderImageUrl release];
	[_amount release];
	[_loanImageUrl release];
	[_loanName release];
	[_defaultImage release];
	[super dealloc];
}


@end
