//
//  AccountTestCase.m
//  JoyplusGHTest
//
//  Created by scottliyq on 12-9-26.
//  Copyright (c) 2012年 scottliyq. All rights reserved.
//

#import "GHUnitIOS/GHUnit.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperationLogger.h"
#import "AFServiceAPIClient.h"
#import "ServiceConstants.h"

#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

@interface AccountTestCase : GHAsyncTestCase{ }
@end

@implementation AccountTestCase

- (void)setUpClass {
    // Run at start of all tests in the class
    [[AFHTTPRequestOperationLogger sharedLogger] startLogging];
}

- (void)testStrings {
    NSString *string1 = @"a string";
    GHTestLog(@"I can log to the GHUnit test console: %@", string1);
    
    // Assert string1 is not NULL, with no custom error description
    GHAssertNotNULL(string1, nil);
    
    // Assert equal objects, add custom error description
    NSString *string2 = @"a dstring";
    GHAssertEqualObjects(string1, string2, @"A custom error message. string1 should be equal to: %@.", string2);
}


//- (void)testRegister {
//    //Get sina user information
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
//    
//    //Get sina user information
//    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
//                                @"ijoyplus_ios_001", @"app_key",
//                                @"unittest_userqwe", @"username",
//                                @"mypassword", @"password",
//                                nil];
//    
//    
//    [[AFServiceAPIClient sharedClient] getPath:kPathAccountRegister parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
//        
//        dispatch_semaphore_signal(semaphore);
//        NSString *responseCode = [result objectForKey:@"res_code"];
//        if ([@"00000" isEqualToString:responseCode]) {
//            NSLog(@"<<<<<<Success>>>>>");
//        } else {
//            
//            NSLog(@"<<<<<<Logical Failure>>>>>");
//        }
//        
//    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
//        dispatch_semaphore_signal(semaphore);
//        NSLog(@"<<<<<<%@>>>>>", error);
//    }];
//    
//    
//    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
//                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
//    dispatch_release(semaphore);
//
//}

- (void)testLoginSuccessful {

    //dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
     [self prepare];

    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"ijoyplus_ios_001", @"app_key",
                                @"unittest_userqwe", @"username",
                                @"mypassword", @"password",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:kPathAccountLogin parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        
        //dispatch_semaphore_signal(semaphore);
        NSString *responseCode = [result objectForKey:@"res_code"];
       // GHAssertEqualObjects(@"00000", responseCode, @"Response failed: %@.", responseCode);
        
        //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
        assertThat(@"00000", equalTo(responseCode));
          [self notify:kGHUnitWaitStatusSuccess];
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        //dispatch_semaphore_signal(semaphore);

        GHFail(@"<<<<<<%@>>>>>", error);
        [self notify:kGHUnitWaitStatusSuccess];
    }];
    
    [self waitForStatus:kGHUnitWaitStatusSuccess timeout:15];


    
//    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
//        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
//                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
//    dispatch_release(semaphore);
    
}


@end
