//
//  LoansDataSource.m
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <JSON/JSON.h>
#import "LoansDataSource.h"
#import "LoanTableField.h"
#import "LoanTableFieldCell.h"
#import "Templates.h"



@implementation LoansDataSource


@synthesize loans;


- (void)load:(TTURLRequestCachePolicy)cachePolicy nextPage:(BOOL)nextPage {
	TTURLRequest *request = [TTURLRequest requestWithURL:@"http://api.kivaws.org/v1/loans/newest.json" delegate:self];
	request.cachePolicy = cachePolicy;
	request.response = [[[TTURLDataResponse alloc] init] autorelease];
	request.httpMethod = @"GET";
	[request send];
}


- (void)requestDidStartLoad:(TTURLRequest*)request {

	[self dataSourceDidStartLoad];
}


- (void)requestDidFinishLoad:(TTURLRequest*)request {
	TTURLDataResponse *response = request.response;
	NSString *json = [[NSString alloc] initWithData:response.data encoding:NSUTF8StringEncoding];	
	SBJSON *jsonParser = [SBJSON new];
	id dictionary = [jsonParser objectWithString:json error:NULL];
	loans = [[dictionary objectForKey:@"loans"] copy];
	[json release];
	request.response = nil;
	
	loading = NO;
	loadingMore = NO;
	loaded = YES;  
	
	if(lastLoadedTime) {
		[lastLoadedTime release];
	}
	lastLoadedTime = [[NSDate alloc] init];
	[self dataSourceDidFinishLoad];
}


- (void)request:(TTURLRequest*)request didFailLoadWithError:(NSError*)error {
	loading = NO;
	loadingMore = NO;
	loaded = YES;
	[self dataSourceDidFailLoadWithError:error];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (loans.count > 0) {
		return loans.count + 1;
	} else {
		return 0;
	}
}


- (BOOL)isEmpty {
	return !loans.count;
}


-(id)tableView:(UITableView*)tableView objectForRowAtIndexPath:(NSIndexPath*)indexPath {
	if ([indexPath row] == [loans count]) {
		return     [[[TTMoreButtonTableField alloc] initWithText:@"More Loans..."
														subtitle:@"Showing 1 of 100"] autorelease];
	} else {
		id loan = [loans objectAtIndex:[indexPath row]];
		id image = [loan objectForKey:@"image"];
		id image_url = nil;
		if (image) {
			id image_id = [image objectForKey:@"id"];
			image_url = [NSString stringWithFormat:image_template, @"w80h80", image_id];
		}

		LoanTableField *cell = [[[LoanTableField alloc] initWithName:[loan objectForKey:@"name"]
															   andImageUrl:image_url
															   andLocation:[[loan objectForKey:@"location"] objectForKey:@"country"]
															   andActivity:[loan objectForKey:@"activity"]
													 andAmountNeeded:[NSString stringWithFormat:@"$%d", ([[loan objectForKey:@"loan_amount"] intValue] - [[loan objectForKey:@"funded_amount"] intValue])]
															  andUse:[loan objectForKey:@"use"]] autorelease];

		return cell;
	}
}


- (Class)tableView:(UITableView*)tableView cellClassForObject:(id)object {
	if ([object isKindOfClass:[LoanTableField class]]) {
		return [LoanTableFieldCell class];
	} else {
		return [super tableView:tableView cellClassForObject:object];
	}
}


- (void)tableView:(UITableView*)tableView search:(NSString*)text {


	TTURLRequest *request = [TTURLRequest requestWithURL:[[NSString stringWithFormat:@"http://api.kivaws.org/v1/loans/search.json?q=%@", text] stringByAddingPercentEscapesUsingEncoding:NSStringEncodingConversionAllowLossy] delegate:self];
	request.response = [[[TTURLDataResponse alloc] init] autorelease];
	request.httpMethod = @"GET";
	[request send];
}


@end
