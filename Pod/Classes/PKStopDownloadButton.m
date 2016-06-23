//
//  PKStopDownloadButton.m
//  PKDownloadButton
//
//  Created by Pavel on 28/05/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import "PKStopDownloadButton.h"
#import "NSLayoutConstraint+PKDownloadButton.h"
#import "UIImage+PKDownloadButton.h"

static const CGFloat kDefaultStopButtonWidth = 8.f;

@interface PKStopDownloadButton ()

@property (nonatomic, weak) PKBorderedButton *stopButton;
@property (nonatomic, assign) PKStopButtonType buttonType;

- (PKBorderedButton *)createStopButton;
- (NSArray *)createStopButtonConstraints;
- (void)updateAppearance;
- (PKCircleProgressView *)createCircleProgressView;

@end

static PKStopDownloadButton *CommonInit(PKStopDownloadButton *self) {
    if (self != nil) {
        PKBorderedButton *stopButton = [self createStopButton];
        stopButton.translatesAutoresizingMaskIntoConstraints = NO;
        [self addSubview:stopButton];
        self.stopButton = stopButton;
        
        [self addConstraints:[self createStopButtonConstraints]];
        [self updateAppearance];
        [self setNeedsDisplay];
    }
    return self;
}

@implementation PKStopDownloadButton


#pragma mark - properties

- (void)setStopButtonWidth:(CGFloat)stopButtonWidth {
    _stopButtonWidth = stopButtonWidth;
    
    switch (self.buttonType) {
        case kPKStopButtonType_Stop: {
            [self.stopButton setImage:[UIImage stopImageOfSize:_stopButtonWidth color:self.tintColor] forState:UIControlStateNormal];
            break;
        }
        case kPKStopButtonType_Pause: {
            [self.stopButton setImage:[UIImage pauseImageOfSize:_stopButtonWidth color:self.tintColor] forState:UIControlStateNormal];
            break;
        }
        case kPKStopButtonType_Resume: {
            [self.stopButton setImage:[UIImage playImageOfSize:_stopButtonWidth color:self.tintColor] forState:UIControlStateNormal];
            break;
        }
    }

    [self setNeedsDisplay];
}

#pragma mark - initialization

- (instancetype)initWithCoder:(NSCoder *)decoder {
    return CommonInit([super initWithCoder:decoder]);
}

- (instancetype)initWithButtonType:(PKStopButtonType)buttonType {
    PKStopDownloadButton *button = CommonInit([super init]);
    button.buttonType = buttonType;
    [self updateAppearance];
    [self setNeedsDisplay];
    
    return button;
}

#pragma mark - private methods

- (PKBorderedButton *)createStopButton {
    PKBorderedButton *stopButton = [PKBorderedButton buttonWithType:UIButtonTypeCustom];
	stopButton.tintColor = [UIColor clearColor];
    _stopButtonWidth = kDefaultStopButtonWidth;
    return stopButton;
}

- (NSArray *)createStopButtonConstraints {
    NSMutableArray *constraints = [NSMutableArray array];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsForWrappedSubview:self.stopButton withInsets:UIEdgeInsetsZero]];
    
    return constraints;
}

- (PKCircleProgressView *)createCircleProgressView {
    PKCircleProgressView *circleProgressView = [[PKCircleProgressView alloc] init];
    
    return circleProgressView;
}

#pragma mark - appearance

- (void)updateAppearance {
    switch (self.buttonType) {
        case kPKStopButtonType_Stop: {
            [self.stopButton setImage:[UIImage stopImageOfSize:_stopButtonWidth color:self.tintColor] forState:UIControlStateNormal];
            break;
        }
        case kPKStopButtonType_Pause: {
            [self.stopButton setImage:[UIImage pauseImageOfSize:_stopButtonWidth color:self.tintColor] forState:UIControlStateNormal];
            break;
        }
        case kPKStopButtonType_Resume: {
            [self.stopButton setImage:[UIImage playImageOfSize:_stopButtonWidth color:self.tintColor] forState:UIControlStateNormal];
            break;
        }
    }
}

- (void)tintColorDidChange {
	[super tintColorDidChange];
	[self updateAppearance];
}
@end
