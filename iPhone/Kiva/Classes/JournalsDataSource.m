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
	TTURLRequest *request = [TTURLRequest requestWithURL:@"http://api.kivaws.org/v1/journal_entries/search.json?sort_by=newest&media=video" delegate:self];
	request.cachePolicy = cachePolicy;
	request.response = [[[TTURLDataResponse alloc] init] autorelease];
	request.httpMethod = @"GET";
	request.userInfo = @"journals";
	[request send];	
}


- (void)requestDidStartLoad:(TTURLRequest*)request {
	[self dataSourceDidStartLoad];
}


- (void)requestDidFinishLoad:(TTURLRequest*)request {
	SBJSON *jsonParser = [SBJSON new];
	
	if ([request.userInfo isEqualToString:@"journals"]) {
		TTURLDataResponse *response = request.response;
		NSString *json = [[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding];
		id dictionary = [jsonParser objectWithString:json error:NULL];
		if ([[dictionary objectForKey:@"journal_entries"] count] > 0) {
			for (NSDictionary *journal in [dictionary objectForKey:@"journal_entries"]) {
				[journals addObject:journal];
			}
		}
		[json release];
		request.response = nil;
		[self dataSourceDidFinishLoad];
	}

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
