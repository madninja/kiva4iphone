//
//  LoanTableFieldCell.m
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Three20/Three20.h>
#import "LoanTableFieldCell.h"
#import "LoanTableField.h"

static CGFloat kHPadding = 10;
static CGFloat kVPadding = 10;
//static CGFloat kMargin = 10;
//static CGFloat kSpacing = 8;
//static CGFloat kGroupMargin = 10;
static CGFloat kKeySpacing = 12;
//static CGFloat kKeyWidth = 75;
//static CGFloat kMaxLabelHeight = 2000;
//static CGFloat kDisclosureIndicatorWidth = 23;
//static CGFloat kTextFieldTitleWidth = 100;
//static CGFloat kTableViewFieldCellHeight = 180;
static CGFloat kDefaultIconSize = 50;


@implementation LoanTableFieldCell

/*
+ (CGFloat)tableView:(UITableView*)tableView rowHeightForItem:(id)item {
	TTImageTableField* field = item;
	
	UIImage* image = field.image ? [[TTURLCache sharedCache] imageForURL:field.image] : nil;
	
	CGFloat iconWidth = image
    ? image.size.width + kKeySpacing
    : (field.image ? kDefaultIconSize + kKeySpacing : 0);
	CGFloat iconHeight = image
    ? image.size.height
    : (field.image ? kDefaultIconSize : 0);
    
	CGFloat maxWidth = tableView.width - (iconWidth + kHPadding*2 + kMargin*2);
	
	CGSize textSize = [field.text sizeWithFont:[UIFont boldSystemFontOfSize:15]
					   constrainedToSize:CGSizeMake(maxWidth, CGFLOAT_MAX)
					   lineBreakMode:UILineBreakModeWordWrap];
	
	CGFloat contentHeight = textSize.height > iconHeight ? textSize.height : iconHeight;
	return contentHeight + kVPadding*2;
}
 */

- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString*)identifier {
	if (self = [super initWithFrame:frame reuseIdentifier:identifier]) {
		_iconView = [[TTImageView alloc] initWithFrame:CGRectZero];
		//_iconView.borderRadius = 6;
		_iconView.backgroundColor = [UIColor clearColor];
		[self.contentView addSubview:_iconView];
		
		
		_useLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_useLabel.font = [UIFont systemFontOfSize:10.0f];
		_useLabel.adjustsFontSizeToFitWidth = YES;
		//_useLabel.textColor = [TTAppearance appearance].tableSubTextColor;
		_useLabel.highlightedTextColor = [UIColor whiteColor];
		_useLabel.textAlignment = UITextAlignmentLeft;
		_useLabel.contentMode = UIViewContentModeTop;
		_useLabel.lineBreakMode = UILineBreakModeWordWrap;
		_useLabel.numberOfLines = 1;
		[self.contentView addSubview:_useLabel];
		
		_locationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_locationLabel.font = [UIFont systemFontOfSize:10.0f];
		_locationLabel.adjustsFontSizeToFitWidth = YES;
		//_locationLabel.textColor = [TTAppearance appearance].tableSubTextColor;
		_locationLabel.highlightedTextColor = [UIColor whiteColor];
		_locationLabel.textAlignment = UITextAlignmentLeft;
		_locationLabel.contentMode = UIViewContentModeTop;
		_locationLabel.lineBreakMode = UILineBreakModeWordWrap;
		_locationLabel.numberOfLines = 1;
		[self.contentView addSubview:_locationLabel];
		
		_activityLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_activityLabel.font = [UIFont systemFontOfSize:10.0f];
		_activityLabel.adjustsFontSizeToFitWidth = YES;
		//_activityLabel.textColor = [TTAppearance appearance].tableSubTextColor;
		_activityLabel.highlightedTextColor = [UIColor whiteColor];
		_activityLabel.textAlignment = UITextAlignmentLeft;
		_activityLabel.contentMode = UIViewContentModeTop;
		_activityLabel.lineBreakMode = UILineBreakModeWordWrap;
		_activityLabel.numberOfLines = 1;
		[self.contentView addSubview:_activityLabel];
		
		_nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_nameLabel.font = [UIFont systemFontOfSize:20.0f];
		_nameLabel.adjustsFontSizeToFitWidth = YES;
		//_nameLabel.textColor = [TTAppearance appearance].tableSubTextColor;
		_nameLabel.highlightedTextColor = [UIColor whiteColor];
		_nameLabel.textAlignment = UITextAlignmentLeft;
		_nameLabel.contentMode = UIViewContentModeTop;
		_nameLabel.lineBreakMode = UILineBreakModeWordWrap;
		_nameLabel.numberOfLines = 1;
		[self.contentView addSubview:_nameLabel];
		
		
		_amountNeededLabel = [[UILabel alloc] initWithFrame:CGRectZero];
		_amountNeededLabel.font = [UIFont systemFontOfSize:22.0f];
		_amountNeededLabel.adjustsFontSizeToFitWidth = YES;
		//_amountNeededLabel.textColor = [TTAppearance appearance].tableSubTextColor;
		_amountNeededLabel.highlightedTextColor = [UIColor whiteColor];
		_amountNeededLabel.textAlignment = UITextAlignmentCenter;
		_amountNeededLabel.contentMode = UIViewContentModeTop;
		_amountNeededLabel.lineBreakMode = UILineBreakModeWordWrap;
		_amountNeededLabel.numberOfLines = 1;
		[self.contentView addSubview:_amountNeededLabel];
		
	}
	return self;
}




