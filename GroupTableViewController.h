//
//  GroupTableViewController.h
//  ParseStarterProject
//
//  Created by Kako on 2015/03/04.
//
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface GroupTableViewController : UIViewController<UITableViewDataSource,UITableViewDelegate> {
    NSMutableArray *roomArray;
    IBOutlet UITableView *roomNameTableView;
}

@end
