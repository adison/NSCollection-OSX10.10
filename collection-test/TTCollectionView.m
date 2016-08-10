//
//  TTCollectionView.m
//  collection-test
//
//  Created by Adison Wu on 2016/8/10.
//  Copyright © 2016年 adison. All rights reserved.
//

#import "TTCollectionView.h"

@implementation TTCollectionView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}

-(NSCollectionViewItem *)newItemForRepresentedObject:(id)object {
    id a = self.content[3];
    return [super newItemForRepresentedObject:a];
    
}
@end
