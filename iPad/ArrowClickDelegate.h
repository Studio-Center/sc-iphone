//
//  ArrowClickDelegate.h
//  SCProduction
//
//  Created by Владимир Шевченко on 07.07.10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol ArrowClickDelegate

- (IBAction)didClickRightArrow:(id)sender;
- (IBAction)didClickLeftArrow:(id)sender;

@end