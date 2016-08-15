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
    
    NSLayoutConstraint* snHeight;
}
@property (weak) IBOutlet TTCollectionView *collectView;
@property (nonatomic) NSArray* list;
@end

@implementation ViewController
@synthesize list;

- (IBAction)row1:(id)sender {
    snHeight.constant = 300.f;
    [_collectView updateConstraints];
    itemPrototype = [[CollectionItem alloc] initWithNibName:@"CollectionItem" bundle:[NSBundle mainBundle]];
    itemPrototype.straightStyle = false;
    [_collectView setItemPrototype:itemPrototype];
    
//    CGFloat width = [[_collectView enclosingScrollView] bounds].size.width;
    CGSize itemSize = NSMakeSize(200, 100);
    [_collectView setMaxItemSize:itemSize];
    [_collectView setMinItemSize:itemSize];
    [_collectView reloadData];
}

- (IBAction)row2:(id)sender {
    snHeight.constant = 200.f;
    
    [_collectView updateConstraints];
    itemPrototype = [[CollectionItem alloc] initWithNibName:@"StraightCollectionItem" bundle:[NSBundle mainBundle]];
    itemPrototype.straightStyle = true;
    [_collectView setItemPrototype:itemPrototype];
    
//    CGFloat width = [[_collectView enclosingScrollView] bounds].size.width;
    CGSize itemSize = NSMakeSize(300, 100);
    [_collectView setMaxItemSize:itemSize];
    [_collectView setMinItemSize:itemSize];

    [_collectView reloadData];
}


-(void)viewWillAppear {
    [super viewWillAppear];
    
    for (NSLayoutConstraint *con in [[[_collectView superview] superview] constraints]) {
        if ([[con identifier] isEqualToString:@"snHeight"]) {
            snHeight = con;
        }
    }
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
    
    
    CGFloat width = [[_collectView enclosingScrollView] bounds].size.width;
    CGSize itemSize = NSMakeSize(width, 100);
    [_collectView setMaxItemSize:itemSize];
    [_collectView setMinItemSize:itemSize];
    
    [_collectView setItemPrototype:itemPrototype];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

@end
