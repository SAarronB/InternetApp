//
//  InternetMasterViewController.swift
//  InternetApp
//
//  Created by Bonilla, Sean on 12/14/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

class InternetMasterViewController: UITableViewController {
    private weak var internetDetail : InternetDetailViewController? = nil
    private lazy var internetTopics : [String] = [String]()
    private lazy var addresses : [String] = [String]()
    
    private func setupDetailContents() -> Void{
        internetTopics = [
                "Internet Definitions",
                "Standard Search Engine",
                "AP CSP",
                "Canyons District",
                "CTEC",
                "Social Media"]
        
        addresses = [
            "https://www.google.com",
            "https://www.twitter.com",
            "https://www.youtube.com",
            "https://canyons.instructure.com/",
            "https://ctec.canyonsdistricts.org/"]
        
        if let splitView = splitViewController{
            let currentController = splitView.viewControllers
            internetDetail = currentController[0] as? InternetDetailViewController
        }
    }

    public override func viewDidLoad() -> Void {
        
        super.viewDidLoad()
        setupDetailContents()
        self.clearsSelectionOnViewWillAppear = false
        
        if let split = splitViewController{
            let controllers = split.viewControllers
            internetDetail = (controllers[controllers.count-1] as! UINavigationController).topViewController as?
            InternetDetailViewController
        }
        // Do any additional setup after loading the view.
    }
    
    public override func viewWillAppear(_ animated: Bool) -> Void{
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let rowtext = internetTopics[indexPath.row]
        cell.textLabel!.text = rowtext
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        internetDetail?.detailAddress = addresses[indexPath.row]
        internetDetail?.detailTitle = internetTopics[indexPath.row]
        if (internetDetail != nil){
            splitViewController?.showDetailViewController(internetDetail!, sender: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
 */

}
