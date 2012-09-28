//
//  joyplusTestTests.m
//  joyplusTestTests
//
//  Created by scottliyq on 12-9-27.
//  Copyright (c) 2012年 scottliyq. All rights reserved.
//

#import "AccountTestCase.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperationLogger.h"
#import "AFServiceAPIClient.h"
#import "ServiceConstants.h"

@implementation AccountTestCase

- (void)setUp
{
    [super setUp];
    
    //AFNetworking Logging
    [[AFHTTPRequestOperationLogger sharedLogger] startLogging];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"unittest1@gmail.com", @"username",
                                @"mypassword", @"password",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathAccountLogin parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
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

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

//- (void)testAccountRegisterSuccessful
//{
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
//    
//    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
//                                @"ijoyplus_ios_001", @"app_key",
//                                @"unittest1@gmail.com", @"username",
//                                @"mypassword", @"password",
//                                @"unittest1", @"nickname",
//                                nil];
//    
//    [[AFServiceAPIClient sharedClient] getPath:kPathAccountRegister parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
//        
//        dispatch_semaphore_signal(semaphore);
//        NSString *responseCode = [result objectForKey:@"res_code"];
//        STAssertEqualObjects(@"00000", responseCode, @"Response failed: %@.", responseCode);
//        
//        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
//        //assertThat(@"00000", equalTo(responseCode));
//        
//    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
//        dispatch_semaphore_signal(semaphore);
//        
//        STFail(@"<<<<<<%@>>>>>", error);
//    }];
//    
//    
//    
//    
//    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
//                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
//    dispatch_release(semaphore);
//}



- (void)testAccountLoginSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"unittest1@gmail.com", @"username",
                                @"mypassword", @"password",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathAccountLogin parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
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

- (void)testAccountUpdateProfileSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"unittest1@gmail.com", @"username",
                                @"mypassword", @"password",
                                @"123", @"source_id",
                                @"1", @"source_type",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathAccountUpdateProfile parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
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

- (void)testAccountLogoutSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                nil];
    
    [[AFServiceAPIClient sharedClient] postPath:kPathAccountLogout parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
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

- (void)testAccountBindAccountSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"sina123", @"source_id",
                                @"1", @"source_type",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathAccountBindAccount parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
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

- (void)testAccountBindPhoneSuccessful
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"139123223232", @"phone",
                                nil];
    
    [[AFServiceAPIClient sharedClient] postPath:kPathAccountBindPhone parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
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

@end
