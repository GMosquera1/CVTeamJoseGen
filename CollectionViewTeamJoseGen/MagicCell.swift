//
//  MagicCell.swift
//  CollectionViewTeamJoseGen
//
//  Created by Genesis Mosquera on 1/9/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class MagicCell: UICollectionViewCell {
   
    @IBOutlet weak var magicImageView: UIImageView!
    
    override func prepareForReuse() {
        magicImageView.image = nil
    }
}


