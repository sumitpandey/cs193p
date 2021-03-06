//
//  SetCard.m
//  Machishmo
//
//  Created by Sumit Pandey on 30/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

+(NSArray *) validSuits
{
    return @[@"■", @"●", @"▲"];
}

+(NSArray *) validColors
{
    return @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]];
}

+(NSArray *) validStrokes
{
    return @[@-5, @0, @5];
}

+(NSUInteger) maxRank
{
    return 3;
}

-(NSString *)contents
{
    //initialize this, string by appending string causes problems with nil
    NSString *content = @"";
    for (int i = 1; i<=self.rank; i++) {
        content = [content stringByAppendingString:self.suit];
    }
    return content;
}


-(void)setRank:(NSUInteger)rank
{
    if (rank <= [SetCard maxRank]) {
        _rank = rank;
    }
}

@synthesize stroke = _stroke;

-(void) setStroke:(NSNumber *)stroke
{
    if ([[SetCard validStrokes] containsObject:stroke]) {
        _stroke = stroke;
    }
}

-(NSNumber *) stroke
{
    return _stroke ? _stroke : nil;
}

@synthesize color = _color;

-(void)setColor:(UIColor *)color
{
    if ([[SetCard validColors] containsObject:color]) {
        _color = color;
    }
}

-(UIColor *)color
{
    return _color ? _color : nil;
}

@synthesize suit = _suit;

-(NSString *) suit
{
    return _suit ? _suit : @"";
}

-(void) setSuit:(NSString *)suit
{
    if ([[SetCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(int) match:(NSArray *)otherCards
{
    //matching in set is only dependent on color and stroke
    //cases: same suit, rank, color, stroke/different suit, rank, color, stroke
    int score = 0;
    int matchColor = 0;
    int matchStroke = 0;
    int matchSuit = 0;
    int matchRank = 0;
    
    if(otherCards.count == 2){
        for (SetCard *otherCard in otherCards) {
            if ([otherCard.suit isEqualToString:self.suit]) {
                matchSuit++;
            }
            if (otherCard.rank == self.rank) {
                matchRank++;
            }
            if ([otherCard.color isEqual:self.color]) {
                matchColor++;
            }
            if ([otherCard.stroke isEqualToNumber:self.stroke]) {
                matchStroke++;
            }
        }
        if (((matchSuit == 2)||(matchSuit == 0))&&((matchStroke == 2)||(matchStroke == 0))&&((matchRank == 2)||(matchRank == 0))&&((matchColor == 2)||(matchColor == 0))) {
            score = 4;
        }
    }
    return score;
}

@end
