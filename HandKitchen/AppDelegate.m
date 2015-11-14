//
//  AppDelegate.m
//  HandKitchen
//
//  Created by qianfeng on 15-7-6.
//  Copyright (c) 2015年 qianfeng-sunxingguo. All rights reserved.
//

#import "AppDelegate.h"
#import "FactoryUI.h"
#import "QFNavigationViewController.h"
#import "QFTabbarViewController.h"
#import "CookBookViewController.h"
#import "ExploreViewController.h"
#import "SquareViewController.h"
#import "AboutMeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    [self loadRootViewController];
    
    return YES;
}

- (void)loadRootViewController{
    
    self.window.rootViewController = [self CreateTabBarViewController];
}

- (UITabBarController *)CreateTabBarViewController{
    
    //初始化四个子视图控制器
    CookBookViewController *cookBook = [[CookBookViewController alloc] init];
    ExploreViewController *explore = [[ExploreViewController alloc] init];
    SquareViewController *square = [[SquareViewController alloc] init];
    AboutMeViewController *aboutMe = [[AboutMeViewController alloc] init];
    
    QFNavigationViewController *cookNav = [[QFNavigationViewController alloc] initWithRootViewController:cookBook];
    QFNavigationViewController *exploreNav = [[QFNavigationViewController alloc] initWithRootViewController:explore];
    QFNavigationViewController *squareNav = [[QFNavigationViewController alloc] initWithRootViewController:square];
    QFNavigationViewController *aboutMeNav = [[QFNavigationViewController alloc] initWithRootViewController:aboutMe];
    
    //设置标题
    cookNav.tabBarItem.title = @"菜谱";
    exploreNav.tabBarItem.title = @"发现";
    squareNav.tabBarItem.title = @"广场";
    aboutMeNav.tabBarItem.title = @"我的";
    
    cookNav.tabBarItem.image = [UIImage imageNamed:@"tab_cookbook"];
    cookNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_cookbook_hl"];
    
    exploreNav.tabBarItem.image = [UIImage imageNamed:@"tab_explore"];
    exploreNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_explore_hl"];
    
    squareNav.tabBarItem.image = [UIImage imageNamed:@"tab_plaza"];
    squareNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_plaza_hl"];
    
    aboutMeNav.tabBarItem.image = [UIImage imageNamed:@"tab_aboutme"];
    aboutMeNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tab_aboutme_hl"];
    
    QFTabbarViewController *tabBarViewController = [[QFTabbarViewController alloc] init];
    tabBarViewController.viewControllers = @[cookNav, exploreNav, squareNav, aboutMeNav];
    
    return tabBarViewController;
 }

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
