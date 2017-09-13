INSERT INTO empresas (nome,cnpj,created_at,updated_at)  VALUES ('Modelar Decorações ME','02.965.280/0001-06',now(),now());
INSERT INTO empresas (nome,cnpj,created_at,updated_at)  VALUES ('Natália Araújo Lucas EIRELI','026.181.205/0001-04',now(),now());

INSERT INTO usuarios_tipo (nome,created_at,updated_at) VALUES ('Administrador',now(),now());
INSERT INTO usuarios_tipo (nome,created_at,updated_at) VALUES ('Atendente',now(),now());
INSERT INTO usuarios_tipo (nome,created_at,updated_at) VALUES ('Técnico',now(),now());
INSERT INTO usuarios_tipo (nome,created_at,updated_at) VALUES ('Cliente Pessoa Física',now(),now());
INSERT INTO usuarios_tipo (nome,created_at,updated_at) VALUES ('Cliente Pessoa Jurídica',now(),now());

INSERT INTO status (nome,created_at,updated_at) VALUES ('Em andamento',now(),now());

INSERT INTO servico_tipos (nome,descricao,created_at,updated_at) VALUES ('Impermeabilização de Estofados','É um tratamento que quando se aplica no tecido dos estofados, envolve cada uma das suas fibras, sem tirar a ventilação do tecido e assim impede a penetração de manchas por líquidos derramados.', now(),now());
INSERT INTO servico_tipos (nome,descricao,created_at,updated_at) VALUES ('Lavagem de Estofados','Trabalhamos com a lavagem a seco, que é feita na casa do cliente, deixando o estofado limpo e ajuda a matar ácaros e agentes alérgicos.',now(),now());
INSERT INTO servico_tipos (nome,descricao,created_at,updated_at) VALUES (' Hidratação de Estofados','Hidrata o couro do estofado evitando rachaduras e dando mais durabilidade para o mesmo.',now(),now());

INSERT INTO materiais (nome,created_at,updated_at) VALUES ('Couro',now(),now());
INSERT INTO materiais (nome,created_at,updated_at) VALUES ('Tecido',now(),now());

INSERT INTO item_tipos (nome,created_at,updated_at) VALUES ('Sofá',now(),now());

INSERT INTO carros (nome,created_at,updated_at) VALUES ('Luxo',now(),now());
INSERT INTO carros (nome,created_at,updated_at) VALUES ('Popular',now(),now());

INSERT INTO regioes (nome,created_at,updated_at) VALUES ('Plano Piloto',now(),now());
INSERT INTO regioes (nome,created_at,updated_at) VALUES ('Sul',now(),now());
INSERT INTO regioes (nome,created_at,updated_at) VALUES ('Norte',now(),now());
INSERT INTO regioes (nome,created_at,updated_at) VALUES ('Águas Claras',now(),now());
INSERT INTO regioes (nome,created_at,updated_at) VALUES ('Taguatinga',now(),now());

INSERT INTO cidades (regiao_id, nome,created_at,updated_at) VALUES (4,'Nucleo Bandeirante',now(),now());

