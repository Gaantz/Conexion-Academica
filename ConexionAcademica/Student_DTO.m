//
//  Student_DTO.m
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 10/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "Student_DTO.h"

@implementation Student_DTO

@synthesize STUDENT_ID;
@synthesize STUDENT_NAMES;
@synthesize STUDENT_LASTNAMES;
@synthesize STUDENT_CODE;
@synthesize STUDENT_GENDER;
@synthesize USER_ID;
@synthesize GROUP_ID;

- (void) encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeObject:STUDENT_ID forKey:@"STUDENT_ID"];
    [encoder encodeObject:STUDENT_NAMES forKey:@"STUDENT_NAMES"];
    [encoder encodeObject:STUDENT_LASTNAMES forKey:@"STUDENT_LASTNAMES"];
    [encoder encodeObject:STUDENT_CODE forKey:@"STUDENT_CODE"];
    [encoder encodeObject:STUDENT_GENDER forKey:@"STUDENT_GENDER"];
    [encoder encodeObject:USER_ID forKey:@"USER_ID"];
    [encoder encodeObject:GROUP_ID forKey:@"GROUP_ID"];
}

- (id) initWithCoder:(NSCoder*)decoder
{
    if (self = [super init]) {
        STUDENT_ID = [decoder decodeObjectForKey:@"STUDENT_ID"];
        STUDENT_NAMES = [decoder decodeObjectForKey:@"STUDENT_NAMES"];
        STUDENT_LASTNAMES = [decoder decodeObjectForKey:@"STUDENT_LASTNAMES"];
        STUDENT_CODE = [decoder decodeObjectForKey:@"STUDENT_CODE"];
        STUDENT_GENDER = [decoder decodeObjectForKey:@"STUDENT_GENDER"];
        USER_ID = [decoder decodeObjectForKey:@"USER_ID"];
        GROUP_ID = [decoder decodeObjectForKey:@"GROUP_ID"];
    }
    return self;
}

@end
