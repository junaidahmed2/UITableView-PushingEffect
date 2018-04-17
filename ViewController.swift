//
//  ViewController.swift
//  TwitterTrendsClient
//
//  Created by f0dsterz on 17/01/17.
//  Copyright © 2017 frankszs. All rights reserved.
//

import UIKit
import CoreData

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
        let initialPushFactor : CGFloat = 0.1
        let pushCompundAmount : CGFloat = 0.7
        
        for i in -6...6 {
            
            if(i != 0){
                
                var section = indexPath.section
                var row = indexPath.row
                
                var inBounds = true
                var tempI = i
                
                while tempI != 0 {
                    if(i < 0){
                        if(row-1 < 0){
                            if(section-1 < 0){
                                inBounds = false
                                break
                            }
                            else{
                                section -= 1
                                row = self.tableView(tableView, numberOfRowsInSection: section)-1
                            }
                        }
                        else{
                            row -= 1
                        }
                        
                        tempI += 1
                    }
                    else{
                        if(row+1 >= self.tableView(tableView, numberOfRowsInSection: section)){
                            if(section+1 >= self.numberOfSections(in: tableView)){
                                inBounds = false
                                break
                            }
                            else{
                                section += 1
                                row = 0
                            }
                        }
                        else{
                            row += 1
                        }
                        
                        tempI -= 1
                    }
                }
                
                if !inBounds{
                    continue
                }
                
                let currentIndexPath = IndexPath.init(row: row, section: section)
                let cell = self.tableView.cellForRow(at: currentIndexPath)
                if let pushableCell = cell as? PushableCell{
                    pushableCell.pushCell(inward: true, with: (initialPushFactor * CGFloat(powf(Float(pushCompundAmount), Float(abs(i))))))
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let initialPushFactor : CGFloat = 0.1
        let pushCompundAmount : CGFloat = 0.7
        
        for i in -6...6 {
            
            if(i != 0){
                
                var section = indexPath.section
                var row = indexPath.row
                
                var inBounds = true
                var tempI = i
                
                while tempI != 0 {
                    if(i < 0){
                        if(row-1 < 0){
                            if(section-1 < 0){
                                inBounds = false
                                break
                            }
                            else{
                                section -= 1
                                row = self.tableView(tableView, numberOfRowsInSection: section)-1
                            }
                        }
                        else{
                            row -= 1
                        }
                        
                        tempI += 1
                    }
                    else{
                        if(row+1 >= self.tableView(tableView, numberOfRowsInSection: section)){
                            if(section+1 >= self.numberOfSections(in: tableView)){
                                inBounds = false
                                break
                            }
                            else{
                                section += 1
                                row = 0
                            }
                        }
                        else{
                            row += 1
                        }
                        
                        tempI -= 1
                    }
                }
                
                if !inBounds{
                    continue
                }
                
                let currentIndexPath = IndexPath.init(row: row, section: section)
                let cell = self.tableView.cellForRow(at: currentIndexPath)
                if let pushableCell = cell as? PushableCell{
                    pushableCell.pushCell(inward: false, with: (initialPushFactor * CGFloat(powf(Float(pushCompundAmount), Float(abs(i))))))
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let pushAmount : CGFloat = 0.90
        
        if let pushableCell = cell as? PushableCell{
            pushableCell.transform = CGAffineTransform.init(scaleX: pushAmount, y: pushAmount)
            UIView.animate(withDuration: 0.4, animations: {
                pushableCell.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            })
        }
    }
}
