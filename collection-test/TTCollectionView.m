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
    if ([object isKindOfClass:[NSArrayController class]]) {
        self.content = [(NSArrayController*)object arrangedObjects];
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        NSLog(@"keyPath = %@, change = %@, context = %s", keyPath, change, (char *)context);
    }
    NSLog(@">>>>>>>>>>>>>>>> relaod");
}

-(NSCollectionViewItem *)newItemForRepresentedObject:(id)object {
//    id newItem = [[self itemPrototype] copy];
    id newItem = [super newItemForRepresentedObject:object];
    
//    [newItem setRepresentedObject:object];

//    [newItem bind:@"header" toObject:object withKeyPath:@"strHeader" options:nil];
//    [newItem bind:@"desc" toObject:object withKeyPath:@"strDesc" options:nil];
    
    return newItem;
}

@end
