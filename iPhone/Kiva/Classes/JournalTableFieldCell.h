//
//  LoanTableFieldCell.h
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>

@interface JournalTableFieldCell : TTIconTableFieldCell {
	TTStyledTextLabel *_subjectLabel;
	TTStyledTextLabel *_bodyLabel;
	TTYouTubeView* youTubeView;

}

@property (nonatomic, retain) TTYouTubeView* youTubeView;
@property (nonatomic,retain) TTStyledTextLabel* subjectLabel;
@property (nonatomic,retain) TTStyledTextLabel* bodyLabel;


@end
