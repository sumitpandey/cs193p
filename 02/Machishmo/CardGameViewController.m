//
//  CardGameViewController.m
//  Machishmo
//
//  Created by sumit on 06/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"


@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@end

@implementation CardGameViewController


-(CardMatchingGame *) game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                  usingDeck:[[PlayingCardDeck alloc] init]];
    }
    return _game;
}

-(void)updateUI
{
    //cycle through all the buttons
    for (UIButton *button in self.cardButtons) {
        //get card at the first button
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
        [button setTitle:card.contents forState:UIControlStateSelected];
        [button setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        
        //select only if it is face up
        button.selected = card.isFaceUp;
        //disable the card if its unplayable
        button.enabled = !card.isUnplayable;
        //make the disabled buttons slightly transparent
        button.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.infoLabel.text = [NSString stringWithFormat:@""];
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
    //setting is not happening everytime we are flipping, since we abstracted the method away, so everytime we get the same card.
    //changing state of the button
    //sender.selected = !sender.isSelected;
}



@end
