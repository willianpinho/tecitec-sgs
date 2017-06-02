//
//  HistoricoController.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import HTTP

final class HistoricoController: ResourceRepresentable {
    let view: ViewRenderer
    init(_ view: ViewRenderer) {
        self.view = view
    }
    
    func addRoutes(drop: Droplet) {
        drop.get("historico", handler: index)
    }
    
    func index(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("historico/historico", parameters)
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
