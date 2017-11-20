//
//  ViewController.m
//  W4D1 - iPhone Images
//
//  Created by Murat Ekrem Kolcalar on 11/20/17.
//  Copyright © 2017 murtilicious. All rights reserved.
//

#import "ViewController.h"
#define url1 @"https://imgur.com/zdwdenZ.png"
#define url2 @"https://imgur.com/bktnImE.png"
#define url3 @"https://imgur.com/CoQ8aNl.png"
#define url4 @"https://imgur.com/2vQtZBb.png"
#define url5 @"https://imgur.com/y9MIaCS.png"

@interface ViewController ()

@property (nonatomic) NSURLSession *mySession;
@property (nonatomic) NSString *myPath;
@property (nonatomic) NSData *myData;

@property (nonatomic) NSArray *imageArray;
@property (weak, nonatomic) IBOutlet UIImageView *fullImage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.imageArray = @[url1, url2, url3, url4, url5];
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.mySession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDownloadTask *imageTask = [self.mySession downloadTaskWithURL:[NSURL URLWithString:url1]];
    [imageTask resume];
    
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
didFinishDownloadingToURL:(NSURL *)location {
    
    self.myPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:url1];
    
    self.myData = [NSData dataWithContentsOfURL:location];
    UIImage *image = [UIImage imageWithData:self.myData];

    self.fullImage.image = image;
}


@end
