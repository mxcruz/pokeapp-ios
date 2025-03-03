import Foundation

class PokemonRepositoryImpl: PokemonRepository {
    private let apiService = PokeAPIService()
    
    func getPokemons(completion: @escaping (Result<[Pokemon], Error>) -> Void) {
        apiService.fetchPokemons { result in
            switch result {
            case .success(let dtos):
                let pokemons = dtos.enumerated().map { index, dto in
                    Pokemon(id: index + 1, name: dto.name)
                }
                completion(.success(pokemons))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
