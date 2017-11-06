//
//  OrcamentoController.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import HTTP

final class OrcamentosController: ResourceRepresentable {
    let view: ViewRenderer
    init(_ view: ViewRenderer) {
        self.view = view
    }
    
    func addRoutes(drop: Droplet) {
        drop.get("orcamentos", handler: showOrcamentos)
        drop.get("orcamentos/adicionar", handler: adicionarOrcamentos)
        drop.post("orcamentos/adicionar", handler: addOrcamentos)
        drop.get("orcamentos/:orcamentoId", handler: showOrcamentosId)
        drop.get("orcamentos/:orcamentoId/editar", handler: editarOrcamentosId)
        drop.post("orcamentos/:orcamentoId/editar", handler: editOrcamentosId)
        drop.post("orcamentos/:orcamentoId/cancelar", handler: cancelOrcamentosId)
    }
    
    func showOrcamentos(request: Request) throws -> ResponseRepresentable {
        guard let usuarioCorrente = try Util.getUser(request: request)?.makeJSON() else {
            return Response(redirect: "/")
        }
        
        let orcamentosAContactatar = try Orcamento.makeQuery().filter("status_id", 1).all().makeJSON()
        let orcamentosEmNegocioacao = try Orcamento.makeQuery().filter("status_id", 2).all().makeJSON()
        let orcamentosCancelado = try Orcamento.makeQuery().filter("status_id", 3).all().makeJSON()
        let orcamentosFechado = try Orcamento.makeQuery().filter("status_id", 4).all().makeJSON()
        
        let parameters = try Node(node: [
            "usuario": usuarioCorrente,
            "o_contactar": orcamentosAContactatar,
            "o_negociacao": orcamentosEmNegocioacao,
            "o_cancelado": orcamentosCancelado,
            "o_fechado": orcamentosFechado
            ])
        return try view.make("orcamentos/orcamentos", parameters)
    }
    
    func adicionarOrcamentos(request: Request) throws -> ResponseRepresentable {
        let clientes = try Usuario.makeQuery().or({ (group) in
            try group.filter("tipo_id", 4)
            try group.filter("tipo_id", 5)
        }).all().makeJSON()
        
        let parameters = try Node(node: [
            "clientes": clientes,
            ])
        return try view.make("orcamentos/orcamentos_adicionar", parameters)
    }
    
    func addOrcamentos(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("orcamentos/orcamentos", parameters)
    }
    
    func showOrcamentosId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("orcamentos/orcamentos_id", parameters)
    }
    
    func editarOrcamentosId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("orcamentos/orcamentos_editar", parameters)
    }
    
    func editOrcamentosId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("orcamentos/orcamentos", parameters)
    }
    
    func cancelOrcamentosId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("orcamentos/orcamentos", parameters)
    }
    
    /// When making a controller, it is pretty flexible in that it
    /// only expects closures, this is useful for advanced scenarios, but
    /// most of the time, it should look almost identical to this
    /// implementation
    func makeResource() -> Resource<String> {
        return Resource(
        )
    }
    
}
