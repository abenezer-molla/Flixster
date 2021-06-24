//
//  MoviesViewController.m
//  Flix
//
//  Created by abenezermolla on 6/23/21.
//

#import "MoviesViewController.h"

#import "MovieCell.h"

#import "DetailsViewController.h"

#import "UIImageView+AFNetworking.h"

@interface MoviesViewController () <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) NSArray *movies;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, strong) UIRefreshControl *refreshControl;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation MoviesViewController

- (void)viewDidLoad {
    
    NSLog(@"Hi Aben");
    [super viewDidLoad];
    
    
    
    self.tableView.dataSource = self;
    
    self.tableView.delegate = self;
    
    [self fetchMovies];
    self.refreshControl = [[UIRefreshControl alloc]init];
    
    [self.refreshControl addTarget:self action:@selector(fetchMovies) forControlEvents:UIControlEventValueChanged];
    
    [self.tableView addSubview:self.refreshControl];
    
    
    // Do any additional setup after loading the view.
    

}

- (void)fetchMovies{
    
    NSURL *url = [NSURL URLWithString:@"https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:nil delegateQueue:[NSOperationQueue mainQueue]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
           if (error != nil) {
               NSLog(@"%@", [error localizedDescription]);
               UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"No Network"
                                                                                          message:@"Please connect your device to a network source and try again."
                                                                                   preferredStyle:(UIAlertControllerStyleAlert)];
               // create a cancel action
               UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                                   style:UIAlertActionStyleCancel
                                                                 handler:^(UIAlertAction * _Nonnull action) {
                                                                        // handle cancel response here. Doing nothing will dismiss the view.
                                                                 }];
               // add the cancel action to the alertController
               [alert addAction:cancelAction];

               // create an OK action
               UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Try Again"
                                                                  style:UIAlertActionStyleDefault
                                                                handler:^(UIAlertAction * _Nonnull action) {
                                                                        // handle response here.
                                                                }];
               // add the OK action to the alert controller
               [alert addAction:okAction];
           }
           else {
               NSDictionary *dataDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               
               NSLog(@"%@",dataDictionary);
               
               self.movies = dataDictionary[@"results"];
               
               for(NSDictionary *movie in self.movies) {
                   
                   NSLog(@"%@", movie[@"title"]);
               }
               
               [self.tableView reloadData];

               // TODO: Get the array of movies
               // TODO: Store the movies in a property to use elsewhere
               // TODO: Reload your table view data
           }
        
        [self.refreshControl endRefreshing];
       }];
    [task resume];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.movies.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.activityIndicator startAnimating];
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    //UITableViewCell * cell = [[UITableViewCell alloc] init];
    
    NSDictionary *movie = self.movies[indexPath.row];
    
    cell.titleLable.text = movie[@"title"];
    
    cell.synopsisLable.text = movie[@"overview"];
    //cell.textLabel.text = movie[@"title"];
    
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    
    NSString *posterURLString = movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    
    NSURL *posterURl = [NSURL URLWithString:fullPosterURLString];
    
    cell.posterView.image = nil;
    [cell.posterView setImageWithURL:posterURl];
    [self.activityIndicator stopAnimating];
    return cell;
    
}





#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSLog(@"Tapping on a movie");
    
    UITableViewCell *tappedCell = sender;
    
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:tappedCell];
    
    NSDictionary *movie  = self.movies[indexPath.row];
    
    DetailsViewController *detailsViewController  = [segue destinationViewController];
    
    detailsViewController.movie = movie;
    
    
    
    
}


@end
