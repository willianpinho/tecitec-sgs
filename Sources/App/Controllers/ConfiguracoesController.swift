//
//  ConfiguracoesController.swift
//  Tecitec
//
//  Created by Willian Pinho on 6/1/17.
//
//

import Vapor
import HTTP

final class ConfiguracoesController: ResourceRepresentable {
    let view: ViewRenderer
    init(_ view: ViewRenderer) {
        self.view = view
    }
    
    func addRoutes(drop: Droplet) {
        drop.get("configuracoes", handler: index)
        
        drop.get("configuracoes/carros", handler: showCarros)
        drop.get("configuracoes/carros/adicionar", handler: adicionarCarros)
        drop.post("configuracoes/carros/adicionar", handler: addCarros)
        drop.get("configuracoes/carros/:carroId", handler: showCarrosId)
        drop.get("configuracoes/carros/:carroId/editar", handler: editarCarrosId)
        drop.post("configuracoes/carros/:carroId/editar", handler: editCarrosId)
        drop.post("configuracoes/carros/:carroId/deletar", handler: deleteCarrosId)

        drop.get("configuracoes/cidades", handler: showCidades)
        drop.get("configuracoes/cidades/adicionar", handler: adicionarCidades)
        drop.post("configuracoes/cidades/adicionar", handler: addCidades)
        drop.get("configuracoes/cidades/:cidadeId", handler: showCidadesId)
        drop.get("configuracoes/cidades/:cidadeId/editar", handler: editarCidadesId)
        drop.post("configuracoes/cidades/:cidadeId/editar", handler: editCidadesId)
        drop.post("configuracoes/cidades/:cidadeId/deletar", handler: deleteCidadesId)
        
        drop.get("configuracoes/empresas", handler: showEmpresas)
        drop.get("configuracoes/empresas/adicionar", handler: adicionarEmpresas)
        drop.post("configuracoes/empresas/adicionar", handler: addEmpresas)
        drop.get("configuracoes/empresas/:empresaId", handler: showEmpresasId)
        drop.get("configuracoes/empresas/:empresaId/editar", handler: editarEmpresasId)
        drop.post("configuracoes/empresas/:empresaId/editar", handler: editEmpresasId)
        drop.post("configuracoes/empresas/:empresaId/deletar", handler: deleteEmpresasId)
        
        drop.get("configuracoes/itens", handler: showItens)
        drop.get("configuracoes/itens/adicionar", handler: adicionarItens)
        drop.post("configuracoes/itens/adicionar", handler: addItens)
        drop.get("configuracoes/itens/:itemId", handler: showItensId)
        drop.get("configuracoes/itens/:itemId/editar", handler: editarItensId)
        drop.post("configuracoes/itens/:itemId/editar", handler: editItensId)
        drop.post("configuracoes/itens/:itemId/deletar", handler: deleteItensId)
        
        drop.get("configuracoes/materiais", handler: showMateriais)
        drop.get("configuracoes/materiais/adicionar", handler: adicionarMateriais)
        drop.post("configuracoes/materiais/adicionar", handler: addMateriais)
        drop.get("configuracoes/materiais/:materialId", handler: showMateriaisId)
        drop.get("configuracoes/materiais/:materialId/editar", handler: editarMateriaisId)
        drop.post("configuracoes/materiais/:materialId/editar", handler: editMateriaisId)
        drop.post("configuracoes/materiais/:materialId/deletar", handler: deleteMateriaisId)
        
        drop.get("configuracoes/regioes", handler: showRegioes)
        drop.get("configuracoes/regioes/adicionar", handler: adicionarRegioes)
        drop.post("configuracoes/regioes/adicionar", handler: addRegioes)
        drop.get("configuracoes/regioes/:regiaolId", handler: showRegioesId)
        drop.get("configuracoes/regioes/:regiaolId/editar", handler: editarRegioesId)
        drop.post("configuracoes/regioes/:regiaolId/editar", handler: editRegioesId)
        drop.post("configuracoes/regioes/:regiaolId/deletar", handler: deleteRegioesId)
        
        drop.get("configuracoes/tipos-servico", handler: showTiposServico)
        drop.get("configuracoes/tipos-servico/adicionar", handler: adicionarTiposServico)
        drop.post("configuracoes/tipos-servico/adicionar", handler: addTiposServico)
        drop.get("configuracoes/tipos-servico/:tipoServicoId", handler: showTiposServicoId)
        drop.get("configuracoes/tipos-servico/:tipoServicoId/editar", handler: editarTiposServicoId)
        drop.post("configuracoes/tipos-servico/:tipoServicoId/editar", handler: editTiposServicoId)
        drop.post("configuracoes/tipos-servico/:tipoServicoId/deletar", handler: deleteTiposServicoId)
        
        drop.get("configuracoes/tipos-status", handler: showTiposStatus)
        drop.get("configuracoes/tipos-status/adicionar", handler: adicionarTiposStatus)
        drop.post("configuracoes/tipos-status/adicionar", handler: addTiposStatus)
        drop.get("configuracoes/tipos-status/:tipoStatusId", handler: showTiposStatusId)
        drop.get("configuracoes/tipos-status/:tipoStatusId/editar", handler: editarTiposStatusId)
        drop.post("configuracoes/tipos-status/:tipoStatusId/editar", handler: editTiposStatusId)
        drop.post("configuracoes/tipos-status/:tipoStatusId/deletar", handler: deleteTiposStatusId)
        
        drop.get("configuracoes/tipos-usuario", handler: showTiposUsuario)
        drop.get("configuracoes/tipos-usuario/adicionar", handler: adicionarTiposUsuario)
        drop.post("configuracoes/tipos-usuario/adicionar", handler: addTiposUsuario)
        drop.get("configuracoes/tipos-usuario/:tipoUsuarioId", handler: showTiposUsuarioId)
        drop.get("configuracoes/tipos-usuario/:tipoUsuarioId/editar", handler: editarTiposUsuarioId)
        drop.post("configuracoes/tipos-usuario/:tipoUsuarioId/editar", handler: editTiposUsuarioId)
        drop.post("configuracoes/tipos-usuario/:tipoUsuarioId/deletar", handler: deleteTiposUsuarioId)

    }
    
