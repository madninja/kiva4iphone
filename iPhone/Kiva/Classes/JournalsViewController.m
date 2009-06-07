//
//  JournalsViewController.m
//  Kiva
//
//  Created by Jon Bardin on 4/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "JournalsViewController.h"
#import "Templates.h"
#import <JSON/JSON.h>


@implementation JournalsViewController


@synthesize webView;
@synthesize navigationController;


/*
- (void)loadView {
	[super loadView];
	
	
	[self setTableView:[[[UITableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f - 44.0f) style:UITableViewStylePlain] autorelease]];
	[self setVariableHeightRows:YES];
	[[self tableView] setDelegate:self];
	[[self tableView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
	[[self view] addSubview:[self tableView]];
<<<<<<< .mine
	 
	[self setTitle:@"Your Feed"];
=======
	[self setTitle:@"Journals"];
>>>>>>> .r19
	[[[self navigationController] navigationBar] setTintColor:[UIColor colorWithRed:166.0f/255.0f green:182.0f/255.0f blue:134.0f/255.0f alpha:1.0f]];	 
}
 */


-(void)viewWillAppear:(BOOL)animated {
	TTURLRequest *request = [TTURLRequest requestWithURL:@"http://api.kivaws.org/v1/journal_entries/search.json?sort_by=newest&media=video" delegate:self];
	request.cachePolicy = TTURLRequestCachePolicyNoCache;
	request.response = [[[TTURLDataResponse alloc] init] autorelease];
	request.httpMethod = @"GET";
	request.userInfo = @"journals";
	[request send];	
}



- (void)requestDidStartLoad:(TTURLRequest*)request {
}


- (void)requestDidFinishLoad:(TTURLRequest*)request {
	SBJSON *jsonParser = [SBJSON new];
	NSMutableString *html = [NSMutableString string];
	[html appendString:@"<html><body>"];
	if ([request.userInfo isEqualToString:@"journals"]) {
		TTURLDataResponse *response = request.response;
		NSString *json = [[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding];
		id dictionary = [jsonParser objectWithString:json error:NULL];
		if ([[dictionary objectForKey:@"journal_entries"] count] > 0) {
			for (NSDictionary *journalEntry in [dictionary objectForKey:@"journal_entries"]) {
				
				id subject = [journalEntry objectForKey:@"subject"];
				id body = [journalEntry objectForKey:@"body"];
				id videoUrl = nil;
				id imageUrl = nil;
				if ([[journalEntry objectForKey:@"image"] objectForKey:@"id"] != nil) {
					imageUrl = [NSString stringWithFormat:image_template, @"w80h80", [[journalEntry objectForKey:@"image"] objectForKey:@"id"]];
				}
				if ([[journalEntry objectForKey:@"video"] objectForKey:@"id"] != nil) {
					videoUrl = [NSString stringWithFormat:video_template, [[journalEntry objectForKey:@"video"] objectForKey:@"youtube_id"]];
				}
				
				[html appendString:@"<b>"];
				[html appendString:[subject stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"<br/>"]];
				[html appendString:@"</b>"];
				NSLog(@"body: %@", body);
				[html appendString:[body stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"<br/>"]];
				
				if (imageUrl && !videoUrl) {
					[html appendString:@"<img src=\""];
					[html appendString:imageUrl];
					[html appendString:@"\"/>"];
				} else if (videoUrl) {
					[html appendString:[NSString stringWithFormat:youtube_template, videoUrl, videoUrl]];
					[html appendString:@"<br/><br/>"];
				}
			}
		}
		[json release];
		request.response = nil;
	} else {
		[html appendString:@"<b>error</b>"];
	}
	[html appendString:@"</body></html>"];
	[webView loadHTMLString:html baseURL:nil];
}


-(void)request:(TTURLRequest*)request didFailLoadWithError:(NSError*)error {
}


- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
	NSLog(@"url: %@", request);
	return YES;
}

/*
- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
	id<TTTableViewDataSource> dataSource = (id<TTTableViewDataSource>)tableView.dataSource;
	
	id object = [dataSource tableView:tableView objectForRowAtIndexPath:indexPath];
	Class cls = [dataSource tableView:tableView cellClassForObject:object];
	return [cls tableView:tableView rowHeightForItem:object];
}
 */



/*
- (id<TTTableViewDataSource>)createDataSource {
	[self setJournalsDataSource:[[[JournalsDataSource alloc] init] autorelease]];
	[[journalsDataSource delegates] addObject:self];	
	[journalsDataSource load:TTURLRequestCachePolicyNoCache nextPage:NO];
	return journalsDataSource;
}
 */



/*
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	LoanViewController *loanView = [[[LoanViewController alloc] initWithLoanId:[[[loansDataSource loans] objectAtIndex:[indexPath row]] objectForKey:@"id"]] autorelease];
	[[self navigationController] pushViewController:loanView animated:YES];
}
 */


@end
