unit whatsapp.mensagens;

interface

uses
  System.SysUtils, System.Classes, System.Math, System.StrUtils, System.Generics.Collections,
  EncdDecd, System.DateUtils, ACBrValidador,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  whatsapp.funcoes, udmConexao, whatsapp.constantes;

type
  TMensagemEnviar = record
    Id: integer;
    DataCadastro: TDateTime;
    NumeroEmpresa: string;
    NumeroCliente: string;
    Ticket: string;
    DataEnvioInicio: TDateTime;
    DataEnvioFinal: TDateTime;
    StatusEnvio: integer;
    TipoInteracao: integer;
    OpcaoEntregue: integer;
    Finalizado: integer;
    ClienteId: integer;
    ClienteNome: string;
  private
    FAnexoMensagem: string;
    FMensagem: string;
  public
    class function Add(AId: integer; ADataCadastro: TDateTime; ANumeroEmpresa, ANumeroCliente,
      ATicket: string; ADataEnvioInicio, ADataEnvioFinal: TDateTime; AStatusEnvio,
      ATipoInteracao, AOpcaoEntregue: integer; AMensagem: string; AFinalizado,
      AClienteId: integer; AClienteNome, AAnexoMensagem: string): TMensagemEnviar; static;
    class function Novo(AId: integer; ADataCadastro: TDateTime; ANumeroEmpresa, ANumeroCliente,
      ATicket: string; ADataEnvioInicio, ADataEnvioFinal: TDateTime; AStatusEnvio,
      ATipoInteracao, AOpcaoEntregue: integer; AMensagem: string; AFinalizado,
      AClienteId: integer; AClienteNome, AAnexoMensagem: string): TMensagemEnviar; static;
    procedure Clear;
    function RegistraMensagem(AConexao: TFDConnection): string;
    procedure SetMensagem(ATextoBruto: string);
    procedure SetAnexoMensagem(ACaminhoArquivo: string);
    function GetMensagem: string;
    function GetAnexoImagem:string;
    function GetAnexoPDF:string;
    function MarcarComoEnviada(AConexao: TFDConnection): string; //Retorna erro caso houver
    function MarcarComoFinalizada(AConexao: TFDConnection): string; //Retorna erro caso houver
    class function RetornaUltimaOpcaoEntregueValida(ANumeroEmpresa, ANumeroCliente: string; AConexao: TFDConnection): TMensagemEnviar; static;
    class function RecuperaMensagens(ANumeroEmpresa: string; AConexao: TFDConnection): TList<TMensagemEnviar>; overload; static;
    class function RecuperaMensagens(ANumeroEmpresa, ANumeroCliente: string; AConexao: TFDConnection): TList<TMensagemEnviar>; overload; static;
  end;

  TMensagemRecebida = record
    Id: integer;
    DataCadastro: TDateTime;
    NumeroEmpresa: string;
    NumeroCliente: string;
    Ticket: string;
    Protocolo: string;
    OpcaoRecebida: integer;
    Finalizado: integer;
    ClienteId: integer;
    ClienteNome: string;
  private
    FMensagem: string;
  public
    class function Add(AId: integer; ADataCadastro: TDateTime; ANumeroEmpresa, ANumeroCliente,
      ATicket, AProtocolo: string; AOpcaoRecebida: integer; AMensagem: string; AFinalizado,
      AClienteId: integer; AClienteNome: string): TMensagemRecebida; static;
    class function Novo(AId: integer; ADataCadastro: TDateTime; ANumeroEmpresa, ANumeroCliente,
      ATicket, AProtocolo: string; AOpcaoRecebida: integer; AMensagem: string; AFinalizado,
      AClienteId: integer; AClienteNome: string): TMensagemRecebida; static;
    procedure SetMensagem(ATextoBruto: string);
    function GetMensagem: string;
    function RegistraMensagem(AConexao: TFDConnection): string;
    function MarcarComoFinalizada(AConexao: TFDConnection): string; //Retorna erro caso houver
    function GeraMensagemDeResposta: TMensagemEnviar;
    class function RecuperaMensagens(ANumeroEmpresa, ANumeroCliente: string;
      AConexao: TFDConnection): TList<TMensagemRecebida>; static;
  end;

  TMensagemBruta = record
    Id: integer;
    DataCadastro: TDateTime;
    NumeroEmpresa: string;
    NumeroCliente: string;
    Ticket: string;
    DataEnvioInicio: TDateTime;
    DataEnvioFinal: TDateTime;
    StatusEnvio: integer;
    TipoInteracao: integer;
    OpcaoEntregue: integer;
    OpcaoRecebida: integer;
    TipoEntregaMensagem: integer;
    Finalizado: integer;
    ClienteId: integer;
    Protocolo: string;
    vClienteNome: string;
  private
    FMensagem: string;
    FAnexoMensagem: string;
  public
    class function Add(AId: integer; ADataCadastro: TDateTime; ANumeroEmpresa,
      ANumeroCliente, ATicket: string; ADataEnvioInicio, ADataEnvioFinal: TDateTime;
      AStatusEnvio, ATipoInteracao, AOpcaoEntregue, AOpcaoRecebida, ATipoEntregaMensagem: integer;
      AMensagem, AAnexoMensagem: string; AFinalizado, AClienteId: integer; AProtocolo,
      AClienteNome: string): TMensagemBruta; static;
    class function Novo(AId: integer; ADataCadastro: TDateTime; ANumeroEmpresa,
      ANumeroCliente, ATicket: string; ADataEnvioInicio, ADataEnvioFinal: TDateTime;
      AStatusEnvio, ATipoInteracao, AOpcaoEntregue, AOpcaoRecebida, ATipoEntregaMensagem: integer;
      AMensagem, AAnexoMensagem: string; AFinalizado, AClienteId: integer; AProtocolo,
      AClienteNome: string): TMensagemBruta; static;
    procedure SetMensagem(ATextoBruto: string);
    procedure SetAnexoMensagem(ACaminhoArquivo: string);
    function GetMensagem: string;
    function GetMensagemEncoded: string;
    function GetAnexoMensagemEncoded: string;
    procedure GerarTicket;
    procedure IdentificarClienteAPartirDoWhatsapp(var AConexao: TFDConnection);
    function MarcarComoEnviada(var AConexao: TFDConnection): string; //Retorna erro caso houver
    function MarcarComoLida(var AConexao: TFDConnection): string;
    function RegistraMensagemTexto(var AConexao: TFDConnection): string; //Retorna erro caso ocorra, se retornar em branco deu certo
    function RegistraMensagemArquivo(ACaminhoArquivo: string; var AConexao: TFDConnection): string; //Retorna erro caso ocorra, se retornar em branco deu certo
    class function RecuperaMensagens(ANumeroEmpresa: string; AStatusEnvio: integer;
      AConexao: TFDConnection): TList<TMensagemBruta>; static;
    class function RecuperaMensagensRecebidas(ANumeroEmpresa: string; var AConexao: TFDConnection): TList<TMensagemBruta>; static;

    function SalvaMensagemRecebida(ATipoMensagemRecebida: integer; var AConexao: TFDConnection): TMensagemRecebida;
    function TratarMensagemRecebida(AUltimaMensagemValida: TMensagemEnviar; var AConexao: TFDConnection): TMensagemRecebida;
    //Tratar respostas do cliente para o tipo de op��o recebida
    function ConverterTextoParaOpcaoMenu(ARespostaUsuario: string): integer;
    function ValidarCPFCNPJDoCliente(ARespostaUsuario: string; var AConexao: TFDConnection): integer;
    function VerificarSeEncerraAtendimento(ARespostaUsuario: string): boolean;
    function VerificarSeVoltaParaOMenuInicial(ARespostaUsuario: string): boolean;
  end;

  TMensagemWhatsapp = class
  private
    FdmConexao: TdmConexao;
    function GetMensagemPadrao(ATipoMensagemPadrao: integer): string;
    function GetOpcoesAtedimento(ANumeroAtedimento: string): string;
    function GetPedidosCliente(AClienteId: integer): string;
    procedure FinalizarAtendimento(ANumeroCliente: string);
    function ListarVendedores: string;

    function GetTextoInicioSair: string;
  public
    constructor Create;
    destructor Destroy; override;

    //Fun��es para gerar mensagens de resposta para enviar aos clientes
    class function MensagemBoasVindas(AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
    class function MenuInicialSemBoasVindas(AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
    class function EnviarUltimosPedidos(AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
    class function MensagemFinalizarAtendimento(AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
    class function ReenviaUltimaMensagemValida(AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
    class function RedirecionarParaVendedores(AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
    class function ContatoDosVendedores(AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
  end;

  TProcessamentoMensagens = class
  private
    FdmConexao: TdmConexao;
  public
    constructor Create;
    destructor Destroy; override;
    procedure FinalizarAtendimentosDeDiasAnteriores(ANumeroEmpresa: string);
    procedure ExecutarMensagensTodosCadastros;
    procedure ProcessarMensagensRecebidas(ANumeroEmpresa: string);
  end;

implementation

{ TMensagemWhatsapp }

class function TMensagemWhatsapp.ContatoDosVendedores(
  AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
var
  lMensagemParaEnviar, lTextoPadrao: string;
  lMensagemWhatsapp: TMensagemWhatsapp;
begin
  lMensagemWhatsapp := TMensagemWhatsapp.Create;
  try
    if lMensagemWhatsapp.FdmConexao.ConectarBanco then
    begin
      lTextoPadrao := 'Segue o contato de nossos colaboradores'+sLineBreak;
      lMensagemParaEnviar := lTextoPadrao + lMensagemWhatsapp.ListarVendedores +sLineBreak+ lMensagemWhatsapp.GetTextoInicioSair;
      Result := TMensagemEnviar.Novo(0,
                                    Now,
                                    AMensagemRecebida.NumeroEmpresa,
                                    AMensagemRecebida.NumeroCliente,
                                    AMensagemRecebida.Ticket,
                                    StartOfTheDay(Now),
                                    EndOfTheDay(Now),
                                    STS_MENSAGEM_NAO_ENVIADA,
                                    TP_INTERACAO_A_PARTIR_DO_USUARIO,
                                    TP_ENTREGA_CONTATO_VENDEDORES,
                                    lMensagemParaEnviar,
                                    STS_ATENDIMENTO_EM_ABERTO,
                                    AMensagemRecebida.ClienteId,
                                    AMensagemRecebida.ClienteNome,
                                    EmptyStr);
      Result.RegistraMensagem(lMensagemWhatsapp.FdmConexao.fdConexao);
      lMensagemWhatsapp.FdmConexao.DesconectarBanco;
    end;
  finally
    lMensagemWhatsapp.Free;
  end;
end;

constructor TMensagemWhatsapp.Create;
begin
  FdmConexao := TdmConexao.Create(nil);
end;

destructor TMensagemWhatsapp.Destroy;
begin
  FdmConexao.Free;
  inherited;
end;

class function TMensagemWhatsapp.EnviarUltimosPedidos(
  AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
var
  lMensagemWhatsapp: TMensagemWhatsapp;
  lTextoPadrao, lTextoPedidos: string;
  lMensagemParaEnviar: string;
begin
  lMensagemWhatsapp := TMensagemWhatsapp.Create;
  try
    if lMensagemWhatsapp.FdmConexao.ConectarBanco then
    begin
      if AMensagemRecebida.ClienteId = 0 then //Se o id do cliente for igual a zero requisitar o cpf
      begin
        lTextoPadrao := 'Por favor, informe o n�mero do seu CPF ou CNPJ (sem caracteres especiais) para que possamos identificar o seu cadastro na loja';
        lMensagemParaEnviar := lTextoPadrao+sLineBreak+sLineBreak+lMensagemWhatsapp.GetTextoInicioSair;
        Result := TMensagemEnviar.Novo(0,
                                      Now,
                                      AMensagemRecebida.NumeroEmpresa,
                                      AMensagemRecebida.NumeroCliente,
                                      AMensagemRecebida.Ticket,
                                      StartOfTheDay(Now),
                                      EndOfTheDay(Now),
                                      STS_MENSAGEM_NAO_ENVIADA,
                                      TP_INTERACAO_A_PARTIR_DO_USUARIO,
                                      TP_ENTREGA_ULTIMOS_PEDIDOS_REQUISITAR_CNPJCPF,
                                      lMensagemParaEnviar,
                                      STS_ATENDIMENTO_EM_ABERTO,
                                      AMensagemRecebida.ClienteId,
                                      AMensagemRecebida.ClienteNome,
                                      EmptyStr);
        Result.RegistraMensagem(lMensagemWhatsapp.FdmConexao.fdConexao);
        Exit;
      end;

      if lTextoPadrao.IsEmpty then
        lTextoPadrao := 'Segue um resumo dos �ltimos pedidos encontrados no seu cadastro';
      lTextoPedidos := lMensagemWhatsapp.GetPedidosCliente(AMensagemRecebida.ClienteId);
      lMensagemParaEnviar := lTextoPadrao + sLineBreak + sLineBreak + lTextoPedidos+ sLineBreak + lMensagemWhatsapp.GetTextoInicioSair;

      Result := TMensagemEnviar.Novo(0,
                                    Now,
                                    AMensagemRecebida.NumeroEmpresa,
                                    AMensagemRecebida.NumeroCliente,
                                    AMensagemRecebida.Ticket,
                                    StartOfTheDay(Now),
                                    EndOfTheDay(Now),
                                    STS_MENSAGEM_NAO_ENVIADA,
                                    TP_INTERACAO_A_PARTIR_DO_USUARIO,
                                    TP_ENTREGA_ULTIMOS_PEDIDOS,
                                    lMensagemParaEnviar,
                                    STS_ATENDIMENTO_EM_ABERTO,
                                    AMensagemRecebida.ClienteId,
                                    AMensagemRecebida.ClienteNome,
                                    EmptyStr);
      Result.RegistraMensagem(lMensagemWhatsapp.FdmConexao.fdConexao);
      lMensagemWhatsapp.FdmConexao.DesconectarBanco;
    end;
  finally
    lMensagemWhatsapp.Free;
  end;
end;

procedure TMensagemWhatsapp.FinalizarAtendimento(ANumeroCliente: string);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FdmConexao.fdConexao;
    lQuery.SQL.Text := 'update WB_MENSAGENS set FINALIZADO = :FINALIZADO where NUMERO_CLIENTE = :NUMERO_CLIENTE and TIPO_INTERACAO = :TIPO_INTERACAO ';
    lQuery.ParamByName('FINALIZADO').AsInteger := STS_ATENDIMENTO_FINALIZADO;
    lQuery.ParamByName('TIPO_INTERACAO').AsInteger := TP_INTERACAO_A_PARTIR_DO_USUARIO;
    lQuery.ParamByName('NUMERO_CLIENTE').AsString := ANumeroCliente;
    lQuery.ExecSQL;
    lQuery.SQL.Text := 'update WB_MENSAGEM_ENVIO set FINALIZADO = :FINALIZADO where NUMERO_CLIENTE = :NUMERO_CLIENTE and TIPO_INTERACAO = :TIPO_INTERACAO ';
    lQuery.ParamByName('FINALIZADO').AsInteger := STS_ATENDIMENTO_FINALIZADO;
    lQuery.ParamByName('TIPO_INTERACAO').AsInteger := TP_INTERACAO_A_PARTIR_DO_USUARIO;
    lQuery.ParamByName('NUMERO_CLIENTE').AsString := ANumeroCliente;
    lQuery.ExecSQL;
    lQuery.SQL.Text := 'update WB_MENSAGEM_RECEBIDA set FINALIZADO = :FINALIZADO where NUMERO_CLIENTE = :NUMERO_CLIENTE ';
    lQuery.ParamByName('FINALIZADO').AsInteger := STS_ATENDIMENTO_FINALIZADO;
    lQuery.ParamByName('NUMERO_CLIENTE').AsString := ANumeroCliente;
    lQuery.ExecSQL;
  finally
    lQuery.Free;
  end;
end;

function TMensagemWhatsapp.GetMensagemPadrao(
  ATipoMensagemPadrao: integer): string;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FdmConexao.fdConexao;
    lQuery.SQL.Text := 'select TEXTO from WB_TEXTO_PADRAO where TIPO = :TIPO';
    lQuery.ParamByName('TIPO').AsInteger := ATipoMensagemPadrao;
    lQuery.Open;
    Result := lQuery.FieldByName('TEXTO').AsString;
    lQuery.Close;
  finally
    lQuery.Free;
  end;
end;

function TMensagemWhatsapp.GetOpcoesAtedimento(
  ANumeroAtedimento: string): string;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FdmConexao.fdConexao;
    lQuery.SQL.Text := 'select * from WB_CONFIGURACOES where NUMERO = :NUMERO';
    lQuery.ParamByName('NUMERO').AsString := ANumeroAtedimento;
    lQuery.Open;
    if not (lQuery.IsEmpty) then
    begin
      if lQuery.FieldByName('ULTIMOS_PEDIDOS').AsInteger = 1 then
        Result := Result + 'Digite *'+TP_PALAVRA_CHAVE_ATENDIMENTO_PEDIDOS+'* para exibir os �ltimos Pedidos'+sLineBreak;

      if lQuery.FieldByName('ULTIMAS_ORDEM_SERVICOS').AsInteger = 1 then
        Result := Result + 'Digite *'+TP_PALAVRA_CHAVE_ATENDIMENTO_ORDEM_SERVICO+'* para exibir as �ltimas Ordens de Servi�os'+sLineBreak;

      if lQuery.FieldByName('CONTA_A_RECEBER').AsInteger = 1 then
        Result := Result + 'Digite *'+TP_PALAVRA_CHAVE_ATENDIMENTO_CONTA_RECEBER+'* para exibir o extrato das contas em abertos'+sLineBreak;

      if lQuery.FieldByName('BOLETOS').AsInteger = 1 then
        Result := Result + 'Digite *'+TP_PALAVRA_CHAVE_ATENDIMENTO_BOLETOS+'* para receber a 2� via dos boletos'+sLineBreak;

      if lQuery.FieldByName('VENDEDORES').AsInteger = 1 then
        Result := Result + 'Digite *'+TP_PALAVRA_CHAVE_ATENDIMENTO_VENDEDORES+'* para receber os contatos dos vendedores'+sLineBreak;
    end;
    lQuery.Close;
  finally
    lQuery.Free;
  end;
end;

function TMensagemWhatsapp.GetPedidosCliente(AClienteId: integer): string;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FdmConexao.fdConexao;
    lQuery.SQL.Text := SQL_CONSULTA_PEDIDOS_MV;
    lQuery.ParamByName('CLIENTEID').AsInteger := AClienteId;
    lQuery.Open;
    if not (lQuery.IsEmpty) then
    begin
      lQuery.First;
      while not (lQuery.Eof) do
      begin
        Result := Result + 'N�mero: *'+StrZero(lQuery.FieldByName('ID').AsInteger, 7)+'*'+sLineBreak;
        Result := Result + 'Data: *'+FormatDateTime('dd/mm/yyyy', lQuery.FieldByName('DATA_VENDA').AsDateTime)+'*'+sLineBreak;
        Result := Result + 'Tipo: *'+lQuery.FieldByName('TIPO').AsString+'*'+sLineBreak;
        Result := Result + 'Status: *'+lQuery.FieldByName('STATUS').AsString+'*'+sLineBreak;
        Result := Result + 'Qtd. produtos: *'+lQuery.FieldByName('QUANT_PRODUTOS').AsString+'*'+sLineBreak;
        Result := Result + 'Valor do pedido: *'+FormatCurr('#,##0.00', lQuery.FieldByName('VALOR_NOTA').AsCurrency)+'*'+sLineBreak;
        Result := Result + 'Desconto: *'+FormatCurr('#,##0.00', lQuery.FieldByName('VALOR_DESC_REAL').AsCurrency)+'*'+sLineBreak;
        Result := Result + 'Valor l�quido: *'+FormatCurr('#,##0.00', lQuery.FieldByName('VALOR_PAGAR').AsCurrency)+'*'+sLineBreak+sLineBreak+sLineBreak;
        lQuery.Next;
      end;
    end;
    lQuery.Close;
  finally
    lQuery.Free;
  end;
end;

function TMensagemWhatsapp.GetTextoInicioSair: string;
begin
  Result := 'Digite *'+UpperCase(TP_PALAVRA_CHAVE_ATENDIMENTO_INICIO)+'* para voltar ao menu inicial ou *'+UpperCase(TP_PALAVRA_CHAVE_ATENDIMENTO_SAIR)+'* para finalizar o atendimento'
end;

function TMensagemWhatsapp.ListarVendedores: string;
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := FdmConexao.fdConexao;
    lQuery.SQL.Text := SQL_CONSULTA_VENDEDORES_MV;
    lQuery.Open;
    if not (lQuery.IsEmpty) then
    begin
      lQuery.First;
      while not (lQuery.Eof) do
      begin
        Result := Result+
                  EMOJI_ATENDENTE +' '+
                  lQuery.FieldByName('NOME').AsString+sLineBreak+
                  EMOJI_TELEFONE  +' '+
                  lQuery.FieldByName('FONE').AsString+sLineBreak;
        lQuery.Next;
      end;
    end
    else
    begin
      lQuery.Close;
      lQuery.SQL.Text := SQL_CONSULTA_VENDEDORES_MV;
      lQuery.Open;
      if not (lQuery.IsEmpty) then
      begin
        Result := Result+
                  EMOJI_ATENDENTE +' '+
                  lQuery.FieldByName('NOME').AsString+sLineBreak+
                  EMOJI_TELEFONE  +' '+
                  lQuery.FieldByName('FONE').AsString+sLineBreak;
      end;
    end;
    lQuery.Close;
  finally
    lQuery.Free;
  end;
  if Result.IsEmpty then
    Result := 'Nenhum contato encontrado'+sLineBreak;
end;

class function TMensagemWhatsapp.MensagemBoasVindas(
  AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
var
  lMensagemWhatsapp: TMensagemWhatsapp;
  lTextoPadrao: string;
  lOpcoesDisponiveis: string;
  lMensagemParaEnviar: string;
  lMensagemParaSair: string;
begin
  lMensagemWhatsapp := TMensagemWhatsapp.Create;
  try
    if lMensagemWhatsapp.FdmConexao.ConectarBanco then
    begin
      lTextoPadrao := lMensagemWhatsapp.GetMensagemPadrao(TP_MENSAGEM_PADRAO_BOAS_VINDAS);
      if lTextoPadrao.IsEmpty then
        lTextoPadrao := 'Ol�, bem-vindo ao nosso atedimento automatizado';
      lMensagemParaSair := 'Digite *'+UpperCase(TP_PALAVRA_CHAVE_ATENDIMENTO_SAIR)+'* para finalizar o atendimento';
      lOpcoesDisponiveis := lMensagemWhatsapp.GetOpcoesAtedimento(AMensagemRecebida.NumeroEmpresa);
      lMensagemParaEnviar := lTextoPadrao +sLineBreak + lOpcoesDisponiveis +sLineBreak + sLineBreak +lMensagemParaSair;
      Result := TMensagemEnviar.Novo(0,
                                    Now,
                                    AMensagemRecebida.NumeroEmpresa,
                                    AMensagemRecebida.NumeroCliente,
                                    AMensagemRecebida.Ticket,
                                    StartOfTheDay(Now),
                                    EndOfTheDay(Now),
                                    STS_MENSAGEM_NAO_ENVIADA,
                                    TP_INTERACAO_A_PARTIR_DO_USUARIO,
                                    TP_ENTREGA_BOAS_VINDAS_MENU,
                                    lMensagemParaEnviar,
                                    STS_ATENDIMENTO_EM_ABERTO,
                                    AMensagemRecebida.ClienteId,
                                    AMensagemRecebida.ClienteNome,
                                    EmptyStr);
      Result.RegistraMensagem(lMensagemWhatsapp.FdmConexao.fdConexao);
      lMensagemWhatsapp.FdmConexao.DesconectarBanco;
    end;
  finally
    lMensagemWhatsapp.Free;
  end;
end;

class function TMensagemWhatsapp.MensagemFinalizarAtendimento(
  AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
var
  lMensagemWhatsapp: TMensagemWhatsapp;
  lTextoPadrao: string;
begin
  lMensagemWhatsapp := TMensagemWhatsapp.Create;
  try
    if lMensagemWhatsapp.FdmConexao.ConectarBanco then
    begin
      lTextoPadrao := lMensagemWhatsapp.GetMensagemPadrao(TP_MENSAGEM_PADRAO_FINALIZAR);
      if lTextoPadrao.IsEmpty then
        lTextoPadrao := 'Obrigado por entrar em contato conosco. Estamos sempre a disposi��o. Tenha um bom dia';
      Result := TMensagemEnviar.Novo(0,
                                    Now,
                                    AMensagemRecebida.NumeroEmpresa,
                                    AMensagemRecebida.NumeroCliente,
                                    AMensagemRecebida.Ticket,
                                    StartOfTheDay(Now),
                                    EndOfTheDay(Now),
                                    STS_MENSAGEM_NAO_ENVIADA,
                                    TP_INTERACAO_A_PARTIR_DO_USUARIO,
                                    TP_ENTREGA_FINALIZAR,
                                    lTextoPadrao,
                                    STS_ATENDIMENTO_FINALIZADO,
                                    AMensagemRecebida.ClienteId,
                                    AMensagemRecebida.ClienteNome,
                                    EmptyStr);
      Result.RegistraMensagem(lMensagemWhatsapp.FdmConexao.fdConexao);
      lMensagemWhatsapp.FinalizarAtendimento(AMensagemRecebida.NumeroCliente);
      lMensagemWhatsapp.FdmConexao.DesconectarBanco;
    end;
  finally
    lMensagemWhatsapp.Free;
  end;
end;

class function TMensagemWhatsapp.MenuInicialSemBoasVindas(
  AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
var
  lMensagemWhatsapp: TMensagemWhatsapp;
  lTextoPadrao: string;
  lOpcoesDisponiveis: string;
  lMensagemParaEnviar: string;
  lMensagemParaSair: string;
begin
  lMensagemWhatsapp := TMensagemWhatsapp.Create;
  try
    if lMensagemWhatsapp.FdmConexao.ConectarBanco then
    begin
      lTextoPadrao := 'Por favor, informe a op��o desejada';
      lMensagemParaSair := 'Digite *'+UpperCase(TP_PALAVRA_CHAVE_ATENDIMENTO_SAIR)+'* para finalizar o atendimento';
      lOpcoesDisponiveis := lMensagemWhatsapp.GetOpcoesAtedimento(AMensagemRecebida.NumeroEmpresa);
      lMensagemParaEnviar := lTextoPadrao +sLineBreak + lOpcoesDisponiveis +sLineBreak + sLineBreak +lMensagemParaSair;
      Result := TMensagemEnviar.Novo(0,
                                    Now,
                                    AMensagemRecebida.NumeroEmpresa,
                                    AMensagemRecebida.NumeroCliente,
                                    AMensagemRecebida.Ticket,
                                    StartOfTheDay(Now),
                                    EndOfTheDay(Now),
                                    STS_MENSAGEM_NAO_ENVIADA,
                                    TP_INTERACAO_A_PARTIR_DO_USUARIO,
                                    TP_ENTREGA_MENU_INICIAL,
                                    lMensagemParaEnviar,
                                    STS_ATENDIMENTO_EM_ABERTO,
                                    AMensagemRecebida.ClienteId,
                                    AMensagemRecebida.ClienteNome,
                                    EmptyStr);
      Result.RegistraMensagem(lMensagemWhatsapp.FdmConexao.fdConexao);
      lMensagemWhatsapp.FdmConexao.DesconectarBanco;
    end;
  finally
    lMensagemWhatsapp.Free;
  end;
end;

class function TMensagemWhatsapp.RedirecionarParaVendedores(
  AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
var
  lMensagemParaEnviar, lTextoPadrao: string;
  lMensagemWhatsapp: TMensagemWhatsapp;
begin
  lMensagemWhatsapp := TMensagemWhatsapp.Create;
  try
    if lMensagemWhatsapp.FdmConexao.ConectarBanco then
    begin
      lTextoPadrao := 'N�o encontramos seu cadastro para o CFP/CNPJ informado. Segue o contato de nossos colaboradores'+sLineBreak;
      lMensagemParaEnviar := lTextoPadrao + lMensagemWhatsapp.ListarVendedores +sLineBreak+ lMensagemWhatsapp.GetTextoInicioSair;
      Result := TMensagemEnviar.Novo(0,
                                    Now,
                                    AMensagemRecebida.NumeroEmpresa,
                                    AMensagemRecebida.NumeroCliente,
                                    AMensagemRecebida.Ticket,
                                    StartOfTheDay(Now),
                                    EndOfTheDay(Now),
                                    STS_MENSAGEM_NAO_ENVIADA,
                                    TP_INTERACAO_A_PARTIR_DO_USUARIO,
                                    TP_ENTREGA_CONTATO_VENDEDORES,
                                    lMensagemParaEnviar,
                                    STS_ATENDIMENTO_EM_ABERTO,
                                    AMensagemRecebida.ClienteId,
                                    AMensagemRecebida.ClienteNome,
                                    EmptyStr);
      Result.RegistraMensagem(lMensagemWhatsapp.FdmConexao.fdConexao);
      lMensagemWhatsapp.FdmConexao.DesconectarBanco;
    end;
  finally
    lMensagemWhatsapp.Free;
  end;
end;

class function TMensagemWhatsapp.ReenviaUltimaMensagemValida(
  AMensagemRecebida: TMensagemRecebida): TMensagemEnviar;
var
  lMensagemWhatsapp: TMensagemWhatsapp;
  lUltimaMensagemValida: TMensagemEnviar;
  lTextoPadrao: string;
  lOpcoesDisponiveis: string;
  lMensagemParaEnviar: string;
  lMensagemParaSair: string;
begin
  lMensagemWhatsapp := TMensagemWhatsapp.Create;
  try
    if lMensagemWhatsapp.FdmConexao.ConectarBanco then
    begin
      lTextoPadrao := '*OP��O INV�LIDA*'+sLineBreak;

      lUltimaMensagemValida := TMensagemEnviar.RetornaUltimaOpcaoEntregueValida(AMensagemRecebida.NumeroEmpresa,
                                                                                AMensagemRecebida.NumeroCliente,
                                                                                lMensagemWhatsapp.FdmConexao.fdConexao);

      case lUltimaMensagemValida.OpcaoEntregue of
        TP_ENTREGA_BOAS_VINDAS_MENU, TP_ENTREGA_MENU_INICIAL: begin
          lTextoPadrao := lTextoPadrao+ 'Por favor, informe a op��o desejada';
          lMensagemParaSair := 'Digite *'+UpperCase(TP_PALAVRA_CHAVE_ATENDIMENTO_SAIR)+'* para finalizar o atendimento';
          lOpcoesDisponiveis := lMensagemWhatsapp.GetOpcoesAtedimento(AMensagemRecebida.NumeroEmpresa);
          lMensagemParaEnviar := lTextoPadrao +sLineBreak + lOpcoesDisponiveis +sLineBreak + sLineBreak +lMensagemParaSair;
        end;
        TP_ENTREGA_ULTIMOS_PEDIDOS, TP_ENTREGA_ULTIMOS_OS, TP_ENTREGA_CONTAS_EM_ABERTO,
        TP_ENTREGA_BOLETOS_EM_ABERTO, TP_ENTREGA_CONTATO_VENDEDORES: begin
          lMensagemParaEnviar := lTextoPadrao + lMensagemWhatsapp.GetTextoInicioSair;
        end;
        else begin
          lMensagemParaEnviar := lTextoPadrao + ReplaceStr(lUltimaMensagemValida.GetMensagem, lTextoPadrao, '');
        end;
      end;

      Result := TMensagemEnviar.Novo(0,
                                    Now,
                                    AMensagemRecebida.NumeroEmpresa,
                                    AMensagemRecebida.NumeroCliente,
                                    AMensagemRecebida.Ticket,
                                    StartOfTheDay(Now),
                                    EndOfTheDay(Now),
                                    STS_MENSAGEM_NAO_ENVIADA,
                                    TP_INTERACAO_A_PARTIR_DO_USUARIO,
                                    lUltimaMensagemValida.OpcaoEntregue,
                                    lMensagemParaEnviar,
                                    STS_ATENDIMENTO_EM_ABERTO,
                                    AMensagemRecebida.ClienteId,
                                    AMensagemRecebida.ClienteNome,
                                    EmptyStr);
      Result.RegistraMensagem(lMensagemWhatsapp.FdmConexao.fdConexao);
      lMensagemWhatsapp.FdmConexao.DesconectarBanco;
    end;
  finally
    lMensagemWhatsapp.Free;
  end;
end;

{ TMensagemEnvia }

class function TMensagemEnviar.Add(AId: integer; ADataCadastro: TDateTime;
  ANumeroEmpresa, ANumeroCliente, ATicket: string; ADataEnvioInicio,
  ADataEnvioFinal: TDateTime; AStatusEnvio, ATipoInteracao,
  AOpcaoEntregue: integer; AMensagem: string; AFinalizado, AClienteId: integer;
  AClienteNome, AAnexoMensagem: string): TMensagemEnviar;
begin
  Result.Id := AId;
  Result.DataCadastro := ADataCadastro;
  Result.NumeroEmpresa := ANumeroEmpresa;
  Result.NumeroCliente := ANumeroCliente;
  Result.Ticket := ATicket;
  Result.DataEnvioInicio := ADataEnvioInicio;
  Result.DataEnvioFinal := ADataEnvioFinal;
  Result.StatusEnvio := AStatusEnvio;
  Result.TipoInteracao := ATipoInteracao;
  Result.OpcaoEntregue := AOpcaoEntregue;
  Result.FMensagem := AMensagem;
  Result.Finalizado := AFinalizado;
  Result.ClienteId := AClienteId;
  Result.ClienteNome := AClienteNome;
  Result.FAnexoMensagem := AAnexoMensagem;
end;

class function TMensagemEnviar.RecuperaMensagens(ANumeroEmpresa: string;
  AConexao: TFDConnection): TList<TMensagemEnviar>;
var
  lQuery: TFDQuery;
begin
  Result := TList<TMensagemEnviar>.Create;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := AConexao;
    lQuery.SQL.Text := 'select E.*,  ' +
                              'CLI.DESCRICAO CLIENTE_NOME ' +
                       'from WB_MENSAGEM_ENVIO E ' +
                       'left join CLIENTES CLI on CLI.ID = E.CLIENTE_ID ' +
                       'where E.NUMERO_EMPRESA = :NUMEROEMPRESA and ' +
                             'current_timestamp between E.DATA_ENVIO_INICIO and E.DATA_ENVIO_FINAL and ' +
                             'E.STATUS_ENVIO = :STATUSENVIO';
    lQuery.ParamByName('NUMEROEMPRESA').AsString := ANumeroEmpresa;
    lQuery.ParamByName('STATUSENVIO').AsInteger := STS_MENSAGEM_NAO_ENVIADA;
    lQuery.Open;
    if not (lQuery.IsEmpty) then
    begin
      lQuery.First;
      while not (lQuery.Eof) do
      begin
        Result.Add(TMensagemEnviar.Add(lQuery.FieldByName('ID').AsInteger,
                                      lQuery.FieldByName('DATA_CADASTRO').AsDateTime,
                                      lQuery.FieldByName('NUMERO_EMPRESA').AsString,
                                      lQuery.FieldByName('NUMERO_CLIENTE').AsString,
                                      lQuery.FieldByName('TICKET').AsString,
                                      lQuery.FieldByName('DATA_ENVIO_INICIO').AsDateTime,
                                      lQuery.FieldByName('DATA_ENVIO_FINAL').AsDateTime,
                                      lQuery.FieldByName('STATUS_ENVIO').AsInteger,
                                      lQuery.FieldByName('TIPO_INTERACAO').AsInteger,
                                      lQuery.FieldByName('OPCAO_ENTREGUE').AsInteger,
                                      lQuery.FieldByName('MENSAGEM').AsWideString,
                                      lQuery.FieldByName('FINALIZADO').AsInteger,
                                      lQuery.FieldByName('CLIENTE_ID').AsInteger,
                                      lQuery.FieldByName('CLIENTE_NOME').AsString,
                                      lQuery.FieldByName('ANEXO_MENSAGEM').AsWideString));
        lQuery.Next;
      end;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TMensagemEnviar.RecuperaMensagens(ANumeroEmpresa,
  ANumeroCliente: string; AConexao: TFDConnection): TList<TMensagemEnviar>;
var
  lQuery: TFDQuery;
begin
  Result := TList<TMensagemEnviar>.Create;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := AConexao;
    lQuery.SQL.Text := 'select E.*,  ' +
                              'CLI.DESCRICAO CLIENTE_NOME ' +
                       'from WB_MENSAGEM_ENVIO E ' +
                       'left join CLIENTES CLI on CLI.ID = E.CLIENTE_ID ' +
                       'where E.NUMERO_EMPRESA = :NUMEROEMPRESA and ' +
                             'E.NUMERO_CLIENTE = :NUMEROCLIENTE and ' +
                             'E.STATUS_ENVIO = :STATUSENVIO';
    lQuery.ParamByName('NUMEROEMPRESA').AsString := ANumeroEmpresa;
    lQuery.ParamByName('NUMEROCLIENTE').AsString := ANumeroCliente;
    lQuery.ParamByName('STATUSENVIO').AsInteger := STS_MENSAGEM_ENVIADA;
    lQuery.Open;
    if not (lQuery.IsEmpty) then
    begin
      lQuery.First;
      while not (lQuery.Eof) do
      begin
        Result.Add(TMensagemEnviar.Add(lQuery.FieldByName('ID').AsInteger,
                                      lQuery.FieldByName('DATA_CADASTRO').AsDateTime,
                                      lQuery.FieldByName('NUMERO_EMPRESA').AsString,
                                      lQuery.FieldByName('NUMERO_CLIENTE').AsString,
                                      lQuery.FieldByName('TICKET').AsString,
                                      lQuery.FieldByName('DATA_ENVIO_INICIO').AsDateTime,
                                      lQuery.FieldByName('DATA_ENVIO_FINAL').AsDateTime,
                                      lQuery.FieldByName('STATUS_ENVIO').AsInteger,
                                      lQuery.FieldByName('TIPO_INTERACAO').AsInteger,
                                      lQuery.FieldByName('OPCAO_ENTREGUE').AsInteger,
                                      lQuery.FieldByName('MENSAGEM').AsWideString,
                                      lQuery.FieldByName('FINALIZADO').AsInteger,
                                      lQuery.FieldByName('CLIENTE_ID').AsInteger,
                                      lQuery.FieldByName('CLIENTE_NOME').AsString,
                                      lQuery.FieldByName('ANEXO_MENSAGEM').AsWideString));
        lQuery.Next;
      end;
    end;
  finally
    lQuery.Free;
  end;
end;

function TMensagemEnviar.RegistraMensagem(AConexao: TFDConnection): string;
var
  lQuery: TFDQuery;
begin
  Result := EmptyStr;
  if AConexao.Connected then
  begin
    lQuery := TFDQuery.Create(nil);
    try
      lQuery.Connection := AConexao;
      lQuery.SQL.Text := 'insert into WB_MENSAGEM_ENVIO (DATA_CADASTRO, NUMERO_EMPRESA, NUMERO_CLIENTE, TICKET, DATA_ENVIO_INICIO, ' +
                                                        'DATA_ENVIO_FINAL, STATUS_ENVIO, TIPO_INTERACAO, OPCAO_ENTREGUE, MENSAGEM, ' +
                                                        'FINALIZADO, CLIENTE_ID, ANEXO_MENSAGEM) ' +
                         'values (:DATA_CADASTRO, :NUMERO_EMPRESA, :NUMERO_CLIENTE, :TICKET, :DATA_ENVIO_INICIO, :DATA_ENVIO_FINAL, ' +
                                 ':STATUS_ENVIO, :TIPO_INTERACAO, :OPCAO_ENTREGUE, :MENSAGEM, :FINALIZADO, :CLIENTE_ID, :ANEXO_MENSAGEM)';
      lQuery.ParamByName('NUMERO_EMPRESA').AsString := NumeroEmpresa;
      lQuery.ParamByName('NUMERO_CLIENTE').AsString := NumeroCliente;
      if ClienteId = 0 then
        lQuery.ParamByName('CLIENTE_ID').Clear
      else
        lQuery.ParamByName('CLIENTE_ID').AsInteger := ClienteId;
      lQuery.ParamByName('TICKET').AsString := Ticket;
      lQuery.ParamByName('DATA_CADASTRO').AsDateTime := DataCadastro;
      lQuery.ParamByName('DATA_ENVIO_INICIO').AsDateTime := DataEnvioInicio;
      lQuery.ParamByName('DATA_ENVIO_FINAL').AsDateTime := DataEnvioFinal;
      lQuery.ParamByName('STATUS_ENVIO').AsInteger := StatusEnvio;
      lQuery.ParamByName('TIPO_INTERACAO').AsInteger := TipoInteracao;
      lQuery.ParamByName('OPCAO_ENTREGUE').AsInteger := OpcaoEntregue;
      lQuery.ParamByName('MENSAGEM').AsWideMemo := FMensagem;
      lQuery.ParamByName('FINALIZADO').AsInteger := Finalizado;
      lQuery.ParamByName('ANEXO_MENSAGEM').AsWideMemo := FAnexoMensagem;

      try
        lQuery.ExecSQL;
        lQuery.Connection.Commit;
      except
        on e: exception do
        begin
          Result := 'Erro ao salvar mensagem: '+e.Message;
        end;
      end;
    finally
      lQuery.Free;
    end;
  end;
end;

class function TMensagemEnviar.RetornaUltimaOpcaoEntregueValida(ANumeroEmpresa,
  ANumeroCliente: string; AConexao: TFDConnection): TMensagemEnviar;
var
  lQuery: TFDQuery;
begin
  Result.Clear;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := AConexao;
    lQuery.SQL.Text := 'select first 1 E.*, ' +
                              'CLI.DESCRICAO CLIENTE_NOME ' +
                       'from WB_MENSAGEM_ENVIO E ' +
                       'left join CLIENTES CLI on CLI.ID = E.CLIENTE_ID ' +
                       'where E.NUMERO_EMPRESA = :NUMEROEMPRESA and ' +
                             'E.NUMERO_CLIENTE = :NUMEROCLIENTE and ' +
                             'E.OPCAO_ENTREGUE <> :OPCAOENTREGUE AND '+
                             'E.FINALIZADO = 1 and ' +
                             'E.TIPO_INTERACAO = 1 '+
                       ' order by DATA_CADASTRO desc ';
    lQuery.ParamByName('NUMEROEMPRESA').AsString := ANumeroEmpresa;
    lQuery.ParamByName('NUMEROCLIENTE').AsString := ANumeroCliente;
    lQuery.ParamByName('OPCAOENTREGUE').AsInteger := TP_ENTREGA_OPCAO_INVALIDA;
    lQuery.Open;
    if not (lQuery.IsEmpty) then
    begin
      Result := TMensagemEnviar.Add(lQuery.FieldByName('ID').AsInteger,
                                    lQuery.FieldByName('DATA_CADASTRO').AsDateTime,
                                    lQuery.FieldByName('NUMERO_EMPRESA').AsString,
                                    lQuery.FieldByName('NUMERO_CLIENTE').AsString,
                                    lQuery.FieldByName('TICKET').AsString,
                                    lQuery.FieldByName('DATA_ENVIO_INICIO').AsDateTime,
                                    lQuery.FieldByName('DATA_ENVIO_FINAL').AsDateTime,
                                    lQuery.FieldByName('STATUS_ENVIO').AsInteger,
                                    lQuery.FieldByName('TIPO_INTERACAO').AsInteger,
                                    lQuery.FieldByName('OPCAO_ENTREGUE').AsInteger,
                                    lQuery.FieldByName('MENSAGEM').AsWideString,
                                    lQuery.FieldByName('FINALIZADO').AsInteger,
                                    lQuery.FieldByName('CLIENTE_ID').AsInteger,
                                    lQuery.FieldByName('CLIENTE_NOME').AsString,
                                    lQuery.FieldByName('ANEXO_MENSAGEM').AsWideString);
    end;
  finally
    lQuery.Free;
  end;
end;

procedure TMensagemEnviar.SetAnexoMensagem(ACaminhoArquivo: string);
begin
  FAnexoMensagem := EncodeFileBase64(ACaminhoArquivo);
end;

procedure TMensagemEnviar.SetMensagem(ATextoBruto: string);
begin
  FMensagem := EncodeString(ATextoBruto);
end;

procedure TMensagemEnviar.Clear;
begin
  Id := 0;
  DataCadastro := 0;
  NumeroEmpresa := EmptyStr;
  NumeroCliente := EmptyStr;
  Ticket := EmptyStr;
  DataEnvioInicio := 0;
  DataEnvioFinal := 0;
  StatusEnvio := 0;
  TipoInteracao := 0;
  OpcaoEntregue := 0;
  FMensagem := EmptyStr;
  Finalizado := 0;
  ClienteId := 0;
  ClienteNome := EmptyStr;
  FAnexoMensagem := EmptyStr;
end;

function TMensagemEnviar.GetAnexoImagem: string;
begin
  Result := SalvarImagemEncoded(FAnexoMensagem);
end;

function TMensagemEnviar.GetAnexoPDF: string;
begin
  Result := SalvarPDFEncoded(FAnexoMensagem);
end;

function TMensagemEnviar.GetMensagem: string;
begin
  Result := Trim(DecodeString(FMensagem));
end;

function TMensagemEnviar.MarcarComoEnviada(AConexao: TFDConnection): string;
var
  lQuery: TFDQuery;
begin
  Result := EmptyStr;
  lQuery := TFDQuery.Create(nil);
  lQuery.Connection := AConexao;
  try
    lQuery.SQL.Text := 'update WB_MENSAGEM_ENVIO set STATUS_ENVIO = :STATUS_ENVIO where ID = :ID';
    lQuery.ParamByName('STATUS_ENVIO').AsInteger := STS_MENSAGEM_ENVIADA;
    lQuery.ParamByName('ID').AsInteger := Id;
    lQuery.ExecSQL;
  except
    on e: exception do
    begin
      Result := 'Ocorreu o sequinte erro: '+e.Message;
    end;
  end;
end;

function TMensagemEnviar.MarcarComoFinalizada(AConexao: TFDConnection): string;
var
  lQuery: TFDQuery;
begin
  Result := EmptyStr;
  lQuery := TFDQuery.Create(nil);
  lQuery.Connection := AConexao;
  try
    if Ticket.IsEmpty then
    begin
      lQuery.SQL.Text := 'update WB_MENSAGEM_ENVIO set FINALIZADO = :FINALIZADO where ID = :ID';
      lQuery.ParamByName('ID').AsInteger := Id;
    end
    else
    begin
      lQuery.SQL.Text := 'update WB_MENSAGEM_ENVIO set FINALIZADO = :FINALIZADO where TICKET = :TICKET';
      lQuery.ParamByName('TICKET').AsString := Ticket;
    end;
    lQuery.ParamByName('FINALIZADO').AsInteger := STS_ATENDIMENTO_FINALIZADO;
    lQuery.ExecSQL;
  except
    on e: exception do
    begin
      Result := 'Ocorreu o sequinte erro: '+e.Message;
    end;
  end;
end;

class function TMensagemEnviar.Novo(AId: integer; ADataCadastro: TDateTime;
  ANumeroEmpresa, ANumeroCliente, ATicket: string; ADataEnvioInicio,
  ADataEnvioFinal: TDateTime; AStatusEnvio, ATipoInteracao,
  AOpcaoEntregue: integer; AMensagem: string; AFinalizado, AClienteId: integer;
  AClienteNome, AAnexoMensagem: string): TMensagemEnviar;
begin
  Result.Id := AId;
  Result.DataCadastro := ADataCadastro;
  Result.NumeroEmpresa := ANumeroEmpresa;
  Result.NumeroCliente := ANumeroCliente;
  Result.Ticket := ATicket;
  Result.DataEnvioInicio := ADataEnvioInicio;
  Result.DataEnvioFinal := ADataEnvioFinal;
  Result.StatusEnvio := AStatusEnvio;
  Result.TipoInteracao := ATipoInteracao;
  Result.OpcaoEntregue := AOpcaoEntregue;
  Result.SetMensagem(AMensagem);
  Result.Finalizado := AFinalizado;
  Result.ClienteId := AClienteId;
  Result.ClienteNome := AClienteNome;
  Result.SetAnexoMensagem(AAnexoMensagem);
end;

{ TMensagemBruta }

class function TMensagemBruta.Add(AId: integer; ADataCadastro: TDateTime;
  ANumeroEmpresa, ANumeroCliente, ATicket: string; ADataEnvioInicio,
  ADataEnvioFinal: TDateTime; AStatusEnvio, ATipoInteracao, AOpcaoEntregue,
  AOpcaoRecebida, ATipoEntregaMensagem: integer; AMensagem,
  AAnexoMensagem: string; AFinalizado, AClienteId: integer;
  AProtocolo, AClienteNome: string): TMensagemBruta;
begin
  Result.Id := AId;
  Result.DataCadastro := ADataCadastro;
  Result.NumeroEmpresa := ANumeroEmpresa;
  Result.NumeroCliente := ANumeroCliente;
  Result.Ticket := ATicket;
  Result.DataEnvioInicio := ADataEnvioInicio;
  Result.DataEnvioFinal := ADataEnvioFinal;
  Result.StatusEnvio := AStatusEnvio;
  Result.TipoInteracao := ATipoInteracao;
  Result.OpcaoEntregue := AOpcaoEntregue;
  Result.OpcaoRecebida := AOpcaoRecebida;
  Result.TipoEntregaMensagem := ATipoEntregaMensagem;
  Result.FMensagem := AMensagem;
  Result.FAnexoMensagem := AAnexoMensagem;
  Result.Finalizado := AFinalizado;
  Result.ClienteId := AClienteId;
  Result.Protocolo := AProtocolo;
  Result.vClienteNome := AClienteNome;
end;

function TMensagemBruta.ConverterTextoParaOpcaoMenu(
  ARespostaUsuario: string): integer;
begin
  if (StringsIguais(TP_PALAVRA_CHAVE_ATENDIMENTO_PEDIDOS, ARespostaUsuario)) or
    (StringsIguais(TP_PALAVRA_CHAVE_ATENDIMENTO_PEDIDOS_SINGULAR, ARespostaUsuario)) then
    Result := TP_RECEBIDA_REQUISITAR_ULTIMOS_PEDIDOS
  else
  if (StringsIguais(TP_PALAVRA_CHAVE_ATENDIMENTO_ORDEM_SERVICO, ARespostaUsuario)) or
    (StringsIguais(TP_PALAVRA_CHAVE_ATENDIMENTO_ORDEM_SERVICO_SINGULAR, ARespostaUsuario)) then
    Result := TP_RECEBIDA_REQUISITAR_ULTIMAS_OS
  else
  if (StringsIguais(TP_PALAVRA_CHAVE_ATENDIMENTO_CONTA_RECEBER, ARespostaUsuario)) or
    (StringsIguais(TP_PALAVRA_CHAVE_ATENDIMENTO_CONTA_RECEBER_SINGULAR, ARespostaUsuario)) then
    Result := TP_RECEBIDA_REQUISITAR_CONTAS_EM_ABERTO
  else
  if (StringsIguais(TP_PALAVRA_CHAVE_ATENDIMENTO_BOLETOS, ARespostaUsuario)) or
    (StringsIguais(TP_PALAVRA_CHAVE_ATENDIMENTO_BOLETOS_SINGULAR, ARespostaUsuario)) then
    Result := TP_RECEBIDA_REQUISITAR_BOLETOS_EM_ABERTO
  else
  if (StringsIguais(TP_PALAVRA_CHAVE_ATENDIMENTO_VENDEDORES, ARespostaUsuario)) or
    (StringsIguais(TP_PALAVRA_CHAVE_ATENDIMENTO_VENDEDORES_SINGULAR, ARespostaUsuario)) then
    Result := TP_RECEBIDA_REQUISITAR_CONTATO_VENDEDORES
  else
    Result := TP_RECEBIDA_INVALIDA;
end;

procedure TMensagemBruta.GerarTicket;
var
  lNovoGUID: TGuid;
  lResultado: HResult;
begin
  lResultado := CreateGuid(lNovoGUID);
  if lResultado = S_OK then
   Self.Ticket := GuidToString(lNovoGUID);
end;

function TMensagemBruta.GetAnexoMensagemEncoded: string;
begin
  Result := FAnexoMensagem;
end;

function TMensagemBruta.GetMensagem: string;
begin
  Result := Trim(DecodeString(FMensagem));
end;

function TMensagemBruta.GetMensagemEncoded: string;
begin
  Result := FMensagem;
end;

procedure TMensagemBruta.IdentificarClienteAPartirDoWhatsapp(var AConexao: TFDConnection);
var
  lQuery: TFDQuery;
begin
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := AConexao;
    lQuery.SQL.Text := 'select first 1 ID, DESCRICAO from CLIENTES where WHATSAPP = :WHATSAPP';
    lQuery.ParamByName('WHATSAPP').AsString := Self.NumeroCliente;
    lQuery.Open;
    if not (lQuery.IsEmpty) then
    begin
      Self.ClienteId := lQuery.FieldByName('ID').AsInteger;
      Self.vClienteNome := lQuery.FieldByName('DESCRICAO').AsString;
    end;
    lQuery.Close;
  finally
    lQuery.Free;
  end;
end;

function TMensagemBruta.MarcarComoEnviada(var AConexao: TFDConnection): string;
var
  lQuery: TFDQuery;
begin
  Result := EmptyStr;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := AConexao;
    try
      lQuery.SQL.Text := 'update WB_MENSAGENS set STATUS_ENVIO = :STATUS_ENVIO where ID = :ID';
      lQuery.ParamByName('STATUS_ENVIO').AsInteger := STS_MENSAGEM_ENVIADA;
      lQuery.ParamByName('ID').AsInteger := Id;
      lQuery.ExecSQL;
    except
      on e: exception do
      begin
        Result := 'Ocorreu o sequinte erro: '+e.Message;
      end;
    end;
  finally
    lQuery.Free;
  end;
end;

function TMensagemBruta.MarcarComoLida(var AConexao: TFDConnection): string;
var
  lQuery: TFDQuery;
begin
  Result := EmptyStr;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := AConexao;
    try
      lQuery.SQL.Text := 'update WB_MENSAGENS set STATUS_ENVIO = :STATUS_ENVIO where ID = :ID';
      lQuery.ParamByName('STATUS_ENVIO').AsInteger := STS_MENSAGEM_LIDA;
      lQuery.ParamByName('ID').AsInteger := Id;
      lQuery.ExecSQL;
    except
      on e: exception do
      begin
        Result := 'Ocorreu o sequinte erro: '+e.Message;
      end;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TMensagemBruta.Novo(AId: integer; ADataCadastro: TDateTime;
  ANumeroEmpresa, ANumeroCliente, ATicket: string; ADataEnvioInicio,
  ADataEnvioFinal: TDateTime; AStatusEnvio, ATipoInteracao, AOpcaoEntregue,
  AOpcaoRecebida, ATipoEntregaMensagem: integer; AMensagem,
  AAnexoMensagem: string; AFinalizado, AClienteId: integer; AProtocolo,
  AClienteNome: string): TMensagemBruta;
begin
  Result.Id := AId;
  Result.DataCadastro := ADataCadastro;
  Result.NumeroEmpresa := ANumeroEmpresa;
  Result.NumeroCliente := ANumeroCliente;
  Result.Ticket := ATicket;
  Result.DataEnvioInicio := ADataEnvioInicio;
  Result.DataEnvioFinal := ADataEnvioFinal;
  Result.StatusEnvio := AStatusEnvio;
  Result.TipoInteracao := ATipoInteracao;
  Result.OpcaoEntregue := AOpcaoEntregue;
  Result.OpcaoRecebida := AOpcaoRecebida;
  Result.TipoEntregaMensagem := ATipoEntregaMensagem;
  Result.SetMensagem(AMensagem);
  Result.SetAnexoMensagem(AAnexoMensagem);
  Result.Finalizado := AFinalizado;
  Result.ClienteId := AClienteId;
  Result.Protocolo := AProtocolo;
  Result.vClienteNome := AClienteNome;
end;

class function TMensagemBruta.RecuperaMensagens(ANumeroEmpresa: string; AStatusEnvio: integer;
  AConexao: TFDConnection): TList<TMensagemBruta>;
var
  lQuery: TFDQuery;
  Key: string;
begin
  Result := TList<TMensagemBruta>.Create;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := AConexao;
    lQuery.SQL.Text := 'select B.*, ' +
                              'CLI.DESCRICAO CLIENTE_NOME ' +
                       'from WB_MENSAGENS B ' +
                       'left join CLIENTES CLI on CLI.ID = B.CLIENTE_ID ' +
                       'where B.NUMERO_EMPRESA = :NUMEROEMPRESA and ' +
                             'current_timestamp between B.DATA_ENVIO_INICIO and B.DATA_ENVIO_FINAL and ' +
                             'B.STATUS_ENVIO = :STATUSENVIO ';
    lQuery.ParamByName('NUMEROEMPRESA').AsString := ANumeroEmpresa;
    lQuery.ParamByName('STATUSENVIO').AsInteger := AStatusEnvio;
    lQuery.Open;
    if not (lQuery.IsEmpty) then
    begin
      lQuery.First;
      while not (lQuery.Eof) do
      begin
        Result.Add(TMensagemBruta.Add(lQuery.FieldByName('ID').AsInteger,
                                      lQuery.FieldByName('DATA_CADASTRO').AsDateTime,
                                      lQuery.FieldByName('NUMERO_EMPRESA').AsString,
                                      lQuery.FieldByName('NUMERO_CLIENTE').AsString,
                                      lQuery.FieldByName('TICKET').AsString,
                                      lQuery.FieldByName('DATA_ENVIO_INICIO').AsDateTime,
                                      lQuery.FieldByName('DATA_ENVIO_FINAL').AsDateTime,
                                      lQuery.FieldByName('STATUS_ENVIO').AsInteger,
                                      lQuery.FieldByName('TIPO_INTERACAO').AsInteger,
                                      lQuery.FieldByName('OPCAO_ENTREGUE').AsInteger,
                                      lQuery.FieldByName('OPCAO_RECEBIDA').AsInteger,
                                      lQuery.FieldByName('TIPO_ENTREGA_MENSAGEM').AsInteger,
                                      lQuery.FieldByName('MENSAGEM').AsWideString,
                                      lQuery.FieldByName('ANEXO_MENSAGEM').AsWideString,
                                      lQuery.FieldByName('FINALIZADO').AsInteger,
                                      lQuery.FieldByName('CLIENTE_ID').AsInteger,
                                      lQuery.FieldByName('PROTOCOLO').AsString,
                                      lQuery.FieldByName('CLIENTE_NOME').AsString));
        lQuery.Next;
      end;
    end;
  finally
    lQuery.Free;
  end;
end;

class function TMensagemBruta.RecuperaMensagensRecebidas(ANumeroEmpresa: string;
  var AConexao: TFDConnection): TList<TMensagemBruta>;
var
  lQuery: TFDQuery;
  lNumeros: TDictionary<string, integer>;
  Key: string;
begin
  Result := TList<TMensagemBruta>.Create;
  lQuery := TFDQuery.Create(nil);
  lNumeros := TDictionary<string, integer>.Create;
  try
    lQuery.Connection := AConexao;
    //Recuperar todos os numeros dos clientes que enviaram mensagem antes das mensagem
    lQuery.SQL.Text := 'select distinct B.NUMERO_CLIENTE, ' +
                             '(select first 1 CLI.ID ' +
                             'from CLIENTES CLI ' +
                             'where CLI.WHATSAPP = B.NUMERO_CLIENTE) CLIENTE_ID '+
                       'from wb_mensagens b ' +
                       'where B.NUMERO_EMPRESA = :NUMEROEMPRESA and ' +
                             'current_timestamp between B.DATA_ENVIO_INICIO and B.DATA_ENVIO_FINAL and ' +
                             'B.STATUS_ENVIO = :STATUSENVIO ';
    lQuery.ParamByName('NUMEROEMPRESA').AsString := ANumeroEmpresa;
    lQuery.ParamByName('STATUSENVIO').AsInteger := STS_MENSAGEM_RECEBIDA;
    lQuery.Open;
    if not (lQuery.IsEmpty) then
    begin
      lQuery.First;
      while not (lQuery.Eof) do
      begin
        lNumeros.Add(lQuery.FieldByName('NUMERO_CLIENTE').AsString, lQuery.FieldByName('CLIENTE_ID').AsInteger);
        lQuery.Next;
      end;
    end;

    for Key in lNumeros.Keys do
    begin
      lQuery.Close;
      lQuery.SQL.Text := 'select first 1 B.*, ' +
                                'CLI.DESCRICAO CLIENTE_NOME ' +
                         'from WB_MENSAGENS B ' +
                         'left join CLIENTES CLI on CLI.ID = iif(:CLIENTEID = 0, B.CLIENTE_ID, :CLIENTEID) ' +
                         'where B.NUMERO_EMPRESA = :NUMEROEMPRESA and ' +
                               'current_timestamp between B.DATA_ENVIO_INICIO and B.DATA_ENVIO_FINAL and ' +
                               'B.STATUS_ENVIO = :STATUSENVIO and ' +
                               'B.NUMERO_CLIENTE = :NUMEROCLIENTE ' +
                         'order by B.DATA_CADASTRO desc ';
      lQuery.ParamByName('CLIENTEID').AsInteger := lNumeros.Items[Key];
      lQuery.ParamByName('NUMEROEMPRESA').AsString := ANumeroEmpresa;
      lQuery.ParamByName('STATUSENVIO').AsInteger := STS_MENSAGEM_RECEBIDA;
      lQuery.ParamByName('NUMEROCLIENTE').AsString := Key;
      lQuery.Open;
      if not (lQuery.IsEmpty) then
      begin
        lQuery.First;
        while not (lQuery.Eof) do
        begin
          Result.Add(TMensagemBruta.Add(lQuery.FieldByName('ID').AsInteger,
                                        lQuery.FieldByName('DATA_CADASTRO').AsDateTime,
                                        lQuery.FieldByName('NUMERO_EMPRESA').AsString,
                                        lQuery.FieldByName('NUMERO_CLIENTE').AsString,
                                        lQuery.FieldByName('TICKET').AsString,
                                        lQuery.FieldByName('DATA_ENVIO_INICIO').AsDateTime,
                                        lQuery.FieldByName('DATA_ENVIO_FINAL').AsDateTime,
                                        lQuery.FieldByName('STATUS_ENVIO').AsInteger,
                                        lQuery.FieldByName('TIPO_INTERACAO').AsInteger,
                                        lQuery.FieldByName('OPCAO_ENTREGUE').AsInteger,
                                        lQuery.FieldByName('OPCAO_RECEBIDA').AsInteger,
                                        lQuery.FieldByName('TIPO_ENTREGA_MENSAGEM').AsInteger,
                                        lQuery.FieldByName('MENSAGEM').AsWideString,
                                        lQuery.FieldByName('ANEXO_MENSAGEM').AsWideString,
                                        lQuery.FieldByName('FINALIZADO').AsInteger,
                                        lNumeros.Items[Key],
                                        lQuery.FieldByName('PROTOCOLO').AsString,
                                        lQuery.FieldByName('CLIENTE_NOME').AsString));
          lQuery.Next;
        end;
      end;
    end;
  finally
    lNumeros.Free;
    lQuery.Free;
  end;
end;

function TMensagemBruta.RegistraMensagemArquivo(ACaminhoArquivo: string; var AConexao: TFDConnection): string;
var
  lQuery: TFDQuery;
begin
  if not FileExists(ACaminhoArquivo) then
    Exit('Arquivo n�o encontrado');
  Result := EmptyStr;
  if AConexao.Connected then
  begin
    lQuery := TFDQuery.Create(nil);
    try
      lQuery.Connection := AConexao;
      lQuery.SQL.Text := 'update or insert into WB_MENSAGENS (DATA_CADASTRO, NUMERO_EMPRESA, NUMERO_CLIENTE, TICKET, DATA_ENVIO_INICIO, ' +
                                                   'DATA_ENVIO_FINAL, STATUS_ENVIO, TIPO_INTERACAO, OPCAO_ENTREGUE, OPCAO_RECEBIDA, ' +
                                                   'TIPO_ENTREGA_MENSAGEM, MENSAGEM, ANEXO_MENSAGEM, FINALIZADO, CLIENTE_ID, PROTOCOLO) ' +
                         'values (current_timestamp, :NUMERO_EMPRESA, :NUMERO_CLIENTE, :TICKET, :DATA_ENVIO_INICIO, :DATA_ENVIO_FINAL, ' +
                                 ':STATUS_ENVIO, :TIPO_INTERACAO, :OPCAO_ENTREGUE, :OPCAO_RECEBIDA, :TIPO_ENTREGA_MENSAGEM, :MENSAGEM, ' +
                                 ':ANEXO_MENSAGEM, :FINALIZADO, :CLIENTE_ID, :PROTOCOLO) matching (PROTOCOLO)';
      lQuery.ParamByName('NUMERO_EMPRESA').AsString := NumeroEmpresa;
      lQuery.ParamByName('NUMERO_CLIENTE').AsString := NumeroCliente;
      if ClienteId = 0 then
        lQuery.ParamByName('CLIENTE_ID').Clear
      else
        lQuery.ParamByName('CLIENTE_ID').AsInteger := ClienteId;
      lQuery.ParamByName('TICKET').AsString := Ticket;
      lQuery.ParamByName('DATA_ENVIO_INICIO').AsDateTime := DataEnvioInicio;
      lQuery.ParamByName('DATA_ENVIO_FINAL').AsDateTime := DataEnvioFinal;
      lQuery.ParamByName('STATUS_ENVIO').AsInteger := StatusEnvio;
      lQuery.ParamByName('TIPO_INTERACAO').AsInteger := TipoInteracao;
      lQuery.ParamByName('OPCAO_ENTREGUE').AsInteger := OpcaoEntregue;
      lQuery.ParamByName('OPCAO_RECEBIDA').AsInteger := OpcaoRecebida;
      lQuery.ParamByName('TIPO_ENTREGA_MENSAGEM').AsInteger := TipoEntregaMensagem;
      lQuery.ParamByName('MENSAGEM').AsWideString := FMensagem;
      lQuery.ParamByName('ANEXO_MENSAGEM').AsWideString := EncodeFileBase64(ACaminhoArquivo);
      lQuery.ParamByName('FINALIZADO').AsInteger := Finalizado;
      if Protocolo.IsEmpty then
        lQuery.ParamByName('PROTOCOLO').AsString := FormatDateTime('ddmmyyhhnnsszzz', Now)
      else
        lQuery.ParamByName('PROTOCOLO').AsString := Protocolo;
      try
        lQuery.ExecSQL;
      except
        on e: exception do
        begin
          Result := 'Erro ao salvar mensagem: '+e.Message;
        end;
      end;
    finally
      lQuery.Free;
    end;
  end;
end;

function TMensagemBruta.RegistraMensagemTexto(var AConexao: TFDConnection): string;
var
  lQuery: TFDQuery;
begin
  Result := EmptyStr;
  if AConexao.Connected then
  begin
    lQuery := TFDQuery.Create(nil);
    try
      lQuery.Connection := AConexao;
      lQuery.SQL.Text := 'update or insert into WB_MENSAGENS (DATA_CADASTRO, NUMERO_EMPRESA, NUMERO_CLIENTE, TICKET, DATA_ENVIO_INICIO, ' +
                                                   'DATA_ENVIO_FINAL, STATUS_ENVIO, TIPO_INTERACAO, OPCAO_ENTREGUE, OPCAO_RECEBIDA, ' +
                                                   'TIPO_ENTREGA_MENSAGEM, MENSAGEM, FINALIZADO, CLIENTE_ID, PROTOCOLO) ' +
                         'values (current_timestamp, :NUMERO_EMPRESA, :NUMERO_CLIENTE, :TICKET, :DATA_ENVIO_INICIO, :DATA_ENVIO_FINAL, ' +
                                 ':STATUS_ENVIO, :TIPO_INTERACAO, :OPCAO_ENTREGUE, :OPCAO_RECEBIDA, :TIPO_ENTREGA_MENSAGEM, :MENSAGEM, ' +
                                 ':FINALIZADO, :CLIENTE_ID, :PROTOCOLO) matching (PROTOCOLO)';
      lQuery.ParamByName('NUMERO_EMPRESA').AsString := NumeroEmpresa;
      lQuery.ParamByName('NUMERO_CLIENTE').AsString := NumeroCliente;
      if ClienteId = 0 then
        lQuery.ParamByName('CLIENTE_ID').Clear
      else
        lQuery.ParamByName('CLIENTE_ID').AsInteger := ClienteId;
      lQuery.ParamByName('TICKET').AsString := Ticket;
      lQuery.ParamByName('DATA_ENVIO_INICIO').AsDateTime := DataEnvioInicio;
      lQuery.ParamByName('DATA_ENVIO_FINAL').AsDateTime := DataEnvioFinal;
      lQuery.ParamByName('STATUS_ENVIO').AsInteger := StatusEnvio;
      lQuery.ParamByName('TIPO_INTERACAO').AsInteger := TipoInteracao;
      lQuery.ParamByName('OPCAO_ENTREGUE').AsInteger := OpcaoEntregue;
      lQuery.ParamByName('OPCAO_RECEBIDA').AsInteger := OpcaoRecebida;
      lQuery.ParamByName('TIPO_ENTREGA_MENSAGEM').AsInteger := TipoEntregaMensagem;
      lQuery.ParamByName('MENSAGEM').AsString := FMensagem;
      lQuery.ParamByName('FINALIZADO').AsInteger := Finalizado;
      if Protocolo.IsEmpty then
        lQuery.ParamByName('PROTOCOLO').AsString := FormatDateTime('ddmmyyhhnnsszzz', Now)
      else
        lQuery.ParamByName('PROTOCOLO').AsString := Protocolo;
      try
        lQuery.ExecSQL;
      except
        on e: exception do
        begin
          Result := 'Erro ao salvar mensagem: '+e.Message;
        end;
      end;
    finally
      lQuery.Free;
    end;
  end;
end;


function TMensagemBruta.SalvaMensagemRecebida(ATipoMensagemRecebida: integer;
  var AConexao: TFDConnection): TMensagemRecebida;
begin
  if Ticket.IsEmpty then
    GerarTicket;
  if ClienteId = 0 then
    IdentificarClienteAPartirDoWhatsapp(AConexao);
  Result := TMensagemRecebida.Add(0, DataCadastro, NumeroEmpresa, NumeroCliente, Ticket,
    Protocolo, ATipoMensagemRecebida, FMensagem, Finalizado, ClienteId, vClienteNome);
  Result.RegistraMensagem(AConexao);
end;

procedure TMensagemBruta.SetAnexoMensagem(ACaminhoArquivo: string);
begin
  FAnexoMensagem := EncodeFileBase64(ACaminhoArquivo);
end;

procedure TMensagemBruta.SetMensagem(ATextoBruto: string);
begin
  FMensagem := EncodeString(ATextoBruto);
end;

function TMensagemBruta.TratarMensagemRecebida(AUltimaMensagemValida: TMensagemEnviar;
  var AConexao: TFDConnection): TMensagemRecebida;
var
  lRespostaTratada: integer;
begin
  if not (VerificarSeEncerraAtendimento(Self.GetMensagem)) then
  begin
    case AUltimaMensagemValida.OpcaoEntregue of
      TP_ENTREGA_BOAS_VINDAS_MENU, TP_ENTREGA_MENU_INICIAL: begin
        lRespostaTratada := ConverterTextoParaOpcaoMenu(Self.GetMensagem);
        if ClienteId = 0 then
          IdentificarClienteAPartirDoWhatsapp(AConexao);
        Result := TMensagemRecebida.Add(0, DataCadastro, NumeroEmpresa, NumeroCliente, AUltimaMensagemValida.Ticket,
          Protocolo, lRespostaTratada, FMensagem, Finalizado, ClienteId, vClienteNome);
      end;
      TP_ENTREGA_ULTIMOS_PEDIDOS_REQUISITAR_CNPJCPF, TP_ENTREGA_ULTIMOS_OS_REQUISITAR_CNPJCPF,
      TP_ENTREGA_CONTAS_EM_ABERTO_REQUISITAR_CNPJCPF, TP_ENTREGA_BOLETOS_EM_ABERTO_REQUISITAR_CNPJCPF: begin //Respostas para quando requisitar cpf/cnpj
        if VerificarSeVoltaParaOMenuInicial(Self.GetMensagem) then
        begin //Volta para o menu inicial
          Result := TMensagemRecebida.Add(0, DataCadastro, NumeroEmpresa, NumeroCliente, AUltimaMensagemValida.Ticket,
            Protocolo, TP_RECEBIDA_INICIO_ATENDIMENTO, FMensagem, Finalizado, ClienteId, vClienteNome);
        end
        else
        begin
          lRespostaTratada := ValidarCPFCNPJDoCliente(Self.GetMensagem, AConexao);
          if lRespostaTratada = TP_RECEBIDA_VALIDADA then
            case AUltimaMensagemValida.OpcaoEntregue of
              TP_ENTREGA_ULTIMOS_PEDIDOS_REQUISITAR_CNPJCPF: lRespostaTratada := TP_RECEBIDA_REQUISITAR_ULTIMOS_PEDIDOS_CPFCNPJ_ENCONTRADO;
              TP_ENTREGA_ULTIMOS_OS_REQUISITAR_CNPJCPF: lRespostaTratada := TP_RECEBIDA_REQUISITAR_ULTIMAS_OS_CPFCNPJ_ENCONTRADO;
              TP_ENTREGA_CONTAS_EM_ABERTO_REQUISITAR_CNPJCPF: lRespostaTratada := TP_RECEBIDA_REQUISITAR_CONTAS_EM_ABERTO_CPFCNPJ_ENCONTRADO;
              TP_ENTREGA_BOLETOS_EM_ABERTO_REQUISITAR_CNPJCPF: lRespostaTratada := TP_RECEBIDA_REQUISITAR_BOLETOS_EM_ABERTO_CPFCNPJ_ENCONTRADO;
            end;
          Result := TMensagemRecebida.Add(0, DataCadastro, NumeroEmpresa, NumeroCliente, AUltimaMensagemValida.Ticket,
            Protocolo, lRespostaTratada, FMensagem, Finalizado, ClienteId, vClienteNome);
        end;
      end;
      //Caso o usuario ja fez o que queria tratar se ele ta voltando para o inicio novamente
      TP_ENTREGA_ULTIMOS_PEDIDOS, TP_ENTREGA_ULTIMOS_OS, TP_ENTREGA_CONTAS_EM_ABERTO,
      TP_ENTREGA_BOLETOS_EM_ABERTO, TP_ENTREGA_CONTATO_VENDEDORES: begin
        if VerificarSeVoltaParaOMenuInicial(Self.GetMensagem) then
        begin //Volta para o menu inicial
          Result := TMensagemRecebida.Add(0, DataCadastro, NumeroEmpresa, NumeroCliente, AUltimaMensagemValida.Ticket,
            Protocolo, TP_RECEBIDA_INICIO_ATENDIMENTO, FMensagem, Finalizado, ClienteId, vClienteNome);
        end
        else
        begin //Retona op��o invalida
          Result := TMensagemRecebida.Add(0, DataCadastro, NumeroEmpresa, NumeroCliente, AUltimaMensagemValida.Ticket,
            Protocolo, TP_RECEBIDA_INVALIDA, FMensagem, Finalizado, ClienteId, vClienteNome);
        end;
      end;
    end;
  end
  else  //Encerra os atendimentos se o usuairo digitou "SAIR"
  begin
    Result := TMensagemRecebida.Add(0, DataCadastro, NumeroEmpresa, NumeroCliente, AUltimaMensagemValida.Ticket,
      Protocolo, TP_RECEBIDA_FINALIZAR, FMensagem, STS_ATENDIMENTO_FINALIZADO, ClienteId, vClienteNome);
  end;
  Result.RegistraMensagem(AConexao);
end;

function TMensagemBruta.ValidarCPFCNPJDoCliente(ARespostaUsuario: string;
  var AConexao: TFDConnection): integer;
var
  lQuery: TFDQuery;
begin
  if ValidarCNPJouCPF(Trim(ARespostaUsuario)).IsEmpty then
  begin
    lQuery := TFDQuery.Create(nil);
    try
      lQuery.Connection := AConexao;
      lQuery.SQL.Text := 'select first 1 ID, DESCRICAO from CLIENTES where (CPF = :DOCUMENTO) or (CNPJ = :DOCUMENTO)';
      lQuery.ParamByName('DOCUMENTO').AsString := OnlyCNPJorCPF(ARespostaUsuario);
      lQuery.Open;
      if not (lQuery.IsEmpty) then
      begin
        Self.ClienteId := lQuery.FieldByName('ID').AsInteger;
        Self.vClienteNome := lQuery.FieldByName('DESCRICAO').AsString;
        Result := TP_RECEBIDA_VALIDADA;
        lQuery.Close;
        lQuery.SQL.Text := 'update CLIENTES set WHATSAPP = :WHATSAPP where ID = :ID';
        lQuery.ParamByName('WHATSAPP').AsString := Self.NumeroCliente;
        lQuery.ParamByName('ID').AsInteger := Self.ClienteId;
        lQuery.ExecSQL;
      end
      else
        Result := TP_RECEBIDA_CADASTRO_NAO_ENCONTRADO;
      lQuery.Close;
    finally
      lQuery.Free;
    end;
  end
  else
    Result := TP_RECEBIDA_INVALIDA;
end;

function TMensagemBruta.VerificarSeEncerraAtendimento(ARespostaUsuario: string): boolean;
begin
  if StringsIguais(ARespostaUsuario, TP_PALAVRA_CHAVE_ATENDIMENTO_SAIR) then
    Result := True;
end;

function TMensagemBruta.VerificarSeVoltaParaOMenuInicial(
  ARespostaUsuario: string): boolean;
begin
  if StringsIguais(ARespostaUsuario, TP_PALAVRA_CHAVE_ATENDIMENTO_INICIO) then
    Result := True;
end;

{ TMensagemRecebida }

class function TMensagemRecebida.Add(AId: integer; ADataCadastro: TDateTime; ANumeroEmpresa, ANumeroCliente,
      ATicket, AProtocolo: string; AOpcaoRecebida: integer; AMensagem: string; AFinalizado,
      AClienteId: integer; AClienteNome: string): TMensagemRecebida;
begin
  Result.Id := AId;
  Result.DataCadastro := ADataCadastro;
  Result.NumeroEmpresa := ANumeroEmpresa;
  Result.NumeroCliente := ANumeroCliente;
  Result.Ticket := ATicket;
  Result.Protocolo := AProtocolo;
  Result.OpcaoRecebida := AOpcaoRecebida;
  Result.FMensagem := AMensagem;
  Result.Finalizado := AFinalizado;
  Result.ClienteId := AClienteId;
  Result.ClienteNome := AClienteNome;
end;

function TMensagemRecebida.GeraMensagemDeResposta: TMensagemEnviar;
begin
  case OpcaoRecebida of
    TP_RECEBIDA_NOVO_ATENDIMENTO: Result := TMensagemWhatsapp.MensagemBoasVindas(Self);
    TP_RECEBIDA_INICIO_ATENDIMENTO: Result := TMensagemWhatsapp.MenuInicialSemBoasVindas(Self);
    TP_RECEBIDA_REQUISITAR_ULTIMOS_PEDIDOS, TP_RECEBIDA_REQUISITAR_ULTIMOS_PEDIDOS_CPFCNPJ_ENCONTRADO:
      Result := TMensagemWhatsapp.EnviarUltimosPedidos(Self);
//    TP_RECEBIDA_REQUISITAR_ULTIMAS_OS: Result := TMensagemWhatsapp.MensagemBoasVindas(Self);
//    TP_RECEBIDA_REQUISITAR_CONTAS_EM_ABERTO: Result := TMensagemWhatsapp.MensagemBoasVindas(Self);
//    TP_RECEBIDA_REQUISITAR_BOLETOS_EM_ABERTO: Result := TMensagemWhatsapp.MensagemBoasVindas(Self);
    TP_RECEBIDA_REQUISITAR_CONTATO_VENDEDORES: Result := TMensagemWhatsapp.ContatoDosVendedores(Self);
    TP_RECEBIDA_CADASTRO_NAO_ENCONTRADO: Result := TMensagemWhatsapp.RedirecionarParaVendedores(Self);
    TP_RECEBIDA_FINALIZAR: Result := TMensagemWhatsapp.MensagemFinalizarAtendimento(Self);
    TP_RECEBIDA_INVALIDA: Result := TMensagemWhatsapp.ReenviaUltimaMensagemValida(Self);
  end;
end;

function TMensagemRecebida.GetMensagem: string;
begin
  Result := Trim(DecodeString(FMensagem));
end;

function TMensagemRecebida.MarcarComoFinalizada(AConexao: TFDConnection): string;
var
  lQuery: TFDQuery;
begin
  Result := EmptyStr;
  lQuery := TFDQuery.Create(nil);
  lQuery.Connection := AConexao;
  try
    if Ticket.IsEmpty then
    begin
      lQuery.SQL.Text := 'update WB_MENSAGEM_RECEBIDA set FINALIZADO = :FINALIZADO where ID = :ID';
      lQuery.ParamByName('ID').AsInteger := Id;
    end
    else
    begin
      lQuery.SQL.Text := 'update WB_MENSAGEM_RECEBIDA set FINALIZADO = :FINALIZADO where TICKET = :TICKET';
      lQuery.ParamByName('TICKET').AsString := Ticket;
    end;
    lQuery.ParamByName('FINALIZADO').AsInteger := STS_ATENDIMENTO_FINALIZADO;
    lQuery.ExecSQL;
  except
    on e: exception do
    begin
      Result := 'Ocorreu o sequinte erro: '+e.Message;
    end;
  end;
end;

class function TMensagemRecebida.Novo(AId: integer; ADataCadastro: TDateTime;
  ANumeroEmpresa, ANumeroCliente, ATicket, AProtocolo: string;
  AOpcaoRecebida: integer; AMensagem: string; AFinalizado, AClienteId: integer;
  AClienteNome: string): TMensagemRecebida;
begin
  Result.Id := AId;
  Result.DataCadastro := ADataCadastro;
  Result.NumeroEmpresa := ANumeroEmpresa;
  Result.NumeroCliente := ANumeroCliente;
  Result.Ticket := ATicket;
  Result.Protocolo := AProtocolo;
  Result.OpcaoRecebida := AOpcaoRecebida;
  Result.SetMensagem(AMensagem);
  Result.Finalizado := AFinalizado;
  Result.ClienteId := AClienteId;
  Result.ClienteNome := AClienteNome;
end;

class function TMensagemRecebida.RecuperaMensagens(ANumeroEmpresa,
  ANumeroCliente: string; AConexao: TFDConnection): TList<TMensagemRecebida>;
var
  lQuery: TFDQuery;
begin
  Result := TList<TMensagemRecebida>.Create;
  lQuery := TFDQuery.Create(nil);
  try
    lQuery.Connection := AConexao;
    lQuery.SQL.Text := 'select R.*, '+
                              'CLI.DESCRICAO CLIENTE_NOME '+
                       'from WB_MENSAGEM_RECEBIDA R '+
                       'left join CLIENTES CLI on CLI.ID = R.CLIENTE_ID '+
                       'where R.NUMERO_EMPRESA = :NUMEROEMPRESA and '+
                             'R.NUMERO_CLIENTE = :NUMEROCLIENTE';
    lQuery.ParamByName('NUMEROEMPRESA').AsString := ANumeroEmpresa;
    lQuery.ParamByName('NUMEROCLIENTE').AsString := ANumeroCliente;
    lQuery.Open;
    if not (lQuery.IsEmpty) then
    begin
      lQuery.First;
      while not (lQuery.Eof) do
      begin
        Result.Add(TMensagemRecebida.Add(lQuery.FieldByName('ID').AsInteger,
                                         lQuery.FieldByName('DATA_CADASTRO').AsDateTime,
                                         lQuery.FieldByName('NUMERO_EMPRESA').AsString,
                                         lQuery.FieldByName('NUMERO_CLIENTE').AsString,
                                         lQuery.FieldByName('TICKET').AsString,
                                         lQuery.FieldByName('PROTOCOLO').AsString,
                                         lQuery.FieldByName('OPCAO_RESPOSTA').AsInteger,
                                         lQuery.FieldByName('MENSAGEM').AsWideString,
                                         lQuery.FieldByName('FINALIZADO').AsInteger,
                                         lQuery.FieldByName('CLIENTE_ID').AsInteger,
                                         lQuery.FieldByName('CLIENTE_NOME').AsString));
        lQuery.Next;
      end;
    end;
  finally
    lQuery.Free;
  end;
end;

function TMensagemRecebida.RegistraMensagem(AConexao: TFDConnection): string;
var
  lQuery: TFDQuery;
begin
  Result := EmptyStr;
  if AConexao.Connected then
  begin
    lQuery := TFDQuery.Create(nil);
    try
      lQuery.Connection := AConexao;
      lQuery.SQL.Text := 'update or insert into WB_MENSAGEM_RECEBIDA (DATA_CADASTRO, NUMERO_EMPRESA, '+
                                                                     'NUMERO_CLIENTE, TICKET, PROTOCOLO, ' +
                                                                     'OPCAO_RESPOSTA, MENSAGEM_COMPLETA, FINALIZADO, CLIENTE_ID) ' +
                         'values (:DATA_CADASTRO, :NUMERO_EMPRESA, :NUMERO_CLIENTE, :TICKET, :PROTOCOLO, '+
                                 ':OPCAO_RESPOSTA, :MENSAGEM_COMPLETA, :FINALIZADO, :CLIENTE_ID) ' +
                         'matching (PROTOCOLO)';
      lQuery.ParamByName('NUMERO_EMPRESA').AsString := NumeroEmpresa;
      lQuery.ParamByName('NUMERO_CLIENTE').AsString := NumeroCliente;
      if ClienteId = 0 then
        lQuery.ParamByName('CLIENTE_ID').Clear
      else
        lQuery.ParamByName('CLIENTE_ID').AsInteger := ClienteId;
      lQuery.ParamByName('DATA_CADASTRO').AsDateTime := DataCadastro;
      lQuery.ParamByName('TICKET').AsString := Ticket;
      lQuery.ParamByName('PROTOCOLO').AsString := Protocolo;
      lQuery.ParamByName('OPCAO_RESPOSTA').AsInteger := OpcaoRecebida;
      lQuery.ParamByName('MENSAGEM_COMPLETA').AsWideMemo := FMensagem;
      lQuery.ParamByName('FINALIZADO').AsInteger := Finalizado;
      try
        lQuery.ExecSQL;
      except
        on e: exception do
        begin
          Result := 'Erro ao salvar mensagem: '+e.Message;
        end;
      end;
    finally
      lQuery.Free;
    end;
  end;
end;

procedure TMensagemRecebida.SetMensagem(ATextoBruto: string);
begin
  FMensagem := EncodeString(ATextoBruto);
end;

{ TProcessamentoMensagens }

constructor TProcessamentoMensagens.Create;
begin
  FdmConexao := TdmConexao.Create(nil);
end;

destructor TProcessamentoMensagens.Destroy;
begin
  FdmConexao.Free;
  inherited;
end;

procedure TProcessamentoMensagens.ExecutarMensagensTodosCadastros;
var
  lQuery: TFDQuery;
  lListaNumerosAtendimentos: TStringList;
  I: integer;
begin
  lListaNumerosAtendimentos := TStringList.Create;
  try
    if FdmConexao.ConectarBanco then
    begin
      lQuery := TFDQuery.Create(nil);
      try
        lQuery.Connection := FdmConexao.fdConexao;
        lQuery.Open('select distinct NUMERO from WB_CONFIGURACOES');
        lQuery.First;
        while not (lQuery.Eof) do
        begin
          lListaNumerosAtendimentos.Add(lQuery.FieldByName('NUMERO').AsString);
          lQuery.Next;
        end;
        lQuery.Close;
      finally
        lQuery.Free;
      end;
      for I := 0 to lListaNumerosAtendimentos.Count - 1 do
      begin
        FinalizarAtendimentosDeDiasAnteriores(lListaNumerosAtendimentos[I]);
        ProcessarMensagensRecebidas(lListaNumerosAtendimentos[I]);
      end;
    end;
    FdmConexao.DesconectarBanco;
  finally
    lListaNumerosAtendimentos.Free;
  end;
end;

procedure TProcessamentoMensagens.FinalizarAtendimentosDeDiasAnteriores(
  ANumeroEmpresa: string);
begin
  FdmConexao.ExecutarSQL('update WB_MENSAGENS set FINALIZADO = 2 where NUMERO_EMPRESA = '+QuotedStr(ANumeroEmpresa)+
    ' and DATA_ENVIO_FINAL < current_timestamp and TIPO_INTERACAO = 1 and FINALIZADO = 0');
  FdmConexao.ExecutarSQL('update WB_MENSAGEM_ENVIO set FINALIZADO = 2 where NUMERO_EMPRESA = '+QuotedStr(ANumeroEmpresa)+
    ' and DATA_ENVIO_FINAL < current_timestamp and TIPO_INTERACAO = 1 and FINALIZADO = 0');
  FdmConexao.ExecutarSQL('update WB_MENSAGEM_RECEBIDA set FINALIZADO = 2 where NUMERO_EMPRESA = '+QuotedStr(ANumeroEmpresa)+
    ' and DATA_CADASTRO < current_timestamp and FINALIZADO = 0');
end;

procedure TProcessamentoMensagens.ProcessarMensagensRecebidas(ANumeroEmpresa: string);
var
  I: integer;
  lMensagensRecebidas: TList<TMensagemBruta>;
  lUltimaOpcaoEntregueValida: TMensagemEnviar;
  lNovaMensagemRecebida: TMensagemRecebida;
  lMensagemResposta: TMensagemEnviar;
begin
  lMensagensRecebidas := TMensagemBruta.RecuperaMensagensRecebidas(ANumeroEmpresa, FdmConexao.fdConexao);
  for I := 0 to lMensagensRecebidas.Count - 1 do
  begin
    lUltimaOpcaoEntregueValida := TMensagemEnviar.RetornaUltimaOpcaoEntregueValida(lMensagensRecebidas[I].NumeroEmpresa,
                                                                                   lMensagensRecebidas[I].NumeroCliente,
                                                                                   FdmConexao.fdConexao);
    if not (lUltimaOpcaoEntregueValida.Id = 0) then //Existe mensagem anterior entregue
    begin
      lNovaMensagemRecebida := lMensagensRecebidas[I].TratarMensagemRecebida(lUltimaOpcaoEntregueValida, FdmConexao.fdConexao);
      lMensagemResposta := lNovaMensagemRecebida.GeraMensagemDeResposta;
    end
    else
    begin
      lNovaMensagemRecebida := lMensagensRecebidas[I].SalvaMensagemRecebida(TP_RECEBIDA_NOVO_ATENDIMENTO, FdmConexao.fdConexao);
      lMensagemResposta := lNovaMensagemRecebida.GeraMensagemDeResposta;
    end;
    lMensagensRecebidas[I].MarcarComoLida(FdmConexao.fdConexao);
  end;
end;

end.