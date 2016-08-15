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

-(NSCollectionViewItem *)newItemForRepresentedObject:(id)object {
    id newItem = [[self itemPrototype] copy];
    [newItem setRepresentedObject:object];
    
    return newItem;
}

@end
