//
//  LoanTableFieldCell.m
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Three20/Three20.h>
#import "JournalTableField.h"
#import "JournalTableFieldCell.h"

/*
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
 */


@implementation JournalTableFieldCell


@synthesize subjectLabel = _subjectLabel;
@synthesize bodyLabel = _bodyLabel;
@synthesize youTubeView;

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForItem:(id)item {
	JournalTableField* field = item;
	CGFloat maxWidth = tableView.width - 10;
	
	CGSize textSize = [field.subject sizeWithFont:[UIFont boldSystemFontOfSize:13.0f]
					   constrainedToSize:CGSizeMake(maxWidth, CGFLOAT_MAX)
					   lineBreakMode:UILineBreakModeWordWrap];
	CGSize subtextSize = [field.body sizeWithFont:[UIFont systemFontOfSize:12.0f]
						  constrainedToSize:CGSizeMake(maxWidth, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
	CGFloat mod;
	if (field.videoUrl != nil) {
		mod = 160.0f;
	} else {
		mod = 40.0f;
	}
	return mod + textSize.height + subtextSize.height;
	
}



- (id)initWithFrame:(CGRect)frame reuseIdentifier:(NSString*)identifier {
	if (self = [super initWithFrame:frame reuseIdentifier:identifier]) {
		
		_subjectLabel = [[TTStyledTextLabel alloc] initWithFrame:CGRectZero];
		_subjectLabel.font = [UIFont systemFontOfSize:13.0f];
		//_subjectLabel.textColor = [TTAppearance appearance].tableSubTextColor;
		_subjectLabel.highlightedTextColor = [UIColor whiteColor];
		_subjectLabel.textAlignment = UITextAlignmentLeft;
		_subjectLabel.contentMode = UIViewContentModeTop;
		[self.contentView addSubview:_subjectLabel];
		
		_bodyLabel = [[TTStyledTextLabel alloc] initWithFrame:CGRectZero];
		_bodyLabel.font = [UIFont systemFontOfSize:12.0f];
		//_bodyLabel.textColor = [TTAppearance appearance].tableSubTextColor;
		_bodyLabel.highlightedTextColor = [UIColor whiteColor];
		_bodyLabel.textAlignment = UITextAlignmentRight;
		_bodyLabel.contentMode = UIViewContentModeTop;
		[self.contentView addSubview:_bodyLabel];
		
		youTubeView = [[TTYouTubeView alloc] initWithFrame:CGRectZero];		
		[self.contentView addSubview:youTubeView];
		

	}
	return self;
}


- (void)layoutSubviews {
	[super layoutSubviews];
	JournalTableField* field = self.object;
	
	_subjectLabel.backgroundColor = [UIColor clearColor];
	_subjectLabel.frame = CGRectMake(10, 5, 300, 30);
	_subjectLabel.text = [TTStyledText textFromXHTML:[NSString stringWithFormat:@"<b>%@</b>", field.subject]];
	[_subjectLabel sizeToFit];
	
	_bodyLabel.backgroundColor = [UIColor clearColor];
	//NSLog("wang %@", [field.body stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"</p><p>"]);
	_bodyLabel.text = [TTStyledText textFromXHTML:[field.body stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@""]];
	_bodyLabel.frame = CGRectMake(10.0f, 35.0f, 310.0f, 480.0f);
	[_bodyLabel sizeToFit];
	CGSize subtextSize = [field.body sizeWithFont:[UIFont systemFontOfSize:12]
						  constrainedToSize:CGSizeMake(310, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];
	
	
	//_bodyLabel.text = [TTStyledText textFromXHTML:[NSString stringWithFormat:@"%@<img src=\"%@\" style=\"width:100px height:100px;\" width=\"100\" height=\"100\"/>", field.body, field.imageUrl]];
	//NSLog(@"body %@", [NSString stringWithFormat:@"<img src=\"%@\" style=\"width:100px height:100px;\" width=\"100\" height=\"100\"/>%@", field.imageUrl, field.body]);
	
	
	if (field.videoUrl != nil) {
		youTubeView.frame = CGRectMake(100.0f, subtextSize.height + 60, 140.0f, 105.0f);
	}
}


- (void)setObject:(id)object {
	if (_field != object) {
		[super setObject:object];
		JournalTableField* field = object;
		if (field.videoUrl != nil) {
			[youTubeView setUrl:field.videoUrl];
		}
	}
}

- (void)dealloc {
	[_iconView release];
	[_subjectLabel release];
	[_bodyLabel release];
	[youTubeView release];
	[super dealloc];
}



@end
