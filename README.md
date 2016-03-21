# UIWebviewOpenPdf
用UIWebvoew打开pdf，并响应自定义手势


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


