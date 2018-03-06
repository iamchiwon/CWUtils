//
//  ViewCreator.swift
//  d.code
//
//  Created by iamchiwon on 2018. 3. 6..
//  Copyright © 2018년 n.code. All rights reserved.
//

import SnapKit
import UIKit

func createView<T>(_ view: T,
                   parent: UIView,
                   setting: (T) -> (),
                   constraint: (ConstraintMaker) -> ()) -> T where T: UIView
{
    setting(view)
    parent.addSubview(view)
    view.snp.makeConstraints(constraint)
    return view
}
