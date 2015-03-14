

//
//  Calification_DTO.m
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 26/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "Calification_DTO.h"
#import "SelfPieElement.h"
#import "CustomPieView.h"
#import "PieLayer.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation Calification_DTO

@synthesize SCORE_ID;
@synthesize SCORE_ES;
@synthesize SCORE_ING;
@synthesize SCORE_MAT;
@synthesize SCORE_CIE;
@synthesize SCORE_TEC;
@synthesize SCORE_GEO;
@synthesize SCORE_AE;
@synthesize STUDENT_ID;
@synthesize USER_ID;
@synthesize SCORE_CREATED;
@synthesize SCORE_UPDATED;
@synthesize SCORE_DATE;
@synthesize SCORE_HOUR;

-(void)obtainChart:(CustomPieView*)custom_view
{
    NSArray *courses = @[@"Español",@"Ingles",
                         @"Matematica",@"Ciencias",
                         @"Tecnologica",@"Geografia",
                         @"Ambiente",@"E.Fisica",
                         @"Algo"];
    for (int i = 0 ; i < courses.count ; i++) {
        SelfPieElement *element = [SelfPieElement pieElementWithValue:5.0
                                                                color:UIColorFromRGB(0x2ecc71)];
        element.title = [NSString stringWithFormat:@"%@",[courses objectAtIndex:i]];
        [custom_view.layer addValues:@[element] animated:NO];
    }
}

@end
