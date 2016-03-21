//
//  ViewController.m
//  web
//
//  Created by liuyugui on 16/3/21.
//  Copyright © 2016年 刘玉贵. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate,UIScrollViewDelegate>
{
    UIWebView * _webView;

}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView * webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _webView = webView;
    [self.view addSubview:webView];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test.pdf" ofType:nil];
    
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    
    
    //支持缩放
    webView.scalesPageToFit = YES;
    
    //添加长按手势
    UILongPressGestureRecognizer *longtapGesture = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longClik:)];
    longtapGesture.delegate = self;
    longtapGesture.minimumPressDuration = 0.2;
    [_webView addGestureRecognizer:longtapGesture];
    
    
}


//废除放大效果
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    
    return NO;
}

//长按调用的手势
- (void)longClik:(UILongPressGestureRecognizer *)longPressGesture{

    // 如果是手势开始的状态才执行
    if (longPressGesture.state==UIGestureRecognizerStateBegan) {
        
        
        CGPoint p = [(UILongPressGestureRecognizer *)longPressGesture locationInView:_webView.scrollView];
        
        NSLog(@"当前点击位置x%f y%f",p.x,p.y);
        
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
