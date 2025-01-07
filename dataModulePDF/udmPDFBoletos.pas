unit udmPDFBoletos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ACBrBase, ACBrBoleto, System.TypInfo, uSystemConfigConsts, uSystemConsts, whatsapp.funcoes,
  ACBrDFeSSL, blcksock, pcnConversao, ACBrBoletoFCFortesFr, Forms, DateUtils, ACBrBoletoConversao, udmConexao;

type
  TdmPDFBoletos = class(TDataModule)
    qrReceber: TFDQuery;
    ACBrBoleto1: TACBrBoleto;
    qryCBR_CONFIG: TFDQuery;
    ACBrBoletoFCFortes1: TACBrBoletoFCFortes;
    qrReceberSEL: TIntegerField;
    qrReceberID_EMISSOR: TIntegerField;
    qrReceberID_CBR_TITULOS: TLargeintField;
    qrReceberSITUACAO: TWideStringField;
    qrReceberCLIENTE_ID: TIntegerField;
    qrReceberDTEMISSAO: TDateField;
    qrReceberDTALTERACAO: TSQLTimeStampField;
    qrReceberDTVENCIMENTO: TDateField;
    qrReceberDTCANCELAMENTO: TDateField;
    qrReceberVALOR: TFMTBCDField;
    qrReceberHISTORICO: TWideStringField;
    qrReceberVLJURO: TFMTBCDField;
    qrReceberVLACRESCIMO: TFMTBCDField;
    qrReceberVLDESCONTO: TFMTBCDField;
    qrReceberVLPAGO: TFMTBCDField;
    qrReceberDTCADASTRO: TSQLTimeStampField;
    qrReceberDTPAGAMENTO: TDateField;
    qrReceberALTERACAO_LOJA: TWideStringField;
    qrReceberPAGAMENTO_LOJA: TWideStringField;
    qrReceberCANCELAMENTO_LOJA: TWideStringField;
    qrReceberCANCELAMENTO_DATA: TSQLTimeStampField;
    qrReceberREMESSA: TWideStringField;
    qrReceberREMESSA_REENVIAR: TWideStringField;
    qrReceberREMESSA_DATA: TDateField;
    qrReceberREMESSA_ARQUIVO: TWideStringField;
    qrReceberREGISTRO_ID_CBR_RETORNO: TLargeintField;
    qrReceberREGISTRO_STATUS: TWideStringField;
    qrReceberREGISTRO_DATA: TSQLTimeStampField;
    qrReceberREGISTRO_ARQUIVO: TWideStringField;
    qrReceberREGISTRO_HISTORICO: TWideStringField;
    qrReceberREGISTRO_SEM_REGISTRO: TWideStringField;
    qrReceberREGISTRO_LIMITE_PRAZO: TWideStringField;
    qrReceberRETORNO_HISTORICO: TWideStringField;
    qrReceberOBS: TWideStringField;
    qrReceberID_CBR_REMESSA_UUID: TWideStringField;
    qrReceberPEDIDOS_VENDAS_ID: TIntegerField;
    qrReceberCONTA_PR_ID: TIntegerField;
    qrReceberCAIXA_BANCO_ID: TIntegerField;
    qrReceberVALOR_MULTA: TFMTBCDField;
    qrReceberTIPO_COBRANCA_JUROS: TIntegerField;
    qrReceberTIPO_MULTA: TIntegerField;
    qrReceberDIAS_CARENCIA: TIntegerField;
    qrReceberCODIGO_BARRAS: TWideStringField;
    qrReceberDATA_NOTIFICACAO: TDateField;
    qrReceberSITUACAO_DESRICAO: TWideStringField;
    qrReceberREGISTRO_STATUS_DESCRICAO: TWideStringField;
    qrReceberCLI_DESCRICAO: TWideStringField;
    qrReceberCLI_CPF_CNPJ: TWideStringField;
    qrReceberCLI_ENDERECO: TWideStringField;
    qrReceberCLI_ENDNUMERO: TWideStringField;
    qrReceberCLI_ENDBAIRRO: TWideStringField;
    qrReceberCLI_ENDCIDADE: TWideStringField;
    qrReceberCLI_ENDUF: TWideStringField;
    qrReceberCLI_ENDCEP: TWideStringField;
    qryCBR_CONFIGID_EMISSOR: TIntegerField;
    qryCBR_CONFIGDESCRICAO: TWideStringField;
    qryCBR_CONFIGDIRRECEBE: TWideStringField;
    qryCBR_CONFIGDIRENVIA: TWideStringField;
    qryCBR_CONFIGDIRRECEBEBKP: TWideStringField;
    qryCBR_CONFIGVLRTARIFABOLETA: TFMTBCDField;
    qryCBR_CONFIGTIPOCOBRANCA: TWideStringField;
    qryCBR_CONFIGCODBANCO: TSmallintField;
    qryCBR_CONFIGAGENCIA: TSmallintField;
    qryCBR_CONFIGAGENCIADIG: TWideStringField;
    qryCBR_CONFIGCONTA: TWideStringField;
    qryCBR_CONFIGCONTADIG: TWideStringField;
    qryCBR_CONFIGCODCEDENTE: TWideStringField;
    qryCBR_CONFIGCODCEDENTEDIG: TWideStringField;
    qryCBR_CONFIGCONVENIO: TWideStringField;
    qryCBR_CONFIGCARTEIRA: TWideStringField;
    qryCBR_CONFIGMODALIDADE: TWideStringField;
    qryCBR_CONFIGESPECIEDOC: TWideStringField;
    qryCBR_CONFIGCOBMOEDA: TWideStringField;
    qryCBR_CONFIGCOBACEITE: TWideStringField;
    qryCBR_CONFIGLOCALPAGTO: TWideStringField;
    qryCBR_CONFIGINSTRUCAO1: TWideStringField;
    qryCBR_CONFIGINSTRUCAO2: TWideStringField;
    qryCBR_CONFIGJUROS: TFMTBCDField;
    qryCBR_CONFIGMULTA: TFMTBCDField;
    qryCBR_CONFIGCARENCIA_JUROS: TIntegerField;
    qryCBR_CONFIGTIPO_CALC_JUROS: TIntegerField;
    qryCBR_CONFIGWS_CLIENTID: TWideStringField;
    qryCBR_CONFIGWS_CLIENTSECRET: TWideStringField;
    qryCBR_CONFIGWS_KEYUSER: TWideStringField;
    qryCBR_CONFIGWS_SCOPE: TWideStringField;
    qryCBR_CONFIGWS_INDICADORPIX: TIntegerField;
    qryCBR_CONFIGLAYOUT: TIntegerField;
    qryCBR_CONFIGOBSERVACOES: TWideStringField;
    qryCBR_CONFIGEMP_RAZAOSOCIAL: TWideStringField;
    qryCBR_CONFIGEMP_CNPJ: TWideStringField;
    qryCBR_CONFIGEMP_ENDERECO: TWideStringField;
    qryCBR_CONFIGEMP_COMPLEMENTO: TWideStringField;
    qryCBR_CONFIGEMP_BAIRRO: TWideStringField;
    qryCBR_CONFIGEMP_CIDADE: TWideStringField;
    qryCBR_CONFIGEMP_UF: TWideStringField;
    qryCBR_CONFIGEMP_CEP: TWideStringField;
    qryCBR_CONFIGEMP_TELEFONE: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    FRemessaID: integer;
    FTotalBoletos: integer;
    FValorBoletosEmAberto: double;
    FValorBoletosPagos: double;
    FTotalBoletosEmAberto: integer;
    FTotalBoletosPagos: integer;
    FEmissorID: integer;
    FValorBoletos: double;
    function MontaWhereBoleto(aValor: string): string;
    procedure SetarDisplayLabel(vDataSet: TDataSet);
    procedure SetEmissorID(const Value: integer);
    procedure SetTotalBoletosEmAberto(const Value: integer);
    procedure SetTotalBoletosPagos(const Value: integer);
    procedure SetValorBoletosEmAberto(const Value: double);
    procedure SetValorBoletosPagos(const Value: double);
    procedure MontaBoletoNaLista(var aTitulo: TACBrTitulo; aDataVencimento, aDataDocumento, aDataPagamento,
      aDataProcessamento: TDateTime; aEspecieDoc, aAceite, aCarteira, aTituloId, aNomeSacado, aCNPJCPFSacado,
      aEnderecoSacado, aNumeroSacado, aBairroSacado, aCidadeSacado, aUfSacado, aCEPSacado, aLocalPagamento, aInstrucao1,
      aInstrucao2, aMensagem: string; aValor, aMulta, aJuros: double; aTipoMulta, aTipoJuros, aDiasCarencia: integer);
    { Private declarations }

  public
    { Public declarations }
    property EmissorID: integer read FEmissorID write SetEmissorID;
    property RemessaID: integer read FRemessaID write FRemessaID;
    property TotalBoletosPagos: integer read FTotalBoletosPagos write SetTotalBoletosPagos;
    property TotalBoletosEmAberto: integer read FTotalBoletosEmAberto write SetTotalBoletosEmAberto;
    property ValorBoletosPagos: double read FValorBoletosPagos write SetValorBoletosPagos;
    property ValorBoletosEmAberto: double read FValorBoletosEmAberto write SetValorBoletosEmAberto;
    property TotalBoletos: integer read FTotalBoletos write FTotalBoletos;
    property ValorBoletos: double read FValorBoletos write FValorBoletos;
    procedure ConfigurarBoleto(aEmissorID: integer);

    class function GeraPDFBase64(aID_CLIENTE: Integer): TArray<TAnexo>;
  end;

