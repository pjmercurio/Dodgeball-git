//
//  PMercurioFinalProjectViewController.h
//  PMercurioFinalProject
//
//  Created by Paul Mercurio on 11/4/11.
//  Copyright 2011 SBHS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <AudioToolbox/AudioToolbox.h>

@interface PMercurioFinalProjectViewController : UIViewController <AVAudioPlayerDelegate>{
    int score;
    int highscore1;
    int highscore2;
    int highscore3;
    int level;
    CGPoint touchLocation;
    CGRect ballRect;
    CGRect fingerRect;
    UILabel *xCoord;
    UILabel *yCoord;
    int randballType;
    NSString *fingerCenter;
    UILabel *fingerCenterLabel;
    NSString *userName;
    NSString *loseaudioPath;
    NSString *bonusaudioPath;
    bool hardModeToggle;
    bool running;
    bool gameStarted;
    NSInteger randball;
    NSInteger randballSize;
    NSString *highScoreLabel1Text;
    NSString *highScoreLabel2Text;
    NSString *highScoreLabel3Text;
    UILabel *welcomeLabel;
    UILabel *pressAnywhereLabel;
    UILabel *namePromptLabel;
    UILabel *gamePlayLabel;
    UILabel *scoreLabel;
    UILabel *hardModeLabel;
    UILabel *hardModeIndicatorLabel;
    UILabel *goodLuckLabel;
    UILabel *goodLuckLabel2;
    UILabel *highScore1Label;
    UILabel *highScore2Label;
    UILabel *highScore3Label;
    UIAlertView *gameOver;
    UIButton *playButton;
    UIButton *loseButton;
    UIButton *homeButton;
    UIButton *showHighScoresButton;
    UIButton *playAgainButton;
    UITextField *nameTextField;
    UIImageView *theBall;
    UIImageView *fingerPrint;
    UISegmentedControl *levelSegmentedControl;
    UINavigationBar *highScoresTitle;
    AVAudioPlayer *ballHit;
    AVAudioPlayer *bonusGet;
}
@property (retain, nonatomic) IBOutlet UILabel *xCoord;
@property (retain, nonatomic) IBOutlet UILabel *yCoord;
@property (nonatomic, retain) IBOutlet UILabel *welcomeLabel;
@property (nonatomic, retain) IBOutlet UILabel *pressAnywhereLabel;
@property (nonatomic, retain) IBOutlet UILabel *namePromptLabel;
@property (nonatomic, retain) IBOutlet UILabel *gamePlayLabel;
@property (nonatomic, retain) IBOutlet UILabel *scoreLabel;
@property (nonatomic, retain) IBOutlet UILabel *hardModeLabel;
@property (nonatomic, retain) IBOutlet UILabel *hardModeIndicatorLabel;
@property (nonatomic, retain) IBOutlet UILabel *goodLuckLabel;
@property (nonatomic, retain) IBOutlet UILabel *goodLuckLabel2;
@property (nonatomic, retain) IBOutlet UILabel *highScore1Label;
@property (nonatomic, retain) IBOutlet UILabel *highScore2Label;
@property (nonatomic, retain) IBOutlet UILabel *highScore3Label;
@property (nonatomic, retain) IBOutlet UILabel *fingerCenterLabel;
@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet UIButton *loseButton;
@property (nonatomic, retain) IBOutlet UIButton *homeButton;
@property (nonatomic, retain) IBOutlet UIButton *playAgainButton;
@property (nonatomic, retain) IBOutlet UISegmentedControl *levelSegmentedControl;
@property (nonatomic, retain) IBOutlet UIButton *showHighScoresButton;
@property (nonatomic, retain) IBOutlet UITextField *nameTextField;
@property (nonatomic, retain) IBOutlet UIImageView *theBall;
@property (nonatomic, retain) IBOutlet UIImageView *fingerPrint;
@property (nonatomic, retain) IBOutlet UINavigationBar *highScoresTitle;
-(IBAction)toggleLevel:(id)sender;
-(IBAction)loadMainView:(id)sender;
-(IBAction)promptName:(id)sender;
-(IBAction)gameStarted:(id)sender;
-(IBAction)fingerReleased:(id)sender;
-(IBAction)ballHit:(id)sender;
-(IBAction)showHighScores:(id)sender;
@end
