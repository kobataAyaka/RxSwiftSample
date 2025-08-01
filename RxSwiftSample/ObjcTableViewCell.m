//
//  ObjcTableViewCell.m
//  RxSwiftSample
//
//  Created by 小幡綾加 on 8/1/25.
//

#import "ObjcTableViewCell.h"

@implementation ObjcTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureWithImage:(nonnull UIImage *)image {
    [self.gradientRingView configureWithImage:image];
}

@end
