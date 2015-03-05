//
//  GroupTableViewController.m
//  ParseStarterProject
//
//  Created by Kako on 2015/03/04.
//
//

#import "GroupTableViewController.h"
#import <Parse/Parse.h>

@interface GroupTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation GroupTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    PFQuery *query = [PFQuery queryWithClassName:@"chatRoom"];
    [query getObjectInBackgroundWithId:@"roomName" block:^(PFObject *chatRoom, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", chatRoom);
        roomArray = [[NSMutableArray alloc]init];
        [roomArray addObject:query];
    
       
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return roomArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"myCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    label.text = [NSString stringWithFormat:@"%@",roomArray];
    return cell;
}
//- (id)initWithCoder:(NSCoder *)decoder {
//    self = [super initWithCoder:decoder];
//    if (!self) {
//        return nil;
//    }
//        // This table displays items in the Todo class
//        self.parseClassName = @"Todo";
//        self.pullToRefreshEnabled = YES;
//        self.paginationEnabled = NO;
//        self.objectsPerPage = 25;
//  
//    return self;
//}
//
//- (PFQuery *)queryForTable {
//    PFQuery *query = [PFQuery queryWithClassName:self.parseClassName];
//    if (self.pullToRefreshEnabled) {
//        query.cachePolicy = kPFCachePolicyNetworkOnly;
//    }
//    if (self.objects.count == 0) {
//        query.cachePolicy = kPFCachePolicyCacheThenNetwork;
//    }
//    [query orderByDescending:@"createdAt"];
//    return query;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView
//         cellForRowAtIndexPath:(NSIndexPath *)indexPath
//                        object:(PFObject *)object {
//    static NSString *CellIdentifier = @"Cell";
//    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
//                                      reuseIdentifier:CellIdentifier];
//    }
//    
//    // Configure the cell to show todo item with a priority at the bottom
//    cell.textLabel.text = [object objectForKey:@"text"];
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"Priority: %@",
//                                 [object objectForKey:@"priority"]];
//    
//    return cell;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
