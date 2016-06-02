//
//  Card.h
//  CardGame
//
//  Created by 南珂 on 16/6/2.
//  Copyright © 2016年 Nicole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString *suit;//花色
@property (nonatomic, strong) NSString *rank;//大小
@property (nonatomic, getter=isFaceUp) BOOL faceUp;//是否正面朝上
@property (nonatomic, getter=isMatched) BOOL matched;//是否匹配

//花色和大小的整体字符串
@property (nonatomic, strong, readonly) NSString *cardInfo;

- (instancetype)initWithSuit:(NSString *)suit andRank:(NSString *)rank;
//使用两个类方法提供全部合法的花色和大小
//便于后面生成全套的扑克牌
+ (NSArray *)allSuit;
+ (NSArray *)allRank;
@end
