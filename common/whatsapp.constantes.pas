unit whatsapp.constantes;

interface

const
  SIM = 1;
  NAO = 2;

  STS_SERVICO_INOPERANTE = 0;
  STS_SERVICO_FORA_EXPEDIENTE = 1;
  STS_SERVICO_ATIVADO = 2;

  LOG_ERRO = -1;
  LOG_OPERACAO = -2;

  STS_MENSAGEM_NAO_ENVIADA = 0;
  STS_MENSAGEM_ENVIADA = 1;
  STS_MENSAGEM_RECEBIDA = 2;
  STS_MENSAGEM_LIDA = 3;

  TP_INTERACAO_DESCONHECIDO = 0;
  TP_INTERACAO_A_PARTIR_DO_USUARIO = 1;
  TP_INTERACAO_A_PARTIR_DA_EMPRESA = 2;

  TP_OPCAO_ENTREGA_PARA_USUARIO = 0; //enviar para o usuairo
  TP_OPCAO_ENTREGA_PARA_EMPRESA = 1; //Receber do usuario

  STS_ATENDIMENTO_DESCONHECIDO = 0;
  STS_ATENDIMENTO_EM_ABERTO = 1;
  STS_ATENDIMENTO_FINALIZADO = 2;

  //SQL de consultas
  SQL_CONSULTA_PEDIDOS_MV = 'select ID, ' +
                                   'coalesce(DATA_CONCLUSAO, DATA_CRIACAO) DATA_VENDA, ' +
