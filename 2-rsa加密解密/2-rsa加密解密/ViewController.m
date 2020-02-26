//
//  ViewController.m
//  2-rsa加密解密
//
//  Created by zhangzhiliang on 2020/2/26.
//  Copyright © 2020 zhangzhiliang. All rights reserved.
//

#import "ViewController.h"
#import "RSACryptor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载rsa公钥
    [[RSACryptor sharedRSACryptor] loadPublicKey:[[NSBundle mainBundle] pathForResource:@"rsacert.der" ofType:nil]];
    
    // 加载rsa私钥
    [[RSACryptor sharedRSACryptor] loadPrivateKey:[[NSBundle mainBundle] pathForResource:@"p.p12" ofType:nil] password:@"123456"];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSString * message = @"hello world";
    
    // 加密过程
    NSData *e = [[RSACryptor sharedRSACryptor] encryptData:[message dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 解密过程
    NSData *d = [[RSACryptor sharedRSACryptor] decryptData:e];
    
    // 得到结果
    NSString * res = [[NSString alloc] initWithData:d encoding:NSUTF8StringEncoding];
    // 打印结果
    NSLog(@"%@", res);
}


@end
