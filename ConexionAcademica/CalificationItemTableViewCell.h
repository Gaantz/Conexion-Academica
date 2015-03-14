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



@property (weak, nonatomic) IBOutlet UIView *uiview;
@property (weak, nonatomic) IBOutlet UILabel *espaniol;
@property (weak, nonatomic) IBOutlet UILabel *ingles;
@property (weak, nonatomic) IBOutlet UILabel *matematica;
@property (weak, nonatomic) IBOutlet UILabel *ciencias;
@property (weak, nonatomic) IBOutlet UILabel *tecnologia;
@property (weak, nonatomic) IBOutlet UILabel *geografia;
@property (weak, nonatomic) IBOutlet UILabel *ambiente;
@property (weak, nonatomic) IBOutlet UILabel *fisica;
@property (weak, nonatomic) IBOutlet UILabel *otro;
@property (weak, nonatomic) IBOutlet UILabel *promedio;
@property (weak, nonatomic) IBOutlet UILabel *fecha;
@end
