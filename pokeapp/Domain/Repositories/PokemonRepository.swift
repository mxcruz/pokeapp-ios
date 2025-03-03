import Foundation

protocol PokemonRepository {
    func getPokemons(completion: @escaping (Result<[Pokemon], Error>) -> Void)
}
