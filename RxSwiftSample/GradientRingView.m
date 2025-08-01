//
//  GradientRingView.m
//  RxSwiftSample
//
//  Created by 小幡綾加 on 8/1/25.
//

#import "GradientRingView.h"

@interface GradientRingView ()
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@end

@implementation GradientRingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setup];
    }
    return self;
}


- (void)setup {
    self.clipsToBounds = YES;

    self.imageView = [[UIImageView alloc] init];
    self.imageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.imageView.image = [UIImage imageNamed:@"cheese_dog"];
    [self addSubview:self.imageView];

    // AutoLayout
    [NSLayoutConstraint activateConstraints:@[
        [self.imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor],
        [self.imageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor],
        [self.imageView.widthAnchor constraintEqualToAnchor:self.widthAnchor multiplier:0.85],
        [self.imageView.heightAnchor constraintEqualToAnchor:self.imageView.widthAnchor]
    ]];

    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.startPoint = CGPointMake(0, 0);
    self.gradientLayer.endPoint = CGPointMake(1, 1);
    self.gradientLayer.colors = @[
        (__bridge id)[UIColor systemPinkColor].CGColor,
        (__bridge id)[UIColor systemOrangeColor].CGColor,
        (__bridge id)[UIColor systemPurpleColor].CGColor
    ];
    [self.layer insertSublayer:self.gradientLayer atIndex:0];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.layer.cornerRadius = self.bounds.size.width / 2.0;
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.width / 2.0;
    self.gradientLayer.frame = self.bounds;

    CGFloat inset = self.bounds.size.width * 0.075;
    UIBezierPath *outerPath = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
    UIBezierPath *innerPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds, inset, inset)];
    [outerPath appendPath:innerPath];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = outerPath.CGPath;
    maskLayer.fillRule = kCAFillRuleEvenOdd;

    self.gradientLayer.mask = maskLayer;
}

- (void)configureWithImage:(UIImage *)image {
    self.imageView.image = image;
}

@end
