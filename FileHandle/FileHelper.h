//
//  FileHelper.h
//  FileOperation
//
//  Created by Xiao Ma on 12-8-12.
//  Copyright (c) 2012年 东北大学. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileHelper : NSObject

@property (nonatomic,retain)NSString *filePath;
-(FileHelper*)initWithFilePath:(NSString*)tempFilePath;
-(NSArray*)getAllContents;
-(void)readUseNSInputStream;
-(void)readLineUseCLangueage;

@end
