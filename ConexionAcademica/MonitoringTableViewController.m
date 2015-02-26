//
//  MonitoringTableViewController.m
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 24/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "MonitoringTableViewController.h"
#import "Student_DTO.h"
#import "SeguimientoItemTableViewCell.h"
#import "Session_DTO.h"
#import "Monitoring.h"
#import "Student_DTO.h"
#import "MBProgressHUD.h"
#import "AFHTTPRequestOperationManager.h"

@interface MonitoringTableViewController ()
{
    NSMutableArray *monitorings;
    Student_DTO *student;
    NSString *nombres;
}
@end

@implementation MonitoringTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    Session_DTO *session = [[Session_DTO alloc]init];
    student = [session currentStudent];
    monitorings = [[NSMutableArray alloc] init];
    nombres = [NSString stringWithFormat:@"%@ %@",student.STUDENT_NAMES,student.STUDENT_LASTNAMES];
    [self getMonitoring:student.STUDENT_ID];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nombres;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return monitorings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    SeguimientoItemTableViewCell *item = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (item == nil) {
        item = [[SeguimientoItemTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    item.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Monitoring *monitoring = [monitorings objectAtIndex:indexPath.row];
    item.month.text =  monitoring.MONITORING_DATE;
    item.date.text = monitoring.MONITORING_DATE;
    
    
    return item;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)getMonitoring:(NSString *)student_id
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Load Monitorings";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSString *URL = @"http://airefon.com/conexion/webservices/client/getMonitoring.php";
    NSDictionary *parameters = @{
                                 @"student_id": student_id,
                                 };
    
    [manager POST:URL
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"MONITORING : %@", responseObject);
         Session_DTO *session = [[Session_DTO alloc] init];
         NSDictionary *dic = (NSDictionary*)responseObject;
         NSInteger code = [[dic objectForKey:@"success"] integerValue];
         NSString *message = [dic objectForKey:@"message"];
         
         NSArray *json_messages = [dic objectForKey:@"MONITORING"];
         
         if(code == 1)
         {
             for (NSDictionary *json_message in json_messages)
             {
                 Monitoring *monitoring = [[Monitoring alloc] init];
                 monitoring.MONITORING_ID = [json_message objectForKey:@"MONITORING_ID"];
                 monitoring.MONITORING_EVALUATION = [json_message objectForKey:@"MONITORING_EVALUATION"];
                 monitoring.MONITORING_MATERIAL = [json_message objectForKey:@"MONITORING_MATERIAL"];
                 monitoring.MONITORING_WORK = [json_message objectForKey:@"MONITORING_WORK"];
                 monitoring.MONITORING_PROJECT = [json_message objectForKey:@"MONITORING_PROJECT"];
                 monitoring.MONITORING_APPROACH = [json_message objectForKey:@"MONITORING_APPROACH"];
                 monitoring.MONITORING_INDISCIPLINE = [json_message objectForKey:@"MONITORING_INDISCIPLINE"];
                 monitoring.MONITORING_OBSERVATIONS = [json_message objectForKey:@"MONITORING_OBSERVATIONS"];
                 monitoring.STUDENT_ID = [json_message objectForKey:@"STUDENT_ID"];
                 monitoring.MONITORING_CREATED = [json_message objectForKey:@"MONITORING_CREATED"];
                 monitoring.MONITORING_UPDATED = [json_message objectForKey:@"MONITORING_UPDATED"];
                 monitoring.MONITORING_DATE = [json_message objectForKey:@"MONITORING_DATE"];
                 monitoring.MONITORING_HOUR = [json_message objectForKey:@"MONITORING_HOUR"];
                 
                 [monitorings addObject:monitoring];
             }
         }
         
         hud.labelText = message;
         [hud hide:YES];
         
         nombres = [NSString stringWithFormat:@"%@ %@",student.STUDENT_NAMES,student.STUDENT_LASTNAMES];
         [self.tableView delegate];
         [self.tableView reloadData];
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"Error: %@", error);
     }];
}

@end
