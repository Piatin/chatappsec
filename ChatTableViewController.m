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
    
    [messageLabel sizeToFit];
    
    return comCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 表示したい文字列
    NSString     *text = commentArray[indexPath.row];
    // 表示最大幅・高さ
    CGSize     maxSize = CGSizeMake(200, CGFLOAT_MAX);
    // 表示するフォントサイズ
    NSDictionary *attr = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:17.0]};
    
    // 以上踏まえた上で、表示に必要なサイズ
    CGSize modifiedSize = [text boundingRectWithSize:maxSize
                                             options:NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attr
                                             context:nil
                           ].size;
    
    // 上下10pxずつの余白を加えたものと70pxのうち、大きい方を返す
    return MAX(modifiedSize.height + 20, 70);
    
    
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
