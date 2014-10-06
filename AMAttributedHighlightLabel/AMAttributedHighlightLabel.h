//
//  UIAttributedHIghlightLabel.h
//  UIAttributedHighlightLabelExample
//
//  Created by Alexander Meiler on 04.01.13.
//  Copyright (c) 2013 Alexander Meiler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreText/CoreText.h>

#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@protocol AMAttributedHighlightLabelDelegate

@optional
- (void)selectedMention:(NSString *)userId;
- (void)selectedHashtag:(NSString *)string;
- (void)selectedLink:(NSString *)string;
- (void)selectedDetectedWord:(NSString *)string;
@end

@interface AMAttributedHighlightLabel : UILabel

@property(strong,nonatomic) UIColor *mentionTextColor;
@property(strong,nonatomic) UIColor *hashtagTextColor;
@property(strong,nonatomic) UIColor *linkTextColor;
@property(nonatomic, strong) UIColor *detectedWordColor;
@property(strong,nonatomic) UIColor *selectedMentionTextColor;
@property(strong,nonatomic) UIColor *selectedHashtagTextColor;
@property(strong,nonatomic) UIColor *selectedLinkTextColor;
@property(nonatomic, strong) UIColor *selectedDetectedWordColor;

@property(nonatomic, strong) NSArray *detectWords;
@property(nonatomic) BOOL shouldHighlightLabel;

@property (nonatomic, weak) id <AMAttributedHighlightLabelDelegate> delegate;

- (void)setString:(NSString *)string;

@end
