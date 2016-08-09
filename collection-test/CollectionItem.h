//
//  CollectionItem.h
//  collection-test
//
//  Created by Adison Wu on 2016/8/8.
//  Copyright © 2016年 adison. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface CollectionItem : NSCollectionViewItem
@property (nonatomic) IBOutlet NSTextField *header;
@property (nonatomic) IBOutlet NSTextField *desc;

@end
