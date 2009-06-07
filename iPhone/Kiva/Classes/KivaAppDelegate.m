//
//  KivaAppDelegate.m
//  Kiva
//
//  Created by Jon Bardin on 4/4/09.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "KivaAppDelegate.h"
#import "MainTabBarController.h"


@implementation KivaAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize selectedNavigationController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {
	
    // Add the tab bar controller's current view as a subview of the window
    [window addSubview:tabBarController.view];
	//selectedNavigationController = [[UINavigationController alloc] init];
	//[selectedNavigationController pushViewController:tabBarController.view animated:NO];
//	[tabBarController setViewControllers:selectedNavigationController animated:NO];


}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
    [tabBarController release];
    [window release];
    [super dealloc];
}

@end

