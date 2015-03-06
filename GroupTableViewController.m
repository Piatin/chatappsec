//
//  GroupTableViewController.m
//  ParseStarterProject
//
//  Created by Kako on 2015/03/04.
//
//

#import "GroupTableViewController.h"
#import <Parse/Parse.h>

@interface GroupTableViewController ()

@end

@implementation GroupTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    roomNameTableView.dataSource = self;
    roomNameTableView.delegate = self;
    
    roomArray = [[NSMutableArray alloc] init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"chatRoom"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *object in objects) {
                
                [roomArray addObject:[object objectForKey:@"roomName"]];
            }
            NSLog(@"roomName == %@", roomArray);
            [roomNameTableView reloadData];
        }else {
            NSLog(@"ERROR == %@", error);
        }
    }];
    
    //    [query getObjectInBackgroundWithId:@"roomName" block:^(PFObject *chatRoom, NSError *error) {
    //        // Do something with the returned PFObject in the gameScore variable.
    //        NSLog(@"%@", chatRoom);
    //        roomArray = [[NSMutableArray alloc]init];
    //        [roomArray addObject:query];
    //
    //        [chatRoom refresh];
    //    }];
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return roomArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"myCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    
    UILabel *label = (UILabel *)[cell viewWithTag:1];
    //    label.text = [NSString stringWithFormat:@"%@",roomArray];
    label.text = roomArray[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d",indexPath.section,indexPath.row);
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    if ([[segue identifier]isEqualToString:@""]){
//        NSIndexPath *indexPath = [self.roomNameTableView indexPathForSelectedRow];
//    }
//}

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



@end
