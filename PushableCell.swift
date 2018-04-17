//
//  PushableCell.swift
//  TwitterTrendsClient
//
//  Created by Gre on 8/04/18.
//  Copyright © 2018 frankszs. All rights reserved.
//

import UIKit

class PushableCell : UITableViewCell {
    
    private var isPushed : Bool = false
    var pushAmount : CGFloat = 0.1
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        
      self.pushCell(inward: highlighted, with: pushAmount)
    }
    
    func pushCell(inward: Bool, with pushFactor:CGFloat){
        
        if(inward && !isPushed){
            isPushed = true
            UIView.animate(withDuration: 0.35, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: [.curveEaseOut, .allowUserInteraction], animations: {
                self.transform = CGAffineTransform.init(scaleX: (1-pushFactor), y: (1-pushFactor))
            }, completion: nil)
        }
        else if(isPushed){
            isPushed = false
            UIView.animate(withDuration: 0.55, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [.curveEaseOut, .allowUserInteraction], animations: {
                self.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
}

