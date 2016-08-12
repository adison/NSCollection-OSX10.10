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
}
@property (weak) IBOutlet TTCollectionView *collectView;
@property (nonatomic) NSArray* list;
@end

@implementation ViewController
@synthesize list;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.wantsLayer = YES;
    
    NSMutableArray* ll = [NSMutableArray new];
    listController = [NSArrayController new];
    
    for (NSInteger i= 0, ii= 30; i< ii; i++) {
        [listController addObject:@{@"header" : [NSString stringWithFormat:@"%015ld", i],
                        @"desc" : [NSString stringWithFormat:@"%07ld", i*i]}];
        [ll addObject:@{@"header" : [NSString stringWithFormat:@"%015ld", i],
                                    @"desc" : [NSString stringWithFormat:@"%07ld", i*i]}];

    }
    list = ll;
    
    [_collectView registerClass:[CollectionItem class] forItemWithIdentifier:@"test"];
    [_collectView setContent:listController.arrangedObjects];
    
    [_collectView setItemPrototype:[[CollectionItem alloc] initWithNibName:@"CollectionItem" bundle:[NSBundle mainBundle]]];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
}

@end
