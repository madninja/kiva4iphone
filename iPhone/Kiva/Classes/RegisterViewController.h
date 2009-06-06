#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Three20/Three20.h>


@interface RegisterViewController : UIViewController <TTURLRequestDelegate> {
	IBOutlet id usernameField;
	BOOL dismissed;
}


@property (nonatomic) BOOL dismissed;
@property (nonatomic, retain) IBOutlet id usernameField;


-(IBAction)didClickOk:(id)sender;
-(IBAction)didClickLink:(id)sender;


@end
