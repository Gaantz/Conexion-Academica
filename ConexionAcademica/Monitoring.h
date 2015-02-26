//
//  Monitoring.h
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 24/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Monitoring : NSObject <NSCoding>

@property (nonatomic,strong) NSString *MONITORING_ID;
@property (nonatomic,strong) NSString *MONITORING_EVALUATION;
@property (nonatomic,strong) NSString *MONITORING_MATERIAL;
@property (nonatomic,strong) NSString *MONITORING_WORK;
@property (nonatomic,strong) NSString *MONITORING_PROJECT;
@property (nonatomic,strong) NSString *MONITORING_APPROACH;
@property (nonatomic,strong) NSString *MONITORING_INDISCIPLINE;
@property (nonatomic,strong) NSString *MONITORING_OBSERVATIONS;
@property (nonatomic,strong) NSString *STUDENT_ID;
@property (nonatomic,strong) NSString *MONITORING_CREATED;
@property (nonatomic,strong) NSString *MONITORING_UPDATED;
@property (nonatomic,strong) NSString *MONITORING_DATE;
@property (nonatomic,strong) NSString *MONITORING_HOUR;

- (void) encodeWithCoder:(NSCoder*)encoder;
- (id) initWithCoder:(NSCoder*)decoder;

@end
