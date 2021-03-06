import LeafProvider
import FluentProvider

extension Config {
    public func setup() throws {
        // allow fuzzy conversions for these types
        // (add your own types here)
        Node.fuzzy = [JSON.self, Node.self]
        try setupProviders()
        try setupPreparations()

    }
    
    /// Configure providers
    private func setupProviders() throws {
        try addProvider(LeafProvider.Provider.self)
        try addProvider(FluentProvider.Provider.self)
    }
    
    /// Add all models that should have their
    /// schemas prepared before the app boots
    private func setupPreparations() throws {
        preparations.append(Carro.self)
        preparations.append(Cidade.self)
        preparations.append(Empresa.self)
        preparations.append(Item.self)
        preparations.append(Material.self)
        preparations.append(Orcamento.self)
        preparations.append(OrcamentoProduto.self)
        preparations.append(Produto.self)
        preparations.append(Regiao.self)
        preparations.append(Servico.self)
        preparations.append(ServicoTipo.self)
        preparations.append(Status.self)
        preparations.append(Usuario.self)
        preparations.append(UsuarioTipo.self)

    }
}
