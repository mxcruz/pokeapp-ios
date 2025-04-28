import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel: PokemonListViewModel

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
                    
                    NavigationLink(destination: PokemonDetailView(url: pokemon.detailURL)) {
                        Text(pokemon.name.capitalized)
                    }
                }
            }
            .navigationTitle("Pokémons")
            .task {
                await viewModel.loadPokemons()
            }
        }
    }
}
