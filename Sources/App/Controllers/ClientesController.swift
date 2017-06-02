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
        drop.get("clientes", handler: index)
    }
    
    func index(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("clientes/clientes", parameters)
    }
    
    /// When making a controller, it is pretty flexible in that it
    /// only expects closures, this is useful for advanced scenarios, but
    /// most of the time, it should look almost identical to this
    /// implementation
    func makeResource() -> Resource<String> {
        return Resource(
            index: index
        )
    }
    
}
