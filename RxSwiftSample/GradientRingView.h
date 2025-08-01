//
//  GradientRingView.h
//  RxSwiftSample
//
//  Created by 小幡綾加 on 8/1/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface GradientRingView : UIView

@property (nonatomic, strong) UIImageView *imageView;

- (void)configureWithImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
