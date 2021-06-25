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
@property (weak, nonatomic) IBOutlet UILabel *coreJbStatus;
@property (weak, nonatomic) IBOutlet UILabel *systemLabel;
@property (weak, nonatomic) IBOutlet UILabel *macLabel;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL securityCheckResult = isSecurityCheckPassed();
    BOOL appStoreResult = isFromAppStore();
    BOOL debugResult = isDebugged();
    BOOL dylibResult = isInjectedWithDynamicLibrary();
    BOOL coreJbResult = isJailBroken();
    BOOL runningOnMacResult = isRunningOnMac();
    self.securityCheckStatus.text = securityCheckResult?@"TRUE":@"FALSE";
    self.appStoreStatus.text = appStoreResult?@"TRUE":@"FALSE";
    self.debugStatus.text = debugResult?@"TRUE":@"FALSE";
    self.dylibStatus.text = dylibResult?@"TRUE":@"FALSE";
    self.coreJbStatus.text = coreJbResult?@"TRUE":@"FALSE";
    self.macLabel.text = runningOnMacResult?@"TRUE":@"FALSE";
    struct utsname systemInfo;
    uname(&systemInfo);
    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"%@\n%@", [[NSString alloc] initWithUTF8String:systemInfo.machine], [[NSString alloc] initWithUTF8String:systemInfo.version]];
    self.systemLabel.text = str;
    self.systemLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.systemLabel.numberOfLines = 0;
    NSArray *texts = [[NSArray alloc] initWithObjects:self.appStoreStatus, self.debugStatus, self.coreJbStatus,self.dylibStatus, self.macLabel, nil];
    for(UILabel* lbl in texts){
        if([[lbl text] isEqualToString:@"TRUE"]){
            lbl.textColor = UIColor.redColor;
        }else{
            lbl.textColor = UIColor.blueColor;
        }
    }
    if([[self.securityCheckStatus text] isEqualToString:@"TRUE"]){
        self.securityCheckStatus.textColor = UIColor.greenColor;
    }else{
        self.securityCheckStatus.textColor = UIColor.redColor;
    }
    
}


@end
