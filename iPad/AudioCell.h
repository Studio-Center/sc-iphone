//
//  AudioCell.h
//  SCProduction
//
//  Created by Владимир Шевченко on 18.06.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Audio.h"
#import "BaseCell.h"
#import "AudioPlayer.h"

@interface AudioCell : BaseCell {
	UIButton *playButton;
	BOOL isPlaying;
	AudioPlayer *player;
	UIButton *play;
    UILabel *title;
}
@property (nonatomic, retain) UIButton *play;
@end