- (void)layoutSubviews {
	[super layoutSubviews];
	LoanTableField* field = self.object;
	
	_useLabel.backgroundColor = [UIColor clearColor];
	_useLabel.frame = CGRectMake(5.0f, 80.0f, 310.0f, 20.0f);
	_useLabel.text = field.use;
	
	_amountNeededLabel.backgroundColor = [UIColor clearColor];
	_amountNeededLabel.frame = CGRectMake(220.0f + (kHPadding * 2), 30, 80, 40);
	_amountNeededLabel.text = field.amountNeeded;
	
	_nameLabel.backgroundColor = [UIColor clearColor];
	_nameLabel.frame = CGRectMake(80.0f + (kHPadding * 2), 15, 200, 30);
	_nameLabel.text = field.name;
	
	_locationLabel.backgroundColor = [UIColor clearColor];
	_locationLabel.frame = CGRectMake(80.0f + (kHPadding * 2), 45, 120.0f + (kHPadding * 2), 15.0f);
	_locationLabel.text = field.location;
	
	_activityLabel.backgroundColor = [UIColor clearColor];
	_activityLabel.frame = CGRectMake(80.0f + (kHPadding * 2), 65, 120.0f + (kHPadding * 2), 15.0f);
	_activityLabel.text = field.activity;
	
	UIImage* image = field.image ? [[TTURLCache sharedCache] imageForURL:field.image] : nil;
	if (!image) {
		image = field.defaultImage;
	}
	if (_iconView.url) {
		CGFloat iconWidth = image ? image.size.width : (field.image ? kDefaultIconSize : 0);
		CGFloat iconHeight = image ? image.size.height : (field.image ? kDefaultIconSize : 0);
		_iconView.frame = CGRectMake(kHPadding, floor(self.height/2 - iconHeight/2), iconWidth, iconHeight);
		CGFloat innerWidth = self.contentView.width - (kHPadding*2 + iconWidth + kKeySpacing);
		CGFloat innerHeight = self.contentView.height - kVPadding*2;
		_label.frame = CGRectMake(kHPadding + iconWidth + kKeySpacing, kVPadding, innerWidth, innerHeight);
	} else {
		_label.frame = CGRectInset(self.contentView.bounds, kHPadding, kVPadding);
		_iconView.frame = CGRectZero;
	}
}


- (void)setObject:(id)object {
	if (_field != object) {
		[super setObject:object];
		LoanTableField* field = object;
		//_iconView.backgroundImageDefault = field.defaultImage;
		//_iconView.backgroundImageURL = field.image;
	}
}

- (void)dealloc {
	[_iconView release];
	[_nameLabel release];
	[_locationLabel release];
	[_activityLabel release];
	[_amountNeededLabel release];
	[_useLabel release];
	[super dealloc];
}



@end
