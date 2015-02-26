//
//  CalificationItemTableViewCell.m
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 26/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "CalificationItemTableViewCell.h"
#import "MagicPieLayer.h"
#import "SelfPieElement.h"
#import "CustomPieView.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation CalificationItemTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    /*
    for (int i = 0 ; i < 10 ; i++) {
        SelfPieElement *element = [SelfPieElement pieElementWithValue:5.0 color:UIColorFromRGB(0x2ecc71)];
        element.title = [NSString stringWithFormat:@"%d",i];
        [_custom_chart.layer addValues:@[element] animated:NO];
    }
    _custom_chart.layer.showTitles = ShowTitlesAlways;
     */
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
