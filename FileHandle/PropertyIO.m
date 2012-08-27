//
//  PropertyIO.m
//  FileHandle
//
//  Created by 马 啸 on 12-8-21.
//  Copyright (c) 2012年 马 啸. All rights reserved.
//

#import "PropertyIO.h"

@implementation PropertyIO
@synthesize filePath;
@synthesize menberDictionary;
@synthesize membersArray;
-(id)initWithFilePath:(NSString *)tempFilePath
{
    if (self = [super init]) {
        filePath = tempFilePath;
        menberDictionary = [[NSMutableDictionary alloc]initWithContentsOfFile:filePath];
        membersArray = [[NSMutableArray alloc]initWithContentsOfFile:filePath];
        return self;
    }
    return  nil;
}
-(void)printConsoleDictionary
{
 
    if (menberDictionary == nil) {
        NSLog(@"your member Dictionary is nil!");
        return;
    }
    NSLog(@"dictionaray data is %@",self.menberDictionary);
}
-(void)printConsoleArray
{
    if (membersArray == nil) {
        NSLog(@"your member array is nil !");
        return;
    }
    NSLog(@"array data is %@",membersArray);
}
-(void)writeDicToFilePath:(NSString *)tempWriteFilePath
{
    [self.menberDictionary writeToFile:tempWriteFilePath atomically:YES];
    
}
-(void)writeArrayToFilePath:(NSString *)tempWriteFilePath
{
    [self.membersArray writeToFile:tempWriteFilePath atomically:YES];
}
@end
