struct GetPokemonsUseCase {
    let repository: PokemonRepository

    func execute() async throws -> [Pokemon] {
        try await repository.fetchPokemons()
    }
}
