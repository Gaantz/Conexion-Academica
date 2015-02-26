//
//  MessageItemTableViewCell.h
//  ConexionAcademica
//
//  Created by Cristian Palomino Rivera on 22/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageItemTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *type;
@property (weak, nonatomic) IBOutlet UIImageView *imagetype;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *message;
@property (weak, nonatomic) IBOutlet UILabel *fecha;
@property (weak, nonatomic) IBOutlet UILabel *hora;
- (IBAction)open:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *archive;
@property (nonatomic,strong) NSString *LINK;

@end
