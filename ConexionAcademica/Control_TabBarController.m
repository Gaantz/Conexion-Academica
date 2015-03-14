//
//  Control_TabBarController.m
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 9/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "Control_TabBarController.h"
#import "User_DTO.h"
#import "AFHTTPRequestOperationManager.h"
#import "Session_DTO.h"
#import "MBProgressHUD.h"
#import "Student_DTO.h"
#import "CalificationTableViewController.h"
#import "MonitoringTableViewController.h"
#import "MessageTableViewController.h"

@implementation Control_TabBarController
{
    MBProgressHUD *hud;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // HUD
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Load Estudents";
    
    User_DTO *user = [[[Session_DTO alloc] init] currentUser];
    [self loadStudents:user.USER_ID];

}

-(void)getChilds:(id)sender {
    UIAlertView *dialog = [[UIAlertView alloc]
                           initWithTitle:@"ESTUDIANTES"
                           message:nil
                           delegate:self
                           cancelButtonTitle:nil
                           otherButtonTitles:
                           nil];
    
    Session_DTO *session = [[Session_DTO alloc] init];
    NSArray *students = [session getStudents];
    
    for (Student_DTO *student in students) {	
        NSString *nombres = [NSString stringWithFormat:@"%@ %@",student.STUDENT_NAMES,student.STUDENT_LASTNAMES];
        [dialog addButtonWithTitle:nombres];

    }
    
    [dialog show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    Session_DTO *session = [[Session_DTO alloc] init];
    NSString *nombre = [alertView buttonTitleAtIndex:buttonIndex];
    Student_DTO *student = [session searchStudent:nombre];
    
    [session saveStudent:student];
    // Instance
    MessageTableViewController *a = (MessageTableViewController*)
    [[self viewControllers] objectAtIndex:0];
    CalificationTableViewController *b = (CalificationTableViewController*)
    [[self viewControllers] objectAtIndex:2];
    MonitoringTableViewController*c = (MonitoringTableViewController*)
    [[self viewControllers] objectAtIndex:1];

        [a updateTable];
        [b updateTable];
        [c updateTable];
    
}


-(void)loadStudents:(NSString *)user_id
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSString *URL = @"http://airefon.com/conexion/webservices/client/getStudents.php";
    NSDictionary *parameters = @{
                                 @"user_id": user_id,
                                 };
    
    [manager POST:URL
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"STUDENTS : %@", responseObject);
         Session_DTO *session = [[Session_DTO alloc] init];
         NSDictionary *dic = (NSDictionary*)responseObject;
         NSInteger code = [[dic objectForKey:@"success"] integerValue];
         //NSString *message = [dic objectForKey:@"message"];
         
         NSArray *json_students = [dic objectForKey:@"STUDENTS"];
         NSMutableArray *students = [[NSMutableArray alloc] init];
         
         if(code == 1)
         {
             for (int i = 0; i < json_students.count; i++) {
                 NSDictionary *json_student = (NSDictionary*)[json_students objectAtIndex:i];
        
                 Student_DTO *student = [[Student_DTO alloc] init];
                 student.GROUP_ID = [json_student objectForKey:@"GROUP_ID"];
                 student.STUDENT_CODE = [json_student objectForKey:@"STUDENT_CODE"];
                 student.STUDENT_GENDER = [json_student objectForKey:@"STUDENT_GENDER"];
                 student.STUDENT_ID = [json_student objectForKey:@"STUDENT_ID"];
                 student.STUDENT_LASTNAMES = [json_student objectForKey:@"STUDENT_LASTNAMES"];
                 student.STUDENT_NAMES = [json_student objectForKey:@"STUDENT_NAMES"];
                 student.USER_ID = [json_student objectForKey:@"USER_ID"];
                 
                 [students addObject:student];
             }
             
             NSArray *data = [[NSArray alloc] initWithArray:students];
             [session saveStudents:data];
             [session saveStudent:[students objectAtIndex:0]];
             
             // Instance
             MessageTableViewController *view = (MessageTableViewController*)[[self viewControllers] objectAtIndex:0];
             [view updateTable];
         }
         [hud hide:YES];
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
         [hud hide:YES];
     }];
}


@end
