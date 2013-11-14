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

@interface SetGameViewController ()
@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardArray;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@end

@implementation SetGameViewController

-(CardMatchingGame *) game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardArray.count
                                                  usingDeck:[[SetCardDeck alloc] init] withGameMode:YES];
    }
    return _game;
}



@end
