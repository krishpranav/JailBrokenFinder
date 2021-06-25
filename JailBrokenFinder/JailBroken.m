//
//  JailBroken.m
//  JailBrokenFinder
//
//  Created by Elangovan Ayyasamy on 25/06/21.
//  Copyright © 2021 Krisna Pranav. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property NSThread* evtThread;
@property (weak, nonatomic) IBOutlet UILabel *securityCheckStatus;
@property (weak, nonatomic) IBOutlet UILabel *appStoreStatus;
@property (weak, nonatomic) IBOutlet UILabel *debugStatus;
@property (weak, nonatomic) IBOutlet UILabel *dylibStatus;
@property (weak, nonatomic) IBOutlet UILabel *coreJailBreakStatus;
@property (weak, nonatomic) IBOutlet UILabel *systemLabel;
@property (weak, nonatomic) IBOutlet UILabel *macLabel;
@end

