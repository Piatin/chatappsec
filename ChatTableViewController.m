//
//  ChatTableViewController.m
//  ParseStarterProject
//
//  Created by Kako on 2015/03/04.
//
//

#import "ChatTableViewController.h"
#import <Parse/Parse.h>

@interface ChatTableViewController ()

@end

@implementation ChatTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    chatRoomTableView.dataSource = self;
    chatRoomTableView.delegate = self;
    
    
    
    commentArray = [[NSMutableArray alloc]init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"chatMember"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *object in objects) {
                NSLog(@"ここまで");
                [commentArray addObject:[object objectForKey:@"message"]];
                NSLog(@"%@",commentArray);
                NSLog(@"読み込み");
            }
            NSLog(@"message == %@",commentArray);
            [chatRoomTableView reloadData];
        }else{
            NSLog(@"ERROR == %@",error);
        }
        
    }];
    
}

#pragma mark - TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return commentArray.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"messageCell";
    
    UITableViewCell *comCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (comCell == nil) {
        comCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    }
    
    UILabel *messageLabel = (UILabel *)[comCell viewWithTag:1];
    //    label.text = [NSString stringWithFormat:@"%@",roomArray];
    messageLabel.text = commentArray[indexPath.row];
    
    return comCell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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
