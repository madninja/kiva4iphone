#import <Three20/Three20.h>
#import <JSON/JSON.h>
#import "LoanViewController.h"
#import "Templates.h"



@implementation LoanViewController


@synthesize loanId;
@synthesize loan;
@synthesize loanDescriptionText;


-(id)initWithLoanId:(NSString *)theLoanId {
	if (self = [super initWithNibName:@"LoanViewController" bundle:[NSBundle mainBundle]]) {
		[self setLoanId:theLoanId];
	}
	return self;
}

-(void)viewDidLoad {
	[self setTitle:@"Loan Details"];
	[[[self navigationController] navigationBar] setTintColor:[UIColor colorWithRed:166.0f/255.0f green:182.0f/255.0f blue:134.0f/255.0f alpha:1.0f]];
	
	[scrollView setContentSize:CGSizeMake(320.0f, 880.0f)];
	[super viewDidLoad];
}
	


-(void)viewWillAppear:(BOOL)animated {
	//loanImage.borderRadius = 6;
	loanImage.backgroundColor = [UIColor clearColor];
	
	TTURLRequest *request = [TTURLRequest requestWithURL:[NSString stringWithFormat:@"http://api.kivaws.org/v1/loans/%@.json", loanId] delegate:self];
	request.response = [[[TTURLDataResponse alloc] init] autorelease];
	request.httpMethod = @"GET";
	[request send];
	[super viewWillAppear:animated];
}



- (void)requestDidStartLoad:(TTURLRequest*)request {
}


- (void)requestDidFinishLoad:(TTURLRequest*)request {
	TTURLDataResponse *response = request.response;
	NSString *json = [[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding];	
	SBJSON *jsonParser = [SBJSON new];
	id dictionary = [jsonParser objectWithString:json error:NULL];	
	NSArray *loans = [[dictionary objectForKey:@"loans"] copy];	
	if ([loans count] > 0) {
		[self setLoan:[loans objectAtIndex:0]];
		[nameLabel setText:[loan objectForKey:@"name"]];
		[fundedAmountLabel setText:[NSString stringWithFormat:@"$%@", [loan objectForKey:@"funded_amount"]]];
		[loanAmountLabel setText:[NSString stringWithFormat:@"$%@", [[loan objectForKey:@"terms"] objectForKey:@"loan_amount"]]];
		[loanDescriptionText setText:[TTStyledText textFromXHTML:[[[loan objectForKey:@"description"] objectForKey:@"texts"] objectForKey:@"en"]]];
		[loanDescriptionText setFont:[UIFont systemFontOfSize:12]];
		[loanDescriptionText sizeToFit];
		loanImage.contentMode = UIViewContentModeScaleAspectFit;
		//loanImage.backgroundImageDefault =[UIImage imageNamed:@"Delay.png"];
		//loanImage.backgroundImageURL =  [NSString stringWithFormat:image_template, @"w325h250", [[loan objectForKey:@"image"] objectForKey:@"id"]];
	}
	[json release];
	request.response = nil;
}


- (void)request:(TTURLRequest*)request didFailLoadWithError:(NSError*)error {

}


-(IBAction)didClickDetails {
    
}

- (IBAction)didClickLend {
    
}


- (IBAction)didClickBack {
	[[self navigationController] popViewControllerAnimated:YES];
}



@end
