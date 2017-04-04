//
//  TVGuideViewController.swift
//  SuperGuide
//
//  Created by Tóth Balázs on 2017. 04. 04..
//  Copyright © 2017. Tóth Balázs. All rights reserved.
//

import Foundation
import UIKit

final class TVGuideViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let dataSource = DataSource()
    let layout = TVGuideLayout()
    
    var channels: [Channel] = [] {
        didSet {
            collectionView.reloadData()
            collectionView.setCollectionViewLayout(layout, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadChannels()
    }
    
    func loadChannels() {
        dataSource.loadResource(.channels) { (json) in
            guard
                let channels = json["channels"] as? [JSON] else {
                    return
            }
            
            self.channels = channels.flatMap(Channel.init)
        }
    }
    
}

extension TVGuideViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let channel = channels[indexPath.section]
        let program = channel.programme[indexPath.row]
        
        return program.cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension TVGuideViewController: UICollectionViewDelegate {
    
}

extension TVGuideViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return channels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let channel = channels[section]
        
        return channel.programme.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProgramCell.identifier, for: indexPath) as? ProgramCell else {
                return UICollectionViewCell()
        }
        
        let channel = channels[indexPath.section]
        let program = channel.programme[indexPath.row]
        
        cell.setup(for: program)
        
        return cell
    }
    
}
