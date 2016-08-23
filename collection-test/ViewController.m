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
    
    CollectionItem* itemPrototype;
    
    NSLayoutConstraint* snHeight;
}
@property (weak) IBOutlet TTCollectionView *collectView;
@end

@implementation ViewController
@synthesize listController;

- (IBAction)row1:(id)sender {
    
    for (NSInteger i= 0, ii= 30; i< ii; i++) {
        [listController addObject:@{@"header" : [NSString stringWithFormat:@"%015ld", i],
                                    @"desc" : [NSString stringWithFormat:@"%07ld", i*i]}];
    }

    [_collectView reloadData];
}

- (IBAction)row2:(id)sender {
    snHeight.constant = 200.f;
    
    [_collectView updateConstraints];
    
    // change item-prototype
    itemPrototype = [[CollectionItem alloc] initWithNibName:@"StraightCollectionItem" bundle:[NSBundle mainBundle]];
    itemPrototype.straightStyle = true;
    [_collectView setItemPrototype:itemPrototype];
    
    // reload data & layout
    CGSize itemSize = NSMakeSize(300, 100);
    [_collectView setMaxItemSize:itemSize];
    [_collectView setMinItemSize:itemSize];

    _collectView.content = @[];
    _collectView.content = listController.arrangedObjects;
    [_collectView reloadData];
}


-(void)viewWillAppear {
    [super viewWillAppear];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.wantsLayer = YES;
    
    // init array controller
    listController = [NSArrayController new];
    
    for (NSInteger i= 0, ii= 30; i< ii; i++) {
        [listController addObject:@{@"header" : [NSString stringWithFormat:@"%015ld", i],
                                    @"desc" : [NSString stringWithFormat:@"%07ld", i*i]}];
    }
    
    // strat collection view
    [_collectView registerClass:[CollectionItem class] forItemWithIdentifier:@"test"];
    itemPrototype = [[CollectionItem alloc] initWithNibName:@"CollectionItem" bundle:[NSBundle mainBundle]];
    itemPrototype.straightStyle = true;
    
    
    CGFloat width = [[_collectView enclosingScrollView] bounds].size.width;
    CGSize itemSize = NSMakeSize(width, 100);
    [_collectView setMaxItemSize:itemSize];
    [_collectView setMinItemSize:itemSize];
    
    [_collectView setItemPrototype:itemPrototype];

    // start KVC
    [listController addObserver:_collectView forKeyPath:@"content" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial context:"1"];

}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

@end
