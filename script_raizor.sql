use raizor

/*PERFIL*/
insert into profiles (description) values ("SISTEMA");
insert into profiles (description) values ("ADMINISTRADOR");
insert into profiles (description) values ("GERÊNCIA");
insert into profiles (description) values ("SUPERVISOR");
insert into profiles (description) values ("SUB-SUERVISOR");
insert into profiles (description) values ("OPERADOR");
insert into profiles (description) values ("PESQUISA");
insert into profiles (description) values ("CONSULTA");


/*USUÁRIO*/
insert into users (name, login, password, active, profile_id)
    values ("Default", "default", "default", false, 1);
insert into users (name, login, password, active, profile_id)
    values ("MARCO SINGER", "Marco", "123", true, 2);
insert into users (name, login, password, active, profile_id)
    values ("ERICK DO NASCIMENTO", "Erick", "123", false, 2);
insert into users (name, login, password, active, profile_id)
    values ("DAVID DE JESUS", "David", "123", true, 6);
insert into users (name, login, password, active, profile_id)
    values ("DANIEL TADEU", "Daniel", "123", true, 8);


/*AGÊNCIA*/
insert into branches (id, name) values (1013, "ILHA BELA");
insert into branches (id, name) values (1286, "AL. MADEIRA ALPHA - UB");
insert into branches (id, name) values (2271, "JD BELA VISTA");
insert into branches (id, name) values (3040, "VILA ROMANA - USP");


/*MODALIDADE*/
insert into modalities (id, description) values (722, "CAP. DE GIRO - 00722");
insert into modalities (id, description) values (752, "FINAME - 00752");


/*FILA*/
insert into type_status (description) values ("ACAO CONTRA");
insert into type_status (description) values ("ACORDO / LIQUIDADO");
insert into type_status (description) values ("AGENDA CAMAPANHA");
insert into type_status (description) values ("AGENDADOS");
insert into type_status (description) values ("FALECIDO");
insert into type_status (description) values ("FINALIZADO");
insert into type_status (description) values ("NÃO LOCALIZADO");
insert into type_status (description) values ("NOVOS");
insert into type_status (description) values ("PAGAMENTO PARCIAL");
insert into type_status (description) values ("PESQUISA");
insert into type_status (description) values ("PROMESSA DE PAGAMENTO");
insert into type_status (description) values ("RECOBRANCA");
insert into type_status (description) values ("SEM CONDICOES");
insert into type_status (description) values ("SEM INTERESSE");
insert into type_status (description) values ("TENTATIVA FRUSTRADA");


/*STATUS*/
insert into status (id, description, finale, date, color, priority, profile_id, type_status_id)
    values (200, "TELECOBRANCA", false, false, "#00FF00", 1, 1, 8);
insert into status (id, description, finale, date, color, priority, profile_id, type_status_id)
    values (212, "RECADO", false, true, "#FFFF00", 2, 6, 4);
insert into status (id, description, finale, date, color, priority, profile_id, type_status_id)
    values (208, "NOVO TELEFONE OBTIDO", false, false, "#A020F0", 3, 8, 12);
insert into status (id, description, finale, date, color, priority, profile_id, type_status_id)
    values (403, "COBRANCA FINALIZADA", true, false, "#FF0000", 21, 1, 6);
insert into status (id, description, finale, date, color, priority, profile_id, type_status_id)
    values (900, "DEVEDOR SEM DEBITOS VENCIDOS", true, false, "#FF0000", 21, 1, 6);


/*ESQUEMA DE STATUS*/
insert into schema_status (status_id, debtor, debtor_log, debt, debt_log) 
    values (200, true, true, true, true);
insert into schema_status (status_id, debtor, debtor_log, debt, debt_log) 
    values (212, true, true, false, false);
insert into schema_status (status_id, debtor, debtor_log, debt, debt_log) 
    values (208, true, true, false, false);
insert into schema_status (status_id, debtor, debtor_log, debt, debt_log) 
    values (403, false, false, true, true);
