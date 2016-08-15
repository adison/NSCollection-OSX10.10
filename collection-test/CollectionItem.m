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
@synthesize header, desc, straightStyle;

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

-(void)viewWillAppear {
    [self setRepresentedObject:self.representedObject];
    [super viewWillAppear];
}


-(void)setRepresentedObject:(id)representedObject{
    [super setRepresentedObject:representedObject];
    if (representedObject ==nil) {
        representedObject = @{@"header": @"hh",
                              @"desc" : @"desc"};
    }
    header.stringValue = [representedObject valueForKey:@"header"];
    desc.stringValue = [representedObject valueForKey:@"desc"];
}

-(id)copy {
    if (straightStyle) {
        id copy = [[CollectionItem alloc]initWithNibName:@"StraightCollectionItem" bundle:[NSBundle mainBundle]];
        return copy;
    }
    id copy = [[CollectionItem alloc]initWithNibName:@"CollectionItem" bundle:[NSBundle mainBundle]];
    
    return copy;
}
@end
