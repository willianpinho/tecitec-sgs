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
        
        drop.get("configuracoes/produtos", handler: showProdutos)
        drop.get("configuracoes/produtos/adicionar", handler: adicionarProdutos)
        drop.post("configuracoes/produtos/adicionar", handler: addProdutos)
        drop.get("configuracoes/produtos/:produtoId", handler: showProdutosId)
        drop.get("configuracoes/produtos/:produtoId/editar", handler: editarProdutosId)
        drop.post("configuracoes/produtos/:produtoId/editar", handler: editProdutosId)
        drop.post("configuracoes/produtos/:produtoId/deletar", handler: deleteProdutosId)
        
        
        drop.get("configuracoes/regioes", handler: showRegioes)
        drop.get("configuracoes/regioes/adicionar", handler: adicionarRegioes)
        drop.post("configuracoes/regioes/adicionar", handler: addRegioes)
        drop.get("configuracoes/regioes/:regiaoId", handler: showRegioesId)
        drop.get("configuracoes/regioes/:regiaoId/editar", handler: editarRegioesId)
        drop.post("configuracoes/regioes/:regiaoId/editar", handler: editRegioesId)
        drop.post("configuracoes/regioes/:regiaoId/deletar", handler: deleteRegioesId)
        
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
        
        drop.get("configuracoes/tipos-cliente", handler: showTiposCliente)
        drop.get("configuracoes/tipos-cliente/adicionar", handler: adicionarTiposCliente)
        drop.post("configuracoes/tipos-cliente/adicionar", handler: addTiposCliente)
        drop.get("configuracoes/tipos-cliente/:tipoClienteId", handler: showTiposClienteId)
        drop.get("configuracoes/tipos-cliente/:tipoClienteId/editar", handler: editarTiposClienteId)
        drop.post("configuracoes/tipos-cliente/:tipoClienteId/editar", handler: editTiposClienteId)
        drop.post("configuracoes/tipos-cliente/:tipoClienteId/deletar", handler: deleteTiposClienteId)
        
        drop.get("configuracoes/colaboradores", handler: showColaboradores)
        drop.get("configuracoes/colaboradores/adicionar", handler: adicionarColaboradores)
        drop.post("configuracoes/colaboradores/adicionar", handler: addColaboradores)
        drop.get("configuracoes/colaboradores/:colaboradorId", handler: showColaboradoresId)
        drop.get("configuracoes/colaboradores/:colaboradorId/editar", handler: editarColaboradoresId)
        drop.post("configuracoes/colaboradores/:colaboradorId/editar", handler: editColaboradoresId)
        drop.post("configuracoes/colaboradores/:colaboradorId/deletar", handler: deleteColaboradoresId)

        
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
        let carroId = request.parameters["carroId"]?.int
        
        let carro = try Carro.makeQuery().filter("id", carroId).first()?.makeJSON()
        let parameters = try Node(node: [
            "carro": carro,
            ])
        return try view.make("configuracoes/carros/carros_id", parameters)
    }
    
    func editarCarrosId(request: Request) throws -> ResponseRepresentable {
        let carroId = request.parameters["carroId"]?.int
        
        let carro = try Carro.makeQuery().filter("id", carroId).first()?.makeJSON()
        let parameters = try Node(node: [
            "carro": carro,
            ])
        return try view.make("configuracoes/carros/carros_id_editar", parameters)
    }
    
    func editCarrosId(request: Request) throws -> ResponseRepresentable {
        let carroId = request.parameters["carroId"]?.int
        
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let carro = try Carro.find(carroId)
        carro?.nome = nome
        
        try carro?.save()

        return Response(redirect: "/configuracoes/carros/\(carroId!)")
    }
    
    func deleteCarrosId(request: Request) throws -> ResponseRepresentable {
        let carroId = request.parameters["carroId"]?.int
        let carro = try Carro.find(carroId)
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
        let regioes = try Regiao.all().makeJSON()
        
        let parameters = try Node(node: [
            "regioes": regioes,
    
            ])
        
        return try view.make("configuracoes/cidades/cidades_adicionar", parameters)
    }
    
    func addCidades(request: Request) throws -> ResponseRepresentable {
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        guard let regiao = request.data["regiao_id"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo regiao")
        }
        
        let regiaoSelecionada = try Regiao.find(regiao.int)
        
        let cidade = Cidade(regiao: regiaoSelecionada!, nome: nome)
        try cidade.save()
        
        return Response(redirect: "/configuracoes/cidades")
    }
    
    func showCidadesId(request: Request) throws -> ResponseRepresentable {
        let cidadeId = request.parameters["cidadeId"]?.int
        
        let cidade = try Cidade.makeQuery().filter("id", cidadeId).first()?.makeJSON()
        let parameters = try Node(node: [
            "cidade": cidade,
            ])
        return try view.make("configuracoes/cidades/cidades_id", parameters)
    }
    
    func editarCidadesId(request: Request) throws -> ResponseRepresentable {
        let cidadeId = request.parameters["cidadeId"]?.int
        
        let cidade = try Cidade.makeQuery().filter("id", cidadeId).first()?.makeJSON()
        
        let regioes = try Regiao.all().makeJSON()

        let parameters = try Node(node: [
            "cidade": cidade,
            "regioes": regioes
            ])
        return try view.make("configuracoes/cidades/cidades_id_editar", parameters)
    }
    
    func editCidadesId(request: Request) throws -> ResponseRepresentable {
        let cidadeId = request.parameters["cidadeId"]?.int
        
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        guard let regiao = request.data["regiao_id"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo regiao")
        }
        let regiaoSelecionada = try Regiao.find(regiao.int)

        let cidade = try Cidade.find(cidadeId)
        cidade?.nome = nome
        cidade?.regiao = regiaoSelecionada?.id
        
        try cidade?.save()

        
        return Response(redirect: "/configuracoes/cidades/\(cidadeId!)")
    }
    
    func deleteCidadesId(request: Request) throws -> ResponseRepresentable {
        let cidadeId = request.parameters["cidadeId"]?.int
        let cidade = try Cidade.find(cidadeId)
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
        let itensObject = try Item.all()
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
        
        let item = Item(nome: nome)
        try item.save()
        
        return Response(redirect: "/configuracoes/itens")
    }
    
    func showItensId(request: Request) throws -> ResponseRepresentable {
        let itemId = request.parameters["itemId"]?.int
        
        let item = try Item.makeQuery().filter("id", itemId).first()?.makeJSON()
        let parameters = try Node(node: [
            "item": item,
            ])

        return try view.make("configuracoes/itens/itens_id", parameters)
    }
    
    func editarItensId(request: Request) throws -> ResponseRepresentable {
        let itemId = request.parameters["itemId"]?.int
        
        let item = try Item.makeQuery().filter("id", itemId).first()?.makeJSON()
        let parameters = try Node(node: [
            "item": item,
            ])
        return try view.make("configuracoes/itens/itens_id_editar", parameters)
    }
    
    func editItensId(request: Request) throws -> ResponseRepresentable {
        let itemId = request.parameters["itemId"]?.int
        
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let item = try Item.find(itemId)
        item?.nome = nome
        
        try item?.save()
        
        
        return Response(redirect: "/configuracoes/itens/\(itemId!)")
    }
    
    func deleteItensId(request: Request) throws -> ResponseRepresentable {
        let itemId = request.parameters["itemId"]?.int
        let item = try Item.find(itemId)
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
        let materialId = request.parameters["materialId"]?.int
        
        let material = try Material.makeQuery().filter("id", materialId).first()?.makeJSON()
        let parameters = try Node(node: [
            "material": material,
            ])
        return try view.make("configuracoes/materiais/materiais_id", parameters)
    }
    
    func editarMateriaisId(request: Request) throws -> ResponseRepresentable {
        let materialId = request.parameters["materialId"]?.int
        
        let material = try Material.makeQuery().filter("id", materialId).first()?.makeJSON()
        let parameters = try Node(node: [
            "material": material,
            ])
        return try view.make("configuracoes/materiais/materiais_id_editar", parameters)
    }
    
    func editMateriaisId(request: Request) throws -> ResponseRepresentable {
        let materialId = request.parameters["materialId"]?.int
        
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let material = try Material.find(materialId)
        
        material?.nome = nome
        try material?.save()
        
        return Response(redirect: "/configuracoes/materiais/\(materialId!)")
    }
    
    func deleteMateriaisId(request: Request) throws -> ResponseRepresentable {
        let materialId = request.parameters["materialId"]?.int
        let material = try Material.find(materialId)
        try material?.delete()
        
        return Response(redirect: "/configuracoes/materiais")
    }
    
    //MARK: Rotas de Produtos
    func showProdutos(request: Request) throws -> ResponseRepresentable {
        let produtosObject = try Produto.all()
        var empty = true
        if produtosObject.count > 0 {
            empty = false
        }
        
        let produtos = try produtosObject.makeJSON()
        
        let parameters = try Node(node: [
            "produtos": produtos,
            "empty": empty
            ])
        return try view.make("configuracoes/produtos/produtos", parameters)
    }
    
    func adicionarProdutos(request: Request) throws -> ResponseRepresentable {
        let tipoServicos = try ServicoTipo.all().makeJSON()
        let itens = try Item.all().makeJSON()
        
        let parameters = try Node(node: [
            "tipos": tipoServicos,
            "itens": itens
            ])
        return try view.make("configuracoes/produtos/produtos_adicionar", parameters)
    }
    
    func addProdutos(request: Request) throws -> ResponseRepresentable {
        guard let tipoServicoId = request.data["tipo_servico_id"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo Tipo de Serviço")
        }
        
        guard let itemId = request.data["item_id"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo item")
        }
        
        guard let custo = request.data["custo"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo custo")
        }
        
        guard let preco = request.data["preco"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo preco")
        }
        
        let custoDouble = Util.formatStringCurrency(currency: custo)
        let precoDouble = Util.formatStringCurrency(currency: preco)

        
        let tipoServico = try ServicoTipo.find(tipoServicoId.int)
        let item = try Item.find(itemId.int)
        
        let produto = Produto(tipoServico: tipoServico!, item: item!, custo: custoDouble, preco: precoDouble)
        try produto.save()
        
        return Response(redirect: "/configuracoes/produtos")
    }
    
    func showProdutosId(request: Request) throws -> ResponseRepresentable {
        let produtoId = request.parameters["produtoId"]?.int
        
        let produto = try Produto.makeQuery().filter("id", produtoId).first()?.makeJSON()
        let parameters = try Node(node: [
            "produto": produto,
            ])
        
        return try view.make("configuracoes/produtos/produtos_id", parameters)
    }
    
    func editarProdutosId(request: Request) throws -> ResponseRepresentable {
        let produtoId = request.parameters["produtoId"]?.int
        
        let tipoServicos = try ServicoTipo.all().makeJSON()
        let itens = try Item.all().makeJSON()
        let produto = try Produto.makeQuery().filter("id", produtoId).first()?.makeJSON()

        let parameters = try Node(node: [
            "tipos": tipoServicos,
            "itens": itens,
            "produto": produto,

            ])
        return try view.make("configuracoes/produtos/produtos_id_editar", parameters)
    }
    
    func editProdutosId(request: Request) throws -> ResponseRepresentable {
        let produtoId = request.parameters["produtoId"]?.int
        
        guard let tipoServicoId = request.data["tipo_servico_id"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo Tipo de Serviço")
        }
        
        guard let itemId = request.data["item_id"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo item")
        }
        
        guard let custo = request.data["custo"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo custo")
        }
        
        guard let preco = request.data["preco"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo preco")
        }
        
        let tipoServico = try ServicoTipo.find(tipoServicoId.int)
        let item = try Item.find(itemId.int)
        
        let produto = try Produto.find(produtoId)
        produto?.tipoServico = tipoServico?.id
        produto?.item = item?.id
        produto?.custo = Double(custo)!
        produto?.preco = Double(preco)!
        
        try produto?.save()
        
        
        return Response(redirect: "/configuracoes/produtos/\(produtoId!)")
    }
    
    func deleteProdutosId(request: Request) throws -> ResponseRepresentable {
        let produtoId = request.parameters["produtoId"]?.int
        let produto = try Produto.find(produtoId)
        try produto?.delete()
        
        return Response(redirect: "/configuracoes/produtos")
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
        let regiaoId = request.parameters["regiaoId"]?.int
        
        let regiao = try Regiao.makeQuery().filter("id", regiaoId).first()?.makeJSON()
        let parameters = try Node(node: [
            "regiao": regiao,
            ])
        return try view.make("configuracoes/regioes/regioes_id", parameters)
    }
    
    func editarRegioesId(request: Request) throws -> ResponseRepresentable {
        let regiaoId = request.parameters["regiaoId"]?.int
        
        let regiao = try Regiao.makeQuery().filter("id", regiaoId).first()?.makeJSON()
        let parameters = try Node(node: [
            "regiao": regiao,
            ])
        return try view.make("configuracoes/regioes/regioes_id_editar", parameters)
    }
    
    func editRegioesId(request: Request) throws -> ResponseRepresentable {
        let regiaoId = request.parameters["regiaoId"]?.int
        
        
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let regiao = try Regiao.find(regiaoId)
        regiao?.nome = nome
        
        try regiao?.save()
        
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
            "tipos_status": status,
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
        let tipoStatusId = request.parameters["tipoStatusId"]?.int
        
        let tipoStatus = try Status.makeQuery().filter("id", tipoStatusId).first()?.makeJSON()
        let parameters = try Node(node: [
            "tipo_status": tipoStatus,
            ])
        return try view.make("configuracoes/tipos_status/tipos_status_id", parameters)
    }
    
    func editarTiposStatusId(request: Request) throws -> ResponseRepresentable {
        let tipoStatusId = request.parameters["tipoStatusId"]?.int
        
        let tipoStatus = try Status.makeQuery().filter("id", tipoStatusId).first()?.makeJSON()
        let parameters = try Node(node: [
            "tipo_status": tipoStatus,
            ])
        return try view.make("configuracoes/tipos_status/tipos_status_id_editar", parameters)
    }
    
    func editTiposStatusId(request: Request) throws -> ResponseRepresentable {
        let tipoStatusId = request.parameters["tipoStatusId"]?.int
        
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let status = try Status.find(tipoStatusId)
        status?.nome = nome
        
        try status?.save()
        
        
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
        let tipoUsuarioId = request.parameters["tipoUsuarioId"]?.int
        
        let tipoUsuario = try UsuarioTipo.makeQuery().filter("id", tipoUsuarioId).first()?.makeJSON()
        let parameters = try Node(node: [
            "tipo_usuario": tipoUsuario,
            ])
        return try view.make("configuracoes/tipos_usuario/tipos_usuario_id", parameters)
    }
    
    func editarTiposUsuarioId(request: Request) throws -> ResponseRepresentable {
        let tipoUsuarioId = request.parameters["tipoUsuarioId"]?.int
        
        let tipoUsuario = try UsuarioTipo.makeQuery().filter("id", tipoUsuarioId).first()?.makeJSON()
        let parameters = try Node(node: [
            "tipo_usuario": tipoUsuario,
            ])
        return try view.make("configuracoes/tipos_usuario/tipos_usuario_id_editar", parameters)
    }
    
    func editTiposUsuarioId(request: Request) throws -> ResponseRepresentable {
        let tipoUsuarioId = request.parameters["tipoUsuarioId"]?.int
        
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let tipoUsuario = try UsuarioTipo.find(tipoUsuarioId)
        tipoUsuario?.nome = nome
        
        try tipoUsuario?.save()
        
        return Response(redirect: "/configuracoes/tipos-usuario/\(tipoUsuarioId!)")
    }
    
    func deleteTiposUsuarioId(request: Request) throws -> ResponseRepresentable {
        let tipoUsuarioId = request.parameters["tipoUsuarioId"]?.int
        let tipoUsuario = try UsuarioTipo.find(tipoUsuarioId)
        try tipoUsuario?.delete()
        
        return Response(redirect: "/configuracoes/tipos-usuario")
    }
    
    //MARK: Rotas de TiposCliente
    func showTiposCliente(request: Request) throws -> ResponseRepresentable {
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
    
    func adicionarTiposCliente(request: Request) throws -> ResponseRepresentable {
        let parameters = try Node(node: [
            
            ])
        return try view.make("configuracoes/tipos_usuario/tipos_usuario_adicionar", parameters)
    }
    
    func addTiposCliente(request: Request) throws -> ResponseRepresentable {
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let tipoUsuario = UsuarioTipo(nome: nome)
        try tipoUsuario.save()
        
        return Response(redirect: "/configuracoes/tipos-usuario")
    }
    
    func showTiposClienteId(request: Request) throws -> ResponseRepresentable {
        let tipoUsuarioId = request.parameters["tipoUsuarioId"]?.int
        
        let tipoUsuario = try UsuarioTipo.makeQuery().filter("id", tipoUsuarioId).first()?.makeJSON()
        let parameters = try Node(node: [
            "tipo_usuario": tipoUsuario,
            ])
        return try view.make("configuracoes/tipos_usuario/tipos_usuario_id", parameters)
    }
    
    func editarTiposClienteId(request: Request) throws -> ResponseRepresentable {
        let tipoUsuarioId = request.parameters["tipoUsuarioId"]?.int
        
        let tipoUsuario = try UsuarioTipo.makeQuery().filter("id", tipoUsuarioId).first()?.makeJSON()
        let parameters = try Node(node: [
            "tipo_usuario": tipoUsuario,
            ])
        return try view.make("configuracoes/tipos_usuario/tipos_usuario_id_editar", parameters)
    }
    
    func editTiposClienteId(request: Request) throws -> ResponseRepresentable {
        let tipoUsuarioId = request.parameters["tipoUsuarioId"]?.int
        
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        let tipoUsuario = try UsuarioTipo.find(tipoUsuarioId)
        tipoUsuario?.nome = nome
        
        try tipoUsuario?.save()
        
        return Response(redirect: "/configuracoes/tipos-usuario/\(tipoUsuarioId!)")
    }
    
    func deleteTiposClienteId(request: Request) throws -> ResponseRepresentable {
        let tipoUsuarioId = request.parameters["tipoUsuarioId"]?.int
        let tipoUsuario = try UsuarioTipo.find(tipoUsuarioId)
        try tipoUsuario?.delete()
        
        return Response(redirect: "/configuracoes/tipos-usuario")
    }
    
    // MARK: Rotas de Colaboradores
    func showColaboradores(request: Request) throws -> ResponseRepresentable {
        let colaboradores = try Usuario.makeQuery().or({ (group) in
            try group.filter("tipo_id", 1)
            try group.filter("tipo_id", 2)
            try group.filter("tipo_id", 3)

        }).all().makeJSON()
        
        let parameters = try Node(node: [
            "colaboradores": colaboradores
            ])
        
        return try view.make("configuracoes/colaboradores/colaboradores", parameters)
    }
    
    func adicionarColaboradores(request: Request) throws -> ResponseRepresentable {
        let tipos = try UsuarioTipo.makeQuery().or({ (group) in
            try group.filter("id", 1)
            try group.filter("id", 2)
            try group.filter("id", 3)
        }).all().makeJSON()
        
        let cidades = try Cidade.makeQuery().all().makeJSON()
        
        let parameters = try Node(node: [
            "tipos": tipos,
            "cidades": cidades
            ])
        return try view.make("configuracoes/colaboradores/colaboradores_adicionar", parameters)
    }
    
    func addColaboradores(request: Request) throws -> ResponseRepresentable {
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        guard let documento = request.data["documento"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo documento")
        }
        
        guard let endereco = request.data["endereco"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo endereco")
            
        }
        
        guard let complemento = request.data["complemento"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo complemento")
        }
        
        guard let cep = request.data["cep"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo cep")
        }
        
        guard let celular = request.data["celular"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo celular")
        }
        
        guard let telefone = request.data["telefone"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo telefone")
        }
        
        guard let dataNascimento = request.data["data_nascimento"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo data nascimneto")
        }
        
        guard let observacoes = request.data["observacoes"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo observacoes")
        }
        
        guard let email = request.data["email"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo email")
        }
        
        guard let cidadeId = request.data["cidade_id"]?.int else {
            throw Abort(.badRequest, reason: "Sem campo cidade")
        }
        
        guard let usuarioTipoId = request.data["tipo_id"]?.int else {
            throw Abort(.badRequest, reason: "Sem campo tipo")
        }
        
        let cidade = try Cidade.find(cidadeId)
        let usuarioTipo = try UsuarioTipo.find(usuarioTipoId)
        let status = try Status.makeQuery().filter("nome", "Ativo").first()
        
        let colaborador = Usuario(nome: nome, documento: documento, endereco: endereco, complemento: complemento, cidade: cidade!, cep: cep, celular: celular, telefone: telefone, dataNascimento: dataNascimento, observacoes: observacoes, tipo: usuarioTipo!, email: email, senha: "tecitec", status: status!)
        
        try colaborador.save()
        
        return Response(redirect: "/configuracoes/colaboradores")
    }
    
    func showColaboradoresId(request: Request) throws -> ResponseRepresentable {
        let colaboradorId = request.parameters["colaboradorId"]?.int
        let colaborador = try Usuario.find(colaboradorId)?.makeJSON()
        let parameters = try Node(node: [
            "colaborador": colaborador
            ])
        return try view.make("configuracoes/colaboradores/colaboradores_id", parameters)
    }
    
    func editarColaboradoresId(request: Request) throws -> ResponseRepresentable {
        let colaboradorId = request.parameters["colaboradorId"]?.int
        let colaborador = try Usuario.find(colaboradorId)?.makeJSON()
        
        let tipos = try UsuarioTipo.makeQuery().or({ (group) in
            try group.filter("id", 1)
            try group.filter("id", 2)
            try group.filter("id", 3)
        }).all().makeJSON()
        
        let cidades = try Cidade.makeQuery().all().makeJSON()
        
        let parameters = try Node(node: [
            "tipos": tipos,
            "cidades": cidades,
            "colaborador": colaborador
            ])
        
        return try view.make("configuracoes/colaboradores/colaboradores_id_editar", parameters)
    }
    
    func editColaboradoresId(request: Request) throws -> ResponseRepresentable {
        let colaboradorId = request.parameters["colaboradorId"]?.int
        let colaborador = try Usuario.find(colaboradorId)
        guard let nome = request.data["nome"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo nome")
        }
        
        guard let documento = request.data["documento"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo documento")
        }
        
        guard let endereco = request.data["endereco"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo endereco")
            
        }
        
        guard let complemento = request.data["complemento"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo complemento")
        }
        
        guard let cep = request.data["cep"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo cep")
        }
        
        guard let celular = request.data["celular"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo celular")
        }
        
        guard let telefone = request.data["telefone"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo telefone")
        }
        
        guard let dataNascimento = request.data["data_nascimento"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo data nascimneto")
        }
        
        guard let observacoes = request.data["observacoes"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo observacoes")
        }
        
        guard let email = request.data["email"]?.string else {
            throw Abort(.badRequest, reason: "Sem campo email")
        }
        
        guard let cidadeId = request.data["cidade_id"]?.int else {
            throw Abort(.badRequest, reason: "Sem campo cidade")
        }
        
        guard let usuarioTipoId = request.data["tipo_id"]?.int else {
            throw Abort(.badRequest, reason: "Sem campo tipo")
        }
        
        let cidade = try Cidade.find(cidadeId)
        let usuarioTipo = try UsuarioTipo.find(usuarioTipoId)
        
        colaborador?.nome = nome
        colaborador?.documento = documento
        colaborador?.endereco = endereco
        colaborador?.complemento = complemento
        colaborador?.cidade = cidade?.id
        colaborador?.cep = cep
        colaborador?.celular = celular
        colaborador?.telefone = telefone
        colaborador?.dataNascimento = dataNascimento
        colaborador?.observacoes = observacoes
        colaborador?.tipo = usuarioTipo?.id
        colaborador?.email = email
        
        try colaborador?.save()
        
        return Response(redirect: "/configuracoes/colaboradores/\(colaboradorId!)")
    }
    
    func deleteColaboradoresId(request: Request) throws -> ResponseRepresentable {
        let colaboradorId = request.parameters["colaboradorId"]?.int
        
        let colaborador = try Usuario.find(colaboradorId)
        try colaborador?.delete()
        
        return Response(redirect: "/configuracoes/colaboradores")
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
