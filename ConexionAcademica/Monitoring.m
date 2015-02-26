//
//  Monitoring.m
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 24/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "Monitoring.h"

@implementation Monitoring

@synthesize MONITORING_ID;
@synthesize MONITORING_EVALUATION;
@synthesize MONITORING_MATERIAL;
@synthesize MONITORING_WORK;
@synthesize MONITORING_PROJECT;
@synthesize MONITORING_APPROACH;
@synthesize MONITORING_INDISCIPLINE;
@synthesize MONITORING_OBSERVATIONS;
@synthesize STUDENT_ID;
@synthesize MONITORING_CREATED;
@synthesize MONITORING_UPDATED;
@synthesize MONITORING_DATE;
@synthesize MONITORING_HOUR;

- (void) encodeWithCoder:(NSCoder*)encoder
{
    [encoder encodeObject:MONITORING_ID forKey:@"MONITORING_ID"];
    [encoder encodeObject:MONITORING_EVALUATION forKey:@"MONITORING_EVALUATION"];
    [encoder encodeObject:MONITORING_MATERIAL forKey:@"MONITORING_MATERIAL"];
    [encoder encodeObject:MONITORING_WORK forKey:@"MONITORING_WORK"];
    [encoder encodeObject:MONITORING_PROJECT forKey:@"MONITORING_PROJECT"];
    [encoder encodeObject:MONITORING_APPROACH forKey:@"MONITORING_APPROACH"];
    [encoder encodeObject:MONITORING_INDISCIPLINE forKey:@"MONITORING_INDISCIPLINE"];
    [encoder encodeObject:MONITORING_OBSERVATIONS forKey:@"MONITORING_OBSERVATIONS"];
    [encoder encodeObject:STUDENT_ID forKey:@"STUDENT_ID"];
    [encoder encodeObject:MONITORING_CREATED forKey:@"MONITORING_CREATED"];
    [encoder encodeObject:MONITORING_UPDATED forKey:@"MONITORING_UPDATED"];
    [encoder encodeObject:MONITORING_DATE forKey:@"MONITORING_DATE"];
    [encoder encodeObject:MONITORING_HOUR forKey:@"MONITORING_HOUR"];
}

- (id) initWithCoder:(NSCoder*)decoder
{
    if (self = [super init]) {
        MONITORING_ID = [decoder decodeObjectForKey:@"MONITORING_ID"];
        MONITORING_EVALUATION = [decoder decodeObjectForKey:@"MONITORING_EVALUATION"];
        MONITORING_MATERIAL = [decoder decodeObjectForKey:@"MONITORING_MATERIAL"];
        MONITORING_WORK = [decoder decodeObjectForKey:@"MONITORING_WORK"];
        MONITORING_PROJECT = [decoder decodeObjectForKey:@"MONITORING_PROJECT"];
        MONITORING_APPROACH = [decoder decodeObjectForKey:@"MONITORING_APPROACH"];
        MONITORING_INDISCIPLINE = [decoder decodeObjectForKey:@"MONITORING_INDISCIPLINE"];
        MONITORING_OBSERVATIONS = [decoder decodeObjectForKey:@"MONITORING_OBSERVATIONS"];
        STUDENT_ID = [decoder decodeObjectForKey:@"STUDENT_ID"];
        MONITORING_CREATED = [decoder decodeObjectForKey:@"MONITORING_CREATED"];
        MONITORING_UPDATED = [decoder decodeObjectForKey:@"MONITORING_UPDATED"];
        MONITORING_DATE = [decoder decodeObjectForKey:@"MONITORING_DATE"];
        MONITORING_HOUR = [decoder decodeObjectForKey:@"MONITORING_HOUR"];
    }
    return self;
}

@end
