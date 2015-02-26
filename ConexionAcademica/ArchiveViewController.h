//
//  ArchiveViewController.h
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 23/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArchiveViewController : UIViewController

@property (nonatomic,strong) NSString *LINK;
@property (nonatomic,strong) NSString *TITLE;
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end
