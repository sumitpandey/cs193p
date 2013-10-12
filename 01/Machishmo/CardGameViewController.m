//
//  CardGameViewController.m
//  Machishmo
//
//  Created by sumit on 06/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"

@interface CardGameViewController ()
@property (nonatomic, strong) PlayingCardDeck *playingCardDeck;
@end

@implementation CardGameViewController

- (IBAction)flipCard:(UIButton *)sender {
    //lazy instantiation
    if (!_playingCardDeck) {
        _playingCardDeck = [[PlayingCardDeck alloc] init];
    }
    
    //temp variable to store card selected
    Card *randomCard = [self.playingCardDeck drawRandomCard];
    //NSLog(@"%@", randomCard.contents);
    // setting the title for the selected state
    [sender setTitle:randomCard.contents forState:UIControlStateSelected];
    //changing state of the button
    sender.selected = !sender.isSelected;
}



@end
