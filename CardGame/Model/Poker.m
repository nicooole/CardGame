//
//  Poker.m
//  CardGame
//
//  Created by 南珂 on 16/6/2.
//  Copyright © 2016年 Nicole. All rights reserved.
//

#import "Poker.h"
#import "Card.h"
@implementation Poker

- (instancetype)init
{
    if (self = [super init]) {
        self.allCards = [NSMutableArray array];
        
        NSArray *allSuit = [Card allSuit];
        NSArray *allRank = [Card allRank];
        
        //内部循环13次，外部循环4次，所以可以创建52张牌
        for (NSString *suit in allSuit) {
            for (NSString *rank in allRank) {
                Card *card = [[Card alloc] initWithSuit:suit andRank:rank];
                //将牌放到数组中
                [self.allCards addObject:card];
            }
        }
    }
    return self;
}
@end
