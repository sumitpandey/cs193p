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
    return @[@"◻︎", @"○", @"△"];
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
    NSString *content = @"";
    for (int i = 0; i<=self.rank; i++) {
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

@end
