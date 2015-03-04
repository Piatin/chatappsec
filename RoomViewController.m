//
//  RoomViewController.m
//  ParseStarterProject
//
//  Created by Kako on 2015/03/04.
//
//

#import "RoomViewController.h"
#import <Parse/Parse.h>

@interface RoomViewController ()

@end

@implementation RoomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    PFObject *chatRoom = [PFObject objectWithClassName:@"chatRoom"];
    chatRoom[@"roomName"]=roomField.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
