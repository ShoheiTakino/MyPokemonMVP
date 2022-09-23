//
//  MainViewControllerCell.swift
//  MyPokemonMVP
//
//  Created by 滝野翔平 on 2022/09/17.
//

import UIKit

final class MainViewControllerCell: UICollectionViewCell {

    static let identifire = "MainViewControllerCell"
    static func nib()-> UINib {
        UINib(nibName: identifire, bundle: nil)
    }
    
    @IBOutlet private weak var pokemonId: UILabel!
    @IBOutlet private weak var pokemonName: UILabel!
    @IBOutlet private weak var pokemonImage: UIImageView!
    
    func configure(pokemon: Pokemon) {
        pokemonId.text = "No. \(pokemon.id)"
        pokemonName.text = pokemon.name
//        pokemonImage.sd_setImage(with: NSURL(string: pokemon.sprites.image) as URL?)
//        PokeImage?.contentMode = UIView.ContentMode.scaleAspectFit
//        self.addSubview(PokeImage)
    }
}
