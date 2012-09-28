//
//  OCTests.m
//  OCTests
//
//  Created by scottliyq on 12-9-27.
//  Copyright (c) 2012年 scottliyq. All rights reserved.
//

#import "OCTests.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperationLogger.h"
#import "AFServiceAPIClient.h"
#import "ServiceConstants.h"

@implementation OCTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}
- (void)testLoginSuccessful {
        
        dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
        
        NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                    @"ijoyplus_ios_001", @"app_key",
                                    @"unittest_userqwe", @"username",
                                    @"mypassword", @"password",
                                    nil];
        
        [[AFServiceAPIClient sharedClient] getPath:kPathAccountLogin parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
            
            dispatch_semaphore_signal(semaphore);
            NSString *responseCode = [result objectForKey:@"res_code"];
            GHAssertEqualObjects(@"00000", responseCode, @"Response failed: %@.", responseCode);
            
            //GHAssertTrueNoThrow([@"00000" isEqualToString:responseCode], @"faileure");
            //assertThat(@"00000", equalTo(responseCode));
            
        } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
            dispatch_semaphore_signal(semaphore);
            
            GHFail(@"<<<<<<%@>>>>>", error);
        }];
        
        
        
        
        while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                     beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
        dispatch_release(semaphore);
        
}



@end
