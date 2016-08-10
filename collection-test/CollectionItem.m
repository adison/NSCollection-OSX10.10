//
//  CollectionItem.m
//  collection-test
//
//  Created by Adison Wu on 2016/8/8.
//  Copyright © 2016年 adison. All rights reserved.
//

#import "CollectionItem.h"
#import <QuartzCore/QuartzCore.h>

@interface CollectionItem ()

@end

@implementation CollectionItem
@synthesize header, desc,kk;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.wantsLayer = YES;
    
    
//    self.view.layer.backgroundColor = [NSColor blueColor];
    // Do view setup here.
}

- (void)drawRect:(NSRect)rect
{
        //[[NSColor redColor] setFill];
        //NSRectFill(rect);
        //[super drawRect:rect];
        
//        NSColor* gS = [NSColor colorWithCalibratedRed:0.06 green:0.45 blue:0.86 alpha:1.0];
//        NSColor* gE = [NSColor colorWithCalibratedRed:0.12 green:0.64 blue:0.94 alpha:1.0];
//        NSGradient* g = [[NSGradient alloc] initWithStartingColor:gE endingColor:gS];
//        NSColor *borderColor = [NSColor colorFromGradient:g];
    
    NSRect frameRect = rect;
    
        if(rect.size.height < frameRect.size.height)
            return;
        NSRect newRect = NSMakeRect(rect.origin.x+5, rect.origin.y+5, rect.size.width-10, rect.size.height-10);
        
        NSBezierPath *textViewSurround = [NSBezierPath bezierPathWithRoundedRect:newRect xRadius:7 yRadius:7];
        [textViewSurround setLineWidth:2.0];
//        [borderColor set];
//        [textViewSurround stroke];
//    }
}


-(void)setRepresentedObject:(id)representedObject{
    [super setRepresentedObject:representedObject];
    if (representedObject !=nil)
    {
        representedObject = [kk objectAtIndex:3];
        header.stringValue = [representedObject valueForKey:@"header"];
        desc.stringValue = [representedObject valueForKey:@"desc"];
        
    }

}
@end
