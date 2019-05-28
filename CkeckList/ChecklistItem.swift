//
//  ChecklistItem.swift
//  CkeckList
//
//  Created by Myo Set Paing on 5/22/19.
//  Copyright © 2019 Myo Set Paing. All rights reserved.
//

import Foundation

class ChecklistItem : NSObject {
    var text = ""
    var checked = false
    
    func toggleCheck() {
        checked = !checked
    }
} 
