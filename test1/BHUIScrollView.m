//
//  BHUIScrollView.m
//  test1
//
//  Created by chendi on 15/8/19.
//  Copyright (c) 2015年 liupeng. All rights reserved.
//

#import "BHUIScrollView.h"

@implementation UIScrollView(BHUIScrollView)

-(void)didAddSubview:(UIView *)subview{
    
    self.panGestureRecognizer.delegate = self;
    UIResponder *re = self.nextResponder;
    while (re) {
        NSLog(@"re %@",re);
        if([re isKindOfClass:[UIViewController class]]){
            break;
        }
        re = re.nextResponder;
    }
    UIViewController *controller = (UIViewController *)re;
//    [controller.view addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionInitial context:nil];
    controller.navigationController.delegate = self;
//    UIGestureRecognizer *g2 = controller.navigationController.view.gestureRecognizers[1];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSLog(@"will show");
    self.scrollEnabled = NO;
    self.scrollEnabled = YES;
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSLog(@"did show");
    self.scrollEnabled = YES;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLog(@"%@%@",keyPath,object);
}
-(void)ongesture{
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    return YES;
}
@end
