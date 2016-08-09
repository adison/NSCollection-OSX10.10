//
//  CollectionItem.m
//  collection-test
//
//  Created by Adison Wu on 2016/8/8.
//  Copyright © 2016年 adison. All rights reserved.
//

#import "CollectionItem.h"

@interface CollectionItem ()

@end

@implementation CollectionItem
@synthesize header, desc;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.wantsLayer = YES;
    
//    self.view.layer.backgroundColor = [NSColor blueColor];
    // Do view setup here.
}

-(void)setRepresentedObject:(id)representedObject{
    [super setRepresentedObject:representedObject];
    if (representedObject !=nil)
    {
        header.stringValue = [representedObject valueForKey:@"header"];
        desc.stringValue = [representedObject valueForKey:@"desc"];
        
    }

}
@end
