//
//  ViewController.swift
//  CollectionViewTeamJoseGen
//
//  Created by Genesis Mosquera on 1/9/19.
//  Copyright © 2019 Genesis Mosquera. All rights reserved.
//

import UIKit

class MagicViewController: UIViewController {
    var magicImages = [Card]() {
        didSet {
            DispatchQueue.main.async {
                self.magicCollectionView.reloadData()
            }
        }
        
    }
    
    
    
    @IBOutlet weak var magicCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        magicCollectionView.dataSource = self
        magicCollectionView.delegate = self
        
        guard let url = URL.init(string: "https://api.magicthegathering.io/v1/cards?contains=imageUrl") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    let MagicData = try JSONDecoder().decode(MagicModel.self, from: data)
                    self.magicImages = MagicData.cards
                    
                    //MAKE SURE ALL THE OBJECTS HAVE A IMAGEURL
                    
                    print(self.magicImages[0].name)
                    
                } catch {
                    print(error)
                }
            }
            if let error = error {
                print(error)
            }
        }.resume()
      }
    }

extension MagicViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return magicImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MagicCell", for: indexPath) as? MagicCell else { return UICollectionViewCell()}
        //
        guard let url = URL.init(string: magicImages[indexPath.row].imageUrl) else {
            return UICollectionViewCell()
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    cell.magicImageView.image = UIImage.init(data: data)
                }
            }
        }.resume()
        return cell
    }
    
    
}
extension MagicViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 100, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("we done did it")
    }
}
