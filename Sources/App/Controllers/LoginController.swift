//
//  LoginController.swift
//  TecitecPackageDescription
//
//  Created by Willian Pinho on 11/5/17.
//

import Vapor
import HTTP
import BCrypt

final class LoginController: ResourceRepresentable {
    let view: ViewRenderer
    init(_ view: ViewRenderer) {
        self.view = view
    }
    
    func addRoutes(drop: Droplet) {
        drop.get("/", handler: index)
        drop.post("autenticar", handler: autenticar)
        drop.get("sair", handler: sair)

        
    }
    
    func index(request: Request) throws -> ResponseRepresentable {
        let session = try request.assertSession()
        if session.data["user_id"]?.string != nil {
            return Response(redirect: "/dashboard")
        } else {
            return try self.view.make("login/login")
        }
    }
    
    func autenticar(request: Request) throws -> ResponseRepresentable {
        guard let email = request.data["email"]?.string else {
            return try self.view.make("login/login", ["flash": "Email Necessário"])
        }
        
        guard let senha = request.data["senha"]?.string else {
            return try self.view.make("login/login", ["flash": "Senha Necessário"])
        }
        
        let user = try Usuario.makeQuery().and({ (group) in
            try group.filter("email", email)
            try group.filter("senha", senha)
        }).first()
        
        if (user != nil) {
            let session = try request.assertSession()
            session.data["user_id"] = Node.string((user?.id?.string)!)
            return Response(redirect: "/dashboard")
        } else {
            return Response(redirect: "/")
        }
    }
    
    func sair(request: Request) throws -> ResponseRepresentable {
        let session = try request.assertSession()
        session.destroy()
        return Response(redirect: "/")

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
