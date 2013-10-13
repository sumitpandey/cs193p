//
//  PlayingCardDeck.m
//  Machishmo
//
//  Created by sumit on 06/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck
//The return type id here means “object of any (unknown) class.” All initializers return this type.
//PlayingCardDeck inherits its initializer from Deck which inherits it from NSObject
-(id) init
{
    //Sending a message to super is just like sending to self except that we start with our superclass’s implementation first (i.e. not our own).
    //The first thing we do in an initializer (we are allowed to have multiple initializers, each with different arguments) is call our class’s “designated initializer” (unless the method we are implementing IS our class’s designated initializer, in which case we call our superclass's "designated initializer".
    self = [super init];
    
    
    //We check to see if our designated initializer returned nil because, if it does, this object cannot be initialized and we should return nil to indicate that.
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank =1; rank<=[PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                //inherited method from deck, adding card to self's deck
                [self addCard:card atTop:YES];
            }
        }
    }
    return self;
}
@end
