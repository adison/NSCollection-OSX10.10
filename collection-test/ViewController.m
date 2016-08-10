//
//  ViewController.m
//  collection-test
//
//  Created by Adison Wu on 2016/8/8.
//  Copyright © 2016年 adison. All rights reserved.
//

#import "ViewController.h"
#import "CollectionItem.h"
#import "TTCollectionView.h"

@interface ViewController() {
    
    CollectionItem* collectItem;
    NSArrayController* listController;
}
@property (weak) IBOutlet TTCollectionView *collectView;
//@property (strong) CollectionItem* collectItem;
@end

@implementation ViewController
@synthesize list;

//- (NSCollectionViewItem *)collectionView:(NSCollectionView *)aCollectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)aIndexPath {
//    [aCollectionView deq]
//    
//    CollectionItem* item = [aCollectionView makeItemWithIdentifier:@"test" forIndexPath:aIndexPath];
//    
//    if (item == nil) {
//        item = [[CollectionItem alloc] initWithNibName:@"CollectionItem" bundle:[NSBundle mainBundle]];
////        item.view.layer.backgroundColor = [NSColor redColor];
//    }
//    
//    
////    item.header.stringValue = [(NSDictionary*)list[aIndexPath.section * 24 + aIndexPath.item] objectForKey:@"header"];
////    item.desc.stringValue = [(NSDictionary*)list[aIndexPath.section * 24 + aIndexPath.item] objectForKey:@"desc"];
//    
//    
//    return item;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.wantsLayer = YES;
    
    NSMutableArray* ll = [NSMutableArray new];
    listController = [NSArrayController new];
    
    for (NSInteger i= 0, ii= 100; i< ii; i++) {
        [listController addObject:@{@"header" : [NSString stringWithFormat:@"%015ld", i],
                        @"desc" : [NSString stringWithFormat:@"%07ld", i*i]}];
        [ll addObject:@{@"header" : [NSString stringWithFormat:@"%015ld", i],
                                    @"desc" : [NSString stringWithFormat:@"%07ld", i*i]}];

    }
    list = ll;
    collectItem = [[CollectionItem alloc] initWithNibName:@"CollectionItem" bundle:[NSBundle mainBundle]];
    
//    collectItem.header.stringValue = @"hh";

//    collectItem.kk = ll;
//    collectItem = [[CollectionItem alloc] initWithNibName:@"CollectionItem" bundle:[NSBundle mainBundle]];
//    [_collectView setItemPrototype:[self.storyboard instantiateControllerWithIdentifier:@"tt"]];
    [_collectView setItemPrototype:[[CollectionItem alloc] initWithNibName:@"CollectionItem" bundle:[NSBundle mainBundle]]];

    [_collectView bind:NSContentBinding toObject:self withKeyPath:@"list" options:NULL];
    [_collectView setContent:listController.arrangedObjects];
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    NSLog(@"represented?");
}

@end
