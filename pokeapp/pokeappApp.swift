import SwiftUI

@main
struct pokeappApp: App {
    var body: some Scene {
        WindowGroup {
            let repository = PokemonApiClient()
            let getPokemonsUseCase = GetPokemonsUseCase(repository: repository)
            let viewModel = PokemonListViewModel(getPokemonsUseCase: getPokemonsUseCase)
            
            PokemonListView(viewModel: viewModel)
        }
    }
}
