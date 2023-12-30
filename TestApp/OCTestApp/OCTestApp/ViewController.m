//
//  ViewController.m
//  OCTestApp
//
//  Created by joker on 12/30/23.
//

#import "ViewController.h"

@import OrzUIKit;

@interface ViewController()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIView *colorView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView.image = UIImage.test1;
    
    self.colorView.backgroundColor = UIColor.test2;
}

- (IBAction)featureAction:(UIBarButtonItem *)sender {
    
    OrzUIKitFeatureDemoPage *page = [OrzUIKitFeatureDemoPage new];
    
    [self.navigationController pushViewController:page animated:YES];
    
}

@end
