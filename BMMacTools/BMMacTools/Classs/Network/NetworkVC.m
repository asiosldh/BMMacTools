//
//  NetworkVC.m
//  BMMacTools
//
//  Created by __liangdahong on 2017/2/26.
//  Copyright © 2017年 http://idhong.com/. All rights reserved.
//

#import "NetworkVC.h"

@interface NetworkVC ()
    
@property (weak) IBOutlet NSTextField *inputTextField;
    
@property (unsafe_unretained) IBOutlet NSTextView *textView;

@end

@implementation NetworkVC

- (void)viewDidLoad {
    [super viewDidLoad];
}
    
- (IBAction)okButtonClick:(id)sender {

    if (self.inputTextField.stringValue.length < 1) {
        self.textView.string = @"请输入内容";
        return;
    }
    
    NSString *classString = self.inputTextField.stringValue;
    
    // 去掉前后空格
    while ([[classString substringToIndex:1] isEqualToString:@" "]) {
        classString = [classString substringFromIndex:1];
    }

    // 网络管理者类名
    NSMutableString *mutableString = [NSMutableString stringWithFormat:@"BM"];
    for (NSString *str in [classString componentsSeparatedByString:@"/"]) {
        if (str.length > 0) {
            NSString *cstr = [str substringToIndex:1];
            cstr = [cstr uppercaseString];
            [mutableString appendString:cstr];
            [mutableString appendString:[str substringFromIndex:1]];
        }
    }
    [mutableString appendString:@"APIManager"];
    
    
    NSMutableString *URLString = [NSMutableString stringWithFormat:@"INTERFACE"];
    
    NSString *inapi = self.inputTextField.stringValue;
    while ([[inapi substringToIndex:1] isEqualToString:@" "]) {
        inapi = [inapi substringFromIndex:1];
    }
    NSString *api = inapi;
    
    for (NSString *str in [inapi componentsSeparatedByString:@"/"]) {
        if (str.length > 0) {
            [URLString appendString:@"_"];
            [URLString appendString:[str uppercaseString]];
        }
    }
    
    while ([[api substringToIndex:1] isEqualToString:@"/"]) {
        api = [api substringFromIndex:1];
    }
    
    NSString *string = [NSString stringWithFormat:@"#define %@ @\"%@\" <#name#>",URLString, api];

    [mutableString appendString:@"\n"];
    [mutableString appendString:string];
    
    self.textView.string = mutableString;
}
    
@end
