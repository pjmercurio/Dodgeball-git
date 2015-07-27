//
//  PMercurioFinalProjectAppDelegate.h
//  PMercurioFinalProject
//
//  Created by Paul Mercurio on 11/4/11.
//  Copyright 2011 SBHS. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PMercurioFinalProjectViewController;

@interface PMercurioFinalProjectAppDelegate : NSObject <UIApplicationDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet PMercurioFinalProjectViewController *viewController;

@end
