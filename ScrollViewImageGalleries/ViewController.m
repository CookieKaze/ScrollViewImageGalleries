//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Erin Luu on 2016-11-14.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float imageWidth = self.view.frame.size.width;
    
    UIImageView * imageView1 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Lighthouse-in-Field"]];
    imageView1.frame = CGRectMake(0, 0, imageWidth, 300);
    imageView1.clipsToBounds = YES;
    imageView1.contentMode = UIViewContentModeScaleAspectFill;
    [self.myScrollView addSubview:imageView1];
    
    UIImageView * imageView2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Lighthouse-night"]];
    imageView2.frame = CGRectMake(imageWidth, 0, imageWidth, 300);
    imageView2.clipsToBounds = YES;
    imageView2.contentMode = UIViewContentModeScaleAspectFill;
    [self.myScrollView addSubview:imageView2];
    
    UIImageView * imageView3 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Lighthouse-zoomed"]];
    imageView3.frame = CGRectMake( imageWidth *2, 0, imageWidth, 300);
    imageView3.clipsToBounds = YES;
    imageView3.contentMode = UIViewContentModeScaleAspectFill;
    [self.myScrollView addSubview:imageView3];
    
    self.myScrollView.contentSize = CGSizeMake(imageView1.frame.size.width + imageView2.frame.size.width + imageView3.frame.size.width, 300);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
