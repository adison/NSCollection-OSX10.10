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
    CollectionItem* d = [[self itemPrototype] copy];
    [d setRepresentedObject:object];
    
    return d;
}


@end
