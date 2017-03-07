//
//  ClickToLoadMoreTableViewController.swift
//  continuingTableViewDemo
//
//  Created by 任岐鸣 on 2017/3/7.
//  Copyright © 2017年 navi. All rights reserved.
//

import UIKit

class ClickCellToLoadMoreTableViewController: UITableViewController {
    
    let identifier = "clickCellToLoadDemoIdentifier"
    
    var titleArr = [0,1,2,3,4,5,6,7,8,9]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
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
        return titleArr.count + 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        if indexPath.row < titleArr.count {
            cell.textLabel?.text = "\(titleArr[indexPath.row])"
        } else if indexPath.row == titleArr.count {
            cell.textLabel?.text = "Click to load more"
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == titleArr.count {
            loadMoreData()
        }
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
