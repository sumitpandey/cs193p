//
//  Deck.h
//  Machishmo
//
//  Created by sumit on 06/10/13.
//  Copyright (c) 2013 Head Machine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void) addCard: (Card *) card atTop:(BOOL)atTop;
- (Card *) drawRandomCard;
@end
