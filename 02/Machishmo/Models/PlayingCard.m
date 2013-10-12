//
//  PlayingCard.m
//  Machishmo
//
//  Created by sumit on 06/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

//creating class methods
//This method can be invoked directly on the class (i.e. not sent to an instance). Of course, that also means it can’t use any properties. validSuits does not.
+(NSArray *) validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

+(NSArray *) rankStrings
{
    return @[@"?",@"A",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

//since maxRank is a class method, it can be use self to call other class methods.
+(NSUInteger) maxRank
{
    return ([self rankStrings].count-1);
}

//overriding the content getter from card class
-(NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    //This does not give out the rank and string in the proper card format. Gives out numerals for A, J, Q, K
    //return [NSString stringWithFormat:@"%d%@", self.rank, self.suit];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}


//safeguarding rank from being set too high and preventing arrayindex out of bounds errors
-(void)setRank:(NSUInteger)rank
{
    if (rank<=[PlayingCard maxRank]) {
        _rank = rank;
    }
}

//note that as soon as we implemented the setSuit method, (i.e. the setter and the getter for a property) the _suit (the auto synthesised variable for suit) became invalid. Now we need to manually synthesize it

@synthesize suit = _suit;

//suits setter
-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

//making the suit return ? if the suit is undefined by implementing the getter
-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

//overriding the card class' match algorithm to match for suits and rank as well.
-(int) match:(NSArray *)otherCards{
    int score = 0;
    //matching for a single card
    if (otherCards.count == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }
        else if (otherCard.rank == self.rank){
            score = 4;
        }
    }
    return score;
}
@end
