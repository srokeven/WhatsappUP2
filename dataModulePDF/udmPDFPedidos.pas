unit udmPDFPEdidos;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxExportPDF, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.Controls, cxImageList, cxGraphics, frxDBSet, FireDAC.Comp.DataSet, Vcl.Forms ,
  FireDAC.Comp.Client, uSystemConsts, math, StrUtils, udmConexao;

type
  TdmPDPPedidos = class(TDataModule)
    qrCliente: TFDQuery;
    qrClienteID: TFDAutoIncField;
    qrClienteGRUPOS_CLIENTE_ID: TIntegerField;
    qrClienteDESCRICAO: TWideStringField;
    qrClienteTIPOCLIENTE: TSmallintField;
    qrClienteIDENTIDADE: TWideStringField;
    qrClienteCPF: TWideStringField;
    qrClienteINSCRICAOESTADUAL: TWideStringField;
    qrClienteCNPJ: TWideStringField;
    qrClienteUF: TWideStringField;
    qrClienteCODIGOESTADO: TSmallintField;
    qrClienteCIDADE: TWideStringField;
    qrClienteCODIGOCIDADE: TWideStringField;
    qrClienteBAIRRO: TWideStringField;
    qrClienteENDERECO: TWideStringField;
    qrClienteCEP: TWideStringField;
    qrClienteNUMERO: TWideStringField;
    qrClienteTELEFONE: TWideStringField;
    qrClienteCELULAR: TWideStringField;
    qrClienteDATANASCIMENTO: TDateField;
    qrClienteESTADOCIVIL: TSmallintField;
    qrClienteINFORMACOES: TWideStringField;
    qrClienteAREAPROFISSIONAL: TWideStringField;
    qrClienteAPELIDO: TWideStringField;
    qrClienteNOMEFANTASIA: TWideStringField;
    qrClienteOBS: TWideStringField;
    qrClienteEMAIL: TWideStringField;
    qrClienteLIMITECREDITO: TBCDField;
    qrClienteTIPOCONTRIBUINTE: TSmallintField;
    qrClienteDATACADASTRO: TDateField;
    qrClienteSTATUS: TSmallintField;
    qrClienteINATIVO: TSmallintField;
    qrClienteCREDITO: TBCDField;
    qrClienteUSUARIOS_ID: TIntegerField;
    qrMain: TFDQuery;
    qrMainID: TFDAutoIncField;
    qrMainUSUARIO_ID: TIntegerField;
    qrMainVENDEDOR_ID: TIntegerField;
    qrMainCLIENTE_ID: TIntegerField;
    qrMainFILIAL_ID: TIntegerField;
    qrMainTIPO_PAGAMENTO: TIntegerField;
    qrMainSTATUS: TIntegerField;
    qrMainDATA_CRIACAO: TSQLTimeStampField;
    qrMainDATA_CONCLUSAO: TSQLTimeStampField;
    qrMainVALOR_BRUTO: TBCDField;
    qrMainVALOR_DESCONTO: TBCDField;
    qrMainVALOR_LIQUIDO: TBCDField;
    qrMainVALOR_RECEBIDO: TBCDField;
    qrMainVALOR_TROCO: TBCDField;
    qrMainPEDIDO_ORIGINAL: TWideStringField;
    qrMainINTEGRACAO: TIntegerField;
    qrMainOBSERVACOES: TWideStringField;
    qrMainSTATUS_MOVIMENTO: TIntegerField;
    qrMainCLIENTE_ID_DESC: TWideStringField;
    qrMainVENDEDOR_ID_DESC: TWideStringField;
    qrMainVALOR_FRETE_AGREGADO: TBCDField;
    qrMainVALOR_ABATIDO_FRETE: TBCDField;
    qrMainTEXTO_GARANTIA: TWideStringField;
    qrDetail: TFDQuery;
    qrDetailPEDIDOS_VENDAS_ID: TIntegerField;
    qrDetailPRODUTOS_ID: TIntegerField;
    qrDetailDESCRICAO: TWideStringField;
    qrDetailUNIDADEMEDIDA: TWideStringField;
    qrDetailVALOR_UNITARIO: TBCDField;
    qrDetailVALOR_DESCONTO: TBCDField;
    qrDetailVALOR_ACRESCIMO: TBCDField;
    qrDetailQUANTIDADE: TBCDField;
    qrDetailVALOR_TOTAL: TBCDField;
    qrDetailHISTORICO: TWideStringField;
    qrDetailORDEM: TIntegerField;
    qrDetailLOCALIZACAO: TWideStringField;
    qrDetailPRECO_VENDA: TBCDField;
    qrDetailPRECO_VENDA_PRZ: TBCDField;
    qrDetailPRECO_VENDA_ATA: TBCDField;
    qrDetailPRECO_VENDA_ATA_PRZ: TBCDField;
    qrDetailMARCA_DESCRICAO: TWideStringField;
    qrSubDetail: TFDQuery;
    qrSubDetailID: TFDAutoIncField;
    qrSubDetailORDEM: TIntegerField;
    qrSubDetailPEDIDOS_VENDAS_ID: TIntegerField;
    qrSubDetailCAIXAS_ID: TIntegerField;
    qrSubDetailFORMAS_PAGAMENTOS_ID: TIntegerField;
    qrSubDetailTIPOS_DOCUMENTOS_ID: TIntegerField;
    qrSubDetailDATA: TDateField;
    qrSubDetailTIPO_TITULO: TIntegerField;
    qrSubDetailVALOR_PAGAMENTO: TBCDField;
    qrSubDetailHISTORICO: TWideStringField;
    qrSubDetailDESCRICAO_PAG_DOC: TWideStringField;
    frxReportMain: TfrxReport;
    frxDBDatasetMain: TfrxDBDataset;
    imgAcoes: TcxImageList;
    frxDBDatasetDetail: TfrxDBDataset;
    frxDBDatasetSubDetail: TfrxDBDataset;
    dsMain: TDataSource;
    frxPDFExport: TfrxPDFExport;
    procedure DataModuleCreate(Sender: TObject);
  private
    fID_MOVI: INTEGER;
    fID_CLIENTE: INTEGER;
    pgBobina48c, pgPadraoA4: TfrxPage;
    fPedidoMobile: string;
    fInstrucao1, fInstrucao2, fInstrucao3: string;
    fExibirImpressaoTroco,
    fExibirImpressaoValorRecebido,
    fExibirImpressaoValorDesc,
    fExibirImpressaoPercDesc,
    FExibirImpressaoValorTotal,
    fExibirImpressaoTipoPedido,
    fExibirImpressaoPesoProdutos,
    fExibirImpressaoValorLiquido: boolean;
    fExibirImpressaoOrdemProdutos: integer;
    mmAssinatura: TfrxMemoView;
    mmAssinaturaA4: TfrxMemoView;
    ShapeAssinaturaA4: TfrxShapeView;
    mmAreaAssinaturaA4: TfrxMemoView;
    mmGarantiaA4: TfrxMemoView;
    dtGarantiaA4: TfrxMemoView;
    procedure instanciarPaginas;
    procedure CarregaCabecalho;
    procedure CarregaCliente;
    procedure camposAexibir;
    procedure SetReportVariableValue(aVariableName, aValue: string; aQuotedStr: Boolean = true);
    procedure SaltarLinhas;
    procedure inforPedido;
    function GetCaixaPedido: string;
    procedure PreencheSumarioReport;
    procedure InstanciaMemosReport;

    { Private declarations }
  public
    { Public declarations }
    class function GerarPDFBase64(aID_MOVI, aID_CLIENTE: Integer): String; // vai gerar o .PDF e vai retornar ja codificado
    property ID_MOVI :INTEGER READ fID_MOVI write fID_MOVI;
    property ID_CLIENTE :INTEGER READ fID_CLIENTE write fID_CLIENTE;

  end;

