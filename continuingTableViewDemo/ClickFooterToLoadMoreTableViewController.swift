//
//  ClickFooterToLoadMoreTableViewController.swift
//  continuingTableViewDemo
//
//  Created by 任岐鸣 on 2017/3/7.
//  Copyright © 2017年 navi. All rights reserved.
//

import UIKit

class ClickFooterToLoadMoreTableViewController: UITableViewController {
    
    let identifier = "clickFooterToLoadDemoIdentifier"
    
    var titleArr = [0,1,2,3,4,5,6,7,8,9]
    
    lazy var footerButton:UIButton =  {
        let btn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: self.tableView.frame.width, height: 60))
        btn.setTitle("Click to Load More", for: .normal)
        btn.backgroundColor = .gray
        btn.addTarget(self, action: #selector(loadMoreData), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        tableView.tableFooterView = footerButton
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return titleArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.textLabel?.text = "\(titleArr[indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
    func loadMoreData() {
        var indexPaths = [IndexPath]()
        for i in titleArr.count..<titleArr.count+10 {
            titleArr.append(i)
            indexPaths.append(IndexPath.init(row: titleArr.index(of: i)!, section: 0))
        }
        DispatchQueue.main.async(execute: {
            self.tableView.insertRows(at: indexPaths, with: UITableViewRowAnimation.automatic)
        })
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
}
