#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Three20/Three20.h>


@interface RegisterViewController : UIViewController <TTURLRequestDelegate> {
	IBOutlet id usernameField;
	BOOL dismissed;
	UINavigationController *navigationController;
}


@property (nonatomic) BOOL dismissed;
@property (nonatomic, retain) IBOutlet id usernameField;
@property (nonatomic) IBOutlet UINavigationController *navigationController;



-(IBAction)didClickOk:(id)sender;
-(IBAction)didClickLink:(id)sender;


@end
