import SwiftUI

struct PokemonDetailView: View {
    let url: String
    @StateObject private var viewModel = PokemonDetailViewModel(
        getPokemonDetailUseCase: GetPokemonDetailUseCase(
            repository: PokemonApiClient()
        )
    )

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
            } else if let detail = viewModel.pokemonDetail {
                
                if let imageUrl = detail.imageURL, let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        ProgressView()
                    }
                    
                }
                
                Text(detail.name.capitalized)
                    .font(.largeTitle)
                    .padding()
                
                Text("Height: \(detail.height)")
                Text("Weight: \(detail.weight)")
            } else if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
            }
        }
        .task {
            await viewModel.loadPokemonDetail(url: url)
        }
    }
}

