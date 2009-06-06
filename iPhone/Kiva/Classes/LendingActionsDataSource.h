//
//  LendingActionsDataSource.h
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Three20/Three20.h>


@interface LendingActionsDataSource : TTDataSource <TTURLRequestDelegate> {
	NSMutableArray *lendingActions;
@private
	BOOL loading;
	BOOL loadingMore;
	BOOL loaded;
	NSDate *lastLoadedTime;
}

@end
