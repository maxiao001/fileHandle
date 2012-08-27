//
//  CountFileLinesOfDir.h
//  FileHandle
//
//  Created by 马 啸 on 12-8-21.
//  Copyright (c) 2012年 马 啸. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDFileReader.h"
@interface CountFileLinesOfDir : NSObject

@property(nonatomic,retain) NSString *filePath;
@property int lineCount;
@property NSFileManager *fileManager;
-(id)initWithFilePath:(NSString *)tempFilePath;
-(int)countLinesOfDir:(NSString*)dirPath;
-(int)countLinesOfFile:(NSString*)tempFilePath;
@end
