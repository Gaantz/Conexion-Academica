//
//  Entrar_ViewController.h
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 7/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface Entrar_ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *correo;
@property (weak, nonatomic) IBOutlet UITextField *password;
- (IBAction)entrar:(id)sender;

-(void)iniciarSession:(NSString*)correo and:(NSString*)password;

@end