insert into schema_status (status_id, debtor, debtor_log, debt, debt_log) 
    values (900, true, true, false, false);


/*FILA DE COBRANÇA*/
insert into recovery (status_id, queue_count) values (200,  1);
insert into recovery (status_id, queue_count) values (212, 10);
insert into recovery (status_id, queue_count) values (208, 10);
insert into recovery (status_id, queue_count) values (403,  0);


/*DEVEDOR*/
insert into debtors (name, controller, postal, debtor_type, cpf_cnpj, address, cep, 
city, state, phone, spouse, father, mother, user_id, status_id)
    values ("ADRIANA DOS SANTOS", "0167074418", false, "F", "33389842861", "RUA CORONEL XAVIER DE TOLEDO, 210", "01545001", "SAO PAULO", "SP", "1138061841", "SEBASTIANA SEM SOBRENOME", "JOSE ROBERTO GOMES PEDROSA", "MARIA DE DEUS", 2, 200);

insert into debtors (name, controller, postal, debtor_type, cpf_cnpj, address, cep, 
city, state, phone, spouse, father, mother, user_id)
    values ("KINHOSO ROBERTO", "0167074418", false, "F", "33389842861", "Rua Coronel Diogo, 1316", "01545001", "SAO PAULO", "SP", "1138061841", "SEM ESPOSA", "GERALDO PONCIANO", "CLARINDA FERRAZ", 2);

insert into debtors (name, postal, debtor_type, cpf_cnpj, address, cep, 
city, state, phone, spouse, father, mother, status_id)
    values ("NININHO TADEU DA SILVA", false, "F", "33389842861", "RUA CORONEL DIOGO, 1316", "01545001", "SAO PAULO", "SP", "1138061841", "ABIGAIL UHUUL", "GERANDO PONCIANO", "CLARINDA FERRAZ", 208);


/*SITUAÇÃO DO ACORDO*/
insert into type_deals (description, color) 
    values ("PENDENTE DE ENVIO AO BANCO", "#FFFF00");
insert into type_deals (description, color) 
    values ("ENVIADO AO BANCO. AGUARDANDO PAGAMENTO", "#FF8E00"); 
insert into type_deals (description, color) 
    values ("ACORDO APROVADO. O BOLETO SERÁ EMITIDO", "#69FF0D");
insert into type_deals (description, color) 
    values ("PAGAMENTO DO BOLETO EFETUADO. O ACORDO PASSA A TER VALIDADE", "#064DE8");
insert into type_deals (description, color) 
    values ("ACORDO RECUSADO", "#FF0000"); 


/*DIVIDA*/
insert into debts (account, contract, date, amount, date_att, amount_att, amount_import,
    secure, secure_status, debtor_id, user_id, branch_id, modality_id, status_id) 
values ('0231488', '002424319', '2009-06-08', 1165.39, '20/07/2009', 1165.39, 1165.39, 
    0, 0, 1, 2, 1013, 722, 200);

insert into debts (account, contract, date, amount, date_att, amount_att, amount_import,
    secure, secure_status, debtor_id, user_id, branch_id, modality_id, status_id) 
values ('0231488', '002424319', '2009-07-08', 1165.39, '20/07/2009', 1165.39, 1165.39,  
    0, 0, 1, 2, 1013, 752, 208);

insert into debts (account, contract, date, amount, date_att, amount_att, amount_import,
    secure, secure_status, debtor_id, user_id, branch_id, modality_id, status_id) 
values ('0231488', '002424319', '2009-09-08', 1165.39, '20/07/2009', 1165.39, 1165.39,  
    0, 0, 1, 5, 1013, 752, 208);

insert into debts (account, contract, date, amount, date_att, amount_att, amount_import,
    secure, secure_status, debtor_id, user_id, branch_id, modality_id) 
values ('0231488', '002424319', '2009-08-08', 1165.39, '20/07/2009', 1165.39, 1165.39,  
    0, 0, 2, 5, 1013, 752);
