//
//  ChatTableViewController.h
//  ParseStarterProject
//
//  Created by Kako on 2015/03/04.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ChatTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *commentArray;
    IBOutlet UITableView *chatRoomTableView;
}

@end
