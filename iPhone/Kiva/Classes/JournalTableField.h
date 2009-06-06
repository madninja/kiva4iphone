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

@interface JournalTableField : TTIconTableField {
	NSString *_subject;
	NSString *_body;
	NSString *_videoUrl;
	NSString *_imageUrl;
}


@property (nonatomic,copy) NSString* subject;
@property (nonatomic,copy) NSString* body;
@property (nonatomic,copy) NSString* videoUrl;
@property (nonatomic,copy) NSString* imageUrl;


-(id)initWithSubject:(NSString *)theSubject andBody:(NSString *)theBody andImageUrl:(NSString *)theImageUrl andVideoUrl:(NSString *)theVideoUrl;


@end
