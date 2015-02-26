//
//  SeguimientoItemTableViewCell.h
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 24/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SeguimientoItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *month;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UIImageView *image_evaluacion;
@property (weak, nonatomic) IBOutlet UIImageView *image_material;
@property (weak, nonatomic) IBOutlet UIImageView *image_trabajo;
@property (weak, nonatomic) IBOutlet UIImageView *image_proyecto;
@property (weak, nonatomic) IBOutlet UIImageView *image_actitud;
@property (weak, nonatomic) IBOutlet UIImageView *image_indisciplina;
@end
