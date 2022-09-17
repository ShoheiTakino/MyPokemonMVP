//
//  MainViewController.swift
//  MyPokemonMVP
//
//  Created by 滝野翔平 on 2022/09/17.
//

import UIKit

final class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        viewDidLoad()
    }
    
}


// MARK: Layout
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

