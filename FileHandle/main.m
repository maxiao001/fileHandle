//
//  main.m
//  FileHandle
//
//  Created by 马 啸 on 12-8-21.
//  Copyright (c) 2012年 马 啸. All rights reserved.
//
//-(BOOL)contentsAtPath:path                                           //从一个path所指定的文件上读取数据
//-(BOOL)createFileAtPath:path contents:(NSData*)data attributes:attr  //向一个path所指向的文件上写入数据data
//-(BOOL)removeFileAtPath:path handler:handler                         //删除一个path所指定的文件
//-(BOOL)movePath:from toPath:to handler:handler                       //重命名或移动一个文件。from是源文件，to是目标文件
//-(BOOL)contentsEqualAtPath:path1 andPath:path2                       //比较两个文件的内容是相同
//-(BOOL)fileExistsAtPath:path                                         //判断path所指定的文件是否存在
//-(BOOL)isReadableFileAtPath:path                                     //判断path所指定的文件是否存在，能否进行读取操作
//-(BOOL)isWritableFileAtPath:path                                     //判断path所指定的文件是否存在，能否进行写入操作
//-(NSDictionary*)fileAttributesAtPath:path traverseLink:(BOOL)flag    //获取path所指定的文件的属性，返回一个字典类型
//-(BOOL)changeFileAtributes:attr atPath:path                          //更改path所指定的文件的属性
//
//NSFileManager目录操作
//-(NSString*)currentDirectoryPath                      //获取当前目录
//-(BOOL)changeCurrentDirectoryPath:path                //更改当前目录
//-(BOOL)copyPath:from toPath:to handler:handler        //复制目录结构
//-(BOOL)createDirectoryAtPath:path attributes:attr     //创建一个新的目录
//-(BOOL)fileExistsAtPath:path isDirectory:(BOOL*)flag  //判断是不是目录
//-(NSArray*)directoryContentsAtPath:path               //列出目录内容
//-(NSDirectoryEnumerator*)enumeratorAtPath:path        //枚举目录的内容
//-(BOOL)removeFielPath:path handler:handler            //删除一个空目录
//-(BOOL)movePath:from toPath:to handler:handler        //重命名或移动一个目录
//
//-(NSString*)NSUserName                             //返回当前用户目录
//-(NSString*)NSFullUserName                         //返回当前用户的完整目录
//-(NSString*)NSHomeDirectory                        //返回当前用户主目录路经
//-(NSString*)NSHomeDirectoryForUser:(NSString*)user //返回user用户的主目录
//-(NSString*)NSTemporaryDirectory                   //返回可以用于创建临时文件的临时目录
//
//+(NSString*)pathWithComponents:components        //根据components中的值构造路经
//-(NSArray*)pathComponents                        //柝分路经，获得各个部分，并放入数组
//-(NSString*)lastPathComponents                   //提取路经中最后一个组成部分(一般就是文件名)
//-(NSString*)pathExtension                        //提取文件的扩展名
//-(NSString*)stringByAppendingPathComponents:path //将path增加到现有路经的尾部
//-(NSStirng*)stringByAppendingPathExtension:ext   //将ext扩展名增加到尾部
//-(NSString*)stringByDeletingLastPathComponents   //删除路经的最后一个组成部分
//-(NSString*)stringByDeletingPathExtension        //删除最后的扩展名
//-(NSString*)stringByExpandingTildeInPath         //将路经中的各个"~"符号转换为用户主目录(~)或者为一个指定用户的主目录(~user)
//-(NSString*)stringByStandardizingPath            //解析~，父日目录(..)、当前目录(.)和符号链接来返回一个标准化路经
#import <Foundation/Foundation.h>
#import "PropertyIO.h"
#import "DDFileReader.h"
#import "CountFileLinesOfDir.h"
int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
        
        NSFileManager *fileManager = [NSFileManager defaultManager];

//---------------------------------
        //file handle read and write ,the key is use offset to control the end of read;
