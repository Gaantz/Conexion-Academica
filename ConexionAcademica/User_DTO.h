//
//  User_DTO.h
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 9/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User_DTO : NSObject

@property (nonatomic,strong) NSString *USER_ID;
@property (nonatomic,strong) NSString *USER_NAMES;
@property (nonatomic,strong) NSString *USER_LASTNAMES;
@property (nonatomic,strong) NSString *USER_EMAIL;
@property (nonatomic,strong) NSString *ROLE_ID;

@end
