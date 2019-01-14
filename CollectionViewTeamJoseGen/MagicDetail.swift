//
//  MagicDetail.swift
//  CollectionViewTeamJoseGen
//
//  Created by Jose Alarcon Chacon on 1/10/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class MagicDetail: UICollectionViewCell {
    @IBOutlet weak var magicImage: UIImageView!
    @IBOutlet weak var magicName: UILabel!
    @IBOutlet weak var magiclanguage: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func prepareForReuse() {
        magicImage.image = nil
    }
    
    func language(language: ForeignWrapper) {
        magiclanguage.text = language.language
        textView.text = language.text
        magicName.text = language.name
    }
//    func updateDetail(cell: Card) {
//        ImageHelper.shared.fetchImage(urlString: cell.imageUrl ?? "") { (appError, image) in
//            if let appError = appError {
//                print(appError)
//            } else if let image = image {
//                self.magicImage.image = image
//            }
//        }
//    }
    
    func updateCellUIDetail(wrapper: ForeignWrapper) {
        magicName.text = wrapper.name
        magiclanguage.text = wrapper.language
        textView.text = wrapper.text
        
        ImageHelper.shared.fetchImage(urlString: wrapper.imageUrl ?? "") { (appError, image) in
            if let appError = appError {
                print(appError)
            } else if let image = image {
                self.magicImage.image = image
            }
        }
        
    }
    
//    @IBAction func dismiss(_ sender: UIButton) {
//    
//    }
}
