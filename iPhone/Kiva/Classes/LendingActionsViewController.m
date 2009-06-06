//
//  LendingActionsViewController.m
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LendingActionsViewController.h"
#import "LendingActionsDataSource.h"

@implementation LendingActionsViewController


@synthesize lendingActionsDataSource;


- (void)loadView {
	[super loadView];
	[self setTableView:[[[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f - 44.0f) style:UITableViewStylePlain] autorelease]];
	[[self tableView] setDelegate:self];
	[[self tableView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[[self tableView] setRowHeight:140];
	[[self view] addSubview:[self tableView]];
	[self setTitle:@"Global Feed"];
	[[[self navigationController] navigationBar] setTintColor:[UIColor colorWithRed:166.0f/255.0f green:182.0f/255.0f blue:134.0f/255.0f alpha:1.0f]];
}


- (id<TTTableViewDataSource>)createDataSource {
	[self setLendingActionsDataSource:[[[LendingActionsDataSource alloc] init] autorelease]];
	[[lendingActionsDataSource delegates] addObject:self];	
	[lendingActionsDataSource load:TTURLRequestCachePolicyNoCache nextPage:NO];
	return lendingActionsDataSource;
}


@end
