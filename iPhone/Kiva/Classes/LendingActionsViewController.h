//
//  LendingActionsViewController.h
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <Three20/Three20.h>


@class LendingActionsDataSource;


@interface LendingActionsViewController : TTTableViewController <UITableViewDelegate, TTTableViewDataSourceDelegate, UISearchBarDelegate> {
	LendingActionsDataSource *lendingActionsDataSource;
}


@property (nonatomic, retain) LendingActionsDataSource *lendingActionsDataSource;


@end
