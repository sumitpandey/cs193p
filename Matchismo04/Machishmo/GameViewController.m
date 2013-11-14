//
//  GameViewController.m
//  Machishmo
//
//  Created by Sumit Pandey on 11/11/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import "GameViewController.h"
#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface GameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation GameViewController



-(void)updateUI
{

}

-(void) setCardButtons:(NSArray *)cardButtons
{
    //first do the setter stuff
    _cardButtons = cardButtons;
    //if the card buttons change the UI needs to update itself
    [self updateUI];
}

- (IBAction)flipCard:(UIButton *)sender {
    //letting the model flip the card
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
}
- (IBAction)resetGame:(UIButton *)sender {
    //reset game
    self.game = nil;
    [self updateUI];
    //NSLog(@"Game Mode %@\n", (self.game.gameMode?@"YES":@"NO"));
}



@end
