//
//  Calification_DTO.h
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 26/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomPieView.h"
#import "CalificationItemTableViewCell.h"

@interface Calification_DTO : NSObject

@property (nonatomic,strong) NSString *SCORE_ID;
@property (nonatomic,strong) NSString *SCORE_ES;
@property (nonatomic,strong) NSString *SCORE_ING;
@property (nonatomic,strong) NSString *SCORE_MAT;
@property (nonatomic,strong) NSString *SCORE_CIE;
@property (nonatomic,strong) NSString *SCORE_TEC;
@property (nonatomic,strong) NSString *SCORE_GEO;
@property (nonatomic,strong) NSString *SCORE_AE;
@property (nonatomic,strong) NSString *SCORE_Ef;
@property (nonatomic,strong) NSString *SCORE_A;
@property (nonatomic,strong) NSString *STUDENT_ID;
@property (nonatomic,strong) NSString *USER_ID;
@property (nonatomic,strong) NSString *SCORE_CREATED;
@property (nonatomic,strong) NSString *SCORE_UPDATED;
@property (nonatomic,strong) NSString *SCORE_DATE;
@property (nonatomic,strong) NSString *SCORE_HOUR;

-(void)obtainChart:(CustomPieView*)custom_view;

@end
