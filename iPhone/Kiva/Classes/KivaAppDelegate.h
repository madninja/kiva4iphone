//
//  KivaAppDelegate.h
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MainTabBarController;


@interface KivaAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate, UINavigationControllerDelegate> {
    UIWindow *window;
    MainTabBarController *tabBarController;
	UINavigationController *selectedNavigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainTabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UINavigationController *selectedNavigationController;

@end
