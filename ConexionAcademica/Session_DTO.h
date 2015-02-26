//
//  Session_DTO.h
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 9/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User_DTO.h"
#import "Student_DTO.h"
#import "Message_DTO.h"

@interface Session_DTO : NSObject

- (void) saveUser:(User_DTO*)user;
- (User_DTO*)currentUser;

-(void) saveStudents:(NSArray*) students;
-(NSArray*) getStudents;

- (void) saveStudent:(Student_DTO*)student;
- (Student_DTO*)currentStudent;

-(Student_DTO*)searchStudent:(NSString*) student_name;

- (void) saveMessages:(NSArray*)message;
- (NSMutableArray*)getMessages;

@end
