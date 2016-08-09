//
//  ViewController.m
//  collection-test
//
//  Created by Adison Wu on 2016/8/8.
//  Copyright © 2016年 adison. All rights reserved.
//

#import "ViewController.h"
#import "CollectionItem.h"

@interface ViewController() {
    
    NSArray* list;
    CollectionItem* collectItem;
}
@property (weak) IBOutlet NSCollectionView *collectView;
//@property (strong) CollectionItem* collectItem;
@end

@implementation ViewController


#pragma mark - collection view data source - required
- (NSInteger)numberOfSectionsInCollectionView:(NSCollectionView *)aCollectionView {
    NSLog(@"3");
    
    return 3;
}

- (NSInteger)collectionView:(NSCollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    NSLog(@"10");
    return 10;
}

- (NSCollectionViewItem *)collectionView:(NSCollectionView *)aCollectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)aIndexPath {
    NSLog(@"go");
    
    
    CollectionItem* item = [aCollectionView makeItemWithIdentifier:@"test" forIndexPath:aIndexPath];
    
    if (item == nil) {
        item = [[CollectionItem alloc] initWithNibName:@"CollectionItem" bundle:[NSBundle mainBundle]];
//        item.view.layer.backgroundColor = [NSColor redColor];
    }
    
//    CollectionItem* item = [CollectionItem new];
    
//    item.header.stringValue = [NSString stringWithFormat:@"%ld %ld", (long)aIndexPath.item, (long)aIndexPath.section];
//    item.desc.stringValue = @"46";
    
    NSLog(@"%@", item);
    
    return item;
}

// optional
//- (NSView *)collectionView:(NSCollectionView *)aCollectionView viewForSupplementaryElementOfKind:(NSString *)aKind atIndexPath:(NSIndexPath *)aIndexPath {
//    CollectionItem* item = [[CollectionItem alloc] initWithNibName:@"CollectiponItem" bundle:[NSBundle mainBundle]];
//    item.header.stringValue = [NSString stringWithFormat:@"%ld %ld", (long)aIndexPath.item, (long)aIndexPath.section];
//    item.desc.stringValue = @"46";
//    
//    return item;
//}


-(void)collectionLayout {
    NSCollectionViewFlowLayout* layout = [[NSCollectionViewFlowLayout alloc] init];
    layout.itemSize = NSMakeSize(150, 100);
    layout.sectionInset = NSEdgeInsetsMake(10, 5, 5, 10);
    layout.minimumInteritemSpacing = 10.f;
    layout.minimumLineSpacing = 10.0f;
    
    [_collectView setCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.wantsLayer = YES;
    [self collectionLayout];
    
    
    NSMutableArray* ll = [NSMutableArray new];
    for (NSUInteger i= 0, ii= 100; i< ii; i++) {
        [ll addObject:@{@"header" : [@(i) stringValue],
                        @"desc" : [@(i^i) stringValue] }];
    }
    list = ll;

    collectItem = [CollectionItem new];
    
    [_collectView registerClass:[CollectionItem class] forItemWithIdentifier:@"test"];
    
    [_collectView setContent:list];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    NSLog(@"represented?");
}

@end
