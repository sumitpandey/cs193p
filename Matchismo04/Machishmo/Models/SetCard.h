//
//  SetCard.h
//  Machishmo
//
//  Created by Sumit Pandey on 30/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;
@property (nonatomic, strong) NSNumber *stroke;
@property (nonatomic, strong) UIColor *color;

+(NSArray *) validColors;
+(NSArray *) validStrokes;
+(NSArray *) validSuits;
+(NSUInteger) maxRank;
@end