var
  dmPDPPedidos: TdmPDPPedidos;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses whatsapp.funcoes, uSystemConfigConsts;

{$R *.dfm}

{ TDataModule1 }

class function TdmPDPPedidos.GerarPDFBase64(aID_MOVI, aID_CLIENTE: Integer): String;
var
 pathPDF: String;
begin
  pathPDF := ExtractFilePath(Application.ExeName) + '\Temp\temp.pdf';
  Application.CreateForm(TdmPDPPedidos, dmPDPPedidos);
  try
    with dmPDPPedidos do
      begin
       ID_MOVI := aID_MOVI;
       ID_CLIENTE := aID_CLIENTE;
    //   GERAR_PDF_BASE64 := true;

       InstanciaMemosReport;
       camposAexibir;
       inforPedido;
       //bbtImprimir.Click; // as coisa aqui são depois do click
       instanciarPaginas;
       CarregaCabecalho;
       CarregaCliente;
       SaltarLinhas;

        try
          CriaDiretorioTemporario;
          pathPDF := ExtractFilePath(Application.ExeName) + 'TEMP\TEMP.pdf';

          frxReportMain.PrepareReport;
          frxPDFExport.ShowDialog := false;
          frxPDFExport.FileName := pathPDF;           // diretorio aonde vai ficar salvo + nome do arquivo
          frxReportMain.Export(frxPDFExport) ;

          Result := EncodeFileBase64(pathPDF);
        finally
         // Close;
         // DeleteFile(pathPDF);
        end;

      end;

  finally

    DeleteFile(pathPDF);
    FreeAndNil(dmPDPPedidos);
  end;
