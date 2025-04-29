import XCTest
@testable import pokeapp

class MockPokemonRepository: PokemonRepository {
    func fetchPokemons() async throws -> [Pokemon] {
        return [
            Pokemon(id: 0, name: "bulbasaur", detailURL: "https://pokeapi.co/api/v2/pokemon/1/")
        ]
    }

    func fetchPokemonDetail(from url: String) async throws -> PokemonDetail {
        return PokemonDetail(name: "bulbasaur", imageURL: nil, height: 7, weight: 69)
    }
}
