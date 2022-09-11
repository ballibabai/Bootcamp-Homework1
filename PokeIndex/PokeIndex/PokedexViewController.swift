//
//  PokedexViewController.swift
//  PokeIndex
//
//  Created by İbrahim Ballıbaba on 9.09.2022.
//

import UIKit

protocol addNewPokemonDelegate {
    func addNewPokemon(_ controller: PokedexViewController, with poke: Pokemon)
}

class PokedexViewController: UIViewController {

    //MARK: - UI Elements
    @IBOutlet weak var pokemonNameText: UITextField!
    @IBOutlet weak var pokemonTypeText: UITextField!
    @IBOutlet weak var pokemonSkillAText: UITextField!
    @IBOutlet weak var pokemonSkillBText: UITextField!
    
    //MARK: - Properties
    
    var delegate: addNewPokemonDelegate?
    var newPokemon = Pokemon(pokeName: "", pokeType: "", pokeSkillA: "", pokeSkillB: "")
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    //MARK: - Functions
    
    //we took entry from user and hold at our delegate
    //we used the condition "if textField is not empty"
    @IBAction func pokemonSaveTapped(_ sender: UIBarButtonItem){
        
        if let pokemonName = pokemonNameText.text, pokemonNameText.hasText,
           let pokemonType = pokemonTypeText.text, pokemonTypeText.hasText,
           let pokemonSkillA = pokemonSkillAText.text, pokemonSkillAText.hasText,
           let pokemonSkillB = pokemonSkillBText.text, pokemonSkillBText.hasText{
            newPokemon.pokeName = pokemonName
            newPokemon.pokeType = pokemonType
            newPokemon.pokeSkillA = pokemonSkillA
            newPokemon.pokeSkillB = pokemonSkillB
            
            delegate?.addNewPokemon(self, with: newPokemon)
        }else{
            let alertController = UIAlertController(title: "Error", message: "Could be empty some fields", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Got it!", style: .cancel)
            alertController.addAction(alertAction)
            present(alertController, animated: true)
        }
        
    }
    

  

}
