//
//  ViewController.m
//  ScrollViewImageGalleries
//
//  Created by Erin Luu on 2016-11-14.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property UIImageView * imageView1;
@property UIImageView * imageView2;
@property UIImageView * imageView3;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float imageWidth = self.view.frame.size.width;
    
    self.imageView1 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Lighthouse-in-Field"]];
    self.imageView1.frame = CGRectMake(0, 0, imageWidth, 300);
    self.imageView1.clipsToBounds = YES;
    self.imageView1.contentMode = UIViewContentModeScaleAspectFill;
    [self.myScrollView addSubview:self.imageView1];
    
    
    self.imageView2 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Lighthouse-night"]];
    self.imageView2.frame = CGRectMake(imageWidth, 0, imageWidth, 300);
    self.imageView2.clipsToBounds = YES;
    self.imageView2.contentMode = UIViewContentModeScaleAspectFill;
    [self.myScrollView addSubview:self.imageView2];
    
    self.imageView3 = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"Lighthouse-zoomed"]];
    self.imageView3.frame = CGRectMake( imageWidth *2, 0, imageWidth, 300);
    self.imageView3.clipsToBounds = YES;
    self.imageView3.contentMode = UIViewContentModeScaleAspectFill;
    [self.myScrollView addSubview:self.imageView3];
    
    self.myScrollView.contentSize = CGSizeMake(self.imageView1.frame.size.width + self.imageView2.frame.size.width + self.imageView3.frame.size.width, 300);
}

- (IBAction)onTapGesture:(UITapGestureRecognizer *)sender {
    NSLog(@"%@", NSStringFromCGPoint([sender locationInView:self.myScrollView]));
    
    CGPoint tapLocation = [sender locationInView: self.myScrollView];
    if ((tapLocation.y <= 300) && (tapLocation.x <= self.view.frame.size.width)) {
        [super performSegueWithIdentifier:@"toZoomView" sender:[UIImage imageNamed:@"Lighthouse-in-Field"]];
    } else if ((tapLocation.y <= 300) && (tapLocation.x > self.view.frame.size.width) && (tapLocation.x <= self.view.frame.size.width * 2)) {
        [super performSegueWithIdentifier:@"toZoomView" sender:[UIImage imageNamed:@"Lighthouse-night"]];
    } else if ((tapLocation.y <= 300) && (tapLocation.x > self.view.frame.size.width*2) && (tapLocation.x <= self.view.frame.size.width * 3)) {
        [super performSegueWithIdentifier:@"toZoomView" sender:[UIImage imageNamed:@"Lighthouse-zoomed"]];
    }
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIImage*)sender {
    SecondViewController *secondVC = (SecondViewController*) segue.destinationViewController;
    secondVC.mainImage = sender;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float xOffset = scrollView.contentOffset.x;
    
    if (xOffset == 0) {
        self.pageControl.currentPage = 0;
    } else if ((xOffset >= self.view.frame.size.width) && (xOffset < self.view.frame.size.width * 2)) {
        self.pageControl.currentPage = 1;
    } else if ((xOffset >= self.view.frame.size.width * 2) && (xOffset < self.view.frame.size.width * 3)) {
        self.pageControl.currentPage = 2;
    }
    NSLog(@"%f", scrollView.contentOffset.x);
    NSLog(@"%d", self.pageControl.currentPage);
}

@end
