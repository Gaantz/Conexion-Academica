//
//  Message_DTO.m
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 20/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "Message_DTO.h"

@implementation Message_DTO

@synthesize MESSAGE_CONTENT;
@synthesize MESSAGE_DATE;
@synthesize MESSAGE_EXT;
@synthesize MESSAGE_ID;
@synthesize MESSAGE_SUBJECT;
@synthesize MESSAGE_HOUR;
@synthesize MESSAGE_URL;
@synthesize STUDENTS_ID;
@synthesize TYPE_ID;
@synthesize TYPE_NAME;
@synthesize USER_ID;

- (void) encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeObject:MESSAGE_CONTENT forKey:@"MESSAGE_CONTENT"];
    [encoder encodeObject:MESSAGE_DATE forKey:@"MESSAGE_DATE"];
    [encoder encodeObject:MESSAGE_EXT forKey:@"MESSAGE_EXT"];
    [encoder encodeObject:MESSAGE_ID forKey:@"MESSAGE_ID"];
    [encoder encodeObject:MESSAGE_SUBJECT forKey:@"MESSAGE_SUBJECT"];
    [encoder encodeObject:MESSAGE_HOUR forKey:@"MESSAGE_HOUR"];
    [encoder encodeObject:MESSAGE_URL forKey:@"MESSAGE_URL"];
    [encoder encodeObject:STUDENTS_ID forKey:@"STUDENTS_ID"];
    [encoder encodeObject:TYPE_ID forKey:@"TYPE_ID"];
    [encoder encodeObject:TYPE_NAME forKey:@"TYPE_NAME"];
    [encoder encodeObject:USER_ID forKey:@"USER_ID"];
}

- (id) initWithCoder:(NSCoder*)decoder
{
    if (self = [super init]) {
        MESSAGE_CONTENT = [decoder decodeObjectForKey:@"MESSAGE_CONTENT"];
        MESSAGE_DATE = [decoder decodeObjectForKey:@"MESSAGE_DATE"];
        MESSAGE_EXT = [decoder decodeObjectForKey:@"MESSAGE_EXT"];
        MESSAGE_ID = [decoder decodeObjectForKey:@"MESSAGE_ID"];
        MESSAGE_SUBJECT = [decoder decodeObjectForKey:@"MESSAGE_SUBJECT"];
        MESSAGE_HOUR = [decoder decodeObjectForKey:@"MESSAGE_HOUR"];
        MESSAGE_URL = [decoder decodeObjectForKey:@"GROUP_ID"];
        STUDENTS_ID = [decoder decodeObjectForKey:@"STUDENTS_ID"];
        TYPE_ID = [decoder decodeObjectForKey:@"TYPE_ID"];
        TYPE_NAME = [decoder decodeObjectForKey:@"TYPE_NAME"];
        USER_ID = [decoder decodeObjectForKey:@"USER_ID"];
    }
    return self;
}

@end
