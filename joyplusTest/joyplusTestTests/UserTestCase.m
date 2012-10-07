//
//  joyplusTestTests.m
//  joyplusTestTests
//
//  Created by scottliyq on 12-9-27.
//  Copyright (c) 2012年 scottliyq. All rights reserved.
//

#import "UserTestCase.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperationLogger.h"
#import "AFServiceAPIClient.h"
#import "ServiceConstants.h"


@implementation UserTestCase

- (void)setUp
{
    [super setUp];
    //AFNetworking Logging
    [[AFHTTPRequestOperationLogger sharedLogger] startLogging];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}


- (void)testUserViewCurrentUserSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathUserView parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        STAssertNil(responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        //assertThat(@"00000", equalTo(responseCode));
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];

    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

- (void)testUserViewOtherUserSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"12", @"userid",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathUserView parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        STAssertNil(responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        //assertThat(@"00000", equalTo(responseCode));
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

- (void)testUserThirtyPartyUserSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"1", @"source_type",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathUserThirdPartyUsers parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        STAssertEqualObjects(@"00000", responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        //assertThat(@"00000", equalTo(responseCode));
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

- (void)testFriendFollowSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"1", @"friend_ids",
                                nil];
    
    [[AFServiceAPIClient sharedClient] postPath:kPathFriendFollow parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        STAssertEqualObjects(@"00000", responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        //assertThat(@"00000", equalTo(responseCode));
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

- (void)testFriendDestorySuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"1", @"friend_ids",
                                nil];
    
    [[AFServiceAPIClient sharedClient] postPath:kPathFriendDestory parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        STAssertEqualObjects(@"00000", responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        //assertThat(@"00000", equalTo(responseCode));
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

- (void)testUserFriendsCurrentUserSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathUserFriends parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        STAssertNil(responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        //assertThat(@"00000", equalTo(responseCode));
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

- (void)testUserFriendsOtherUserSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"12", @"userid",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathUserFriends parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        STAssertNil(responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        //assertThat(@"00000", equalTo(responseCode));
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}


- (void)testUserFansCurrentUserSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathUserFans parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        STAssertNil(responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        //assertThat(@"00000", equalTo(responseCode));
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

- (void)testUserFansOtherUserSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"12", @"userid",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathUserFans parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        STAssertNil(responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        //assertThat(@"00000", equalTo(responseCode));
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

- (void)testFriendsRecommends
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathFriendRecommends parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        STAssertNil(responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        //assertThat(@"00000", equalTo(responseCode));
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

- (void)testUserFriendDynamics
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathUserFriendDynamics parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        STAssertNil(responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        //assertThat(@"00000", equalTo(responseCode));
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

- (void)testUserMsgs
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathUserMsgs parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        STAssertNil(responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        //assertThat(@"00000", equalTo(responseCode));
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

- (void)testUserUpdatePicUrl
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"www.github.com/testurl", @"url",
                                nil];
    
    [[AFServiceAPIClient sharedClient] postPath:kPathUserMsgs parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        //STAssertNil(responseCode, @"Response failed: %@.", responseCode);
        STAssertEqualObjects(@"00000", responseCode, @"Response failed: %@.", responseCode);
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

- (void)testUserUpdateBGPUrl
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"www.github.com/testurl", @"url",
                                nil];
    
    [[AFServiceAPIClient sharedClient] postPath:kPathUserUpdateBGPUrl parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
        //STAssertNil(responseCode, @"Response failed: %@.", responseCode);
        STAssertEqualObjects(@"00000", responseCode, @"Response failed: %@.", responseCode);
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        
        STFail(@"<<<<<<%@>>>>>", error);
    }];
    
    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}
@end
