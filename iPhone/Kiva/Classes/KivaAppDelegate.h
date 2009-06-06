//
//  KivaAppDelegate.h
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MainTabBarController;


@interface KivaAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    MainTabBarController *tabBarController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet MainTabBarController *tabBarController;

@end
