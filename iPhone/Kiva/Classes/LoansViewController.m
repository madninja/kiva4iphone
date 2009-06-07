#import "LoansViewController.h"
#import <Three20/Three20.h>
#import "LoansDataSource.h"
#import "LoanViewController.h"


@implementation LoansViewController


@synthesize searchBar;
@synthesize loansDataSource;

-(void)viewWillAppear{
	[[[self navigationController] navigationBar] setTintColor:[UIColor colorWithRed:166.0f/255.0f green:182.0f/255.0f blue:134.0f/255.0f alpha:1.0f]];

}

- (void)loadView {
	[super loadView];
	[self setSearchBar:[[UISearchBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)]];
	[searchBar setTintColor:[UIColor colorWithRed:166.0f/255.0f green:182.0f/255.0f blue:134.0f/255.0f alpha:1.0f]];
	[searchBar setShowsCancelButton:YES];
	[searchBar setPlaceholder:@"Search Loans..."];
	[[self searchBar] setDelegate:self];
	[self setTableView:[[[UITableView alloc] initWithFrame:CGRectMake(0.0f, 44.0f, 320.0f, 480.0f - 44.0f - 44.0f) style:UITableViewStylePlain] autorelease]];
	[[self tableView] setDelegate:self];
	[[self tableView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[[self tableView] setRowHeight:100];
	[[self view] addSubview:[self tableView]];
	[self setTitle:@"Loans"];
	[[[self navigationController] navigationBar] setTintColor:[UIColor colorWithRed:166.0f/255.0f green:182.0f/255.0f blue:134.0f/255.0f alpha:1.0f]];
	//[[self navigationItem] setTitleView:searchBar];
	[[self view] addSubview:searchBar];
}


- (void)searchBarSearchButtonClicked:(UISearchBar *)theSearchBar {
	[[self loansDataSource] setLoans:nil];
	[[self loansDataSource] setLoans:[NSMutableArray arrayWithCapacity:0]];
	[[self tableView] reloadData];
	
	[loansDataSource tableView:[self tableView] search:[theSearchBar text]];
	//[searchBar resignFirstResponder];
}


- (void)searchBar:(UISearchBar *)theSearchBar textDidChange:(NSString *)searchText {
	if ([searchText length] > 0) {
	} else {
	}
}


- (void)searchBarCancelButtonClicked:(UISearchBar *)theSearchBar {
	[searchBar resignFirstResponder];
}


- (id<TTTableViewDataSource>)createDataSource {
	[self setLoansDataSource:[[[LoansDataSource alloc] init] autorelease]];
	[[loansDataSource delegates] addObject:self];	
	[loansDataSource load:TTURLRequestCachePolicyNoCache nextPage:NO];
	return loansDataSource;
}


- (void)dataSourceDidFinishLoad:(id<TTTableViewDataSource>)dataSource {
	[super dataSourceDidFinishLoad:dataSource];
	if ([dataSource isEmpty]) {
	} else {
		[searchBar resignFirstResponder];
	}
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	LoanViewController *loanView = [[[LoanViewController alloc] initWithLoanId:[[[loansDataSource loans] objectAtIndex:[indexPath row]] objectForKey:@"id"]] autorelease];
	[[self navigationController] pushViewController:loanView animated:YES];
}

/*
 
- (void)dataSourceDidStartLoad:(id<TTTableViewDataSource>)dataSource {
	[super dataSourceDidStartLoad:dataSource];
}


- (void)dataSource:(id<TTTableViewDataSource>)dataSource didFailLoadWithError:(NSError*)error {
	[super dataSource:dataSource didFailLoadWithError:error];
}


- (void)dataSourceDidCancelLoad:(id<TTTableViewDataSource>)dataSource {
	[super dataSourceDidCancelLoad:dataSource];
}
 */

/*
- (UIImage*)imageForNoData {
	return [UIImage imageNamed:@"Three20.bundle/images/empty.png"];
}
 */

- (NSString*)titleForNoData {
	return NSLocalizedString(@"No Loans Found", @"");
}

- (NSString*)subtitleForNoData {
	return NSLocalizedString(@"Please broaden your search terms", @"");
}

/*
- (UIImage*)imageForError:(NSError*)error {
	return [UIImage imageNamed:@"Three20.bundle/images/error.png"];
}
 */

- (NSString*)subtitleForError:(NSError*)error {
	return NSLocalizedString(@"There was an error searching for loans.", @"");
}
 


@end
