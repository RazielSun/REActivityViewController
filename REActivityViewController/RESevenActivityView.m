//
//  RESevenActivityView.m
//  Pods
//
//  Created by Aleksandr Kardakov on 05.11.13.
//
//

#import "RESevenActivityView.h"

@implementation RESevenActivityView

#define CANCEL_BTN_HEIGHT       53

- (id) initWithFrame:(CGRect)frame activities:(NSArray *)activities
{
    if (self = [super initWithFrame:frame activities:activities])
    {
        self.backgroundImageView.image = nil;
        self.backgroundImageView.backgroundColor = [UIColor colorWithWhite:(248.0/255.0) alpha:1.0f];
        
        [self.cancelButton removeFromSuperview];
        self.cancelButton = nil;
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [self.cancelButton setBackgroundImage:[[UIImage imageNamed:@"REActivityViewController.bundle/Button_style2"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)] forState:UIControlStateNormal];
        
        [self.cancelButton setBackgroundImage:[[UIImage imageNamed:@"REActivityViewController.bundle/Button_style2_up"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)] forState:UIControlStateHighlighted];
        
        CGFloat posY = frame.size.height - CANCEL_BTN_HEIGHT;
        
        self.cancelButton.frame = CGRectMake(frame.origin.x, posY, frame.size.width, CANCEL_BTN_HEIGHT);
        [self.cancelButton setTitle:NSLocalizedStringFromTable(@"button.cancel", @"REActivityViewController", @"Cancel") forState:UIControlStateNormal];
        
        [self.cancelButton.titleLabel setFont:[UIFont systemFontOfSize:22]];
        [self.cancelButton addTarget:self action:@selector(cancelButtonPressed) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.cancelButton];
    }
    
    return self;
}

- (UIView *)viewForActivity:(REActivity *)activity index:(NSInteger)index x:(NSInteger)x y:(NSInteger)y
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, 80, 80)];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 0, 60, 60);
    button.tag = index;
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:activity.image forState:UIControlStateNormal];
    button.accessibilityLabel = activity.title;
    [view addSubview:button];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, 80, 26)];
    label.textAlignment = UITextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor blackColor];
    label.shadowOffset = CGSizeMake(0, 1);
    label.text = activity.title;
    label.font = [UIFont systemFontOfSize:11];
    label.numberOfLines = 0;
    [label setNumberOfLines:0];
    [label sizeToFit];
    CGRect frame = label.frame;
    frame.origin.x = roundf((view.frame.size.width - frame.size.width) / 2.0f);
    label.frame = frame;
    [view addSubview:label];
    
    return view;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect cancelButtonFrame = self.cancelButton.frame;
    CGRect scrollViewFrame = self.scrollView.frame;
    
    cancelButtonFrame.size.width = self.frame.size.width;
    cancelButtonFrame.origin.x = self.frame.origin.x;
    cancelButtonFrame.origin.y = self.frame.size.height - CANCEL_BTN_HEIGHT;
    
    scrollViewFrame.origin.y = 20;
    
    self.scrollView.frame = scrollViewFrame;
    self.cancelButton.frame = cancelButtonFrame;
}

#pragma mark -
#pragma mark UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width;
}

#pragma mark -

- (void)pageControlValueChanged:(UIPageControl *)pageControl
{
    CGFloat pageWidth = self.scrollView.contentSize.width /_pageControl.numberOfPages;
    CGFloat x = _pageControl.currentPage * pageWidth;
    [self.scrollView scrollRectToVisible:CGRectMake(x, 0, pageWidth, self.scrollView.frame.size.height) animated:YES];
}

@end
