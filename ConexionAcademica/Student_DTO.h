//
//  Student_DTO.h
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 10/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student_DTO : NSObject <NSCoding>

@property (nonatomic,strong) NSString *STUDENT_ID;
@property (nonatomic,strong) NSString *STUDENT_NAMES;
@property (nonatomic,strong) NSString *STUDENT_LASTNAMES;
@property (nonatomic,strong) NSString *STUDENT_CODE;
@property (nonatomic,strong) NSString *STUDENT_GENDER;
@property (nonatomic,strong) NSString *USER_ID;
@property (nonatomic,strong) NSString *GROUP_ID;

- (void) encodeWithCoder:(NSCoder*)encoder;
- (id) initWithCoder:(NSCoder*)decoder;

@end
