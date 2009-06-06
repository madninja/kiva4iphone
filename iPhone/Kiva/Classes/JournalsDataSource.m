//
//  JournalsDataSource.m
//  Kiva
//
//  Created by Jon Bardin on 4/5/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <JSON/JSON.h>
#import "Templates.h"
#import "JournalsDataSource.h"
#import "JournalTableField.h"
#import "JournalTableFieldCell.h"


@implementation JournalsDataSource


@synthesize loans;
@synthesize journals;


-(id)init {
	if (self = [super init]) {
		[self setLoans:[NSMutableArray arrayWithCapacity:0]];
		[self setJournals:[NSMutableArray arrayWithCapacity:0]];
	}
	return self;
}


- (void)load:(TTURLRequestCachePolicy)cachePolicy nextPage:(BOOL)nextPage {
	TTURLRequest *request = [TTURLRequest requestWithURL:@"http://api.kivaws.org/v1/lenders/HMSBeagle/loans.json?sort_by=newest" delegate:self];
	request.cachePolicy = cachePolicy;
	request.response = [[[TTURLDataResponse alloc] init] autorelease];
	request.httpMethod = @"GET";
	request.userInfo = @"loans";
	[request send];	
}


- (void)requestDidStartLoad:(TTURLRequest*)request {
	[self dataSourceDidStartLoad];
}


- (void)requestDidFinishLoad:(TTURLRequest*)request {
	SBJSON *jsonParser = [SBJSON new];

	if ([request.userInfo isEqualToString:@"loans"]) {
		NSInteger i = 0;
		TTURLDataResponse *response = request.response;
		NSString *json = [[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding];	
		id dictionary = [jsonParser objectWithString:json error:NULL];
		loans = [[dictionary objectForKey:@"loans"] copy];
		for (NSString *loanId in [NSArray arrayWithObjects:@"73405", @"64149", @"84623", @"73403", @"73396", @"73386", @"73376", @"73367", nil]) {
			TTURLRequest *request = [TTURLRequest requestWithURL:[NSString stringWithFormat:@"http://api.kivaws.org/v1/loans/%@/journal_entries.json", loanId] delegate:self];
			request.cachePolicy = TTURLRequestCachePolicyNoCache;
			request.response = [[[TTURLDataResponse alloc] init] autorelease];
			request.httpMethod = @"GET";
			request.userInfo = @"journals";
			[request send];	
		}
		/*
		for (NSDictionary *loan in loans) {
			if (i++ > 10) {
				break;
			}
		
			TTURLRequest *request = [TTURLRequest requestWithURL:[NSString stringWithFormat:@"http://api.kivaws.org/v1/loans/%@/journal_entries.json", [loan objectForKey:@"id"]] delegate:self];
			request.cachePolicy = TTURLRequestCachePolicyNoCache;
			request.response = [[[TTURLDataResponse alloc] init] autorelease];
			request.httpMethod = @"GET";
			request.userInfo = @"journals";
			[request send];	
		}*/
		[json release];
		request.response = nil;
	} else if ([request.userInfo isEqualToString:@"journals"]) {
		TTURLDataResponse *response = request.response;
		NSString *json = [[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding];	
		id dictionary = [jsonParser objectWithString:json error:NULL];
		//NSLog(@"journals %@", dictionary);
		if ([[dictionary objectForKey:@"journal_entries"] count] > 0) {
			[journals addObject:[[dictionary objectForKey:@"journal_entries"] objectAtIndex:0]];
		}
		[json release];
		request.response = nil;
		[self dataSourceDidFinishLoad];
	}
	/*
	TTURLDataResponse *response = request.response;
	NSString *json = [[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding];	
	SBJSON *jsonParser = [SBJSON new];
	id dictionary = [jsonParser objectWithString:json error:NULL];
	loans = [[dictionary objectForKey:@"loans"] copy];
	NSLog(@"loans %@", loans);
	[json release];
	request.response = nil;
	
 
	
	if(lastLoadedTime) {
		[lastLoadedTime release];
	}
	lastLoadedTime = [[NSDate alloc] init];
	 */
}


- (void)request:(TTURLRequest*)request didFailLoadWithError:(NSError*)error {
	[self dataSourceDidFailLoadWithError:error];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [journals count];
}


- (BOOL)isEmpty {
	return !journals.count;
}


-(id)tableView:(UITableView*)tableView objectForRowAtIndexPath:(NSIndexPath*)indexPath {
	id journalEntry = [journals objectAtIndex:[indexPath row]];
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
	
	
	JournalTableField *cell = [[[JournalTableField alloc] initWithSubject:subject andBody:body andImageUrl:imageUrl andVideoUrl:videoUrl] autorelease];
	
	return cell;
	
	
}


- (Class)tableView:(UITableView*)tableView cellClassForObject:(id)object {
	
	if ([object isKindOfClass:[JournalTableField class]]) {
		return [JournalTableFieldCell class];
	} else {
		return [super tableView:tableView cellClassForObject:object];
	}
	
}


- (void)tableView:(UITableView*)tableView search:(NSString*)text {
	/*
	TTURLRequest *request = [TTURLRequest requestWithURL:[[NSString stringWithFormat:@"http://api.kivaws.org/v1/loans/search.json?q=%@", text] stringByAddingPercentEscapesUsingEncoding:NSStringEncodingConversionAllowLossy] delegate:self];
	request.response = [[[TTURLDataResponse alloc] init] autorelease];
	request.httpMethod = @"GET";
	[request send];
	 */
}


-(void)dealloc {
	[loans release];
	[journals release];
	[super dealloc];
}


@end
