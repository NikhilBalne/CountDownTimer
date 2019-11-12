//
//  ViewController.m
//  CountDownTimer
//
//  Created by iHub on 12/11/19.
//  Copyright © 2019 iHubTechnologiesPvtLtd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    NSTimer *timer;
    int currMinute;
    int currSeconds;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timerLabel.textColor=[UIColor redColor];
    self.timerLabel.backgroundColor=[UIColor clearColor];
    
}

-(void)timerFired{
    
    if((currMinute>0 || currSeconds>=0) && currMinute>=0)
    {
        if(currSeconds==0)
        {
            currMinute-=1;
            currSeconds=59;
        }
        else if(currSeconds>0)
        {
            currSeconds-=1;
        }
        if(currMinute>-1){
            
            if (currSeconds != 0) {
                [self.timerLabel setText:[NSString stringWithFormat:@"%2d",currSeconds]];
            }else{
                self.timerLabel.hidden = true;
            }
            
            
        }
    }
    else
    {
        [timer invalidate];
    }
}


- (IBAction)startButtonTapped:(id)sender {
    
    currMinute=0;
    currSeconds=04;
    self.timerLabel.hidden = false;
    self.timerLabel.text = @"3";
    [timer invalidate];
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
}

@end
