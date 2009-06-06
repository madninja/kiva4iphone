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
#import "JournalTableField.h"


@implementation JournalTableField


@synthesize subject = _subject;
@synthesize body = _body;
@synthesize videoUrl = _videoUrl;
@synthesize imageUrl = _imageUrl;


-(id)initWithSubject:(NSString *)theSubject andBody:(NSString *)theBody andImageUrl:(NSString *)theImageUrl andVideoUrl:(NSString *)theVideoUrl {
	if (self = [super init]) {
		self.videoUrl = theVideoUrl;
		self.imageUrl = theImageUrl;
		self.subject = theSubject;
		self.body = theBody;
		self.defaultImage = [UIImage imageNamed:@"Delay.png"];
	}
	return self;
}

-(void)dealloc {
	[self.videoUrl release];
	[self.imageUrl release];
	[self.subject release];
	[self.body release];
	[super dealloc];
}

@end
