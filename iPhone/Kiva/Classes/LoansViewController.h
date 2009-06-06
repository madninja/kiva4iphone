#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Three20/Three20.h>


@class LoansDataSource;


@interface LoansViewController : TTTableViewController <UITableViewDelegate, TTTableViewDataSourceDelegate, UISearchBarDelegate> {
	UISearchBar *searchBar;
	LoansDataSource *loansDataSource;
}

@property (nonatomic, retain) LoansDataSource *loansDataSource;
@property (nonatomic, retain) UISearchBar *searchBar;


@end
