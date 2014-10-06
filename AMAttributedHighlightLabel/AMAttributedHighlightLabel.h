//
//  UIAttributedHIghlightLabel.h
//  UIAttributedHighlightLabelExample
//
//  Created by Alexander Meiler on 04.01.13.
//  Copyright (c) 2013 Alexander Meiler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

@protocol AMAttributedHighlightLabelDelegate

@optional
- (void)selectedMention:(NSString *)userId;
- (void)selectedHashtag:(NSString *)string;
- (void)selectedLink:(NSString *)string;
- (void)selectedDetectedWord:(NSString *)string;
@end

@interface AMAttributedHighlightLabel : UILabel

@property(strong,nonatomic) UIColor *linkTextColor;
@property(strong,nonatomic) UIColor *selectedLinkTextColor;

@property(nonatomic, strong) NSArray *detectWords;
@property(nonatomic) BOOL shouldHighlightLabel;

@property (nonatomic, weak) id <AMAttributedHighlightLabelDelegate> delegate;

@end
