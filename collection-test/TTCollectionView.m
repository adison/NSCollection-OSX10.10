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

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    NSLog(@"keyPath = %@, change = %@, context = %s", keyPath, change, (char *)context);
    NSLog(@"relaod");
    [self reloadData];
}

-(NSCollectionViewItem *)newItemForRepresentedObject:(id)object {
    id newItem = [[self itemPrototype] copy];
    [newItem setRepresentedObject:object];
    
    return newItem;
}

@end
