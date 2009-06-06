//
//  MainTabBarController.h
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RegisterViewController;


@interface MainTabBarController : UITabBarController {
	RegisterViewController *registerView;
}


@property (nonatomic, retain) RegisterViewController *registerView;

@end
