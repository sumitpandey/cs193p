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
        //initialize a set card deck
        for (NSString *suit in [SetCard validSuits]) {
            for (NSUInteger rank=0; rank<[SetCard maxRank]; rank++) {
                SetCard *card = [[SetCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                for (NSUInteger style=0; style<[SetCard maxRank]; style++) {
                    card.color = [SetCard validColors][style];
                    card.stroke = [SetCard validStrokes][style];
                    [self addCard:card atTop:YES];
                }
            }
        }
    }
    return self;
}

@end
