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
    
    NSArrayController* listController;
    
    CollectionItem* itemPrototype;
}
@property (weak) IBOutlet TTCollectionView *collectView;
@property (nonatomic) NSArray* list;
@end

@implementation ViewController
@synthesize list;

- (IBAction)row1:(id)sender {
    itemPrototype = [[CollectionItem alloc] initWithNibName:@"CollectionItem" bundle:[NSBundle mainBundle]];
    itemPrototype.straightStyle = false;
    [_collectView setItemPrototype:itemPrototype];
    [_collectView reloadData];
    
}

- (IBAction)row2:(id)sender {
    itemPrototype = [[CollectionItem alloc] initWithNibName:@"StraightCollectionItem" bundle:[NSBundle mainBundle]];
    itemPrototype.straightStyle = true;
    [_collectView setItemPrototype:itemPrototype];
    [_collectView reloadData];
}

- (void)viewDidLoad {
    NSMutableArray* ll = [NSMutableArray new];
    listController = [NSArrayController new];
    
    for (NSInteger i= 0, ii= 30; i< ii; i++) {
        [listController addObject:@{@"header" : [NSString stringWithFormat:@"%015ld", i],
                                    @"desc" : [NSString stringWithFormat:@"%07ld", i*i]}];
        [ll addObject:@{@"header" : [NSString stringWithFormat:@"%015ld", i],
                        @"desc" : [NSString stringWithFormat:@"%07ld", i*i]}];
    }
    list = ll;

    [super viewDidLoad];
    self.view.wantsLayer = YES;
    
    [_collectView registerClass:[CollectionItem class] forItemWithIdentifier:@"test"];
    [_collectView setContent:listController.arrangedObjects];
    itemPrototype = [[CollectionItem alloc] initWithNibName:@"CollectionItem" bundle:[NSBundle mainBundle]];
    itemPrototype.straightStyle = true;
    
    [_collectView setItemPrototype:itemPrototype];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

@end
