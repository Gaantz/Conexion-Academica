//
//  Message_DTO.h
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 20/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message_DTO : NSObject <NSCoding>

@property (nonatomic,strong) NSString *MESSAGE_CONTENT;
@property (nonatomic,strong) NSString *MESSAGE_DATE;
@property (nonatomic,strong) NSString *MESSAGE_EXT;
@property (nonatomic,strong) NSString *MESSAGE_ID;
@property (nonatomic,strong) NSString *MESSAGE_SUBJECT;
@property (nonatomic,strong) NSString *MESSAGE_HOUR;
@property (nonatomic,strong) NSString *MESSAGE_URL;
@property (nonatomic,strong) NSString *STUDENTS_ID;
@property (nonatomic,strong) NSString *TYPE_ID;
@property (nonatomic,strong) NSString *TYPE_NAME;
@property (nonatomic,strong) NSString *USER_ID;

- (void) encodeWithCoder:(NSCoder*)encoder;
- (id) initWithCoder:(NSCoder*)decoder;

@end
