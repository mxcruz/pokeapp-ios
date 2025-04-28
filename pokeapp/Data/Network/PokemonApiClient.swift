import Foundation

final class PokemonApiClient: PokemonRepository {
    
    func fetchPokemons() async throws -> [Pokemon] {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=20")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let dto = try JSONDecoder().decode(PokemonListResponseDTO.self, from: data)
        
        return dto.results.enumerated().map { (index, item) in
            Pokemon(
                id: index + 1,
                name: item.name,
                detailURL: item.url
            )
        }
    }
    
    func fetchPokemonDetail(from url: String) async throws -> PokemonDetail {
        let url = URL(string: url)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let dto = try JSONDecoder().decode(PokemonDetailDTO.self, from: data)
        
        return PokemonDetail(
            name: dto.name,
            imageURL: dto.sprites.front_default,
            height: dto.height,
            weight: dto.weight
        )
    }
}
