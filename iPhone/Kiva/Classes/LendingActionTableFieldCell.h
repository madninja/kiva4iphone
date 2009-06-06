//
//  LoanTableFieldCell.h
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface LendingActionTableFieldCell : TTIconTableFieldCell {
	UIImageView *_arrowImage;
	UILabel *_lenderNameLabel;
	UILabel *_loanNameLabel;
	UILabel *_amountLabel;
	UIImage *_loanImage;
	TTImageView* _loanImageView;
}

@end