end;

procedure TdmPDPPedidos.inforPedido;
var
  INSTRUCAO: string;
begin
  qrMain.Open;
  qrCliente.Open;
  SetReportVariableValue('PEDIDO_ID', qrMainID.AsString);
  SetReportVariableValue('DATA_PEDIDO', qrMainDATA_CRIACAO.AsString);
  SetReportVariableValue('TIPO_PEDIDO','PEDIDO DE VENDA');
  SetReportVariableValue('NOME_VENDEDOR','Vendedor: ' + qrMainVENDEDOR_ID_DESC.AsString, True);
  SetReportVariableValue('CAIXA','Caixa: ' + GetCaixaPedido, True);
  SetReportVariableValue('OBSERVACOES', 'OBS. Pedido: ' + qrMainOBSERVACOES.AsString);
  SetReportVariableValue('INFOR_ADICIONAIS', #13#10+'End. de Entrega: ' + qrClienteINFORMACOES.AsString);

  case qrMainSTATUS.AsInteger of
    STS_PEDIDO_VENDA_CANCELADO :
      SetReportVariableValue('STATUS_PEDIDO', 'PEDIDO CANCELADO');
    STS_PEDIDO_VENDA_EM_ABERTO :
      SetReportVariableValue('STATUS_PEDIDO', 'PEDIDO EM ABERTO');
    STS_PEDIDO_VENDA_CONFERENCIA :
      begin
        SetReportVariableValue('STATUS_PEDIDO', 'PEDIDO EM CONFERÊNCIA');

        frxReportMain.FindObject('MemoLOCALIZACAO').Visible := True;
        frxReportMain.FindObject('frxDBDatasetDetailLOCALIZACAO').Visible := True;

        frxReportMain.FindObject('MemoDescricaoProduto').Width := 267.16;
        frxReportMain.FindObject('frxdbdsProdutoPedidoDESCRICAOA4').Width := 267.16;
      end;
    STS_PEDIDO_VENDA_RETORNO_CONFERENCIA :
      SetReportVariableValue('STATUS_PEDIDO', 'PEDIDO RETORNADO DA CONFERÊNCIA');
    STS_PEDIDO_VENDA_ENVIADO_FATURAMENTO :
      SetReportVariableValue('STATUS_PEDIDO', 'PEDIDO ENVIADO PARA FATURAMENTO');
    STS_PEDIDO_VENDA_FATURADO :
      SetReportVariableValue('STATUS_PEDIDO', 'PEDIDO FATURADO');
  end;

  SetReportVariableValue('TIPO_VENDA', ifthen(qrMainTIPO_PAGAMENTO.AsInteger = TP_PAGAMENTO_A_VISTA, 'A VISTA', 'A PRAZO'));


  if NOT (fInstrucao1.IsEmpty) then
    SetReportVariableValue('LINHA_INSTRUCAO_1', fInstrucao1);

  if NOT (fInstrucao2.IsEmpty) then
    SetReportVariableValue('LINHA_INSTRUCAO_2', #13#10 + fInstrucao2,FALSE);

  if NOT (fInstrucao3.IsEmpty) then
    SetReportVariableValue('LINHA_INSTRUCAO_3', #13#10 + fInstrucao3,FALSE);

  PreencheSumarioReport;

end;

procedure TdmPDPPedidos.InstanciaMemosReport;
begin
  mmAssinatura := TfrxMemoView(frxReportMain.FindObject('mmAssinatura'));
  mmAssinaturaA4 := TfrxMemoView(frxReportMain.FindObject('mmAssinaturaA4'));
  ShapeAssinaturaA4 := TfrxShapeView(frxReportMain.FindObject('ShapeAssinaturaA4'));
  mmAreaAssinaturaA4 := TfrxMemoView(frxReportMain.FindObject('mmAreaAssinaturaA4'));
  mmGarantiaA4 := TfrxMemoView(frxReportMain.FindObject('mmGarantiaA4'));
  dtGarantiaA4 := TfrxMemoView(frxReportMain.FindObject('dtGarantiaA4'));
end;

procedure TdmPDPPedidos.instanciarPaginas;
begin
  pgBobina48c := TfrxPage(frxReportMain.FindObject('pgBobina48c'));
  pgPadraoA4  := TfrxPage(frxReportMain.FindObject('pgPadraoA4'));

  pgBobina48c.Visible := false;
  pgPadraoA4.Visible  := true;
end;

procedure TdmPDPPedidos.PreencheSumarioReport;
begin
  mmAssinatura.Visible := qrMainTIPO_PAGAMENTO.AsInteger =  TP_PAGAMENTO_A_PRAZO;

  ShapeAssinaturaA4.Visible := qrMainTIPO_PAGAMENTO.AsInteger =  TP_PAGAMENTO_A_PRAZO;
  mmAssinaturaA4.Visible := qrMainTIPO_PAGAMENTO.AsInteger =  TP_PAGAMENTO_A_PRAZO;
  mmAreaAssinaturaA4.Visible := qrMainTIPO_PAGAMENTO.AsInteger =  TP_PAGAMENTO_A_PRAZO;

  //INFO GARANTIA

  mmGarantiaA4.Visible := (qrMainSTATUS.AsInteger = STS_PEDIDO_VENDA_CONFERENCIA) and (not (qrMainTEXTO_GARANTIA.AsString.IsEmpty));
  dtGarantiaA4.Visible := (qrMainSTATUS.AsInteger = STS_PEDIDO_VENDA_CONFERENCIA) and (not (qrMainTEXTO_GARANTIA.AsString.IsEmpty));

end;

procedure TdmPDPPedidos.camposAexibir;
begin
  fPedidoMobile := QueryValueStr('select PEDIDO_ORIGINAL from PEDIDOS_VENDAS where ID = '+fID_MOVI.ToString);
  if not (fPedidoMobile.IsEmpty) then
    fPedidoMobile := QueryValueStr('select TP_VENDA from PEDIDOS_VENDAS_MOBILE where ID_LOCAL = '+fPedidoMobile);
  fInstrucao1 := GetConfigValue(TRetaguarda.LINHA_INSTRUCAO_1);
  fInstrucao2 := GetConfigValue(TRetaguarda.LINHA_INSTRUCAO_2);
  fInstrucao3 := GetConfigValue(TRetaguarda.LINHA_INSTRUCAO_3);
  fExibirImpressaoTipoPedido := GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_TIPO_PEDIDO);
  FExibirImpressaoValorTotal := GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_VALOR_TOTAL);
  fExibirImpressaoPercDesc := GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_PERC_DESC);
  fExibirImpressaoValorDesc := GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_VALOR_DESC);
  fExibirImpressaoValorRecebido := GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_VALOR_RECEBIDO);
  fExibirImpressaoTroco := GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_TROCO);
  fExibirImpressaoPesoProdutos := False;
  fExibirImpressaoValorLiquido := GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_VALOR_LIQUIDO);
  fExibirImpressaoOrdemProdutos := GetConfigValueInt(TRetaguarda.ORDEM_IMPRESSAO);
  case fExibirImpressaoOrdemProdutos of
    1: qrDetail.SQL.Add(' order by PRODUTOS_ID ');
    2: qrDetail.SQL.Add(' order by PRO.DESCRICAO ');
  end;
  qrMain.ParamByName('ID_MOVI').AsInteger := fID_MOVI;
  qrCliente.ParamByName('CLIENTE_ID').AsInteger := fID_CLIENTE;
