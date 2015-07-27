//
//  PMercurioFinalProjectViewController.m
//  PMercurioFinalProject
//
//  Created by Paul Mercurio on 11/4/11.
//  Copyright 2011 SBHS. All rights reserved.
//

#import "PMercurioFinalProjectViewController.h"
@implementation PMercurioFinalProjectViewController
@synthesize namePromptLabel;
@synthesize welcomeLabel;
@synthesize pressAnywhereLabel;
@synthesize playButton;
@synthesize loseButton;
@synthesize homeButton;
@synthesize nameTextField;
@synthesize gamePlayLabel;
@synthesize hardModeLabel;
@synthesize hardModeIndicatorLabel;
@synthesize goodLuckLabel;
@synthesize goodLuckLabel2;
@synthesize scoreLabel;
@synthesize theBall;
@synthesize fingerPrint;
@synthesize highScoresTitle;
@synthesize highScore1Label;
@synthesize highScore2Label;
@synthesize highScore3Label;
@synthesize showHighScoresButton;
@synthesize playAgainButton;
@synthesize levelSegmentedControl;
@synthesize yCoord;
@synthesize xCoord;
@synthesize fingerCenterLabel;
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void)stopKill {

}

- (void)viewDidLoad
{
    loseaudioPath = [[NSBundle mainBundle] pathForResource:@"doh1" ofType:@"mp3"];
    ballHit = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:loseaudioPath] error:NULL];
    [ballHit prepareToPlay];
    bonusaudioPath = [[NSBundle mainBundle] pathForResource:@"Cash" ofType:@"wav"];
    bonusGet = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:bonusaudioPath] error:NULL];
    [bonusGet prepareToPlay];
    [super viewDidLoad];
}

-(IBAction)toggleLevel:(id)sender {
    if (levelSegmentedControl.selectedSegmentIndex == 0) {
        goodLuckLabel.hidden = YES;
        goodLuckLabel2.hidden = YES;
    }
    else if (levelSegmentedControl.selectedSegmentIndex == 1) {
        goodLuckLabel.hidden = NO;
        goodLuckLabel2.hidden = YES;
    }
    else if (levelSegmentedControl.selectedSegmentIndex == 2) {
        goodLuckLabel.hidden = YES;
        goodLuckLabel2.hidden = NO;
    }
}


-(IBAction)loadMainView:(id)sender {
    if (hardModeToggle == YES) {
        goodLuckLabel.hidden = NO;
    }
    else {
        goodLuckLabel.hidden = YES;
    }
    welcomeLabel.hidden = FALSE;
    pressAnywhereLabel.hidden = FALSE;
    playButton.hidden = FALSE;
    playAgainButton.hidden = YES;
    homeButton.hidden = TRUE;
    namePromptLabel.hidden = TRUE;
    nameTextField.hidden = TRUE;
    hardModeLabel.hidden = FALSE;
    levelSegmentedControl.hidden = FALSE;
    if (levelSegmentedControl.selectedSegmentIndex == 0) {
        goodLuckLabel.hidden = YES;
        goodLuckLabel2.hidden = YES;
    }
    else if (levelSegmentedControl.selectedSegmentIndex == 1) {
        goodLuckLabel.hidden = NO;
        goodLuckLabel2.hidden = YES;
    }
    else if (levelSegmentedControl.selectedSegmentIndex == 2) {
        goodLuckLabel.hidden = YES;
        goodLuckLabel2.hidden = NO;
    }
    loseButton.hidden = YES;
    highScoresTitle.hidden = YES;
    highScore1Label.hidden = YES;
    highScore2Label.hidden = YES;
    highScore3Label.hidden = YES;
    showHighScoresButton.hidden = NO;
    scoreLabel.hidden = YES;
    [nameTextField resignFirstResponder];
}

-(IBAction)promptName:(id)sender {
    welcomeLabel.hidden = TRUE;
    pressAnywhereLabel.hidden = TRUE;
    playButton.hidden = TRUE;
    homeButton.hidden = FALSE;
    namePromptLabel.hidden = FALSE;
    nameTextField.hidden = FALSE;
    nameTextField.text = nil;
    hardModeLabel.hidden = TRUE;
    levelSegmentedControl.hidden = TRUE;
    goodLuckLabel.hidden = YES;
    goodLuckLabel2.hidden = YES;
    showHighScoresButton.hidden = TRUE;
    if (hardModeToggle == YES) {
        hardModeIndicatorLabel.hidden = NO;
    }
    
}


