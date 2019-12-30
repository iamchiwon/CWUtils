//
//  TableView+Reload.swift
//  Example
//
//  Created by iamchiwon on 2017. 12. 22..
//  Copyright © 2017년 makecube. All rights reserved.
//

import UIKit

public extension UITableView {
    func reload(animation: UITableView.RowAnimation) {
        let range = NSMakeRange(0, numberOfSections)
        let sections = NSIndexSet(indexesIn: range)
        reloadSections(sections as IndexSet, with: animation)
    }
}
