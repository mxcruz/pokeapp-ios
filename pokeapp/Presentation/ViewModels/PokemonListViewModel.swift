import SwiftUI

class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    private let getPokemonsUseCase: GetPokemonsUseCase
    
    init(getPokemonsUseCase: GetPokemonsUseCase) {
        self.getPokemonsUseCase = getPokemonsUseCase
    }
    
    func loadPokemons() {
        getPokemonsUseCase.execute { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemons):
                    self?.pokemons = pokemons
                case .failure(let error):
                    print("Error: \(error)")
                }
            }
        }
    }
}
