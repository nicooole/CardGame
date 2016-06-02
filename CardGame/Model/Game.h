//
//  Game.h
//  CardGame
//
//  Created by 南珂 on 16/6/2.
//  Copyright © 2016年 Nicole. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Poker.h"


@interface Game : NSObject
@property (nonatomic) NSInteger score;

//保存游戏开始时，随机出来的card对象
@property (nonatomic, strong) NSMutableArray *allRankdomCards;

//创建游戏时，根据指定的poker和指定的num
//随机出num张card，并存到allRandomCards数组中
- (instancetype)initWithPoker:(Poker *)poker number:(NSInteger)num;

- (void)tapCardAtIndex:(NSInteger)index;
@end
