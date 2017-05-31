import LeafProvider

extension Config {
    public func setup() throws {
        // allow fuzzy conversions for these types
        // (add your own types here)
        Node.fuzzy = [JSON.self, Node.self]

        try setupProviders()
    }
    
    /// Configure providers
    private func setupProviders() throws {
        try addProvider(LeafProvider.Provider.self)
    }
    
    /// Add all models that should have their
    /// schemas prepared before the app boots
    private func setupPreparations() throws {
        preparations.append(Cliente.self)
        preparations.append(Empresa.self)
        preparations.append(Movel.self)
        preparations.append(MovelTipo.self)
        preparations.append(Orcamento.self)
        preparations.append(Perfil.self)
        preparations.append(Regiao.self)
        preparations.append(Servico.self)
        preparations.append(ServicoTipo.self)
        preparations.append(Usuario.self)
    }
}
