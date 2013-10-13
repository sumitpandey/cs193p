//
//  Card.m
//  Machishmo
//
//  Created by sumit on 06/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards
{
    int score = 0;
    
    for (Card *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    for (int i=0; i<otherCards.count; i++) {
        Card *card = otherCards[i];
        
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }

    }
    

    return score;
}

@end
