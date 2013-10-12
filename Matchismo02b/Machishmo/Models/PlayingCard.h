//
//  PlayingCard.h
//  Machishmo
//
//  Created by sumit on 06/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property (nonatomic, strong) NSString *suit;
@property (nonatomic) NSUInteger rank;

+(NSArray *) validSuits;
+(NSUInteger) maxRank;

@end
