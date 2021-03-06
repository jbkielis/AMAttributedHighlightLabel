//
//  AMViewController.m
//  AMAttributedHighlightLabelExample
//
//  Created by Alexander Meiler on 13.01.13.
//  Copyright (c) 2013 Alexander Meiler. All rights reserved.
//

#import "AMViewController.h"

@interface AMViewController ()

@end

@implementation AMViewController

@synthesize tweetLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    tweetLabel.delegate = self;
    tweetLabel.userInteractionEnabled = YES;
    tweetLabel.numberOfLines = 0;
    tweetLabel.lineBreakMode = NSLineBreakByCharWrapping;
    tweetLabel.shouldHighlightLabel = YES;
    [tweetLabel setText:@"This #is a @test for my #@new http://AMAttributedHighlightLabel.class that includes a deeplink twitter://timeline and better hyperlink support http://www.google.com www.apple.com"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)selectedMention:(NSString *)string {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selected Mention" message:string delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}
- (void)selectedHashtag:(NSString *)string {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selected Hashtag" message:string delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}
- (void)selectedLink:(NSString *)string {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selected Link" message:string delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)selectDeepLink:(NSString *)string {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Selected Deeplink" message:string delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
