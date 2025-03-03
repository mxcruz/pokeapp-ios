import Foundation

class GetPokemonsUseCase {
    private let repository: PokemonRepository
    
    init(repository: PokemonRepository) {
        self.repository = repository
    }
    
    func execute(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        repository.getPokemons(completion: completion)
    }
}
