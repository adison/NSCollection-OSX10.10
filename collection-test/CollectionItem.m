//
//  CollectionItem.m
//  collection-test
//
//  Created by Adison Wu on 2016/8/8.
//  Copyright © 2016年 adison. All rights reserved.
//

#import "CollectionItem.h"
#import <QuartzCore/QuartzCore.h>

@interface CollectionItem ()

@end

@implementation CollectionItem
@synthesize header, desc;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    header.stringValue = @"33";
    desc.stringValue = @"2342";

}

-(void)setRepresentedObject:(id)representedObject{
    [super setRepresentedObject:representedObject];
    if (representedObject ==nil)
    {
        representedObject = @{@"header": @"hh",
                              @"desc" : @"desc"};
        
    }
    header.stringValue = @"33";
    desc.stringValue = @"2342";
//    NSLog(@"%@", self);
    header.stringValue = [representedObject valueForKey:@"header"];
    desc.stringValue = [representedObject valueForKey:@"desc"];

}

-(void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awakeFromNib");
}

@end
