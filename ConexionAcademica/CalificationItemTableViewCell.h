//
//  CalificationItemTableViewCell.h
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 26/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomPieView.h"

@interface CalificationItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet CustomPieView *custom_view;
@end
