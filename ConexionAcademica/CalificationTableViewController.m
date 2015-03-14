//
//  CalificationTableViewController.m
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 26/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "CalificationTableViewController.h"
#import "CalificationItemTableViewCell.h"
#import "MagicPieLayer.h"
#import "SelfPieElement.h"
#import "CustomPieView.h"
#import "Student_DTO.h"
#import "Calification_DTO.h"
#import "Session_DTO.h"
#import "Monitoring.h"
#import "Student_DTO.h"
#import "MBProgressHUD.h"
#import "AFHTTPRequestOperationManager.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface CalificationTableViewController ()
{
    NSMutableArray *califications;
    Student_DTO *student;
    NSString *nombres;
}

@end

@implementation CalificationTableViewController

-(void)updateTable
{
    Session_DTO *session = [[Session_DTO alloc]init];
    student = [session currentStudent];
    califications = [[NSMutableArray alloc] init];
    [self getNotes:student.STUDENT_ID];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Session_DTO *session = [[Session_DTO alloc]init];
    student = [session currentStudent];
    califications = [[NSMutableArray alloc] init];
    nombres = [NSString stringWithFormat:@"%@ %@",student.STUDENT_NAMES,student.STUDENT_LASTNAMES];
    [self getNotes:student.STUDENT_ID];
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
    return califications.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    CalificationItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CalificationItemTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Calification_DTO *calification = [califications objectAtIndex:indexPath.row];
    cell.fecha.text = calification.SCORE_DATE;
    
    cell.espaniol.text = calification.SCORE_ES;
    cell.ingles.text = calification.SCORE_ING;
    cell.matematica.text = calification.SCORE_MAT;
    cell.ciencias.text = calification.SCORE_CIE;
    cell.tecnologia.text = calification.SCORE_TEC;
    cell.geografia.text = calification.SCORE_GEO;
    cell.ambiente.text = calification.SCORE_A;
    cell.fisica.text = calification.SCORE_Ef;
    cell.otro.text = calification.SCORE_AE;
    
    cell.espaniol.textColor = UIColorFromRGB([self getColor:calification.SCORE_ES and:cell.espaniol]);
    cell.ingles.textColor = UIColorFromRGB([self getColor:calification.SCORE_ING and:cell.ingles]);
    cell.matematica.textColor = UIColorFromRGB([self getColor:calification.SCORE_MAT and:cell.matematica]);
    cell.ciencias.textColor = UIColorFromRGB([self getColor:calification.SCORE_CIE and:cell.ciencias]);
    cell.tecnologia.textColor = UIColorFromRGB([self getColor:calification.SCORE_TEC and:cell.tecnologia]);
    cell.geografia.textColor = UIColorFromRGB([self getColor:calification.SCORE_GEO and:cell.geografia]);
    cell.ambiente.textColor = UIColorFromRGB([self getColor:calification.SCORE_A and:cell.ambiente]);
    cell.fisica.textColor = UIColorFromRGB([self getColor:calification.SCORE_Ef and:cell.fisica]);
    cell.otro.textColor = UIColorFromRGB([self getColor:calification.SCORE_AE and:cell.otro]);
    
    cell.promedio.text =
    [@(([calification.SCORE_ES integerValue] +
      [calification.SCORE_ING integerValue] +
      [calification.SCORE_MAT integerValue] +
      [calification.SCORE_CIE integerValue] +
      [calification.SCORE_TEC integerValue] +
      [calification.SCORE_GEO integerValue] +
      [calification.SCORE_A integerValue] +
      [calification.SCORE_Ef integerValue] +
      [calification.SCORE_AE integerValue])/9) stringValue];
    cell.promedio.text = [NSString stringWithFormat:@"Promedio : %@",cell.promedio.text];
    cell.promedio.textColor = UIColorFromRGB([self getColor:cell.promedio.text and:cell.promedio]);
    
    PieLayer* pieLayer = [[PieLayer alloc] init];
    pieLayer.frame = CGRectMake(0,0,200,200);
    [cell.uiview.layer addSublayer:pieLayer];
    
    [pieLayer addValues:@[
                          [PieElement pieElementWithValue:[calification.SCORE_ES intValue]
                                                    color:UIColorFromRGB([self getColor:calification.SCORE_ES])],
                          [PieElement pieElementWithValue:[calification.SCORE_ING intValue]
                                                    color:UIColorFromRGB([self getColor:calification.SCORE_ING])],
                          [PieElement pieElementWithValue:[calification.SCORE_MAT intValue]
                                                    color:UIColorFromRGB([self getColor:calification.SCORE_MAT])],
                          [PieElement pieElementWithValue:[calification.SCORE_CIE intValue]
                                                    color:UIColorFromRGB([self getColor:calification.SCORE_CIE])],
                          [PieElement pieElementWithValue:[calification.SCORE_TEC intValue]
                                                    color:UIColorFromRGB([self getColor:calification.SCORE_TEC])],
                          [PieElement pieElementWithValue:[calification.SCORE_GEO intValue]
                                                    color:UIColorFromRGB([self getColor:calification.SCORE_GEO])],
                          [PieElement pieElementWithValue:[calification.SCORE_A intValue]
                                                    color:UIColorFromRGB([self getColor:calification.SCORE_A])],
                          [PieElement pieElementWithValue:[calification.SCORE_Ef intValue]
                                                    color:UIColorFromRGB([self getColor:calification.SCORE_Ef])],
                          [PieElement pieElementWithValue:[calification.SCORE_AE intValue]
                                                    color:UIColorFromRGB([self getColor:calification.SCORE_AE])]]
                          animated:NO];
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 300;
}

