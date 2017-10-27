INSERT INTO empresas (nome,cnpj,created_at,updated_at)  VALUES ('Modelar Decorações ME','02.965.280/0001-06',now(),now());
INSERT INTO empresas (nome,cnpj,created_at,updated_at)  VALUES ('Natália Araújo Lucas EIRELI','026.181.205/0001-04',now(),now());

INSERT INTO usuarios_tipo (nome,created_at,updated_at) VALUES ('Administrador',now(),now());
INSERT INTO usuarios_tipo (nome,created_at,updated_at) VALUES ('Atendente',now(),now());
INSERT INTO usuarios_tipo (nome,created_at,updated_at) VALUES ('Técnico',now(),now());
INSERT INTO usuarios_tipo (nome,created_at,updated_at) VALUES ('Cliente Pessoa Física',now(),now());
INSERT INTO usuarios_tipo (nome,created_at,updated_at) VALUES ('Cliente Pessoa Jurídica',now(),now());

INSERT INTO status (nome,created_at,updated_at) VALUES ('Orçamento - A entrar em contato',now(),now());
INSERT INTO status (nome,created_at,updated_at) VALUES ('Orçamento - Em negociação',now(),now());
INSERT INTO status (nome,created_at,updated_at) VALUES ('Orçamento - Cancelado',now(),now());
INSERT INTO status (nome,created_at,updated_at) VALUES ('Serviço - A Iniciar',now(),now());
INSERT INTO status (nome,created_at,updated_at) VALUES ('Serviço - A Remarcar data',now(),now());
INSERT INTO status (nome,created_at,updated_at) VALUES ('Serviço - Finalizado',now(),now());
INSERT INTO status (nome,created_at,updated_at) VALUES ('Serviço - Cancelado',now(),now());
INSERT INTO status (nome,created_at,updated_at) VALUES ('Ativo',now(),now());
INSERT INTO status (nome,created_at,updated_at) VALUES ('Inativo',now(),now());



INSERT INTO servico_tipos (nome,descricao,created_at,updated_at) VALUES ('Impermeabilização de Estofados','É um tratamento que quando se aplica no tecido dos estofados, envolve cada uma das suas fibras, sem tirar a ventilação do tecido e assim impede a penetração de manchas por líquidos derramados.', now(),now());
INSERT INTO servico_tipos (nome,descricao,created_at,updated_at) VALUES ('Lavagem de Estofados','Trabalhamos com a lavagem a seco, que é feita na casa do cliente, deixando o estofado limpo e ajuda a matar ácaros e agentes alérgicos.',now(),now());
INSERT INTO servico_tipos (nome,descricao,created_at,updated_at) VALUES (' Hidratação de Estofados','Hidrata o couro do estofado evitando rachaduras e dando mais durabilidade para o mesmo.',now(),now());

INSERT INTO materiais (nome,created_at,updated_at) VALUES ('Couro',now(),now());
INSERT INTO materiais (nome,created_at,updated_at) VALUES ('Tecido',now(),now());

INSERT INTO item_tipos (nome,created_at,updated_at) VALUES ('Sofá',now(),now());
INSERT INTO item_tipos (nome,created_at,updated_at) VALUES ('Banco',now(),now());
INSERT INTO item_tipos (nome,created_at,updated_at) VALUES ('Colchão',now(),now());
INSERT INTO item_tipos (nome,created_at,updated_at) VALUES ('Poltrona',now(),now());
INSERT INTO item_tipos (nome,created_at,updated_at) VALUES ('Tapete',now(),now());


INSERT INTO carros (nome,created_at,updated_at) VALUES ('Luxo',now(),now());
INSERT INTO carros (nome,created_at,updated_at) VALUES ('Popular',now(),now());

INSERT INTO regioes (nome,created_at,updated_at) VALUES ('Plano Piloto',now(),now());
INSERT INTO regioes (nome,created_at,updated_at) VALUES ('Sul',now(),now());
INSERT INTO regioes (nome,created_at,updated_at) VALUES ('Norte',now(),now());
INSERT INTO regioes (nome,created_at,updated_at) VALUES ('Águas Claras',now(),now());
INSERT INTO regioes (nome,created_at,updated_at) VALUES ('Taguatinga',now(),now());

INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Asa Sul',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Asa Norte',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Plano',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Cruzeiro',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Sudoeste',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Noroeste',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'SOF Norte',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Lago Norte',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Varjão',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Paranoá',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Itapoã',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Lago Sul',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'São Sebastião',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Jardim ABC',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Jardim Botânico',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (1,'Condomínio do Lago Sul',now(),now());

INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (2,'Gama',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (2,'Recanto das Emas',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (2,'Riacho Fundo 2',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (2,'Ponte Alta',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (2,'Santa Maria',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (2,'Valparaiso',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (2,'Luziânia',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (2,'Cidade Ocidental',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (2,'Novo Gama',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (2,'Pedregal',now(),now());

INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (3,'Sobradinho',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (3,'Taquari',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (3,'Grande Colorado',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (3,'Lago Oeste',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (3,'Planaltina',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (3,'Planaltina GO',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (3,'Formosa',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (3,'Rajadinha',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (3,'Vale do Amanhecer',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (3,'Araponga',now(),now());

INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (4,'Águas Claras',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (4,'Arniqueiras',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (4,'Riacho Fundo 1',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (4,'Park Way QD 02-05',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (4,'Park Way QD 01-27',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (4,'Guará',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (4,'Núcleo Bandeirante',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (4,'Candangolândia',now(),now());
INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (4,'SOF SUL',now(),now());