//
//  MainViewController.swift
//  MyPokemonMVP
//
//  Created by 滝野翔平 on 2022/09/17.
//

import UIKit

final class MainViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(MainViewControllerCell.nib(), forCellWithReuseIdentifier: MainViewControllerCell.identifire)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        PokemonAPIClients.fetchpokemonList()
        self.collectionView.reloadData()
        navigationItem.title = "ポケモン一覧"
        navigationController?.navigationBar.tintColor = .white
    }
}

// MARK: Layout
extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 500
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewControllerCell.identifire, for: indexPath) as! MainViewControllerCell
        cell.configure(pokemon: Pokemon[indexPath.row])
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = cell.frame.width / 2
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let horizontalSpace: CGFloat = 5

        //セルサイズの指定。セルを１行２列で表示
        let cellSize: CGFloat = self.view.bounds.width / 2 - horizontalSpace

        return CGSize(width: cellSize, height: cellSize)
    }
}
