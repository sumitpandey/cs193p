//
//  CardMatchingGame.m
//  Machishmo
//
//  Created by sumit on 11/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Card.h"

@interface CardMatchingGame()
@property (nonatomic, strong) NSMutableArray *cards;
//property is readonly for other classes, but is readwrite for this class
@property (nonatomic, readwrite) int score;
@property (nonatomic, readwrite) NSString *cardInfo;
@end

@implementation CardMatchingGame

-(BOOL) gameMode
{
    if (!_gameMode) {
        //no = 2 card game
        _gameMode = NO;
    }
    return _gameMode;
}

//instantiate cards
-(NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

//designated initializer - other initializers need to call this
-(id) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self)
    {
        for (int i = 0; i<count; i++)
        {
            //we have moved the card filling logic to the model here
            Card *card = [deck drawRandomCard];
            //adding nil to NSMutableArray will crash it
            if (!card)
            {
                self = nil;
            }
            else
            {
                self.cards[i] = card;
            }
            
        }
    }
    
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    //checking for index out of bounds error
    return [self.cards count] > index ? self.cards[index] : nil;
}

-(NSString *)cardInfo
{
    if (!_cardInfo) {
        _cardInfo = [[NSString alloc] initWithFormat:@"Start the game by tapping on a card."];
    }
    
    return _cardInfo;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

-(void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    if (!card.isUnplayable)
    {
        if (!card.isFaceUp)
        {
            self.cardInfo = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            //checking to see if we have another card that is playable and faceup
            for (Card *otherCard in self.cards)
            {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    if (self.gameMode == NO) {
                        //match takes an array of cards for a multicard match game, right now we are building a 2 card matching game
                        int matchScore = [card match:@[otherCard]];
                        if (matchScore)
                        {
                            otherCard.unplayable = YES;
                            card.unplayable = YES;
                            self.score += matchScore*MATCH_BONUS;
                            self.cardInfo = [NSString stringWithFormat:@"Matched %@ & %@ for %d points", card.contents, otherCard.contents, MATCH_BONUS];
                        }
                        else
                        {
                            self.score -= MISMATCH_PENALTY;
                            self.cardInfo = [NSString stringWithFormat:@"%@ & %@ dont match! %d point penalty", card.contents, otherCard.contents, MISMATCH_PENALTY];
                        }
                    }
                    else{
                        //three card game
                        for (Card *anotherCard in self.cards) {
                            if (anotherCard != otherCard) {
                                if (anotherCard.isFaceUp && !anotherCard.isUnplayable) {
                                    int matchScore = [card match:@[otherCard, anotherCard]];
                                    if (matchScore)
                                    {
                                        anotherCard.unplayable = YES;
                                        otherCard.unplayable = YES;
                                        card.unplayable = YES;
                                        self.score += matchScore*MATCH_BONUS;
                                        self.cardInfo = [NSString stringWithFormat:@"Matched %@, %@ & %@ for %d points", card.contents, otherCard.contents, anotherCard.contents, MATCH_BONUS*2];
                                    }
                                    else
                                    {
                                        self.score -= MISMATCH_PENALTY;
                                        self.cardInfo = [NSString stringWithFormat:@"%@, %@ & %@ dont match! %d point penalty", card.contents, otherCard.contents,anotherCard.contents, MISMATCH_PENALTY];
                                    }
                                }
                            }
                        }
                    }
                    break;
                }
            }
            //cost to flip, no cost to flip back (this is why the cost is added when the card is not face up
            self.score -= FLIP_COST;
        }
        
        card.faceUp = !card.isFaceUp; //isfaceup is the getter, the setter is still faceup
    }
}

@end
