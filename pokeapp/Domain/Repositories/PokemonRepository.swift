protocol PokemonRepository {
    func fetchPokemons() async throws -> [Pokemon]
    func fetchPokemonDetail(from url: String) async throws -> PokemonDetail
}
