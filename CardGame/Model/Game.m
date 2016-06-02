//
//  Game.m
//  CardGame
//
//  Created by 南珂 on 16/6/2.
//  Copyright © 2016年 Nicole. All rights reserved.
//

#import "Game.h"
#import "Card.h"
@implementation Game

- (instancetype)initWithPoker:(Poker *)poker number:(NSInteger)num
{
    if (self = [super init]) {
        self.score = 0;
        //1.分配数组空间
        self.allRankdomCards = [NSMutableArray array];
        //2.循环num次，每次从poker中找一张card
        for (NSInteger i = 0; i < num; i++) {
            //随机出一个整数
            //arc4random随机出0 ~ 4个字节表达的最大无符号整数
            NSInteger randomIndex = arc4random()%poker.allCards.count;
            //按照随机出来的下标去找该位置对应的纸牌
            Card *card = poker.allCards[randomIndex];
            
            //将随出牌存到属性中
            [self.allRankdomCards addObject:card];
            //将此张牌从poker中移除
            [poker.allCards removeObjectAtIndex:randomIndex];
        }
    }
    return self;
}

/*
 先获取点击的位置的card对象
 如果这张牌面朝上，翻成背朝上即可
 否则将牌翻成面朝上
 将这张牌与剩下的11张牌中，已经翻上来，且没有被匹配过的另一张牌进行比对
 如果两张牌花色相同
    修改两张牌为已匹配状态
 否则，如果两张牌大小相同
    修改两张牌为已匹配状态
 否则   将领一张牌翻成背朝上
*/
- (void)tapCardAtIndex:(NSInteger)index
{
    //获取点击的位置的card对象
    Card *selectedCard = self.allRankdomCards[index];
    
    
    if (selectedCard.isFaceUp) {
        selectedCard.faceUp = NO;//点击的面朝上的话就翻过来
    } else {
        selectedCard.faceUp = YES;//点击的面朝下的话就翻成面朝上
        //遍历纸牌数组
        for (NSInteger i = 0; i < self.allRankdomCards.count; i++) {
            
            if (i != index) {//如果不是点击的那张牌
                Card *otherCard = self.allRankdomCards[i];//获取那张牌
                //如果面朝上且没有匹配过
                if (otherCard.isFaceUp && !otherCard.isMatched) {
                    //如果被点击的牌的花色与otherCard的花色相同
                    if ([selectedCard.suit isEqualToString:otherCard
                        .suit]) {
                        //则两张牌匹配，得分+1
                        selectedCard.matched = YES;
                        otherCard.matched = YES;
                        self.score += 1;
                        
                    } else if ([selectedCard.rank isEqualToString:otherCard.rank]) {//如果被点击的牌与otherCard的大小相同，则得分+4
                        selectedCard.matched = YES;
                        otherCard.matched = YES;
                        self.score += 4;
                        
                    } else {
                        //使otherCard的面朝向下
                        otherCard.faceUp = NO;
                    }
                }
            }
        }
    }
}
@end
