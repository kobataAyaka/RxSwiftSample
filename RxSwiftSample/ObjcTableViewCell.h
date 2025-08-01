//
//  ObjcTableViewCell.h
//  RxSwiftSample
//
//  Created by 小幡綾加 on 8/1/25.
//

#import <UIKit/UIKit.h>
#import "GradientRingView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ObjcTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet GradientRingView *gradientRingView;
- (void)configureWithImage:(UIImage *)image;

@end

NS_ASSUME_NONNULL_END
