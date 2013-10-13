//
//  CardMatchingGame.h
//  Machishmo
//
//  Created by sumit on 11/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
//match amongst a set of cards from a given deck
//designated initializer
-(id) initWithCardCount: (NSUInteger) count usingDeck:(Deck *) deck;

//flip card logic shifted to model
-(void) flipCardAtIndex: (NSUInteger) index;
//fetch a card at a given location - needed to do card matching
-(Card *) cardAtIndex: (NSUInteger) index;

@property (nonatomic, readonly) int score;
@property (nonatomic, readonly, strong) NSString *cardInfo;
@property (nonatomic) BOOL gameMode;

@end
