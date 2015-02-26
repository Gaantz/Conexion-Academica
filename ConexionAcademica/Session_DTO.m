//
//  Session_DTO.m
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 9/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "Session_DTO.h"

@implementation Session_DTO
{
    
}

-(void)saveUser:(User_DTO *)user
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    [def setValue:user.USER_ID forKey:@"USER_ID"];
    [def setValue:user.USER_EMAIL forKey:@"USER_EMAIL"];
    [def setValue:user.USER_NAMES forKey:@"USER_NAMES"];
    [def setValue:user.USER_LASTNAMES forKey:@"USER_LASTNAMES"];
    [def synchronize];
}

-(User_DTO *)currentUser
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    User_DTO *user = [[User_DTO alloc] init];
    user.USER_ID = [def objectForKey:@"USER_ID"];
    user.USER_EMAIL = [def objectForKey:@"USER_EMAIL"];
    user.USER_NAMES = [def objectForKey:@"USER_NAMES"];
    user.USER_LASTNAMES = [def objectForKey:@"USER_LASTNAMES"];
    
    return user;
}

-(NSArray *)getStudents
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSData *data = [def objectForKey:@"students"];
    NSArray *students = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [def synchronize];
    return students;
}

-(void)saveStudents:(NSArray *)students
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:students];
    [def setObject:data forKey:@"students"];
    [def synchronize];
}

-(void)saveStudent:(Student_DTO *)student
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:student];
    [def setObject:data forKey:@"student"];
    [def synchronize];
}

-(Student_DTO *)currentStudent
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSData *data = [def objectForKey:@"student"];
    Student_DTO *student = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [def synchronize];
    return student;
}

-(Student_DTO *)searchStudent:(NSString *)student_name
{
    NSArray *students = [self getStudents];
    for (Student_DTO* student in students) {
        NSString *nombres = [NSString stringWithFormat:@"%@ %@",student.STUDENT_NAMES,student.STUDENT_LASTNAMES];
        if ([nombres isEqualToString:student_name]) {
            return student;
        }
    }
    
    return nil;
}


-(NSMutableArray *)getMessages
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSData *data = [def objectForKey:@"messages"];
    NSArray *messages = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    [def synchronize];
    return [NSMutableArray arrayWithArray:messages];
}

- (void)saveMessages:(NSArray *)message
{
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:message];
    [def setObject:data forKey:@"messages"];
    [def synchronize];
}

@end
