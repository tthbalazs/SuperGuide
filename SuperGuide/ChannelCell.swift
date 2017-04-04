//
//  ChannelCell.swift
//  SuperGuide
//
//  Created by Tóth Balázs on 2017. 04. 04..
//  Copyright © 2017. Tóth Balázs. All rights reserved.
//

import Foundation
import UIKit

final class ChannelCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    static let identifier = "ChannelCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(for channel: Channel) {
        titleLabel.text = channel.title
    }
}
