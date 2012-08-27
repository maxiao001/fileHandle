//
//  FileHelper.m
//  FileOperation
//
//  Created by Xiao Ma on 12-8-12.
//  Copyright (c) 2012年 东北大学. All rights reserved.
//

#import "FileHelper.h"

@implementation FileHelper
@synthesize filePath;
static int count = 0;
-(FileHelper*)initWithFilePath:(NSString *)tempFilePath
{
    if (self = [super init]) {
        
        self.filePath = tempFilePath;
        return self;
    }
    return nil;
}
-(NSArray*)getAllContents
{
    NSString *contents = [NSString stringWithContentsOfFile:self.filePath encoding:NSUTF8StringEncoding error:nil];
   // return [contents componentsSeparatedByString:@"\r\n"];
    return [contents componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\r\n"]];
}
-(void)readLineUseCLangueage
{
    FILE *file = fopen([self.filePath UTF8String], "rw");
    
    char tempLine[256];//!!important 256!;
    if (file == NULL) {
        NSLog(@"open failed!");
        return;
    }
    while (fgets(tempLine, 256, file) != NULL) {
        NSLog(@"temp line is %@",[NSString stringWithUTF8String:tempLine]);
    }    
    fclose(file);
}
-(void)readUseNSInputStream
{
    NSInputStream *input = [[NSInputStream alloc]initWithFileAtPath:self.filePath];
    if (input == NULL) {
        NSLog(@"NULL");
    }
    unsigned char *temp = NULL;
    while ([input hasBytesAvailable]) {
        NSLog(@"YES");
        [input read:temp maxLength:100];
        NSLog(@"%s",temp);
    }
    [input close];

}

@end
