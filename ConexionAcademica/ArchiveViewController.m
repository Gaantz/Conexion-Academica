//
//  ArchiveViewController.m
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 23/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "ArchiveViewController.h"

@interface ArchiveViewController ()

@end

@implementation ArchiveViewController
@synthesize LINK;
@synthesize TITLE;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = TITLE;
    
    // Do any additional setup after loading the view.
    NSURL *url = [NSURL URLWithString:LINK];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [_webview loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