-(void)throwBall {
    if (running) {
    theBall.hidden = FALSE;
    NSString *scoreText = [[NSString alloc] initWithFormat:@"Score: %i",score++];
    scoreLabel.text = scoreText;
    NSArray *ballArray = [NSArray arrayWithObjects:
                          [UIImage imageNamed:@"1.png"],
                          [UIImage imageNamed:@"2.png"],
                          [UIImage imageNamed:@"3.png"],
                          [UIImage imageNamed:@"4.png"],
                          [UIImage imageNamed:@"5.png"],
                          [UIImage imageNamed:@"6.png"],
                          [UIImage imageNamed:@"7.png"],nil];
    NSArray *bonusBallArray = [NSArray arrayWithObjects:
                               [UIImage imageNamed:@"bonusball1.png"],
                               [UIImage imageNamed:@"bonusball2.png"], nil];
                               
    level = levelSegmentedControl.selectedSegmentIndex;    
    Float32 animDuration;
    randball = arc4random() % 7;
    randballType = arc4random() % 40;
    NSInteger startY;
    NSInteger startX;
    NSInteger finalX;
    NSInteger finalY;
    Float32 animDelay;
        if (randballType == 1 || randballType == 10) {
            [theBall setImage:[bonusBallArray objectAtIndex:0]];
        }
        else if (randballType == 5) {
            [theBall setImage:[bonusBallArray objectAtIndex:1]];
        }
        else {
            [theBall setImage:[ballArray objectAtIndex:randball]];
        }
    if (level == 2 && score > 25) {
        randballSize = (arc4random() % 75) + 45;
        startY = arc4random() % 350;
        finalY = touchLocation.y;
        animDuration = (arc4random() % 1) + 0.5;
        animDelay = 0.2;
        startX = 400;
        finalX = -300;
        theBall.frame = CGRectMake(0, 0, randballSize, randballSize); 
    }
    else if (level == 2 && score > 10) {
            randballSize = (arc4random() % 65) + 45;
            startY = -100;
            finalY = 550;
            animDuration = (arc4random() % 1) + 0.7;
            animDelay = 0.5;
            startX = (arc4random() % 200) + 50;
            finalX = touchLocation.x;
            theBall.frame = CGRectMake(0, 0, randballSize, randballSize); 
        }
    else if (level == 2) {
        randballSize = (arc4random() % 75) + 45;
        startY = arc4random() % 400;
        finalY = touchLocation.y;
        animDuration = 1.0;
        animDelay = 0.5;
        startX = -60;
        finalX = 380;
        theBall.frame = CGRectMake(0, 0, randballSize, randballSize); 
    }
        else if (level == 0) {
            randballSize = (arc4random() % 60) + 40;
            startY = arc4random() % 350;
            finalY = arc4random() % 350;
            animDuration = 1.5;
            animDelay = 0.8;
            startX = -60;
            finalX = 380;
            theBall.frame = CGRectMake(0, 0, randballSize, randballSize); 
        }
        else if (level == 1 && score > 15) {
            randballSize = (arc4random() % 70) + 40;
            startY = arc4random() % 400;
            finalY = arc4random() % 400;
            animDuration = 1.0;
            animDelay = 0.2;
            startX = -60;
            finalX = 380;
            theBall.frame = CGRectMake(0, 0, randballSize, randballSize); 
        }
        else if (level == 1) {
            randballSize = (arc4random() % 70) + 40;
            startY = arc4random() % 400;
            finalY = arc4random() % 400;
            animDuration = 1.2;
            animDelay = 0.4;
            startX = -60;
            finalX = 380;
            theBall.frame = CGRectMake(0, 0, randballSize, randballSize); 
        }
        theBall.center = CGPointMake(startX, startY);
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:animDuration];
            [UIView setAnimationDelay:animDelay];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDidStopSelector:@selector(throwBall)];
            theBall.center = CGPointMake(finalX, finalY);
            [UIView commitAnimations];
            scoreLabel.text = scoreText;
        [scoreText release];
    }

}

