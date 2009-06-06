//
//  LoanTableCellView.h
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Three20/Three20.h>

@interface LoanTableField : TTIconTableField {
	NSString *_name;
	NSString *_location;
	NSString *_activity;
	NSString *_amountNeeded;
	NSString *_use;
}

@property(nonatomic,copy) NSString* name;
@property(nonatomic,copy) NSString* location;
@property(nonatomic,copy) NSString* activity;
@property(nonatomic,copy) NSString* amountNeeded;
@property(nonatomic,copy) NSString* use;



-(id)initWithName:(NSString *)theName andImageUrl:(NSString *)theImageUrl andLocation:(NSString *)theLocation andActivity:(NSString *)theActivity andAmountNeeded:(NSString *)amountNeeded andUse:(NSString *)theUse;

@end
