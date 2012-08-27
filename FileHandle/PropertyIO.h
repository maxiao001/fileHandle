//
//  PropertyIO.h
//  FileHandle
//
//  Created by 马 啸 on 12-8-21.
//  Copyright (c) 2012年 马 啸. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PropertyIO : NSObject
{
    NSString *filePath;
    NSMutableDictionary *membersDictionary;
    NSMutableArray *membersArray;
}
//@property(nonatomic,retain)NSMutableData *membersData;
@property(nonatomic,retain)NSString *filePath;
@property(nonatomic,retain)NSMutableArray *membersArray;
@property(nonatomic,retain) NSMutableDictionary *menberDictionary;
-(id)initWithFilePath:(NSString *)tempFilePath;
-(void)printConsoleDictionary;
-(void)printConsoleArray;
-(void)writeDicToFilePath:(NSString*)tempWriteFilePath;
-(void)writeArrayToFilePath:(NSString *)tempWriteFilePath;
@end
