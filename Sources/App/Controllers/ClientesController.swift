//
//  ClientesController.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import HTTP

final class ClientesController: ResourceRepresentable {
    let view: ViewRenderer
    init(_ view: ViewRenderer) {
        self.view = view
    }
    
    func addRoutes(drop: Droplet) {
        drop.get("clientes", handler: showClientes)
        drop.get("clientes/adicionar", handler: adicionarClientes)
        drop.post("clientes/adicionar", handler: addClientes)
        drop.get("clientes/:clienteId", handler: showClientesId)
        drop.get("clientes/:clienteId/editar", handler: editarClientesId)
        drop.post("clientes/:clienteId/editar", handler: editClientesId)
        drop.post("clientes/:clienteId/deletar", handler: deleteClientesId)
    }
    
    
    //MARK: Rotas de Clientes
    func showClientes(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("clientes/clientes", parameters)
    }
    
    func adicionarClientes(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("clientes/clientes_adicionar", parameters)
    }
    
    func addClientes(request: Request) throws -> ResponseRepresentable {
        return Response(redirect: "/clientes")
    }
    
    func showClientesId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("clientes/clientes_id", parameters)
    }
    
    func editarClientesId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("clientes/clientes_id_editar", parameters)
    }
    
    func editClientesId(request: Request) throws -> ResponseRepresentable {
        let clienteId = request.parameters["clienteId"]?.int
        
        return Response(redirect: "/clientes/\(clienteId!)")
    }
    
    func deleteClientesId(request: Request) throws -> ResponseRepresentable {
        
        return Response(redirect: "/clientes")
    }

    
    /// When making a controller, it is pretty flexible in that it
    /// only expects closures, this is useful for advanced scenarios, but
    /// most of the time, it should look almost identical to this
    /// implementation
    func makeResource() -> Resource<String> {
        return Resource(
            index: showClientes
        )
    }
    
}
