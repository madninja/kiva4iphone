#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Three20/Three20.h>


@class JournalsDataSource;


@interface JournalsViewController : TTTableViewController <UITableViewDelegate, TTTableViewDataSourceDelegate,  UISearchBarDelegate> {
	//UISearchBar *searchBar;
	JournalsDataSource *journalsDataSource;
}

@property (nonatomic, retain) JournalsDataSource *journalsDataSource;
//@property (nonatomic, retain) UISearchBar *searchBar;


@end
