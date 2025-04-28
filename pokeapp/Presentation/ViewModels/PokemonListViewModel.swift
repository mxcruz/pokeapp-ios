import Foundation

@MainActor
class PokemonListViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let getPokemonsUseCase: GetPokemonsUseCase

    init(getPokemonsUseCase: GetPokemonsUseCase) {
        self.getPokemonsUseCase = getPokemonsUseCase
    }

    func loadPokemons() async {
        isLoading = true
        do {
            pokemons = try await getPokemonsUseCase.execute()
        } catch {
            errorMessage = "Error loading pokemons"
        }
        isLoading = false
    }
}
