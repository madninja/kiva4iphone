#import <Three20/Three20.h>
#import "RegisterViewController.h"
#import <JSON/JSON.h>

@implementation RegisterViewController


@synthesize usernameField;
@synthesize dismissed;
@synthesize navigationController;


-(id)init {
	if (self = [super initWithNibName:@"RegisterViewController" bundle:[NSBundle mainBundle]]) {
	}
	
	return self;
}

-(void) viewDidLoad {
	NSLog(@"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!Register.viewWillAppear");
	[navigationController setTitle:[usernameField text]];

}


-(IBAction)didClickOk:(id)sender {
	TTURLRequest *request = [TTURLRequest requestWithURL:[NSString stringWithFormat:@"http://api.kivaws.org/v1/lenders/%@.json", [[usernameField text] stringByReplacingPercentEscapesUsingEncoding:NSStringEncodingConversionAllowLossy]] delegate:self];
	request.response = [[[TTURLDataResponse alloc] init] autorelease];
	request.httpMethod = @"GET";
	[request send];
}


- (void)requestDidFinishLoad:(TTURLRequest*)request {
	TTURLDataResponse *response = request.response;
	NSString *json = [[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding];	
	SBJSON *jsonParser = [SBJSON new];
	id dictionary = [jsonParser objectWithString:json error:NULL];
	[json release];
	request.response = nil;
	[self setDismissed:YES];
}


- (void)request:(TTURLRequest*)request didFailLoadWithError:(NSError*)error {

}


-(IBAction)didClickLink:(id)sender {
	
}

@end
