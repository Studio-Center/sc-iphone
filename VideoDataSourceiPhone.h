//
//  VideoDataSourceiPhone.h
//  SCProduction
//
//  Created by Sergey Zenchenko on 7/15/10.
//  Copyright 2010 JAMG. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VideoDataSource.h"

@interface VideoDataSourceiPhone : VideoDataSource {
	UITableViewCell *custormCell;
}
@property (nonatomic, retain) IBOutlet UITableViewCell *custormCell;
@end