end;

procedure TdmPDPPedidos.CarregaCabecalho;
begin
 if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_RAZAO_SOCIAL) then
  SetReportVariableValue('NOME_EMPRESA', GetEmpresaRazaoSocial,True);

 if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_NOME_FANTASIA) then
  SetReportVariableValue('NOME_FANTASIA',#13#10 + GetEmpresaNomeFatansia, False);

 if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_CNPJ) then
  SetReportVariableValue('CNPJ_EMPRESA', #13#10+ GetEmpresaCnpj(True), False);

 if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_ENDERECO) then
  SetReportVariableValue('ENDERECO_EMPRESA', #13#10+ GetEmpresaEndereco + #13#10 + GetEmpresaBairro + ', ' + GetEmpresaCidade, False);

 if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_TELEFONE) then
  SetReportVariableValue('TELEFONE', #13#10 + GetEmpresaTelefone, False);

  if FileExists(IncludeTrailingBackslash(ExtractFilePath(Application.ExeName))+'\Temp\LOGOIMPRESSAO.jpg') then
    DeleteFile(IncludeTrailingBackslash(ExtractFilePath(Application.ExeName))+'\Temp\LOGOIMPRESSAO.jpg');

 {

  TfmRepositorioImagens.SaveImagem(Self,
                                   dmMain.ServerName,
                                   dmMain.DatabaseName,
                                   dmMain.PortName,
                                   dmMain.UserName,
                                   dmMain.Password,
                                   'LOGOIMPRESSAO',
                                   IncludeTrailingBackslash(ExtractFilePath(Application.ExeName))+'LOGOIMPRESSAO.jpg');      }
  if LoadLogoBase64 <> '' then
  SalvarImagemEncoded(LoadLogoBase64);

  if FileExists(IncludeTrailingBackslash(ExtractFilePath(Application.ExeName))+'LOGOIMPRESSAO.jpg') then
    SetReportVariableValue('LOGO_EMPRESA', IncludeTrailingBackslash(ExtractFilePath(Application.ExeName))+'\Temp\LOGOIMPRESSAO.jpg');

end;


procedure TdmPDPPedidos.CarregaCliente;
begin
 {   if chkImpressoraBobina.Checked then // preenche impressira bobina
   begin
    if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_CLIENTE) then
      SetReportVariableValue('NOME_CLIENTE','Cliente: ' + qrClienteID.AsString + ' - ' + qrClienteDESCRICAO.AsString);

    if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_CLIENTE_APELIDO) then
      SetReportVariableValue('APELIDO_CLIENTE',#13#10 + IFTHEN(qrClienteTIPOCLIENTE.AsInteger = CLIENTE_CPF, 'Apelido: ' + qrClienteAPELIDO.AsString, 'Nome Fantasia: ' + qrClienteNOMEFANTASIA.AsString), true);

    if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_ENDERECO_CLI) then
      SetReportVariableValue('ENDERECO_CLIENTE', #13#10 + 'Endereço: ' + qrClienteENDERECO.AsString + ', ' + qrClienteNUMERO.AsString,false);

    if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_BAIRRO) then
      SetReportVariableValue('BAIRRO_CLIENTE', #13#10 + 'Bairro: ' + qrClienteBAIRRO.AsString, false);

    if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_CIDADE) then
      begin
        SetReportVariableValue('CIDADE_CLIENTE', #13#10 + 'Cidade: ' + qrClienteCIDADE.AsString + '-' + trim(qrClienteUF.AsString), False);
        SetReportVariableValue('CEP_CLIENTE', #13#10 + 'CEP: ' + qrClienteCEP.AsString,false);
      end;

    if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_CPF_CNPJ) then
      SetReportVariableValue('CPF_CLIENTE', #13#10 + IFTHEN(qrClienteTIPOCLIENTE.AsInteger = CLIENTE_CPF, 'CPF: ' + MascaraCPF(qrClienteCPF.AsString), 'CNPJ: ' + MascaraCNPJ(qrClienteCNPJ.AsString)), false );

    if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_TELEFONE_CLI) then
      SetReportVariableValue('TELEFONE_CLIENTE', #13#10 + 'Fones: ' + qrClienteTELEFONE.AsString + ' / ' +  qrClienteCELULAR.AsString, false);

    if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_OBS_CLIENTE) then
      SetReportVariableValue('OBS_CLIENTE', #13#10 + 'OBS: ' + qrCLienteOBS.AsString, false);
   end
   else if chkImpressoraPadrao.Checked then

   }
    //preenche cliente impressora A4

      if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_CLIENTE) then
        SetReportVariableValue('NOME_CLIENTE','Cliente: ' + qrClienteID.AsString + ' - ' + qrClienteDESCRICAO.AsString);

      if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_CLIENTE_APELIDO) then
        SetReportVariableValue('APELIDO_CLIENTE',#13#10 + IFTHEN(qrClienteTIPOCLIENTE.AsInteger = CLIENTE_CPF, 'Apelido: ' + qrClienteAPELIDO.AsString, 'Nome Fantasia: ' + qrClienteNOMEFANTASIA.AsString), false);

      if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_ENDERECO_CLI) then
        SetReportVariableValue('ENDERECO_CLIENTE', #13#10 + 'Endereço: ' + qrClienteENDERECO.AsString + ', ' + qrClienteNUMERO.AsString,false);

      if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_BAIRRO) then
        SetReportVariableValue('BAIRRO_CLIENTE', ', ' + 'Bairro: ' + qrClienteBAIRRO.AsString, true);

      if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_CIDADE) then
        begin
          SetReportVariableValue('CIDADE_CLIENTE', #13#10 + 'Cidade: ' + qrClienteCIDADE.AsString + '-' + trim(qrClienteUF.AsString), False);
          SetReportVariableValue('CEP_CLIENTE', #13#10 + 'CEP: ' + qrClienteCEP.AsString,false);
        end;

      if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_CPF_CNPJ) then
        SetReportVariableValue('CPF_CLIENTE', #13#10 + IFTHEN(qrClienteTIPOCLIENTE.AsInteger = CLIENTE_CPF, 'CPF: ' + MascaraCPF(qrClienteCPF.AsString), 'CNPJ: ' + MascaraCNPJ(qrClienteCNPJ.AsString)), false );

      if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_TELEFONE_CLI) then
        SetReportVariableValue('TELEFONE_CLIENTE', #13#10 + 'Fones: ' + qrClienteTELEFONE.AsString + ' / ' +  qrClienteCELULAR.AsString, false);

      if GetConfigValueBoolean(TRetaguarda.EXIBIR_IMPRESSAO_OBS_CLIENTE) then
        SetReportVariableValue('OBS_CLIENTE', #13#10 + 'OBS. Cliente: ' + qrCLienteOBS.AsString, false);
end;

procedure TdmPDPPedidos.DataModuleCreate(Sender: TObject);
var
  _FdmConexao: TdmConexao;
begin
    _FdmConexao:= TdmConexao.Create(nil);

    if _FdmConexao.ConectarBanco then
      begin
        qrMain.Connection := _FdmConexao.fdConexao;
        qrCliente.Connection := _FdmConexao.fdConexao;
        qrDetail.Connection := _FdmConexao.fdConexao;
        qrSubDetail.Connection := _FdmConexao.fdConexao;
      end;
end;

procedure TdmPDPPedidos.SetReportVariableValue(aVariableName, aValue: string; aQuotedStr: Boolean = True);
begin
  if aQuotedStr then
    frxReportMain.Variables[aVariableName] := QuotedStr(aValue)
  else
    frxReportMain.Variables[aVariableName] := aValue;
end;

procedure TdmPDPPedidos.SaltarLinhas;
var
  i,
  _linhas :integer;
  _text: String;

begin
  _linhas := GetConfigValueInt(TRetaguarda.SALTA_LINHA_IMPRESSAO_BOBINA);
  _text := '';

  for I := 0 to _linhas do
    begin
      _text := _text + #13#10 ;
    end;

  SetReportVariableValue('CONTEUDO_QUEBRA_LINHA',_TEXT, False);
end;

function TdmPDPPedidos.GetCaixaPedido: string;
begin
  Result := QueryValueStr('select first 1 C.DESCRICAO '+
                          'from PEDIDOS_VENDAS_PAGAMENTOS PVG '+
                          'left join CAIXAS C on C.ID = PVG.CAIXAS_ID '+
                          'where PVG.PEDIDOS_VENDAS_ID = '+qrMainID.AsString, 'SEM INFORMAÇÃO  DE CAIXA');
end;

end.
