//
//  LendingActionsDataSource.m
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <JSON/JSON.h>
#import "LendingActionsDataSource.h"
#import "LendingActionTableField.h"
#import "LendingActionTableFieldCell.h"
#import "Templates.h"


@implementation LendingActionsDataSource


- (void)load:(TTURLRequestCachePolicy)cachePolicy nextPage:(BOOL)nextPage {
	TTURLRequest *request = [TTURLRequest requestWithURL:@"http://api.kivaws.org/v1/lending_actions/recent.json" delegate:self];
	
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
	lendingActions = [[dictionary objectForKey:@"lending_actions"] copy];
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
	if (lendingActions.count > 0) {
		return lendingActions.count;
	} else {
		return 0;
	}
}


- (BOOL)isEmpty {
	return !lendingActions.count;
}


-(id)tableView:(UITableView*)tableView objectForRowAtIndexPath:(NSIndexPath*)indexPath {
	id lendingAction = [lendingActions objectAtIndex:[indexPath row]];
	id lender = [lendingAction objectForKey:@"lender"];
	id lenderName = nil;
	if ([lender objectForKey:@"whereabouts"] != nil) {
		lenderName = [NSString stringWithFormat:@"%@ in %@ lent..", [lender objectForKey:@"name"], [lender objectForKey:@"whereabouts"]];
	} else if ([lender objectForKey:@"country_code"] != nil) {
		lenderName = [NSString stringWithFormat:@"%@ in %@ lent..", [lender objectForKey:@"name"], [lender objectForKey:@"country_code"]];
	} else {
		lenderName = [NSString stringWithFormat:@"%@ lent..", [lender objectForKey:@"name"]];
	}
	id lenderImageUrl = nil;
	if ([[lender objectForKey:@"image"] objectForKey:@"id"] != nil) {
		lenderImageUrl = [NSString stringWithFormat:image_template, @"w80h80", [[lender objectForKey:@"image"] objectForKey:@"id"]];
	}
	id loan = [lendingAction objectForKey:@"loan"];
	id loanName = nil;
	loanName = [NSString stringWithFormat:@"%@ in %@", [loan objectForKey:@"name"], [[loan objectForKey:@"location"] objectForKey:@"town"]];		
	
	id loanImageUrl = nil;
	if ([[loan objectForKey:@"image"] objectForKey:@"id"] != nil) {
		loanImageUrl = [NSString stringWithFormat:image_template, @"w80h80", [[loan objectForKey:@"image"] objectForKey:@"id"]];
	}
	id amount = @"$123";
	LendingActionTableField *cell = [[[LendingActionTableField alloc] initWithLenderName:lenderName 
																	   andLenderImageUrl:lenderImageUrl 
																			   andAmount:amount 
																			 andLoanName:loanName 
																		 andLoanImageUrl:loanImageUrl]  autorelease];
	
	return cell;

}


- (Class)tableView:(UITableView*)tableView cellClassForObject:(id)object {
	if ([object isKindOfClass:[LendingActionTableField class]]) {
		return [LendingActionTableFieldCell class];
	} else {
		return [super tableView:tableView cellClassForObject:object];
	}
}


@end
