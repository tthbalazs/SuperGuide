//
//  ProgramCell.swift
//  SuperGuide
//
//  Created by Tóth Balázs on 2017. 04. 04..
//  Copyright © 2017. Tóth Balázs. All rights reserved.
//

import Foundation
import UIKit

final class ProgramCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "ProgramCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(for program: Program) {
        titleLabel.text = program.title
    }
    
}
