//
//  testServiceTests.m
//  testServiceTests
//
//  Created by scottliyq on 12-9-17.
//  Copyright (c) 2012年 scottliyq. All rights reserved.
//

#import "testServiceTests.h"
#import "AFServiceAPIClient.h"
#import "AFNetworking.h"
#import "AFHTTPRequestOperationLogger.h"

@implementation testServiceTests

- (void)setUp
{
    [super setUp];
    //AFNetworking Logging
    [[AFHTTPRequestOperationLogger sharedLogger] startLogging];
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testLogin
{

    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    //Get sina user information
    NSDictionary *parameters = [NSDictionary dictionaryWithObjectsAndKeys:
                                @"scott", @"username",
                                @"mypassword", @"password",
                                nil];
    
    [[AFServiceAPIClient sharedClient] getPath:@"/service/index.php/login" parameters:parameters success:^(AFHTTPRequestOperation *operation, id result) {
        NSLog(@"<<<<<<Success>>>>>");
        dispatch_semaphore_signal(semaphore);
        
    } failure:^(__unused AFHTTPRequestOperation *operation, NSError *error) {
        dispatch_semaphore_signal(semaphore);
        NSLog(@"<<<<<<%@>>>>>", error);
    }];
    

    while (dispatch_semaphore_wait(semaphore, DISPATCH_TIME_NOW))
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    dispatch_release(semaphore);
}

@end
