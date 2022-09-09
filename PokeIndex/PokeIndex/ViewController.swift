//
//  ViewController.swift
//  PokeIndex
//
//  Created by İbrahim Ballıbaba on 9.09.2022.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - UI Elements
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    
    var pokemon = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    //MARK: - Functions
    
    //This function allows viewController to communicate with PokedexViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPokedex" {
 
            let destinationVC = segue.destination as? PokedexViewController
            destinationVC?.delegate = self
        }
    }
    
    @IBAction func addPokemon(_ sender: UIBarButtonItem){
        performSegue(withIdentifier: "toPokedex", sender: nil)
    }

}

    //MARK: - Extensions

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    //We created PokeUItableViewCell so in here we defined new cell thus we were able to use the function in PokeUItableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell") as? PokeUITableViewCell {
            let pokemon = pokemon[indexPath.row]
            cell.pokeUI(pokemon)
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPokemon = pokemon[indexPath.row]
        print(selectedPokemon)
    }
    
}

//We add delegate for data pass and later we created newCell for each pokemon
//PopViewController allows us to go to the previous page after our process is finished.
extension ViewController: addNewPokemonDelegate{
    
    func addNewPokemon(_ controller: PokedexViewController, with poke: Pokemon) {
        let newCell = pokemon.count
        pokemon.append(poke)
        let indexPath = IndexPath(row: newCell, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        navigationController?.popViewController(animated: true)
    }
    
    
}