/*
 PieLayer *pieLayer = [[PieLayer alloc] init];
 pieLayer.frame = CGRectMake(15, 15, 200, 200);
 [cell.layer addSublayer:pieLayer];
 
 [pieLayer addValues:@[[PieElement pieElementWithValue:1.0 color:[UIColor redColor]],
 [PieElement pieElementWithValue:1.0 color:[UIColor blueColor]],
 [PieElement pieElementWithValue:1.0 color:[UIColor redColor]],
 [PieElement pieElementWithValue:1.0 color:[UIColor blueColor]],
 [PieElement pieElementWithValue:1.0 color:[UIColor redColor]],
 [PieElement pieElementWithValue:1.0 color:[UIColor blueColor]],
 [PieElement pieElementWithValue:1.0 color:[UIColor redColor]],
 [PieElement pieElementWithValue:1.0 color:[UIColor blueColor]],
 [PieElement pieElementWithValue:1.0 color:[UIColor greenColor]]] animated:NO];
 */

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

-(int)getColor: (NSString*)note and:(UILabel*)label
{
    if([note intValue] >= 0 && [note intValue] < 6){
        return 0xc0392b;
    }
    else if([note intValue] > 5 && [note intValue] < 9)
    {
        return 0x27ae60;
    }
    else
    {
        return 0x28a6eb;
    }
}

-(int)getColor: (NSString*)note
{
    if([note intValue] >= 0 && [note intValue] < 6){
        return 0xc0392b;
    }
    else if([note intValue] > 5 && [note intValue] < 9)
    {
        return 0x27ae60;
    }
    else
    {
        return 0x28a6eb;
    }
}



-(void)getNotes:(NSString *)student_id
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Load Califications";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSString *URL = @"http://airefon.com/conexion/webservices/client/getScores.php";
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
         
         NSArray *json_messages = [dic objectForKey:@"SCORES"];
         
         if(code == 1)
         {
             for (NSDictionary *json_message in json_messages)
             {
                 
                 Calification_DTO *calification = [[Calification_DTO alloc] init];
                 calification.SCORE_A = [json_message objectForKey:@"SCORE_A"];
                 calification.SCORE_AE = [json_message objectForKey:@"SCORE_AE"];
                 calification.SCORE_CIE = [json_message objectForKey:@"SCORE_CIE"];
                 calification.SCORE_CREATED = [json_message objectForKey:@"SCORE_CREATED"];
                 calification.SCORE_DATE = [json_message objectForKey:@"SCORE_DATE"];
                 calification.SCORE_ES = [json_message objectForKey:@"SCORE_ES"];
                 calification.SCORE_Ef = [json_message objectForKey:@"SCORE_Ef"];
                 calification.SCORE_GEO = [json_message objectForKey:@"SCORE_GEO"];
                 calification.SCORE_HOUR = [json_message objectForKey:@"SCORE_HOUR"];
                 calification.SCORE_ID = [json_message objectForKey:@"SCORE_ID"];
                 calification.SCORE_ING = [json_message objectForKey:@"SCORE_ING"];
                 calification.SCORE_MAT = [json_message objectForKey:@"SCORE_MAT"];
                 calification.SCORE_TEC = [json_message objectForKey:@"SCORE_TEC"];
                 calification.SCORE_UPDATED = [json_message objectForKey:@"SCORE_UPDATED"];
                 calification.STUDENT_ID = [json_message objectForKey:@"STUDENT_ID"];
                 calification.USER_ID = [json_message objectForKey:@"USER_ID"];
                 
                 [califications addObject:calification];
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
