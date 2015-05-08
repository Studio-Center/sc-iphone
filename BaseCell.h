//
//  BaseCell.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/14/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stuff.h"

@interface BaseCell : UITableViewCell {
	Stuff *stuff;
	id delegate;
	BOOL allowFavorite;
	UIButton *favButton;
}
@property (assign) BOOL allowFavorite;
@property (nonatomic, retain) id delegate;
@property (nonatomic, retain) Stuff *stuff;
@property (nonatomic, retain) UIButton *favButton;
- (id) initWithStuff:(Stuff*)aStuff delegate:(id)aDelegate;
- (void) setup;
- (void) setupFavoriteButton;
- (void) favorite;
- (void) setupFavoriteButton;
- (NSInteger) indentationLevel;
- (void)select;
@end
