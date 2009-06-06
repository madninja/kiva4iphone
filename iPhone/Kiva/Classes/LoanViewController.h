#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Three20/Three20.h>


@interface LoanViewController : UIViewController <UIScrollViewDelegate, TTURLRequestDelegate> {
    IBOutlet id fundedAmountLabel;
    IBOutlet id loanAmountLabel;
    IBOutlet id percentageLabel;
    IBOutlet id repaidLabel;
    IBOutlet id nameLabel;
	IBOutlet UIScrollView *scrollView;
	IBOutlet TTStyledTextLabel *loanDescriptionText;
	IBOutlet TTImageView *loanImage;
	NSString *loanId;
	NSDictionary *loan;
}

@property (nonatomic, copy) NSDictionary *loan;
@property (nonatomic, copy) NSString *loanId;
@property (nonatomic, retain) TTStyledTextLabel *loanDescriptionText;

-(id)initWithLoanId:(NSString *)theLoanId;
- (IBAction)didClickDetails;
- (IBAction)didClickLend;
- (IBAction)didClickBack;
@end
