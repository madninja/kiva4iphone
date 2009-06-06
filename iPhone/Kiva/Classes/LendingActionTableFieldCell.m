//
//  LoanTableFieldCell.m
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Three20/Three20.h>
#import "LendingActionTableField.h"
#import "LendingActionTableFieldCell.h"

static CGFloat kHPadding = 10;
static CGFloat kVPadding = 10;
static CGFloat kMargin = 10;
static CGFloat kSpacing = 8;
static CGFloat kGroupMargin = 10;
static CGFloat kKeySpacing = 12;
static CGFloat kKeyWidth = 75;
static CGFloat kMaxLabelHeight = 2000;
static CGFloat kDisclosureIndicatorWidth = 23;
static CGFloat kTextFieldTitleWidth = 100;
static CGFloat kTableViewFieldCellHeight = 180;
static CGFloat kDefaultIconSize = 50;


@implementation LendingActionTableFieldCell


- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString*)identifier {
	if (self = [super initWithFrame:frame reuseIdentifier:identifier]) {
		
		_iconView = [[TTImageView alloc] initWithFrame:CGRectZero];
		//_iconView.borderRadius = 6;
		_iconView.backgroundColor = [UIColor clearColor];
		[self.contentView addSubview:_iconView];
		
		_loanImageView = [[TTImageView alloc] initWithFrame:CGRectZero];
		//_loanImageView.borderRadius = 6;
		_loanImageView.backgroundColor = [UIColor clearColor];
		[self.contentView addSubview:_loanImageView];
		
		_lenderNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_lenderNameLabel.font = [UIFont systemFontOfSize:20.0f];
		_lenderNameLabel.adjustsFontSizeToFitWidth = YES;
		//_lenderNameLabel.textColor = [TTAppearance appearance].tableSubTextColor;
		_lenderNameLabel.highlightedTextColor = [UIColor whiteColor];
		_lenderNameLabel.textAlignment = UITextAlignmentLeft;
		_lenderNameLabel.contentMode = UIViewContentModeTop;
		_lenderNameLabel.lineBreakMode = UILineBreakModeWordWrap;
		_lenderNameLabel.numberOfLines = 1;
		[self.contentView addSubview:_lenderNameLabel];
		
		_loanNameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_loanNameLabel.font = [UIFont systemFontOfSize:20.0f];
		_loanNameLabel.adjustsFontSizeToFitWidth = YES;
		_loanNameLabel.textColor = [TTAppearance appearance].tableSubTextColor;
		_loanNameLabel.highlightedTextColor = [UIColor whiteColor];
		_loanNameLabel.textAlignment = UITextAlignmentRight;
		_loanNameLabel.contentMode = UIViewContentModeTop;
		_loanNameLabel.lineBreakMode = UILineBreakModeWordWrap;
		_loanNameLabel.numberOfLines = 1;
		[self.contentView addSubview:_loanNameLabel];
	}
	return self;
}


- (void)layoutSubviews {
	[super layoutSubviews];
	LendingActionTableField* field = self.object;
	
	_lenderNameLabel.backgroundColor = [UIColor clearColor];
	_lenderNameLabel.frame = CGRectMake(10, 5, 300, 30);
	_lenderNameLabel.text = field.lenderName;
	
	_loanNameLabel.backgroundColor = [UIColor clearColor];
	_loanNameLabel.frame = CGRectMake(20, 105, 290, 30);
	_loanNameLabel.text = field.loanName;
	
	
	UIImage *lenderImage = field.lenderImageUrl ? [[TTURLCache sharedCache] imageForURL:field.lenderImageUrl] : nil;
	if (!lenderImage) {
		lenderImage = field.defaultImage;
	}
	
	if (_iconView.backgroundImageURL) {
		CGFloat iconWidth = lenderImage ? lenderImage.size.width : (field.lenderImageUrl ? kDefaultIconSize : 0);
		CGFloat iconHeight = lenderImage ? lenderImage.size.height : (field.lenderImageUrl ? kDefaultIconSize : 0);
		_iconView.frame = CGRectMake(kHPadding, floor(self.height/2 - iconHeight/2), iconWidth, iconHeight);
	} else {
		_iconView.frame = CGRectMake(kHPadding, floor(self.height/2 - 60.0f/2), 80.0f, 60.0f);
	}
	
	UIImage *loanImage = field.loanImageUrl ? [[TTURLCache sharedCache] imageForURL:field.loanImageUrl] : nil;
	if (!loanImage) {
		loanImage = field.defaultImage;
	}
	
	if (_loanImageView.backgroundImageURL) {
		CGFloat iconWidth = loanImage ? loanImage.size.width : (field.loanImageUrl ? kDefaultIconSize : 0);
		CGFloat iconHeight = loanImage ? loanImage.size.height : (field.loanImageUrl ? kDefaultIconSize : 0);
		_loanImageView.frame = CGRectMake(230.0f, floor(self.height/2 - iconHeight/2), iconWidth, iconHeight);
	} else {
		_loanImageView.frame = CGRectMake(kHPadding, floor(self.height/2 - 60.0f/2), 80.0f, 60.0f);
	}
}


- (void)setObject:(id)object {
	if (_field != object) {
		[super setObject:object];
		LendingActionTableField* field = object;
		_iconView.backgroundImageDefault = field.defaultImage;
		_iconView.backgroundImageURL = field.lenderImageUrl;
		_loanImageView.backgroundImageDefault = field.defaultImage;
		_loanImageView.backgroundImageURL = field.loanImageUrl;
	}
}

- (void)dealloc {
	
	[_iconView release];
	[_loanImageView release];
	[_lenderNameLabel release];
	[_loanNameLabel release];
	//[_amountLabel release];
	 
	[super dealloc];
}



@end
