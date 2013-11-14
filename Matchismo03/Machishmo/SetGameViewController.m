//
//  SetGameViewController.m
//  Machishmo
//
//  Created by Sumit Pandey on 30/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "CardMatchingGame.h"
#import "SetCard.h"

@interface SetGameViewController ()
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation SetGameViewController

-(CardMatchingGame *) game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                  usingDeck:[[SetCardDeck alloc] init] withGameMode:YES];
    }
    return _game;
}

-(void)updateUI
{
    //cycle through all the buttons
    for (UIButton *button in self.cardButtons) {
        //get card at the first button
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:button]];
        NSAttributedString *title = [[NSAttributedString alloc] initWithString:card.contents];
        if (!card.isFaceUp) {
            //set card background
            [button setAttributedTitle:title forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor yellowColor]];
        }else{ //otherwise the image is seen in flipped state too
            [button setImage:nil forState:UIControlStateNormal];
            [button setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
        }
        if ([card isKindOfClass:[SetCard class]]) {
            SetCard *setCard = (SetCard *)card;
            NSMutableAttributedString *mutableButtonContent = [title mutableCopy];
            NSRange stringRange = [[mutableButtonContent string] rangeOfString:card.contents];
            if (stringRange.location != NSNotFound) {
                [mutableButtonContent addAttributes:@{NSForegroundColorAttributeName : setCard.color, NSStrokeWidthAttributeName : setCard.stroke} range:stringRange];
            }
            title = mutableButtonContent;
        }
        [button setAttributedTitle:title forState:UIControlStateSelected];
        [button setAttributedTitle:title forState:UIControlStateSelected|UIControlStateDisabled];

        //select only if it is face up
        button.selected = card.isFaceUp;
        //disable the card if its unplayable
        button.enabled = !card.isUnplayable;
        button.alpha = card.isUnplayable ? 0.1 : 1.0;
    }
    //overriding and adding common functionality
    [super updateUI];
}
-(void) viewDidLoad
{
    //else the buttons dont load unless they are tapped once
    [super viewDidLoad];
    [self updateUI];
}
@end
