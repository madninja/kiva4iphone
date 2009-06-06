//
//  JournalsViewController.m
//  Kiva
//
//  Created by Jon Bardin on 4/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "JournalsViewController.h"
#import "JournalsDataSource.h"

@implementation JournalsViewController


//@synthesize searchBar;
@synthesize journalsDataSource;


- (void)loadView {
	[super loadView];
	
	/*
	[self setSearchBar:[[UISearchBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)]];
	[searchBar setTintColor:[UIColor colorWithRed:166.0f/255.0f green:182.0f/255.0f blue:134.0f/255.0f alpha:1.0f]];
	[searchBar setShowsCancelButton:YES];
	[[self searchBar] setDelegate:self];
	 */
	
	[self setTableView:[[[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f - 44.0f) style:UITableViewStylePlain] autorelease]];
	[self setVariableHeightRows:YES];
	[[self tableView] setDelegate:self];
	[[self tableView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[[self view] addSubview:[self tableView]];
	[self setTitle:@"Your Feed"];
	[[[self navigationController] navigationBar] setTintColor:[UIColor colorWithRed:166.0f/255.0f green:182.0f/255.0f blue:134.0f/255.0f alpha:1.0f]];	 
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
	id<TTTableViewDataSource> dataSource = (id<TTTableViewDataSource>)tableView.dataSource;
	
	id object = [dataSource tableView:tableView objectForRowAtIndexPath:indexPath];
	Class cls = [dataSource tableView:tableView cellClassForObject:object];
	return [cls tableView:tableView rowHeightForItem:object];
}




- (id<TTTableViewDataSource>)createDataSource {
	[self setJournalsDataSource:[[[JournalsDataSource alloc] init] autorelease]];
	[[journalsDataSource delegates] addObject:self];	
	[journalsDataSource load:TTURLRequestCachePolicyNoCache nextPage:NO];
	return journalsDataSource;
}



/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	LoanViewController *loanView = [[[LoanViewController alloc] initWithLoanId:[[[loansDataSource loans] objectAtIndex:[indexPath row]] objectForKey:@"id"]] autorelease];
	[[self navigationController] pushViewController:loanView animated:YES];
}
 */


@end
