//
//  MagicDetailViewController.swift
//  CollectionViewTeamJoseGen
//
//  Created by Jose Alarcon Chacon on 1/10/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class MagicDetailViewController: UIViewController {
    
    @IBOutlet weak var magicCV: UICollectionView!
    
    var magicImage: Card!
    
    private var magicLangage = [ForeignWrapper]() {
        didSet {
            DispatchQueue.main.sync {
                self.magicCV.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        magicCV.dataSource = self
        upDateLanguage()
        let tap = UITapGestureRecognizer(target: self, action: #selector(goBack))
        view.addGestureRecognizer(tap)
    }
    

    @objc func goBack () {
        dismiss(animated: true, completion: nil)
    }
    func upDateLanguage() {
        MagicAPI.upDateLanguage { (appError, foreigns) in
            if let appError = appError {
                print(appError)
            } else if let foreings = foreigns {
                self.magicLangage = [foreings]
            }
        }
    }
}

extension MagicDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return magicImage.foreignNames.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MagicDetail", for: indexPath) as? MagicDetail else {return UICollectionViewCell()}

        ImageHelper.shared.fetchImage(urlString: magicImage.imageUrl!) { (appError, image) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let image = image {
                DispatchQueue.main.async {
                    cell.magicImage.image = image
                }
            }
        }

        let names = magicImage.foreignNames
        cell.updateCellUIDetail(wrapper: names[indexPath.row])
       return cell
    }
}

