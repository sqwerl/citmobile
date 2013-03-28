//
//  MainViewController.m
//  CreateIt
//
//  Created by Larry Cao on 3/28/13.
//  Copyright (c) 2013 Larry Cao. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

- (void)viewDidAppear:(BOOL)animated {
    [(AppDelegate *)[[UIApplication sharedApplication] delegate] performSelector:@selector(checkFacebookState) withObject:nil afterDelay:1];


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
