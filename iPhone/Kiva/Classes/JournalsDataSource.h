//
//  JournalsDataSource.h
//  Kiva
//
//  Created by Jon Bardin on 4/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>


@interface JournalsDataSource : TTDataSource <TTURLRequestDelegate> {
	NSMutableArray *loans;
	NSMutableArray *journals;
@private
	BOOL loading;
	BOOL loadingMore;
	BOOL loaded;
	NSDate *lastLoadedTime;
}


@property (nonatomic, retain) NSMutableArray *loans;
@property (nonatomic, retain) NSMutableArray *journals;


@end
