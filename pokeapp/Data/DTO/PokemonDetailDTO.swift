struct PokemonDetailDTO: Codable {
    let name: String
    let height: Int
    let weight: Int
    let sprites: SpritesDTO

    struct SpritesDTO: Codable {
        let front_default: String?
    }
}
