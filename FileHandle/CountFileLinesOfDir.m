//
//  CountFileLinesOfDir.m
//  FileHandle
//
//  Created by 马 啸 on 12-8-21.
//  Copyright (c) 2012年 马 啸. All rights reserved.
//

#import "CountFileLinesOfDir.h"

@implementation CountFileLinesOfDir

@synthesize filePath;
@synthesize lineCount;
@synthesize fileManager;

-(id)initWithFilePath:(NSString *)tempFilePath
{
    if (self = [super init]) {
        fileManager = [NSFileManager defaultManager];
        self.filePath = tempFilePath;
        lineCount = 0;
        return self;
    }
    return nil;
}

-(int)countLinesOfDir:(NSString *)dirPath
{
    if (![fileManager fileExistsAtPath:dirPath]) {
        NSLog(@"filepath not exists");
        return 0;
    }
    BOOL flag;
    NSString *tempFilePath;
    int count = 0;
    if ([fileManager fileExistsAtPath:dirPath isDirectory:&flag]&&flag) {
        NSArray *fileArray = [fileManager contentsOfDirectoryAtPath:dirPath error:nil];
        for(NSString *temp in fileArray)
        {
            //printf("%s\n",[temp UTF8String]);
            tempFilePath = [dirPath stringByAppendingPathComponent:temp];
            [self countLinesOfDir:tempFilePath];
        }
    }else{
        
        count = [self countLinesOfFile:dirPath];
        printf("%s      count=%d\n",[dirPath UTF8String],count);
        self.lineCount += count;
        
    }
    
    
    
    return 0;
    
}
-(int)countLinesOfFile:(NSString *)tempFilePath
{
    int count = 0;
    DDFileReader *ddFileReader = [[DDFileReader alloc]initWithFilePath:tempFilePath];
    NSString *tempLine = nil;
    while ((tempLine = [ddFileReader readLine])!=nil) {
        count++;
    }
    return count;
}

@end
