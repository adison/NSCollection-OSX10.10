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

    // change content
    NSArray* a= [listController.arrangedObjects copy];

//    for (NSUInteger i= a.count, ii = 0; i > ii; i--) {
//        [listController removeObjectAtArrangedObjectIndex:i-1];
//    }

//    for (NSUInteger i= 0, ii= a.count; i< ii; i++) {
//        NSMutableDictionary* dic = [NSMutableDictionary dictionaryWithDictionary:a[i]];
//        [dic setObject:@"31" forKey:@"header"];
//        [listController addObject:dic];
//    }
    [listController addObject:@{@"header" : @"new-header",
                                @"desc" : @"hello world"}];
//    _collectView.content = listController.arrangedObjects;
}

- (IBAction)row2:(id)sender {
    // change layout
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

    _collectView.content = listController.arrangedObjects;
}


-(void)viewWillAppear {
    [super viewWillAppear];
    _collectView.content = listController.arrangedObjects;
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
    
    CGFloat width = [[_collectView enclosingScrollView] bounds].size.width;
    CGSize itemSize = NSMakeSize(width, 100);
    [_collectView setMaxItemSize:itemSize];
    [_collectView setMinItemSize:itemSize];
    
    itemPrototype = [[CollectionItem alloc] initWithNibName:@"CollectionItem" bundle:[NSBundle mainBundle]];
    itemPrototype.straightStyle = true;
    
    [_collectView setItemPrototype:itemPrototype];

    // start KVC
    [_collectView bind:NSContentBinding toObject:self withKeyPath:@"self.listController.arrangedObjects" options:NULL];

    [listController addObserver:_collectView forKeyPath:@"arrangedObjects" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial context:"1"];
    
    // strat collection view
    [_collectView registerClass:[CollectionItem class] forItemWithIdentifier:@"test"];
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

@end