var
  dmPDFBoletos: TdmPDFBoletos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmPDFBoletos }

procedure TdmPDFBoletos.ConfigurarBoleto(aEmissorID: integer);
var
  vTimeout: string;
  function StrToTipoCobranca(const AValor: String): TACBrTipoCobranca;
  begin
    Result := TACBrTipoCobranca(GetEnumValue(TypeInfo(TACBrTipoCobranca), AValor))
  end;
begin
  try
    EmissorID := aEmissorID;
    qryCBR_CONFIG.Close;
    qryCBR_CONFIG.ParamByName('ID_EMISSOR').AsInteger := EmissorID;
    qryCBR_CONFIG.Open;
    qryCBR_CONFIG.FetchAll;

    if qryCBR_CONFIG.IsEmpty then
      raise Exception.Create('Configuração da cobrança não foi efetuada, favor corrigir.');

    // dados da empresa cedente
    if qryCBR_CONFIG.FieldByName('LAYOUT').AsInteger = 1 then
      ACBrBoleto1.LayoutRemessa         := c400
    else
      ACBrBoleto1.LayoutRemessa         := c240;
    ACBrBoleto1.Banco.TipoCobranca    := StrToTipoCobranca(qryCBR_CONFIG.FieldByName('TIPOCOBRANCA').AsString);
    ACBrBoleto1.Cedente.Nome          := qryCBR_CONFIG.FieldByName('EMP_RAZAOSOCIAL').AsString;
    ACBrBoleto1.Cedente.CNPJCPF       := qryCBR_CONFIG.FieldByName('EMP_CNPJ').AsString;
    ACBrBoleto1.Cedente.CodigoCedente := qryCBR_CONFIG.FieldByName('CODCEDENTE').AsString.Trim;
    ACBrBoleto1.Cedente.Convenio      := qryCBR_CONFIG.FieldByName('CONVENIO').AsString.Trim;
    ACBrBoleto1.Cedente.Modalidade    := qryCBR_CONFIG.FieldByName('MODALIDADE').AsString.Trim;
    ACBrBoleto1.Cedente.Agencia       := qryCBR_CONFIG.FieldByName('AGENCIA').AsString.Trim;
    ACBrBoleto1.Cedente.AgenciaDigito := qryCBR_CONFIG.FieldByName('AGENCIADIG').AsString.Trim;
    ACBrBoleto1.Cedente.Conta         := qryCBR_CONFIG.FieldByName('CONTA').AsString.Trim;
    ACBrBoleto1.Cedente.ContaDigito   := qryCBR_CONFIG.FieldByName('CONTADIG').AsString.Trim;
    ACBrBoleto1.Cedente.Logradouro    := qryCBR_CONFIG.FieldByName('EMP_ENDERECO').AsString;
    ACBrBoleto1.Cedente.Complemento   := qryCBR_CONFIG.FieldByName('EMP_COMPLEMENTO').AsString;
    ACBrBoleto1.Cedente.Bairro        := qryCBR_CONFIG.FieldByName('EMP_BAIRRO').AsString;
    ACBrBoleto1.Cedente.Cidade        := qryCBR_CONFIG.FieldByName('EMP_CIDADE').AsString;
    ACBrBoleto1.Cedente.CEP           := qryCBR_CONFIG.FieldByName('EMP_CEP').AsString;
    ACBrBoleto1.Cedente.UF            := qryCBR_CONFIG.FieldByName('EMP_UF').AsString;
    ACBrBoleto1.Cedente.Telefone      := qryCBR_CONFIG.FieldByName('EMP_TELEFONE').AsString;
    ACBrBoleto1.DirArqRetorno         := qryCBR_CONFIG.FieldByName('DIRRECEBE').AsString;
    ACBrBoleto1.DirArqRemessa         := qryCBR_CONFIG.FieldByName('DIRENVIA').AsString;

    case GetConfigValueInt(TRetaguarda.EMAIL_CONFIG_SSL, RetornaNomeTerminal) of  // TSystemConfig.GetFromRetaguardaAsInteger(TRetaguarda.EMAIL_CONFIG_SSL, RetornaNomeTerminal)
      1: ACBrBoleto1.Configuracoes.WebService.SSLType := LT_TLSv1_2;
      3: ACBrBoleto1.Configuracoes.WebService.SSLType := LT_TLSv1_1;
      4: ACBrBoleto1.Configuracoes.WebService.SSLType := LT_TLSv1;
      6: ACBrBoleto1.Configuracoes.WebService.SSLType := LT_TLSv1_3;
    end;

    case GetConfigValueInt(TRetaguarda.SSLCRYPTLIB) of  // TSystemConfig.GetFromRetaguardaAsInteger(TRetaguarda.SSLCRYPTLIB)
     // 0: ACBrBoleto1.Configuracoes.WebService.SSLCryptLib := cryCapicom;
      1: ACBrBoleto1.Configuracoes.WebService.SSLCryptLib := cryNone;
      2: ACBrBoleto1.Configuracoes.WebService.SSLCryptLib := cryOpenSSL;
      3: ACBrBoleto1.Configuracoes.WebService.SSLCryptLib := cryWinCrypt;
    end;

    case GetConfigValueInt(TRetaguarda.SSLCRYPTLIB) of    // TSystemConfig.GetFromRetaguardaAsInteger(TRetaguarda.SSLCRYPTLIB)
      0: ACBrBoleto1.Configuracoes.WebService.SSLHTTPLib := httpIndy;
      1: ACBrBoleto1.Configuracoes.WebService.SSLHTTPLib := httpNone;
      2: ACBrBoleto1.Configuracoes.WebService.SSLHTTPLib := httpOpenSSL;
      3: ACBrBoleto1.Configuracoes.WebService.SSLHTTPLib := httpWinHttp;
      4: ACBrBoleto1.Configuracoes.WebService.SSLHTTPLib := httpWinINet;
    end;
    vTimeout := GetConfigValue(TRetaguarda.TIMEOUTWS);
    ACBrBoleto1.Configuracoes.WebService.TimeOut             := StrToIntDef(vTimeout, 30000);
    ACBrBoleto1.Configuracoes.WebService.UseCertificateHTTP  := False;

    ACBrBoleto1.Cedente.CedenteWS.ClientID      := qryCBR_CONFIG.FieldByName('WS_CLIENTID').AsString;
    ACBrBoleto1.Cedente.CedenteWS.ClientSecret  := qryCBR_CONFIG.FieldByName('WS_CLIENTSECRET').AsString;
    ACBrBoleto1.Cedente.CedenteWS.Scope         := qryCBR_CONFIG.FieldByName('WS_SCOPE').AsString;
    ACBrBoleto1.Cedente.CedenteWS.KeyUser       := qryCBR_CONFIG.FieldByName('WS_KEYUSER').AsString;
    ACBrBoleto1.Cedente.CedenteWS.IndicadorPix  := qryCBR_CONFIG.FieldByName('WS_INDICADORPIX').AsInteger = SIM; //utilizado para boleto hibrido, necessário o cliente possuir chave PIX no banco do brasil

    ACBrBoleto1.Configuracoes.WebService.Ambiente := tawsProducao;

    //ACBrBoleto1.Configuracoes.WebService.Operacao            := tpConsulta; //[tpConsulta,tpAltera,tpBaixa,tpInclui] // utilizado para o tipo de operação
    ACBrBoletoFCFortes1.DirLogo := ExtractFilePath(Application.ExeName) + 'Logos';
  //  ACBrBoletoFCFortes1.MargemSuperior := TSystemConfig.GetFromRetaguardaAsInteger(TRetaguarda.MARGEM_BOLETO_SUPERIOR);
  //  ACBrBoletoFCFortes1.MargemInferior := TSystemConfig.GetFromRetaguardaAsInteger(TRetaguarda.MARGEM_BOLETO_INFERIOR);
  //  ACBrBoletoFCFortes1.MargemDireita := TSystemConfig.GetFromRetaguardaAsInteger(TRetaguarda.MARGEM_BOLETO_DIREITA);
  //  ACBrBoletoFCFortes1.MargemEsquerda := TSystemConfig.GetFromRetaguardaAsInteger(TRetaguarda.MARGEM_BOLETO_ESQUERDA);

  finally
      qryCBR_CONFIG.Close;
  end;

  if ACBrBoleto1.Cedente.CedenteWS.ClientSecret = EmptyStr then
  begin
    if not DirectoryExists(ACBrBoleto1.DirArqRetorno) then
      raise Exception.Create('Diretório de Retorno não existe, favor verificar!' + sLineBreak + sLineBreak + ACBrBoleto1.DirArqRetorno);

    if not DirectoryExists(ACBrBoleto1.DirArqRemessa) then
      raise Exception.Create('Diretório de Remessa não existe, favor verificar!' + sLineBreak + sLineBreak + ACBrBoleto1.DirArqRemessa);
  end;
