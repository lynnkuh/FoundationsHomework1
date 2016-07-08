//
//  ViewController.swift
//  Juicer
//
//  Created by Jared Sorge on 6/18/16.
//  Copyright © 2016 Taphouse Software. All rights reserved.
//

import UIKit

struct Battery: Equatable {
    let sku: String
    let type: String
    var count: Int


   func incrementCount() -> Battery {
  //  var newCount: Int = count + 1
     return Battery(sku: sku, type: type, count: count + 1)
   
   }
}

func == (lhs: Battery, rhs: Battery)-> Bool {
    return lhs.sku == rhs.sku
}


let cellID = "BatteryCell"

class ViewController: UIViewController {
    private var batteries = [Battery]()
    private var purchasingIndexPath: NSIndexPath?
    private var iapManager: IAPManager?
    
    //IBOutlets
    @IBOutlet private var tableView: UITableView!
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iapManager = IAPManager(delegate: self)
        
        let aaa = Battery(sku: "com.kuhlman.lynn.AAA", type: "AAA", count: 0)
        batteries.append(aaa)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return batteries.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier(cellID) as? BatteryTableViewCell else { fatalError() }
        
        let battery = batteries[indexPath.row]
        cell.configure(withBattery: battery)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        guard let iapManager = iapManager else { return }
        let battery = batteries[indexPath.row]
        iapManager.purchase(battery: battery)
 
    }
}

extension ViewController: IAPManagerDelegate {
    
    func batteryPurchased(battery: Battery) {
        
        let _index = batteries.indexOf(battery)
        guard let index = _index else { return }
        let indexPath = NSIndexPath(forRow: index, inSection: 0)
        
        let updatedBattery = batteries[index]
        batteries[index] = updatedBattery.incrementCount()
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func batteryPurchasedFailed(battery: Battery?, withError error: IAPError) {
        
        let alertController = UIAlertController(title: "Battery Purchase Failed", message: error.message, preferredStyle: .Alert)
        let action = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(action)
        presentViewController(alertController, animated: true, completion: nil)

    }
}