//                                   'case TIPO ' +
//                                   'when 1 then ''Pedido'' ' +
//                                   'when 2 then ''Orçamento'' ' +
//                                   'when 3 then ''Orçamento'' ' +
//                                   'end TIPO, ' +
                                   'iif(STATUS = 1, ''Em Aberto'', ''Fechado'') STATUS, ' +
                                 //  'QUANT_PRODUTOS, ' +
                                   'VALOR_BRUTO, ' +
                                   'VALOR_DESCONTO, ' +
                                   'VALOR_LIQUIDO ' +
                            'from PEDIDOS_VENDAS ' +
                            'where STATUS = 3 and    ' +
                                  'CLIENTE_ID = :CLIENTEID  ' + // and
                             //     '((TIPO = 1 and IMPORTADO in (0, 1)) or (TIPO in (2, 3) and IMPORTADO = 0)) ' +
                            'order by ID desc rows 5 ';
  SQL_CONSULTA_VENDEDORES_MV = 'select ID, NOME, coalesce(CELULAR, TELEFONE) FONE from VENDEDORES where CELULAR is not null and INATIVO = 0';
  SQL_CONSULTA_TELEFONE_EMPRESA = 'select ID, NOME_FANTASIA NOME, TELEFONE FONE from EMPRESA';
  SQL_CONSULTA_SETORES_EMPRESA = 'SELECT * FROM SETORES_CONTATOS';
  SQL_CONSULTA_CONTATOS_POR_SETOR = 'SELECT * FROM CONTATOS_EMPRESA WHERE SETOR_ID = :SETOR_ID';
  SQL_CONSULTA_ULTIMOS_3_PEDIDOS = 'select first 3 ID from pedidos_vendas where cliente_id = :cliente_id  order by id desc';
  SQL_CONSULTA_ANIVERSARIANTES =
             'SELECT                      '
            +'    c.id,                   '
            +'    c.descricao,            '
            +'    c.datanascimento,       '
            +'    c.data_notificacao,     '
            +'    C.whatsapp              '
            +'FROM                        '
            +'    clientes C              '
            +'WHERE                       '
            +'    C.inativo = 0 AND       '
            +'    c.datanascimento IS NOT NULL AND '
            +'    c.whatsapp is not null and '
            +'    EXTRACT(DAY FROM C.datanascimento) <= EXTRACT(DAY FROM CURRENT_DATE) AND '
            +'    EXTRACT(MONTH FROM C.datanascimento) <= EXTRACT(MONTH FROM CURRENT_DATE) AND '
            +'    EXTRACT(YEAR FROM C.datanascimento) < EXTRACT(YEAR FROM CURRENT_DATE) AND '
            +'    (C.data_notificacao IS NULL OR EXTRACT(YEAR FROM C.data_notificacao) < EXTRACT(YEAR FROM CURRENT_DATE))';

  SQL_CONSULTA_BOLETOS_2_DIAS_ANTES_DE_VENCER =
      'select                                                                                      '+
      '    CBR_TITULOS.*,                                                                          '+
      '    CLI.DESCRICAO as CLI_DESCRICAO,                                                         '+
      '    CLI.whatsapp                                                                            '+
      'from                                                                                        '+
      '    CBR_TITULOS                                                                             '+
      'inner join                                                                                  '+
      '    CLIENTES CLI on CBR_TITULOS.CLIENTE_ID = CLI.ID                                         '+
      'where                                                                                       '+
      '    CBR_TITULOS.SITUACAO = ''A'' and                                                        '+
      '    CBR_TITULOS.REMESSA = ''S'' and                                                         '+
      '    coalesce(CLI.whatsapp, '''') <> '''' and                                                '+
      '    cbr_titulos.dtvencimento = DATEADD(2 DAY TO current_date) and                           '+
      '    cast(coalesce(cbr_titulos.data_notificacao, ''01.01.1989'') as date) < current_date    '+
      'order by                                                                                    '+
      'ID_CBR_TITULOS desc                                                                         ';

  SQL_CONSULTA_BOLETOS_1_DIA_APOS_VENCIMENTO =
      'select                                                                                     '+
      '    CBR_TITULOS.*,                                                                         '+
      '    CLI.DESCRICAO as CLI_DESCRICAO,                                                        '+
      '    CLI.whatsapp                                                                           '+
      'from                                                                                       '+
      '    CBR_TITULOS                                                                            '+
      'inner join                                                                                 '+
      '    CLIENTES CLI on CBR_TITULOS.CLIENTE_ID = CLI.ID                                        '+
      'where                                                                                      '+
      '    CBR_TITULOS.SITUACAO = ''A'' and                                                       '+
      '    CBR_TITULOS.REMESSA = ''S'' and                                                        '+
      '    coalesce(CLI.whatsapp, '''') <> '''' and                                               '+
      '    DATEDIFF(DAY, cbr_titulos.dtvencimento, current_date ) = 1 and                         '+
      '    cast(coalesce(cbr_titulos.data_notificacao, ''01.01.1989'') as date) < current_date    '+
      'order by                                                                                   '+
      '    ID_CBR_TITULOS desc                                                                    ';


  SQL_CONSULTA_BOLETOS_A_CADA_3_DIAS_APOS_VENCIMENTO =
      'select                                                 '+
      '    CBR_TITULOS.*,                                     '+
      '    CLI.DESCRICAO as CLI_DESCRICAO,                    '+
      '    CLI.whatsapp,                                      '+
      '    DATEDIFF(DAY, cbr_titulos.dtvencimento, current_date ) AS DIAS_VENCIDOS '+
      'from                                                   '+
      '    CBR_TITULOS                                        '+
      'inner join                                             '+
      '    CLIENTES CLI on CBR_TITULOS.CLIENTE_ID = CLI.ID    '+
      'where                                                  '+
      '    CBR_TITULOS.SITUACAO = ''A'' and                   '+
      '    CBR_TITULOS.REMESSA = ''S'' and                    '+
      '    cbr_titulos.dtvencimento < current_date and        '+
      '    coalesce(CLI.whatsapp, '''') <> '''' and           '+
      '    (mod(datediff(day, cbr_titulos.dtvencimento, current_date), 3) = 0) and               '+
      '    cast(coalesce(cbr_titulos.data_notificacao, ''01.01.1989'') as date) < current_date   '+
      'order by                                                                                  '+
      '    ID_CBR_TITULOS desc                                                                   ';


  //Constatntes de dialogos
  ///Entregar para o usuario
  //Opção invalida
  TP_ENTREGA_OPCAO_INVALIDA = 9999;
  /// Texto
  //Enviada da empresa para o usuario
  TP_ENTREGA_DESCONHECIDA = 0;
  ////Mensagem comum enviada a partir do sistema
  TP_ENTREGA_TEXTO_ATIVO = 1001;
  ////Anexos
  TP_ENTREGA_ANEXO_IMAGEM = 2001;
  TP_ENTREGA_ANEXO_PDF = 2002;

  TP_ENTREGA_BOAS_VINDAS_MENU = 100; //Mensagem de boas vindas enviada para o usuario
  TP_ENTREGA_MENU_INICIAL = 110; //Mensagem com o menu inicial sem boas vindas
  TP_ENTREGA_ULTIMOS_PEDIDOS = 200;
  TP_ENTREGA_ULTIMOS_PEDIDOS_REQUISITAR_CNPJCPF = 201;
  TP_ENTREGA_ULTIMOS_OS = 300;
  TP_ENTREGA_ULTIMOS_OS_REQUISITAR_CNPJCPF = 301;
  TP_ENTREGA_CONTAS_EM_ABERTO = 400;
  TP_ENTREGA_CONTAS_EM_ABERTO_REQUISITAR_CNPJCPF = 401;
  TP_ENTREGA_BOLETOS_EM_ABERTO = 500;
  TP_ENTREGA_BOLETOS_EM_ABERTO_REQUISITAR_CNPJCPF = 501;
  TP_ENTREGA_CONTATO_VENDEDORES = 600;
  TP_ENTREGA_SETORES = 700;
  TP_ENTREGA_NOVO_CLIENTE = 800;
  TP_ENTREGA_FINALIZAR = 999;

  ///Recebida do usuario
  /// Texto
  //Opção escolhida pelo usuario
  TP_RECEBIDA_DESCONHECIDA = 0;
  TP_RECEBIDA_INVALIDA = 9999;
  TP_RECEBIDA_VALIDADA = 1111;
  TP_RECEBIDA_CADASTRO_NAO_ENCONTRADO = 1112;
  TP_RECEBIDA_NOVO_ATENDIMENTO = 10;
  TP_RECEBIDA_INICIO_ATENDIMENTO = 11;
  TP_RECEBIDA_REQUISITAR_ULTIMOS_PEDIDOS = 20;
  TP_RECEBIDA_REQUISITAR_ULTIMOS_PEDIDOS_CPFCNPJ_ENCONTRADO = 21;
  TP_RECEBIDA_REQUISITAR_ULTIMAS_OS = 30;
  TP_RECEBIDA_REQUISITAR_ULTIMAS_OS_CPFCNPJ_ENCONTRADO = 31;
  TP_RECEBIDA_REQUISITAR_CONTAS_EM_ABERTO = 40;
  TP_RECEBIDA_REQUISITAR_CONTAS_EM_ABERTO_CPFCNPJ_ENCONTRADO = 41;
  TP_RECEBIDA_REQUISITAR_BOLETOS_EM_ABERTO = 50;
  TP_RECEBIDA_REQUISITAR_BOLETOS_EM_ABERTO_CPFCNPJ_ENCONTRADO = 51;
  TP_RECEBIDA_REQUISITAR_CONTATO_VENDEDORES = 60;
  TP_RECEBIDA_REQUISITAR_SETORES = 70;
  TP_RECEBIDA_CONFIRMA_CONTATO_NOVO_CLIENTE = 80;
  TP_RECEBIDA_NAO_CONFIRMA_CONTATO_NOVO_CLIENTE = 81;
  TP_RECEBIDA_REQUISITAR_SETORES_CONTATOS = 71;
  TP_RECEBIDA_FINALIZAR = 99;

  ///Interação com o usuario
  //Tipos de mensagens padronizadas
  TP_MENSAGEM_PADRAO_BOAS_VINDAS = 0;
  TP_MENSAGEM_PADRAO_FINALIZAR = 1;
  TP_MENSAGEM_PADRAO_CONFIRMA_CONTATO = 2;
  TP_MESAGEM_PADRAO_NOTIFICAR_ANIVERSARIANTES = 6;
  TP_MENSAGEM_PADRAO_NAO_CONFIRMA_CONTATO = 12;
  TP_MENSAGEM_PADRAO_BOLETOS_A_VENCER = 13;
  TP_MENSAGEM_PADRAO_BOLETOS_VENCIDOS_HA_1_DIA = 14;
  TP_MENSAGEM_PADRAO_BOLETOS_VENCIDOS_HA_CADA_3_DIAS = 15;

  //Palavras chaves para as opções de atendimento
  TP_PALAVRA_CHAVE_ATENDIMENTO_PEDIDOS = 'pedidos';
  TP_PALAVRA_CHAVE_ATENDIMENTO_PEDIDOS_SINGULAR = 'pedido'; //Caso o usuario digite no singular
  TP_PALAVRA_CHAVE_ATENDIMENTO_ORDEM_SERVICO = 'servicos';
  TP_PALAVRA_CHAVE_ATENDIMENTO_ORDEM_SERVICO_SINGULAR = 'servico'; //Caso o usuario digite no singular
  TP_PALAVRA_CHAVE_ATENDIMENTO_CONTA_RECEBER = 'contas';
  TP_PALAVRA_CHAVE_ATENDIMENTO_CONTA_RECEBER_SINGULAR = 'conta'; //Caso o usuario digite no singular
  TP_PALAVRA_CHAVE_ATENDIMENTO_BOLETOS = 'boletos';
  TP_PALAVRA_CHAVE_ATENDIMENTO_BOLETOS_SINGULAR = 'boleto'; //Caso o usuario digite no singular
  TP_PALAVRA_CHAVE_ATENDIMENTO_VENDEDORES = 'vendedores';
  TP_PALAVRA_CHAVE_ATENDIMENTO_VENDEDORES_SINGULAR = 'vendedor'; //Caso o usuario digite no singular
  TP_PALAVRA_CHAVE_ATENDIMENTO_SAIR = 'sair';
  TP_PALAVRA_CHAVE_ATENDIMENTO_INICIO = 'inicio';
  TP_PALAVRA_CHAVE_ATENDIMENTO_SETORES_EMPRESA = 'contatos' ;


  // Ids para cada opção de atendimento testar trabalhar com ids ao inves de descrição, é mais praticos
  ID_ATENDIMENTO_PEDIDOS = '1';
  ID_ATENDIMENTO_BOLETOS = '2';
  ID_ATENDIMENTO_SETORES_EMPRESA = '3' ;

  ID_ATENDIMENTO_ORDEM_SERVICO = '2';
  ID_ATENDIMENTO_CONTA_RECEBER = '3';
  ID_ATENDIMENTO_VENDEDORES = '5';
  ID_ATENDIMENTO_SAIR = 'sair';
  ID_ATENDIMENTO_INICIO = 'inicio';

  ID_CONFIRMA_CONTATO_WHATSAPP = '1';
  ID_NAO_CONFIMA_CONTATO_WHATSAPP = '2';


  //Emojis
  EMOJI_ATENDENTE = '👤';
  EMOJI_TELEFONE = '📱';

implementation

end.
