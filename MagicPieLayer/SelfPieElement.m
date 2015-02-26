//
//  SelfPieElement.m
//  Chart
//
//  Created by Cristian Palomino Rivera on 26/02/15.
//  Copyright (c) 2015 Cristian Palomino Rivera. All rights reserved.
//

#import "SelfPieElement.h"

@implementation SelfPieElement

- (id)copyWithZone:(NSZone *)zone
{
    SelfPieElement *selfpie = [super copyWithZone:zone];
    selfpie.title = self.title;
    return selfpie;
}

@end