//        NSString *readFile = @"/Users/maxiao/Desktop/1.txt";
//        NSString *writeFile = @"/Users/maxiao/Desktop/2.txt";
//        
//        NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:readFile];
//        if (readHandle == nil) {
//            NSLog(@"read file open failed");
//        }
//        NSFileHandle *writeHandle = [NSFileHandle fileHandleForWritingAtPath:writeFile];
//        if (writeHandle == nil) {
//            NSLog(@"write file open failed");
//        }
//        
//        [readHandle seekToEndOfFile];
//        unsigned long long fileLength = [readHandle offsetInFile];
//       
//        [readHandle seekToFileOffset:0];
//        NSMutableData  *data = [[NSMutableData alloc]initWithCapacity:4];
//        int count = 0;
//        
//        int currentOffSet = 0;
//        while ((data = [NSMutableData dataWithData:[readHandle readDataOfLength:4]]) != nil && currentOffSet < fileLength) {
//            [writeHandle writeData:data];
//            currentOffSet += [data length];
//            count++;
//            printf("%s count=%d",[[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]UTF8String],count);
//        }
//        [readHandle closeFile];
//        [writeHandle closeFile];
        
//------------------------------------------
        
        //Property list read and write such as NSMutableDictionary and NSArray;
        
        NSString *inputPath = @"/myspace/workspace4Objective-c/FileHandle/FileHandle/propertyDemo.plist";
        //        NSString *inputArrayPath = @"/myspace/workspace4Objective-c/FileHandle/FileHandle/propertyArray.plist";
        //        NSString *outputPath = @"/myspace/workspace4Objective-c/FileHandle/FileHandle/output.plist";
        //
        //        //write array into file
        //        NSMutableArray *tempArray = [[NSMutableArray alloc]init];
        //        int i = 0;
        //        for (i = 0; i< 10; i++) {
        //            NSArray *values = [[NSArray alloc]initWithObjects:[NSNumber numberWithUnsignedInt:arc4random()%10], nil];
        //            NSArray *keys = [[NSArray alloc]initWithObjects:@"id", nil];
        //            NSDictionary *dic = [[NSDictionary alloc]initWithObjects:values forKeys:keys];
        //
        //           [tempArray addObject:dic];
        //        }
        //
        //        [tempArray writeToFile:inputArrayPath atomically:YES];
        //
        //
        //        //read dic from file
        //        if ([fileManager fileExistsAtPath:inputPath]) {
        //            NSLog(@"input file exists!");
        //        }
        //        PropertyIO *pIO = [[PropertyIO alloc]initWithFilePath:inputPath];
        //        //print  console dic
        //        [pIO printConsoleDictionary];
        //
        //
        //        if ([fileManager fileExistsAtPath:outputPath]) {
        //            NSLog(@"output file exists");
        //        }
        //        [pIO writeDicToFilePath:outputPath];
        //        if (![fileManager fileExistsAtPath:@"/myspace/workspace4Objective-c/FileHandle/FileHandle/outArray.plist"]) {
        //            NSLog(@"file not exists");
        //        }
        //        [tempArray writeToFile:@"/myspace/workspace4Objective-c/FileHandle/FileHandle/outArray.plist" atomically:YES];
        
//----------------------------------
        //test readline use self-define class DDFileReader;
        
        //invoke method 1;
        //        DDFileReader *ddFileReader = [[DDFileReader alloc]initWithFilePath:inputPath];
        //        NSString *tempLine = nil;
        //        while ((tempLine = [ddFileReader readLine])!=nil) {
        //            printf("%s",[tempLine UTF8String]);
        //        }
        
        
        
        //invoke method  2;
        //DDFileReader * reader = [[DDFileReader alloc] initWithFilePath:pathToMyFile];
        //[reader enumerateLinesUsingBlock:^(NSString * line, BOOL * stop) {
        //    NSLog(@"read line: %@", line);
        //}];
       
        
        NSString  *dirPath = @"/myspace/workspace4iPhone/";
        
        CountFileLinesOfDir *counter  = [[CountFileLinesOfDir alloc]initWithFilePath:dirPath];
        [counter countLinesOfDir:counter.filePath];
        
        printf("total line count is %d",counter.lineCount);
        
    }
    return 0;
}

