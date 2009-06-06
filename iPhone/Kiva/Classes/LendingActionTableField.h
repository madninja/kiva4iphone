//
//  LoanTableCellView.h
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Three20/Three20.h>

@interface LendingActionTableField : TTIconTableField {
	NSString *_lenderName;
	NSString *_lenderImageUrl;
	NSString *_amount;
	NSString *_loanName;
	NSString *_loanImageUrl;
	NSString *_lenderWhereabout;
	NSString *_loanWhereabout;
}


@property (nonatomic,copy) NSString* lenderName;
@property (nonatomic,copy) NSString* lenderImageUrl;
@property (nonatomic,copy) NSString* amount;
@property (nonatomic,copy) NSString* loanName;
@property (nonatomic,copy) NSString* loanImageUrl;
@property (nonatomic,copy) NSString* lenderWhereabout;
@property (nonatomic,copy) NSString* loanWhereabout;


-(id)initWithLenderName:(NSString *)theLenderName andLenderImageUrl:(NSString *)theLenderImageUrl andAmount:(NSString *)theAmount andLoanName:(NSString *)theLoanName andLoanImageUrl:(NSString *)loanImageUrl;


@end
