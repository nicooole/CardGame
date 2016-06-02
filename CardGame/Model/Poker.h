//
//  Poker.h
//  CardGame
//
//  Created by 南珂 on 16/6/2.
//  Copyright © 2016年 Nicole. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Poker : NSObject

/*
 类型：一副扑克牌类
 属性：
      存储52个Card对象（数组 NSMutableArray）
        
 一创建扑克牌的实例，就要把其中的52个card对象准备好，所以需要在init方法中，创建好52个对象
 */

@property (nonatomic, strong) NSMutableArray *allCards;

@end
