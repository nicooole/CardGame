//
//  Card.m
//  CardGame
//
//  Created by 南珂 on 16/6/2.
//  Copyright © 2016年 Nicole. All rights reserved.
//

#import "Card.h"

@implementation Card

- (instancetype)initWithSuit:(NSString *)suit andRank:(NSString *)rank
{
    if (self = [super init]) {
        self.suit = suit;
        self.rank = rank;
        self.faceUp = NO;
        self.matched = NO;
    }
    return self;
}

+ (NSArray *)allSuit
{
    return @[@"♠️", @"❤️", @"♣️", @"♦️"];
}

+ (NSArray *)allRank
{
    return @[@"A", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}
/*
 期待：给rank和suit属性赋值时，数据是合法的花色和大小，否则就不能存到这个属性中
 */
- (void)setSuit:(NSString *)suit
{
    if ([[Card allSuit] containsObject:suit]) {
        _suit = suit;
    }
}
- (void)setRank:(NSString *)rank
{
    if ([[Card allRank] containsObject:rank]) {
        _rank = rank;
    }
}
//重写get方法，设置到底读取什么值
- (NSString *)cardInfo
{
    return [self.suit stringByAppendingString:self.rank];
}
@end
