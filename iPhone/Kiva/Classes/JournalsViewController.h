#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Three20/Three20.h>


@class JournalsDataSource;


@interface JournalsViewController : TTTableViewController <UITableViewDelegate, TTURLRequestDelegate,  UISearchBarDelegate, UIWebViewDelegate> {
	UINavigationController *navigationController;
	IBOutlet UIWebView *webView;
}


@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) IBOutlet UIWebView *webView;


@end
