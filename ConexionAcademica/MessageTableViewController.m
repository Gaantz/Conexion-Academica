//
//  MessageTableViewController.m
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 20/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "MessageTableViewController.h"
#import "Student_DTO.h"
#import "Message_DTO.h"
#import "AFHTTPRequestOperationManager.h"
#import "MessageItemTableViewCell.h"
#import "ArchiveViewController.h"
#import "Session_DTO.h"
#import "MBProgressHUD.h"

@interface MessageTableViewController ()

@end

@implementation MessageTableViewController
{
    NSMutableArray *messages;
    Student_DTO *student;
    NSString *nombres;
}
@synthesize LINK;

-(void)updateTable
{
    Session_DTO *session = [[Session_DTO alloc]init];
    student = [session currentStudent];
    messages = [[NSMutableArray alloc] init];
    [self getMessages:student.STUDENT_ID];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    messages = [[NSMutableArray alloc] init];
    nombres = @"LOADING...";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
    return messages.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";
    MessageItemTableViewCell *item = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (item == nil) {
        item = [[MessageItemTableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    item.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Message_DTO *message = [messages objectAtIndex:indexPath.row];
    
    if([message.TYPE_ID isEqual:@"1"])
    {
        //TAREA
        UIImage *image = [UIImage imageNamed: @"tarea.png"];
        [item.imagetype setImage:image];
    }
    else if([message.TYPE_ID isEqual:@"2"])
    {
        //PAGOS
        UIImage *image = [UIImage imageNamed: @"pagos.png"];
        [item.imagetype setImage:image];
    }
    else if([message.TYPE_ID isEqual:@"3"])
    {
        //CIRCULARES
        UIImage *image = [UIImage imageNamed: @"megaphone.png"];
        [item.imagetype setImage:image];
    }
    
    item.fecha.text = message.MESSAGE_DATE;
    item.hora.text = message.MESSAGE_HOUR;
    item.message.text = message.MESSAGE_CONTENT;
    item.title.text = message.MESSAGE_SUBJECT;
    item.type.text = message.TYPE_NAME;
    item.LINK = message.TYPE_NAME;
    
    item.archive.tag = indexPath.row;
    [item.archive addTarget:self action:@selector(yourButtonClicked:) forControlEvents:UIControlEventTouchUpInside];

    
    return item;
}


-(void)yourButtonClicked:(UIButton*)sender
{
        ArchiveViewController *view = (ArchiveViewController*)[self.storyboard instantiateViewControllerWithIdentifier: @"ArchiveViewController"];
        view.LINK = [[messages objectAtIndex:sender.tag] MESSAGE_URL];
        view.TITLE = [[messages objectAtIndex:sender.tag] TYPE_NAME];
        [self.navigationController pushViewController:view animated:YES];

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


-(void)getMessages:(NSString *)student_id
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Load Messages";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSString *URL = @"http://airefon.com/conexion/webservices/client/getMessages.php";
    NSDictionary *parameters = @{
                                 @"student_id": student_id,
                                 };
    
    [manager POST:URL
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"MESSAGE : %@", responseObject);
         Session_DTO *session = [[Session_DTO alloc] init];
         NSDictionary *dic = (NSDictionary*)responseObject;
         NSInteger code = [[dic objectForKey:@"success"] integerValue];
         NSString *message = [dic objectForKey:@"message"];
         
         NSArray *json_messages = [dic objectForKey:@"MESSAGES"];
         
         if(code == 1)
         {
             for (NSDictionary *json_message in json_messages)
             {
                 Message_DTO *message = [[Message_DTO alloc] init];
                 message.MESSAGE_CONTENT = [json_message objectForKey:@"MESSAGE_CONTENT"];
                 message.MESSAGE_DATE = [json_message objectForKey:@"MESSAGE_DATE"];
                 message.MESSAGE_EXT = [json_message objectForKey:@"MESSAGE_EXT"];
                 message.MESSAGE_ID = [json_message objectForKey:@"MESSAGE_ID"];
                 message.MESSAGE_SUBJECT = [json_message objectForKey:@"MESSAGE_SUBJECT"];
                 message.MESSAGE_HOUR = [json_message objectForKey:@"MESSAGE_HOUR"];
                 message.MESSAGE_URL = [json_message objectForKey:@"MESSAGE_URL"];
                 message.STUDENTS_ID = [json_message objectForKey:@"STUDENTS_ID"];
                 message.TYPE_ID = [json_message objectForKey:@"TYPE_ID"];
                 message.TYPE_NAME = [json_message objectForKey:@"TYPE_NAME"];
                 message.USER_ID = [json_message objectForKey:@"USER_ID"];
                 
                 [messages addObject:message];
             }
             
             [session saveMessages:messages];
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
