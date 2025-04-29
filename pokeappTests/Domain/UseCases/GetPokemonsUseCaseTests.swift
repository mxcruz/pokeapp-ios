import XCTest
@testable import pokeapp

final class GetPokemonsUseCaseTests: XCTestCase {

    func testExecute_returnsPokemons() async throws {
        let useCase = GetPokemonsUseCase(repository: MockPokemonRepository())
        let result = try await useCase.execute()

        XCTAssertEqual(result.count, 1)
        XCTAssertEqual(result.first?.name, "bulbasaur")
    }
}
