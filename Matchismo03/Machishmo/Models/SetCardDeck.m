//
//  SetCardDeck.m
//  Machishmo
//
//  Created by Sumit Pandey on 30/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck


//designated initializer
-(id) init
{
    self = [super init];
    if (self) {
        //initialize a set card deck - simplest solution is the best - gives 81 cards
        for (NSString *suit in [SetCard validSuits]) {
            for (NSUInteger rank=1; rank<=[SetCard maxRank]; rank++) {
                for (NSUInteger style=0; style<[SetCard maxRank]; style++) {
                    for (NSUInteger color=0; color<[SetCard maxRank]; color++) {
                        SetCard *card = [[SetCard alloc] init];
                        card.suit = suit;
                        card.rank = rank;
                        card.color = [SetCard validColors][color];
                        card.stroke = [SetCard validStrokes][style];
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
    }
    return self;
}

@end
