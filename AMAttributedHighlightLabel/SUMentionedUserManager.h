//
// Created by Peyman Khanjan on 06/10/2014.
// Copyright (c) 2014 Snupps. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface SUMentionedUserManager : NSObject
@property(nonatomic, strong, readonly) NSMutableDictionary *existingMentions;

+ (instancetype)sharedInstance;

// @userName
- (void)lookupUser:(NSString *)userName completion:(void(^)(NSString *userId))completion;
@end