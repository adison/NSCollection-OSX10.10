//
//  TTCollectionView.m
//  collection-test
//
//  Created by Adison Wu on 2016/8/10.
//  Copyright © 2016年 adison. All rights reserved.
//

#import "TTCollectionView.h"
#import "CollectionItem.h"

@implementation TTCollectionView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
}

-(NSCollectionViewItem *)newItemForRepresentedObject:(id)object {
    CollectionItem* d = [[self itemPrototype] copy];
    
    id a = self.content[3];
    
     [d setRepresentedObject:a];
    return d;
}


@end
