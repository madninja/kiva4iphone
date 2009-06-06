//
//  LoanTableFieldCell.h
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface LoanTableFieldCell : TTIconTableFieldCell {
	UILabel *_nameLabel;
	UILabel *_locationLabel;
	UILabel *_activityLabel;
	UILabel *_amountNeededLabel;
	UILabel *_useLabel;
}

@end
