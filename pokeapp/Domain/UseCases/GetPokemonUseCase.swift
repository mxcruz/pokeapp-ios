struct GetPokemonDetailUseCase {
    let repository: PokemonRepository

    func execute(url: String) async throws -> PokemonDetail {
        try await repository.fetchPokemonDetail(from: url)
    }
}
