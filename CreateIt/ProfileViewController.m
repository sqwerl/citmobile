//
//  ProfileViewController.m
//  CreateIt
//
//  Created by Larry Cao on 2/13/13.
//  Copyright (c) 2013 Larry Cao. All rights reserved.
//

#import "ProfileViewController.h"
#import "AppDelegate.h"
#import <FacebookSDK/FacebookSDK.h>


@interface ProfileViewController ()

@property (strong, nonatomic) IBOutlet FBProfilePictureView *userProfileImage;
@property (strong, nonatomic) IBOutlet UILabel *userNameLabel;

- (void)populateUserDetails;
- (void)sessionStateChanged:(NSNotification*)notification;
- (IBAction)logoutButtonWasPressed:(id)sender;

@end

@implementation ProfileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Profile";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector:@selector(sessionStateChanged:)
     name:FBSessionStateChangedNotification
     object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (FBSession.activeSession.isOpen) {
        [self populateUserDetails];
    }
}

- (void)viewDidUnload
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}


- (IBAction)logoutButtonWasPressed:(id)sender
{
    NSLog(@"logout button pressed");
    [FBSession.activeSession closeAndClearTokenInformation];
}


- (void)populateUserDetails
{
    if (FBSession.activeSession.isOpen) {
        [[FBRequest requestForMe] startWithCompletionHandler:
         ^(FBRequestConnection *connection,
           NSDictionary<FBGraphUser> *user,
           NSError *error) {
             if (!error) {
                 self.userNameLabel.text = user.name;
                 self.userProfileImage.profileID = user.id;
             }
         }];
    }
}
- (void)sessionStateChanged:(NSNotification*)notification {
    [self populateUserDetails];
}

@end