-(IBAction)gameStarted:(id)sender {
    //DECLARATIONS
    running = TRUE;
    highScoresTitle.hidden = YES;
    highScore1Label.hidden = YES;
    highScore2Label.hidden = YES;
    highScore3Label.hidden = YES;
    playAgainButton.hidden = YES;
    gameStarted = TRUE;
    hardModeIndicatorLabel.hidden = YES;
    namePromptLabel.hidden = TRUE;
    nameTextField.hidden = TRUE;
    userName = nameTextField.text;
    gamePlayLabel.hidden = FALSE;
    scoreLabel.hidden = FALSE;
    goodLuckLabel.hidden = YES;
    loseButton.hidden = NO;
    homeButton.hidden = TRUE;
    theBall.hidden = FALSE;
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *theTouch = [[event allTouches] anyObject];
    touchLocation = [theTouch locationInView:theTouch.view];
    if (gameStarted) {
        fingerPrint.center = CGPointMake(touchLocation.x, touchLocation.y);
        fingerPrint.hidden = FALSE;
        gamePlayLabel.hidden = TRUE;
        [self throwBall];
    }
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if(running) {
    fingerPrint.center = CGPointMake(touchLocation.x, touchLocation.y);    
    ballRect = [[[theBall layer] presentationLayer] frame];
    fingerRect = [fingerPrint frame];    
    UITouch *theTouch = [[event allTouches] anyObject];
    touchLocation = [theTouch locationInView:theTouch.view];
        fingerCenter = [[NSString alloc] initWithFormat:@"%f",fingerPrint.center];
        fingerCenterLabel.text = fingerCenter; 
        
        if (randballType == 1 && CGRectIntersectsRect(ballRect, fingerRect)) {
            theBall.center = CGPointMake(1000, 1000);
            [bonusGet play];
            score = score + 9;
        }
        
        else if (randballType == 10 && CGRectIntersectsRect(ballRect, fingerRect)) {
            theBall.center = CGPointMake(1000, 1000);
            [bonusGet play];
            score = score + 9;
        }
        
        else if (randballType == 5 && CGRectIntersectsRect(ballRect, fingerRect)) {
            theBall.center = CGPointMake(1000, 1000);
            [bonusGet play];
            score = (score * 2) - 2;
        }
        
        else if (CGRectIntersectsRect(ballRect, fingerRect)) {
            gameStarted = FALSE;
            fingerPrint.hidden = TRUE;
            [self fingerReleased:self];
            theBall.hidden = TRUE;
        }
        
    }
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    if(running) {
        gameStarted = FALSE;
        fingerPrint.hidden = TRUE;
        [self fingerReleased:self];
    }
}


-(void)showHighScores {
    highScoresTitle.hidden = NO;
    highScore1Label.hidden = NO;
    highScore2Label.hidden = NO;
    highScore3Label.hidden = NO;
    homeButton.hidden = FALSE;
    loseButton.hidden = YES;
    goodLuckLabel.hidden = YES;
    goodLuckLabel2.hidden = YES;
    playAgainButton.hidden = NO;
}


-(IBAction)showHighScores:(id)sender {
    playAgainButton.hidden = YES;
    highScoresTitle.hidden = NO;
    highScore1Label.hidden = NO;
    highScore2Label.hidden = NO;
    highScore3Label.hidden = NO;
    pressAnywhereLabel.hidden = YES;
    hardModeLabel.hidden = YES;
    levelSegmentedControl.hidden = YES;
    homeButton.hidden = FALSE;
    loseButton.hidden = YES;
    playButton.hidden = YES;
    welcomeLabel.hidden = YES;
    goodLuckLabel.hidden = YES;
    goodLuckLabel2.hidden = YES;
    showHighScoresButton.hidden = TRUE;
}

-(IBAction)fingerReleased:(id)sender {
    running = FALSE;
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    [ballHit play];
    [self showHighScores];
    if ((score - 1) > highscore1) {
        highScore3Label.text = highScore2Label.text;
        highScore2Label.text = highScore1Label.text;
        
        highscore1 = (score - 1);
        highScoreLabel1Text = [[NSString alloc] initWithFormat:@"%@: %i",nameTextField.text,highscore1];
        highScore1Label.text = highScoreLabel1Text;
         
    }
    else if ((score - 1) > highscore2) {
        highScore3Label.text = highScore2Label.text;
        
        highscore2 = (score - 1);
        highScoreLabel2Text = [[NSString alloc] initWithFormat:@"%@: %i",nameTextField.text,highscore2];
        highScore2Label.text = highScoreLabel2Text;
    }
    else if ((score - 1) > highscore3) {
        highscore3 = (score - 1);
        highScoreLabel3Text = [[NSString alloc] initWithFormat:@"%@: %i",nameTextField.text,highscore3];
        highScore3Label.text = highScoreLabel3Text;
    }
    
    NSString *msg = [[NSString alloc] initWithFormat:@"You Lost %@! Your score was %i",nameTextField.text, score - 1];
    gameOver = [[UIAlertView alloc] initWithTitle:@"Game Over" message:msg delegate:(self) cancelButtonTitle:@"DENIAL!" otherButtonTitles:@"ACCEPTANCE", nil];
    [gameOver show];
    score = 0;
    [msg release];
}


-(IBAction)ballHit:(id)sender {
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.highScoresTitle = nil;
    self.namePromptLabel = nil;
    self.nameTextField = nil;
    self.welcomeLabel = nil;
    self.pressAnywhereLabel = nil;
    self.playButton = nil;
    self.gamePlayLabel = nil;
    self.scoreLabel = nil;
    self.hardModeLabel = nil;
    self.levelSegmentedControl = nil;
    self.theBall = nil;
    self.title = nil;
    self.toolbarItems = nil;
    self.tabBarItem = nil;
    self.homeButton = nil;
    self.highScore1Label = nil;
    self.highScore2Label = nil;
    self.highScore3Label = nil;
    self.hardModeIndicatorLabel = nil;
    
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
