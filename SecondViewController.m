//
//  SecondViewController.m
//  ScrollViewImageGalleries
//
//  Created by Erin Luu on 2016-11-14.
//  Copyright © 2016 Erin Luu. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *myScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myScrollView.minimumZoomScale = 0.1;
    self.myScrollView.maximumZoomScale = 5;
    self.imageView.image = self.mainImage;
    
}

- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    float heightPadding = (self.myScrollView.frame.size.height + self.imageView.frame.size.height) + 2 ;
    float widthPadding = (self.myScrollView.frame.size.width + self.imageView.frame.size.width) + 2 ;
    self.myScrollView.contentInset= UIEdgeInsetsMake(heightPadding, widthPadding, heightPadding, widthPadding);
}

@end
