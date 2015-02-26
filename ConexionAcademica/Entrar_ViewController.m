//
//  Entrar_ViewController.m
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 7/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "Entrar_ViewController.h"
#import "MBProgressHUD.h"
#import "AFHTTPRequestOperationManager.h"
#import "Control_TabBarController.h"
#import "Session_DTO.h"
#import "User_DTO.h"

@interface Entrar_ViewController ()
{
    NSString *mpassword;
    NSString *mcorreo;
}

@end

@implementation Entrar_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.correo.text = @"soporte@airefon.com";
    self.password.text = @"123456";
    
    mcorreo = self.correo.text;
    mpassword = self.password.text;
    
    _correo.delegate = self;
    _password.delegate = self;
    
    // Do any additional setup after loading the view.
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

- (IBAction)entrar:(id)sender {
    [self iniciarSession:mcorreo and:mpassword];
}

-(void)iniciarSession:(NSString *)correo and:(NSString *)password
{
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Loading";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSString *URL =
    @"http://airefon-com-w2e6bowtidfy.runscope.net/conexion/webservices/client/clientSignin.php";
    NSDictionary *parameters = @{
                                 @"user_email": correo,
                                 @"user_pass": password
                                 };
    
    [manager POST:URL
             parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject)
    {
        Session_DTO *session = [[Session_DTO alloc] init];
        NSDictionary *dic = (NSDictionary*)responseObject;
        NSInteger code = [[dic objectForKey:@"success"] integerValue];
        NSString *message = [dic objectForKey:@"message"];
        
        if(code == 1)
        {
            NSArray *users = [dic objectForKey:@"USERS"];
            NSDictionary *user_json = (NSDictionary*)[users objectAtIndex:0];
            
            User_DTO *user = [[User_DTO alloc] init];
            user.USER_ID = [user_json objectForKey:@"USER_ID"];
            user.USER_NAMES = [user_json objectForKey:@"USER_NAMES"];
            user.USER_LASTNAMES = [user_json objectForKey:@"USER_LASTNAMES"];
            user.USER_EMAIL = [user_json objectForKey:@"USER_EMAIL"];
            user.ROLE_ID = [user_json objectForKey:@"ROLE_ID"];
            
            [session saveUser:user];
            
            Control_TabBarController *secondViewController =
            [self.storyboard instantiateViewControllerWithIdentifier:@"Control_TabBarController"];         [self.navigationController pushViewController:secondViewController animated:YES];
        }
        
        hud.labelText = message;
        [hud hide:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error)
    {
        NSLog(@"Error: %@", operation);
        [hud hide:YES];
    }];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_correo resignFirstResponder];
    [_password resignFirstResponder];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
