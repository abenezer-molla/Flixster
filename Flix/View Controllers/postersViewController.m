//
//  postersViewController.m
//  Flix
//
//  Created by abenezermolla on 6/25/21.
//

#import "postersViewController.h"
#import "UIImageView+AFNetworking.h"

@interface postersViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backPoster;
@property (weak, nonatomic) IBOutlet UIImageView *frontPoster;
@property (weak, nonatomic) IBOutlet UILabel *boldLabel;
@property (weak, nonatomic) IBOutlet UILabel *thinSynopsisLabel;

@end

@implementation postersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    
    NSString *posterURLString = self.movie[@"poster_path"];
    
    
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    
    [self.frontPoster setImageWithURL: posterURL];
    
    NSLog(@"%@", posterURL);
    
    
    NSString *backdropURLString2 = self.movie[@"backdrop_path"];
    NSString *fullBackdropURLString2 = [baseURLString stringByAppendingString:backdropURLString2];
    
    NSURL *posterURl2 = [NSURL URLWithString:fullBackdropURLString2];
    
    [self.backPoster setImageWithURL:posterURl2];
    
    self.boldLabel.text = self.movie[@"title"];
    
    self.thinSynopsisLabel.text = self.movie[@"overview"];
    
    [self.boldLabel sizeToFit];
    
    [self.thinSynopsisLabel sizeToFit];
    
    NSLog(@"%@", posterURl2);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
