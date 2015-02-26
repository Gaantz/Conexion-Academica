//
//  CustomPieView.h
//  Chart
//
//  Created by Cristian Palomino Rivera on 26/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PieLayer;

@interface CustomPieView : UIView

@end

@interface CustomPieView (ex)
@property(nonatomic,readonly,retain) PieLayer *layer;
@end
