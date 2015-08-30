//
//  ViewController.m
//  JimmyKit
//
//  Created by Ben 815-202-2662 on 8/28/15.
//  Copyright (c) 2015 ben. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property int xPoint;
@property int yPoint;
@end

@implementation ViewController

-(void)viewDidAppear:(BOOL)animated
{
    [self Hole1];
}

-(void)Hole1
{
    for (float i = 0; i < 100000; i++)
    {
        if ((int)i / 232 == 3)
        {
            for (int x = i; x > -1; x--)
            {
                NSLog(@"X %i", x);
                if (x == 0)
                {
                    NSLog(@"done");
                    break;
                }
            }
            [self Hole2A];
            break;

        }
    }
}

-(void)Hole2A
{
    int x = arc4random_uniform(arc4random_uniform(arc4random_uniform(100000)));

    NSLog(@"%d", x);

    int newX = [self Hole2B:x];

    NSLog(@"newX %d", newX);

    NSMutableArray *array = [NSMutableArray new];
    for (char a = 'a'; a <= 'z'; a++)
    {
        [array addObject:[NSString stringWithFormat:@"%c", a]];
    }

    newX--;

    NSLog(@"%@", [array objectAtIndex:newX]);

//Next Hole
    self.xPoint = 5;
    self.yPoint = 30;
    [self Hole3];
}

-(int)Hole2B:(int)insert
{
    int x = insert/2;

    if (x <= 26)
    {
        return x;
    }
    else
    {
       return [self Hole2B:x];
    }
}

-(void)Hole3
{
    self.view.backgroundColor = [UIColor redColor];

    int x = self.view.frame.size.width;
    int y = self.view.frame.size.height;

    if (self.xPoint > x - 20)
    {
        self.yPoint += 30;
        self.xPoint = 5;
    }

    if (self.yPoint > y - 20)
    {
        for (UIView *view in self.view.subviews)
        {
            [UIView animateWithDuration:arc4random_uniform(10) animations:^{
            view.backgroundColor = [UIColor greenColor];
                view.alpha = 0;
            } completion:^(BOOL finished)
            {
                [view removeFromSuperview];
            }];

            if ([view isEqual:self.view.subviews.lastObject])
            {
                NSLog(@"done");
                [self Hole4];
            }
        }
        return;
    }

    int coin = arc4random_uniform(2);

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(self.xPoint, self.yPoint, 20, 20)];
    self.xPoint += 30;
    view.layer.cornerRadius = 10;
    view.backgroundColor = [UIColor colorWithWhite:(float)coin alpha:1.0f];
    [self.view addSubview:view];

    [self performSelector:@selector(Hole3) withObject:self afterDelay:0.05f];
}

-(void)Hole4
{
    float x  = M_PI;

    for (int i = 1; i <= 30; i++)
    {
        x = x * 2;
    }

    x = lroundf(x);

    NSLog(@"$%f", x);

        x = x / 4 / 3 / 365;

    NSLog(@"%f Kids per year", x);

    [self Hole5];
}

-(void)Hole5
{
    int coin;
    int coinCount = 0;
    int headCount = 0;
    while (headCount < 5)
    {
        coinCount++;
        coin = arc4random_uniform(2);

        if (!coin)
        {
        headCount = 0;
        continue;
        }
        headCount++;
        NSLog(@"heads");

        if (headCount == 5)
        {
        NSLog(@"%d flips for 5 heads in a row", coinCount);

        if (coinCount > 10) [self Hole5];
        else [self Hole6];
        }
    }
}

-(void)Hole6
{
    int number = arc4random_uniform(11);
    NSLog(@"Number %d", number);

    switch (number)
    {
        case 1:
        case 2:
        case 3:
            NSLog(@"Start over");
            [self Hole6];
            break;
        case 4:
        case 5:
            NSLog(@"tough luck");
            [self Hole6];
        break;
        case 6:
        case 7:
        case 8:
        case 9:

        break;

        case 10:
            NSLog(@"10 gold stars");
            [self Hole6];
        break;

        default:
            NSLog(@"Hopefully it was zero.");
            break;
    }
    [self Hole7];
}

-(void)Hole7
{
    NSMutableArray *array = [NSMutableArray new];
    for (int i = 0; i<= 10; i++)
    {
        NSNumber *number  = [NSNumber numberWithInt:arc4random_uniform(1000)];
        [array addObject:number];
    }

    NSArray *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        if (obj1 > obj2)    return NSOrderedDescending;
        else if (obj2 > obj1) return NSOrderedAscending;
        else return NSOrderedSame;
        }];

    NSLog(@"%@", sortedArray);
    [self Hole8];
}

-(void)Hole8
{
    NSString *string = @"The quick brown fox jumps swiftly over the log";
    NSMutableArray *myWords = [NSMutableArray arrayWithArray:[string componentsSeparatedByString:@" "]];

    for (int i = 0; i < myWords.count; i++)
    {
        int randomIndex = arc4random_uniform((int)myWords.count);
        [myWords exchangeObjectAtIndex:i withObjectAtIndex:randomIndex];
    }

    NSString *newString = [myWords componentsJoinedByString:@" "];
    NSLog(@"%@", newString);
    [self Hole9];
}

-(void)Hole9
{
    int x = arc4random_uniform(100000);
    if (![self isThisNumberPrime:x]) [self Hole9];


    for (int i = 1; i < INFINITY; i++)
    {
        if ([self isThisNumberPrime:i])
        {
            NSLog(@"%i",i);
        }
    }

}

-(BOOL)isThisNumberPrime:(int)x
{
    for (int i = 2; i < x; i++)
    {
        if (x % i == 0)
        {
//        NSLog(@"Not prime");
        return NO;
        break;
        }

        if (i == x - 1)
        {
//            NSLog(@"PRIME NUMBER %i", x);
            return YES;
            break;
        }
    }
    return NO;
}

@end
