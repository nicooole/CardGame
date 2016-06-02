//
//  GameViewController.m
//  CardGame
//
//  Created by 南珂 on 16/6/2.
//  Copyright © 2016年 Nicole. All rights reserved.
//

#import "GameViewController.h"
#import "Card.h"
#import "Poker.h"
#import "Game.h"
@interface GameViewController ()
//分数标签
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

//数据中存储的每一个引用对应界面的一个按钮
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *allButtons;
//点击纸牌
- (IBAction)clickCardButton:(UIButton *)sender;

//两个属性，模拟实际的游戏及必须的纸牌
@property (nonatomic, strong) Poker *poker;
@property (nonatomic, strong) Game *game;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.poker = [[Poker alloc] init];
    self.game = [[Game alloc] initWithPoker:self.poker number:self.allButtons.count];
    
    [self showCards];
}

//界面刷新
//将allRandomCards中的12张card对象一一对应，显示到12个按钮上
//一个card对应一个按钮
- (void)showCards
{
    for (NSInteger i = 0; i < self.allButtons.count; i++) {
        //找到i位置的按钮
        UIButton *button = self.allButtons[i];
        //找到i位置的Card
        Card *card = self.game.allRankdomCards[i];
        //根据card的状态，决定按钮的title和背景图
        [button setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:[self imageNameForCard:card]] forState:UIControlStateNormal];
        //根据card的matched状态，决定按钮是否可用
        //card   matched  YES  NO
        //button enabled  NO   YES
        button.enabled = !card.isMatched;
    }
    //显示分数
    self.scoreLabel.text = [NSString stringWithFormat:@"分数:%ld", self.game.score];
}

//根据传入的card对象，返回显示的按钮标题
- (NSString *)titleForCard:(Card *)card
{
    return card.isFaceUp ? card.cardInfo : @"";
}
//根据传入的card对象，返回显示的按钮图片名称
- (NSString *)imageNameForCard:(Card *)card
{
    return card.isFaceUp ? @"cardfront.png" : @"cardback.png";
}
- (IBAction)clickCardButton:(UIButton *)sender
{
    //获取点击的按钮sender，在数组中的位置
    NSInteger index = [self.allButtons indexOfObject:sender];
    //将位置传给game，game负责根据位置改数据
    [self.game tapCardAtIndex:index];
    //将新的数据再显示到界面上
    [self showCards];
}
@end