end;

procedure TdmPDFBoletos.DataModuleCreate(Sender: TObject);
var
  _FdmConexao: TdmConexao;
begin
    _FdmConexao:= TdmConexao.Create(nil);
    if _FdmConexao.ConectarBanco then
      begin
        qrReceber.Connection := _FdmConexao.fdConexao;
        qryCBR_CONFIG.Connection := _FdmConexao.fdConexao;
      end;
end;

class function TdmPDFBoletos.GeraPDFBase64(aID_CLIENTE: Integer): TArray<TAnexo>;
var
  Titulo: TACBrTitulo;
  vNomeArquivo: String;
  _ListaAnexos: TArray<TAnexo>;
  NovoAnexo: TAnexo;

begin
  Application.CreateForm(TdmPDFBoletos, dmPDFBoletos);


  try
  with dmPDFBoletos do
    begin
        qrReceber.ParamByName('CLIENTE_ID').AsInteger := aID_CLIENTE;
        qrReceber.Open;
        qrReceber.First;
        SetLength(_ListaAnexos, qrReceber.RecordCount);
    while not qrReceber.Eof do
      begin
         ConfigurarBoleto(qrReceberID_EMISSOR.AsInteger);
         ACBrBoleto1.ListadeBoletos.Clear;

          try
            qryCBR_CONFIG.Close;
            qryCBR_CONFIG.Open;
            // popular a lista de boletos selecionados
            Titulo := ACBrBoleto1.CriarTituloNaLista;
            MontaBoletoNaLista(Titulo,
                               qrReceberDTVENCIMENTO.AsDateTimE,
                         qrReceberDTEMISSAO.AsDateTime,
                         qrReceberDTCADASTRO.AsDateTime,
                         Now,
                         qryCBR_CONFIGCOBMOEDA.AsString,
                         'N',
                         qryCBR_CONFIGCARTEIRA.AsString,
                         qrReceberID_CBR_TITULOS.AsString,
                         qrReceberCLI_DESCRICAO.AsString,
                         FormatarCNPJCPF(qrReceberCLI_CPF_CNPJ.AsString),
                         qrReceberCLI_ENDERECO.AsString,
                         qrReceberCLI_ENDNUMERO.AsString,
                         qrReceberCLI_ENDBAIRRO.AsString,
                         qrReceberCLI_ENDCIDADE.AsString,
                         qrReceberCLI_ENDUF.AsString,
                         qrReceberCLI_ENDCEP.AsString,
                         qryCBR_CONFIGLOCALPAGTO.AsString,
                         qryCBR_CONFIGINSTRUCAO1.AsString,
                         qryCBR_CONFIGINSTRUCAO2.AsString,
                         qrReceberOBS.AsString,
                         qrReceberVALOR.AsCurrency,
                         qrReceberVALOR_MULTA.AsCurrency,
                         qrReceberVLJURO.AsCurrency,
                         qrReceberTIPO_MULTA.AsInteger,
                         qrReceberTIPO_COBRANCA_JUROS.AsInteger,
                         qrReceberDIAS_CARENCIA.AsInteger);
          finally
            qryCBR_CONFIG.Close;
          end;

          ACBrBoleto1.ACBrBoletoFC.MostrarPreview := False;
          vNomeArquivo := GerarCaminhoArquivoPDF(qrReceberID_CBR_TITULOS.AsString, False, True);
          ACBrBoleto1.ACBrBoletoFC.NomeArquivo := vNomeArquivo;

          ACBrBoleto1.GerarPDF;
          ACBrBoleto1.ACBrBoletoFC.MostrarPreview := False;
          ACBrBoleto1.ACBrBoletoFC. MostrarPreview := False;

          NovoAnexo.FAnexoBase64 := EncodeFileBase64(vNomeArquivo);
          NovoAnexo.FMensagem :=
              ' '
              + sLineBreak
              + 'Boleto Nº: *' + qrReceberID_CBR_TITULOS.AsString+'*'
              + sLineBreak
              + 'Vencimento: *' + qrReceberDTVENCIMENTO.AsString+'*';

          _ListaAnexos[qrReceber.RecNo - 1] := NovoAnexo;

          qrReceber.Next;
      end;

      Result := _ListaAnexos;
    end;

  finally
   // _ListaAnexoBase64.Free;
    ClearDirectory(ExtractFilePath(Application.ExeName) + '\Temp\PDF\');
    FreeAndNil(dmPDFBoletos);
  end;
end;

function TdmPDFBoletos.MontaWhereBoleto(aValor: string): string;
begin

end;

procedure TdmPDFBoletos.SetarDisplayLabel(vDataSet: TDataSet);
begin

end;

procedure TdmPDFBoletos.SetEmissorID(const Value: integer);
begin
  FEmissorID := Value;
end;

procedure TdmPDFBoletos.SetTotalBoletosEmAberto(const Value: integer);
begin
    FValorBoletosEmAberto := Value;
end;

procedure TdmPDFBoletos.SetTotalBoletosPagos(const Value: integer);
begin
    FTotalBoletosPagos := Value;
end;

procedure TdmPDFBoletos.SetValorBoletosEmAberto(const Value: double);
begin
  FValorBoletosEmAberto := Value;
end;

procedure TdmPDFBoletos.SetValorBoletosPagos(const Value: double);
begin
      FValorBoletosPagos := Value;
end;

procedure TdmPDFBoletos.MontaBoletoNaLista(var aTitulo: TACBrTitulo;
  aDataVencimento, aDataDocumento, aDataPagamento,  aDataProcessamento: TDateTime;
  aEspecieDoc, aAceite, aCarteira, aTituloId, aNomeSacado, aCNPJCPFSacado, aEnderecoSacado,
  aNumeroSacado, aBairroSacado, aCidadeSacado, aUfSacado, aCEPSacado, aLocalPagamento,
  aInstrucao1, aInstrucao2, aMensagem: string; aValor, aMulta, aJuros: double;
  aTipoMulta, aTipoJuros, aDiasCarencia: integer);
var
  vListaMensagem: TStringList;
  lValor: string;
begin
  vListaMensagem := TStringList.Create;
  aTitulo.OcorrenciaOriginal.Tipo := toRemessaRegistrar;

  aTitulo.Vencimento         := aDataVencimento;
  aTitulo.DataLimitePagto    := IncDay(aDataVencimento, 60);
  aTitulo.DataDocumento      := aDataDocumento;

  if aDataPagamento > 0 then
    aTitulo.DataBaixa        := aDataPagamento;

  aTitulo.EspecieDoc         := aEspecieDoc;
  if aAceite = 'S' then
    aTitulo.Aceite             := atSim
  else
    aTitulo.Aceite             := atNao;
  aTitulo.DataProcessamento  := aDataProcessamento;
  aTitulo.Carteira           := aCarteira;
  aTitulo.NumeroDocumento    := PadL(aTituloId, 11, '0');
  aTitulo.SeuNumero          := PadL(aTituloId, 11, '0');
  //bb exige que carteira seja enviada antes do nosso numero
  {if dtmCBR.acbrBoleto1.Banco.Numero = 1 then
    aTitulo.NossoNumero       := aTitulo.Carteira + PadL(aTituloId, 10, '0')
  else}
    aTitulo.NossoNumero       := PadL(aTituloId, 10, '0');

  lValor := ACBrBoleto1.Banco.MontarCampoNossoNumero(aTitulo);
  aTitulo.ValorDocumento    := aValor;
  //Seção Multa          cmValorFixo, cmPercentual, cmIsento
  case aTipoMulta of
    TP_MULTA_BOLETO_REAL_FIXO: aTitulo.CodigoMulta := cmValorFixo;
    TP_MULTA_BOLETO_PERC_VAR: aTitulo.CodigoMulta := cmPercentual;
    else aTitulo.CodigoMulta := cmIsento;
  end;

  if aTitulo.CodigoMulta <> cmIsento then
  begin
    aTitulo.MultaValorFixo    := aTipoMulta = TP_MULTA_BOLETO_REAL_FIXO;
    aTitulo.PercentualMulta   := aMulta;
  end;

  //Fim Multa
  //Seção dos juros
  case aTipoJuros of
    TP_JUROS_BOLETO_DIA_REAL    : aTitulo.CodigoMoraJuros := cjValorDia;
    TP_JUROS_BOLETO_MENSAL_PERC : aTitulo.CodigoMoraJuros := cjTaxaMensal;
    TP_JUROS_BOLETO_ISENTO      : aTitulo.CodigoMoraJuros := cjIsento;
    TP_JUROS_BOLETO_MENSAL_REAL : aTitulo.CodigoMoraJuros := cjValorMensal;
    TP_JUROS_BOLETO_DIA_PERC    : aTitulo.CodigoMoraJuros := cjTaxaDiaria;
  end;
  aTitulo.ValorMoraJuros    := aJuros;
  if aDiasCarencia = 0 then
  begin
    aTitulo.DataMoraJuros := aDataVencimento;
    if aTitulo.CodigoMulta <> cmIsento then
      aTitulo.DataMulta := aDataVencimento;
  end
  else
  begin
    aTitulo.DataMoraJuros := IncDay(aDataVencimento,
                                   aDiasCarencia);
    if aTitulo.CodigoMulta <> cmIsento then
      aTitulo.DataMulta := IncDay(aDataVencimento,
                                 aDiasCarencia);
  end;
  //Fim Juros

  aTitulo.Sacado.NomeSacado := aNomeSacado;
  case NumbersOnly(aCNPJCPFSacado).Trim.Length of
    11:aTitulo.Sacado.Pessoa :=   pFisica;
    14:aTitulo.Sacado.Pessoa :=   pJuridica;
  else
    raise Exception.Create('Erro com CPF/CNPJ Cliente: ' + sLineBreak +
      aCNPJCPFSacado + ' | ' + aNomeSacado);
  end;

  aTitulo.Sacado.CNPJCPF    := aCNPJCPFSacado;

  aTitulo.Sacado.Logradouro := aEnderecoSacado;
  aTitulo.Sacado.Numero     := aNumeroSacado;
  aTitulo.Sacado.Bairro     := aBairroSacado;
  aTitulo.Sacado.Cidade     := aCidadeSacado;
  aTitulo.Sacado.UF         := aUfSacado;
  aTitulo.Sacado.CEP        := aCEPSacado;
  aTitulo.ValorAbatimento   := 0.00;
  aTitulo.LocalPagamento    := aLocalPagamento;

  aTitulo.ValorDesconto     := 0.00;
  aTitulo.ValorAbatimento   := 0.00;
  aTitulo.DataDesconto      := 0.00;
  aTitulo.DataAbatimento    := 0.00;
  aTitulo.DataProtesto      := 0.00;

  acbrBoleto1.AdicionarMensagensPadroes(aTitulo, vListaMensagem);
  aTitulo.OcorrenciaOriginal.Tipo := toRemessaRegistrar;
  aTitulo.Instrucao1        := PadR(trim(aInstrucao1),2,'0');
  aTitulo.Instrucao2        := PadR(trim(aInstrucao2),2,'0');
  aTitulo.Mensagem.Text     := aMensagem;
end;


end.
