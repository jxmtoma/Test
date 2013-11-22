//
//  MeSegmentControl.h
//  iFlavor
//
//  Created by Toma Ju on 11/20/13.
//  Copyright (c) 2013 Toma Ju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeSegmentControl : UISegmentedControl <UIScrollViewDelegate>

@property (retain, nonatomic) UIColor *backgroundColor UI_APPEARANCE_SELECTOR;
@property (retain, nonatomic) UIColor *borderColor UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CGFloat borderWidth UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CGFloat arrowSize UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CGFloat arrowHeightFactor UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CFTimeInterval animationDuration UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CGFloat interItemSpace UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) UIEdgeInsets stainEdgeInsets UI_APPEARANCE_SELECTOR;
@property (retain, nonatomic) UIColor *shadowColor UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CGFloat shadowRadius UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CGFloat shadowOpacity UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CGSize shadowOffset UI_APPEARANCE_SELECTOR;

@property (assign,nonatomic) UIScrollView *scrollView;

@end

@interface SDSegmentView : UIButton

@property (assign, nonatomic) CGSize imageSize UI_APPEARANCE_SELECTOR;
@property (retain, nonatomic) UIFont *titleFont UI_APPEARANCE_SELECTOR;
@property (retain, nonatomic) UIFont *selectedTitleFont UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CGSize titleShadowOffset UI_APPEARANCE_SELECTOR;

@end

@interface SDStainView : UIView <UIAppearance>

@property (retain, nonatomic) UIColor *backgroundColor UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CGFloat cornerRadius UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) UIEdgeInsets edgeInsets UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CGSize shadowOffset UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CGFloat shadowBlur UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) UIColor *shadowColor UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) CGFloat innerStrokeLineWidth UI_APPEARANCE_SELECTOR;
@property (assign, nonatomic) UIColor *innerStrokeColor UI_APPEARANCE_SELECTOR;

@end
