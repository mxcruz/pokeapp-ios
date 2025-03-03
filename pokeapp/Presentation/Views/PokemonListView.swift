import SwiftUI

struct PokemonListView: View {
    @StateObject private var viewModel = PokemonListViewModel(
        getPokemonsUseCase: GetPokemonsUseCase(repository: PokemonRepositoryImpl())
    )
    
    var body: some View {
        NavigationView {
            List(viewModel.pokemons) { pokemon in
                HStack {
                    AsyncImage(url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemon.id).png")) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 50, height: 50)
                    
                    Text(pokemon.name.capitalized)
                        .font(.headline)
                }
            }
            .onAppear {
                viewModel.loadPokemons()
            }
            .navigationTitle("Pokémon List")
        }
    }
}
