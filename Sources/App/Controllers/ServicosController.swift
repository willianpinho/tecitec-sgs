//
//  ServicosController.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import HTTP

final class ServicosController: ResourceRepresentable {
    let view: ViewRenderer
    init(_ view: ViewRenderer) {
        self.view = view
    }
    
    func addRoutes(drop: Droplet) {
        drop.get("servicos", handler: showServicos)
        drop.get("servicos/adicionar", handler: adicionarServicos)
        drop.post("servicos/adicionar", handler: addServicos)
        drop.get("servicos/:servicoId", handler: showServicosId)
        drop.get("servicos/:servicoId/editar", handler: editarServicosId)
        drop.post("servicos/:servicoId/editar", handler: editServicosId)
        drop.post("servicos/:servicoId/deletar", handler: deleteServicosId)
    }
    
    
    //MARK: Rotas de Servicos
    func showServicos(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("servicos/servicos", parameters)
    }
    
    func adicionarServicos(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("servicos/servicos_adicionar", parameters)
    }
    
    func addServicos(request: Request) throws -> ResponseRepresentable {
        return Response(redirect: "/servicos")
    }
    
    func showServicosId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("servicos/servicos_id", parameters)
    }
    
    func editarServicosId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("servicos/servicos_id_editar", parameters)
    }
    
    func editServicosId(request: Request) throws -> ResponseRepresentable {
        let servicoId = request.parameters["servicoId"]?.int
        
        return Response(redirect: "/servicos/\(servicoId!)")
    }
    
    func deleteServicosId(request: Request) throws -> ResponseRepresentable {
        
        return Response(redirect: "/servicos")
    }
    /// When making a controller, it is pretty flexible in that it
    /// only expects closures, this is useful for advanced scenarios, but
    /// most of the time, it should look almost identical to this
    /// implementation
    func makeResource() -> Resource<String> {
        return Resource(
            index: showServicos
        )
    }
    
}
