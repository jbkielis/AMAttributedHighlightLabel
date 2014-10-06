//
// Created by Peyman Khanjan on 06/10/2014.
// Copyright (c) 2014 Snupps. All rights reserved.
//

#import "SUMentionedUserManager.h"
#import "SFSession.h"

@interface SUMentionedUserManager ()
@property(nonatomic, strong, readonly) NSMutableArray *failedMentions;
@end

@implementation SUMentionedUserManager
+ (instancetype)sharedInstance
{
    static dispatch_once_t once;
    static SUMentionedUserManager *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance->_existingMentions = [NSMutableDictionary dictionary];
        sharedInstance->_failedMentions = [NSMutableArray array];
    });

    return sharedInstance;
}

- (void)lookupUser:(NSString *)userName completion:(void(^)(NSString *userId))completion
{
    if (self.existingMentions[userName]) {
        if (completion) {
            completion(self.existingMentions[userName]);
        }

        return;
    }


    if ([self.failedMentions containsObject:userName]) {
        if (completion) {
            completion(nil);
        }

        return;
    }

    __weak typeof(self) weakSelf = self;
    [[SFSession getSession].restController checkUserNameExists:[userName substringFromIndex:1] completion:^(NSString *userId) {
        if (userId == nil) {
            [weakSelf.failedMentions addObject:userName];
        } else {
            weakSelf.existingMentions[userName] = userId;
        }

        if (completion) {
            completion(userId);
        }
    }];
}

@end