    func index(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/configuracoes", parameters)
    }
    
    //MARK: Rotas de Carros
    func showCarros(request: Request) throws -> ResponseRepresentable {
        let carrosObject = try Carro.all()
        var empty = true
        if carrosObject.count > 0 {
            empty = false
        }
        
        let carros = try carrosObject.makeJSON()
        
        let parameters = try Node(node: [
            "carros": carros,
            "empty": empty
            ])
        return try view.make("configuracoes/carros/carros", parameters)
    }
    
    func adicionarCarros(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/carros/carros_adicionar", parameters)
    }
    
    func addCarros(request: Request) throws -> ResponseRepresentable {
        
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let carro = Carro(nome: nome)
        try carro.save()
        
        return Response(redirect: "/configuracoes/carros")
    }
    
    func showCarrosId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/carros/carros_id", parameters)
    }
    
    func editarCarrosId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/carros/carros_id_editar", parameters)
    }
    
    func editCarrosId(request: Request) throws -> ResponseRepresentable {
        let carroId = request.parameters["carroId"]?.int

        return Response(redirect: "/configuracoes/carros/\(carroId!)")
    }
    
    func deleteCarrosId(request: Request) throws -> ResponseRepresentable {
        let carroId = request.parameters["carroId"]?.int
        let carro = try Regiao.find(carroId)
        try carro?.delete()
        
        return Response(redirect: "/configuracoes/carros")
    }
    
    //MARK: Rotas de Cidades
    func showCidades(request: Request) throws -> ResponseRepresentable {
        let cidadesObject = try Cidade.all()
        var empty = true
        if cidadesObject.count > 0 {
            empty = false
        }
        
        let cidades = try cidadesObject.makeJSON()
        
        let parameters = try Node(node: [
            "cidades": cidades,
            "empty": empty
            ])

        return try view.make("configuracoes/cidades/cidades", parameters)
    }
    
    func adicionarCidades(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/cidades/cidades_adicionar", parameters)
    }
    
    func addCidades(request: Request) throws -> ResponseRepresentable {
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        guard let regiao = request.data["regiao"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo regiao")
        }
        
        let regiaoSelecionada = try Regiao.find(regiao.int)
        let cidade = Cidade(regiao: regiaoSelecionada!, nome: nome)
        try cidade.save()
        
        return Response(redirect: "/configuracoes/cidades")
    }
    
    func showCidadesId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/cidades/cidades_id", parameters)
    }
    
    func editarCidadesId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/cidades/cidades_id_editar", parameters)
    }
    
    func editCidadesId(request: Request) throws -> ResponseRepresentable {
        let cidadeId = request.parameters["cidadeId"]?.int
        
        return Response(redirect: "/configuracoes/cidades/\(cidadeId!)")
    }
    
    func deleteCidadesId(request: Request) throws -> ResponseRepresentable {
        let cidadeId = request.parameters["cidadeId"]?.int
        let cidade = try Regiao.find(cidadeId)
        try cidade?.delete()
        
        return Response(redirect: "/configuracoes/cidades")
    }
    
    //MARK: Rotas de Empresas
    func showEmpresas(request: Request) throws -> ResponseRepresentable {
        let empresasObject = try Empresa.all()
        var empty = true
        if empresasObject.count > 0 {
            empty = false
        }
        
        let empresas = try empresasObject.makeJSON()
        
        let parameters = try Node(node: [
            "empresas": empresas,
            "empty": empty
            ])
        return try view.make("configuracoes/empresas/empresas", parameters)
    }
    
    func adicionarEmpresas(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/empresas/empresas_adicionar", parameters)
    }
    
    func addEmpresas(request: Request) throws -> ResponseRepresentable {
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        guard let cnpj = request.data["cnpj"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo cnpj")
        }
        
        let empresa = Empresa(nome: nome, cnpj: cnpj)
        try empresa.save()
        
        return Response(redirect: "/configuracoes/empresas")
    }
    
    func showEmpresasId(request: Request) throws -> ResponseRepresentable {
        let empresaId = request.parameters["empresaId"]?.int

        let empresa = try Empresa.makeQuery().filter("id", empresaId).first()?.makeJSON()
        let parameters = try Node(node: [
            "empresa": empresa,
            ])
        return try view.make("configuracoes/empresas/empresas_id", parameters)
    }
    
    func editarEmpresasId(request: Request) throws -> ResponseRepresentable {
        let empresaId = request.parameters["empresaId"]?.int
        
        let empresa = try Empresa.makeQuery().filter("id", empresaId).first()?.makeJSON()
        let parameters = try Node(node: [
            "empresa": empresa,
            ])
        return try view.make("configuracoes/empresas/empresas_id_editar", parameters)
    }
    
    func editEmpresasId(request: Request) throws -> ResponseRepresentable {
        
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        guard let cnpj = request.data["cnpj"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo cnpj")
        }
        
        let empresaId = request.parameters["empresaId"]?.int
        
        let empresa = try Empresa.find(empresaId)
        
        empresa?.nome = nome
        empresa?.cnpj = cnpj
        
        try empresa?.save()

        return Response(redirect: "/configuracoes/empresas/\(empresaId!)")
    }
    
    func deleteEmpresasId(request: Request) throws -> ResponseRepresentable {
        let empresaId = request.parameters["empresaId"]?.int

        let empresa = try Empresa.find(empresaId)
        try empresa?.delete()
        
        return Response(redirect: "/configuracoes/empresas")
    }
    
    //MARK: Rotas de Itens
    func showItens(request: Request) throws -> ResponseRepresentable {
        let itensObject = try ItemTipo.all()
        var empty = true
        if itensObject.count > 0 {
            empty = false
        }
        
        let itens = try itensObject.makeJSON()
        
        let parameters = try Node(node: [
            "itens": itens,
            "empty": empty
            ])
        return try view.make("configuracoes/itens/itens", parameters)
    }
    
    func adicionarItens(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/itens/itens_adicionar", parameters)
    }
    
    func addItens(request: Request) throws -> ResponseRepresentable {
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let item = ItemTipo(nome: nome)
        try item.save()
        
        return Response(redirect: "/configuracoes/itens")
    }
    
    func showItensId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/itens/itens_id", parameters)
    }
    
    func editarItensId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/itens/itens_id_editar", parameters)
    }
    
    func editItensId(request: Request) throws -> ResponseRepresentable {
        let itemId = request.parameters["itemId"]?.int
        
        return Response(redirect: "/configuracoes/itens/\(itemId!)")
    }
    
    func deleteItensId(request: Request) throws -> ResponseRepresentable {
        let itemId = request.parameters["itemId"]?.int
        let item = try Regiao.find(itemId)
        try item?.delete()
        
        return Response(redirect: "/configuracoes/itens")
    }
    
    //MARK: Rotas de Materiais
    func showMateriais(request: Request) throws -> ResponseRepresentable {
        let materiaisObject = try Material.all()
        var empty = true
        if materiaisObject.count > 0 {
            empty = false
        }
        
        let materiais = try materiaisObject.makeJSON()
        
        let parameters = try Node(node: [
            "materiais": materiais,
            "empty": empty
            ])
        return try view.make("configuracoes/materiais/materiais", parameters)
    }
    
    func adicionarMateriais(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/materiais/materiais_adicionar", parameters)
    }
    
    func addMateriais(request: Request) throws -> ResponseRepresentable {
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let material = Material(nome: nome)
        try material.save()
        
        return Response(redirect: "/configuracoes/materiais")
    }
    
    func showMateriaisId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/materiais/materiais_id", parameters)
    }
    
    func editarMateriaisId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/materiais/materiais_id_editar", parameters)
    }
    
    func editMateriaisId(request: Request) throws -> ResponseRepresentable {
        let materialId = request.parameters["materialId"]?.int
        
        return Response(redirect: "/configuracoes/materiais/\(materialId!)")
    }
    
    func deleteMateriaisId(request: Request) throws -> ResponseRepresentable {
        let materialId = request.parameters["materialId"]?.int
        let material = try Regiao.find(materialId)
        try material?.delete()
        
        return Response(redirect: "/configuracoes/materiais")
    }
    
    //MARK: Rotas de Regioes
    func showRegioes(request: Request) throws -> ResponseRepresentable {
        let regioesObject = try Regiao.all()
        var empty = true
        if regioesObject.count > 0 {
            empty = false
        }
        
        let regioes = try regioesObject.makeJSON()
        
        let parameters = try Node(node: [
            "regioes": regioes,
            "empty": empty
            ])
        return try view.make("configuracoes/regioes/regioes", parameters)
    }
    
    func adicionarRegioes(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/regioes/regioes_adicionar", parameters)
    }
    
    func addRegioes(request: Request) throws -> ResponseRepresentable {
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let regiao = Regiao(nome: nome)
        try regiao.save()
        
        return Response(redirect: "/configuracoes/regioes")
    }
    
    func showRegioesId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/regioes/regioes_id", parameters)
    }
    
    func editarRegioesId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/regioes/regioes_id_editar", parameters)
    }
    
    func editRegioesId(request: Request) throws -> ResponseRepresentable {
        let regiaoId = request.parameters["regiaoId"]?.int
        
        return Response(redirect: "/configuracoes/regioes/\(regiaoId!)")
    }
    
    func deleteRegioesId(request: Request) throws -> ResponseRepresentable {
        let regiaoId = request.parameters["regiaoId"]?.int
        let regiao = try Regiao.find(regiaoId)
        try regiao?.delete()
        
        return Response(redirect: "/configuracoes/regioes")
    }
    
    //MARK: Rotas de TiposServico
    func showTiposServico(request: Request) throws -> ResponseRepresentable {
        let tiposServicoObject = try ServicoTipo.all()
        var empty = true
        if tiposServicoObject.count > 0 {
            empty = false
        }
        
        let tiposServico = try tiposServicoObject.makeJSON()
        
        let parameters = try Node(node: [
            "tipos_servico": tiposServico,
            "empty": empty
            ])
        return try view.make("configuracoes/tipos_servico/tipos_servico", parameters)
    }
    
    func adicionarTiposServico(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/tipos_servico/tipos_servico_adicionar", parameters)
    }
    
    func addTiposServico(request: Request) throws -> ResponseRepresentable {
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        guard let descricao = request.data["descricao"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo descicao")
        }
        
        let tipoServico = ServicoTipo(nome: nome, descricao: descricao)
        try tipoServico.save()
        
        return Response(redirect: "/configuracoes/tipos-servico")
    }
    
    func showTiposServicoId(request: Request) throws -> ResponseRepresentable {
        let tipoServicoId = request.parameters["tipoServicoId"]?.int
        
        let tipoServico = try ServicoTipo.makeQuery().filter("id", tipoServicoId).first()?.makeJSON()
        let parameters = try Node(node: [
            "tipo_servico": tipoServico,
            ])

        return try view.make("configuracoes/tipos_servico/tipos_servico_id", parameters)
    }
    
    func editarTiposServicoId(request: Request) throws -> ResponseRepresentable {
        let tipoServicoId = request.parameters["tipoServicoId"]?.int
        
        let tipoServico = try ServicoTipo.makeQuery().filter("id", tipoServicoId).first()?.makeJSON()
        let parameters = try Node(node: [
            "tipo_servico": tipoServico,
            ])

        return try view.make("configuracoes/tipos_servico/tipos_servico_id_editar", parameters)
    }
    
    func editTiposServicoId(request: Request) throws -> ResponseRepresentable {
        let tipoServicoId = request.parameters["tipoServicoId"]?.int
        
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        guard let descricao = request.data["descricao"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo descricao")
        }
        
        let tipoServico = try ServicoTipo.find(tipoServicoId)
        
        tipoServico?.nome = nome
        tipoServico?.descricao = descricao
        
        try tipoServico?.save()

        
        return Response(redirect: "/configuracoes/tipos-servico/\(tipoServicoId!)")
    }
    
    func deleteTiposServicoId(request: Request) throws -> ResponseRepresentable {
        let tipoServicoId = request.parameters["tipoServicoId"]?.int
        let tipoServico = try ServicoTipo.find(tipoServicoId)
        try tipoServico?.delete()

        return Response(redirect: "/configuracoes/tipos-servico")
    }
    
    //MARK: Rotas de TiposStatus
    func showTiposStatus(request: Request) throws -> ResponseRepresentable {
        let statusObject = try Status.all()
        var empty = true
        if statusObject.count > 0 {
            empty = false
        }
        
        let status = try statusObject.makeJSON()
        
        let parameters = try Node(node: [
            "status": status,
            "empty": empty
            ])
        return try view.make("configuracoes/tipos_status/tipos_status", parameters)
    }
    
    func adicionarTiposStatus(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/tipos_status/tipos_status_adicionar", parameters)
    }
    
    func addTiposStatus(request: Request) throws -> ResponseRepresentable {
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let tipoStatus = Status(nome: nome)
        try tipoStatus.save()
        
        return Response(redirect: "/configuracoes/tipos-status")
    }
    
    func showTiposStatusId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/tipos_status/tipos_status_id", parameters)
    }
    
    func editarTiposStatusId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/tipos_status/tipos_status_id_editar", parameters)
    }
    
    func editTiposStatusId(request: Request) throws -> ResponseRepresentable {
        let tipoStatusId = request.parameters["tipoStatusId"]?.int
        
        return Response(redirect: "/configuracoes/tipos-status/\(tipoStatusId!)")
    }
    
    func deleteTiposStatusId(request: Request) throws -> ResponseRepresentable {
        let tipoStatusId = request.parameters["tipoStatusId"]?.int
        let tipoStatus = try Status.find(tipoStatusId)
        try tipoStatus?.delete()
        
        return Response(redirect: "/configuracoes/tipos-status")
    }
    
    //MARK: Rotas de TiposUsuario
    func showTiposUsuario(request: Request) throws -> ResponseRepresentable {
        let tiposUsuarioObject = try UsuarioTipo.all()
        var empty = true
        if tiposUsuarioObject.count > 0 {
            empty = false
        }
        
        let tiposUsuario = try tiposUsuarioObject.makeJSON()
        
        let parameters = try Node(node: [
            "tipos_usuario": tiposUsuario,
            "empty": empty
            ])
        return try view.make("configuracoes/tipos_usuario/tipos_usuario", parameters)
    }
    
    func adicionarTiposUsuario(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/tipos_usuario/tipos_usuario_adicionar", parameters)
    }
    
    func addTiposUsuario(request: Request) throws -> ResponseRepresentable {
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let tipoUsuario = UsuarioTipo(nome: nome)
        try tipoUsuario.save()
        
        return Response(redirect: "/configuracoes/tipos-usuario")
    }
    
    func showTiposUsuarioId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/tipos_usuario/tipos_usuario_id", parameters)
    }
    
    func editarTiposUsuarioId(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/tipos_usuario/tipos_usuario_id_editar", parameters)
    }
    
    func editTiposUsuarioId(request: Request) throws -> ResponseRepresentable {
        let tipoUsuarioId = request.parameters["tipoUsuarioId"]?.int
        
        return Response(redirect: "/configuracoes/tipos-usuario/\(tipoUsuarioId!)")
    }
    
    func deleteTiposUsuarioId(request: Request) throws -> ResponseRepresentable {
        let tipoUsuarioId = request.parameters["tipoUsuarioId"]?.int
        let tipoUsuario = try UsuarioTipo.find(tipoUsuarioId)
        try tipoUsuario?.delete()
        
        return Response(redirect: "/configuracoes/tipos-usuario")
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
