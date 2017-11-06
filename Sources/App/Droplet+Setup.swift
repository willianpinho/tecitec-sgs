@_exported import Vapor

extension Droplet {
    public func setup() throws {
        let routes = Routes(view)
        try collection(routes)
        
        let calendario = CalendarioController(view)
        calendario.addRoutes(drop: self)
        
        let clientes = ClientesController(view)
        clientes.addRoutes(drop: self)
        
        let comissoes = ComissoesController(view)
        comissoes.addRoutes(drop: self)
        
        let configuracoes = ConfiguracoesController(view)
        configuracoes.addRoutes(drop: self)
        
        let dashboard = DashboardController(view)
        dashboard.addRoutes(drop: self)
        
        let historico = HistoricoController(view)
        historico.addRoutes(drop: self)
        
        let login = LoginController(view)
        login.addRoutes(drop: self)
        
        let orcamentos = OrcamentosController(view)
        orcamentos.addRoutes(drop: self)
        
        let relatorios = RelatoriosController(view)
        relatorios.addRoutes(drop: self)
        
        let servicos = ServicosController(view)
        servicos.addRoutes(drop: self)
        
        

        
    }
}
