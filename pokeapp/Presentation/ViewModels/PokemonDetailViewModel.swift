import Foundation

@MainActor
class PokemonDetailViewModel: ObservableObject {
    @Published var pokemonDetail: PokemonDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let getPokemonDetailUseCase: GetPokemonDetailUseCase

    init(getPokemonDetailUseCase: GetPokemonDetailUseCase) {
        self.getPokemonDetailUseCase = getPokemonDetailUseCase
    }

    func loadPokemonDetail(url: String) async {
        isLoading = true
        do {
            pokemonDetail = try await getPokemonDetailUseCase.execute(url: url)
        } catch {
            errorMessage = "Error loading detail"
        }
        isLoading = false
    }
}
