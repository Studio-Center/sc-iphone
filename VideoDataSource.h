//
//  VideoDataSource.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/15/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDataSource.h"
#import "VideoCell_Pad.h"

@interface VideoDataSource : BaseDataSource {
	VideoCell_Pad *videoCell;
}
@property (nonatomic, retain) IBOutlet VideoCell_Pad *videoCell;
-(void)playVideo:(Video*)video;
- (IBAction)buttonClick:(id)sender;
@end
