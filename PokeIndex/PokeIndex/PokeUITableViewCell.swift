//
//  PokeUITableViewCell.swift
//  PokeIndex
//
//  Created by İbrahim Ballıbaba on 9.09.2022.
//

import UIKit

class PokeUITableViewCell: UITableViewCell {
    
    //MARK: - UI Elements
    
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeTypeLabel: UILabel!
    @IBOutlet weak var pokeSkillALabel: UILabel!
    @IBOutlet weak var pokeSkillBLabel: UILabel!
    
    //MARK: - Function
    
    func pokeUI(_ poke: Pokemon){
        pokeNameLabel.text = poke.pokeName
        pokeTypeLabel.text = poke.pokeType
        pokeSkillALabel.text = poke.pokeSkillA
        pokeSkillBLabel.text = poke.pokeSkillB
    }
    
    
}
