import XCTest
@testable import pokeapp

@MainActor
final class PokemonListViewModelTests: XCTestCase {

    func testLoadPokemons_setsPokemons() async throws {
        let viewModel = PokemonListViewModel(
            getPokemonsUseCase: GetPokemonsUseCase(repository: MockPokemonRepository())
        )
        
        await viewModel.loadPokemons()
        
        XCTAssertEqual(viewModel.pokemons.count, 1)
        XCTAssertEqual(viewModel.pokemons.first?.name, "bulbasaur")
    }
}
