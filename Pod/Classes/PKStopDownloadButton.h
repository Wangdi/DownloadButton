//
//  PKStopDownloadButton.h
//  PKDownloadButton
//
//  Created by Pavel on 28/05/15.
//  Copyright (c) 2015 Katunin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PKCircleProgressView.h"
#import "PKBorderedButton.h"

typedef NS_ENUM(NSUInteger, PKStopButtonType) {
    kPKStopButtonType_Stop,
    kPKStopButtonType_Pause,
    kPKStopButtonType_Resume
};

IB_DESIGNABLE
@interface PKStopDownloadButton : PKCircleProgressView

@property (nonatomic, assign) IBInspectable CGFloat stopButtonWidth;
@property (nonatomic, weak, readonly) PKBorderedButton *stopButton;

- (instancetype)initWithPauseCapability:(bool)pauseCapability;
- (instancetype)initWithButtonType:(PKStopButtonType)buttonType;

@end
