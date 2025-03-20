unit uMainWhatsapp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxButtons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  Inifiles, Vcl.Graphics, System.DateUtils, System.Math,

  // ################### ATENCAO AQUI ####################
  // units adicionais obrigatorias
  uTInject.ConfigCEF, uTInject, uTInject.Constant, uTInject.JS, uInjectDecryptFile,
  uTInject.Console, uTInject.Diversos, uTInject.AdjustNumber, uTInject.Config,
  uTInject.Classes,

  // units Opcionais (dependendo do que ira fazer)
  System.NetEncoding, System.TypInfo, WinInet, Vcl.ComCtrls, System.AnsiStrings,
  System.StrUtils, Vcl.Imaging.jpeg, EncdDecd,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  System.Generics.Collections,
  cxTimeEdit, ACBrUtil, whatsapp.constantes, whatsapp.funcoes, whatsapp.mensagens;

type
  TfmMainWhatsapp = class(TForm)
    pnlBackground: TPanel;
    pnlTopo: TPanel;
    Label1: TLabel;
    pnlStatusAplicacao: TPanel;
    pnlLogMensagens: TPanel;
    pnlTipoConexao: TPanel;
    Label2: TLabel;
    cbTipoConexao: TComboBox;
    pnlConfiguracoesGerais: TPanel;
    chkPausarEnvioMensagem: TCheckBox;
    chkForcarNonoDigito: TCheckBox;
    Label3: TLabel;
    edArquivoIni: TEdit;
    SpeedButton1: TSpeedButton;
    odArquivo: TOpenDialog;
    pnlControles: TPanel;
    pnlControlesButtons: TPanel;
    btnDesconectar: TcxButton;
    btnConectar: TcxButton;
    lbStatus: TLabel;
    pnlInformacoes: TPanel;
    lbMeuNumero: TLabel;
    lbLogUltimasMensagens: TLabel;
    mmMensagens: TMemo;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    WhatsappWeb: TInject;
    pcInformacoes: TPageControl;
    tsLogs: TTabSheet;
    tsEnvioMensagem: TTabSheet;
    imgQRCode: TImage;
    lbStatusAtual: TLabel;
    tsHorarios: TTabSheet;
    chkMonitorarSegunda: TCheckBox;
    chkMonitorarTerca: TCheckBox;
    chkMonitorarQuarta: TCheckBox;
    chkMonitorarQuinta: TCheckBox;
    chkMonitorarSexta: TCheckBox;
    chkMonitorarSabado: TCheckBox;
    chkMonitorarDomingo: TCheckBox;
    tdHoraInicioSegunda: TcxTimeEdit;
    tdHoraInicioTerca: TcxTimeEdit;
    tdHoraInicioQuarta: TcxTimeEdit;
    tdHoraInicioQuinta: TcxTimeEdit;
    tdHoraInicioSexta: TcxTimeEdit;
    tdHoraInicioSabado: TcxTimeEdit;
    tdHoraInicioDomingo: TcxTimeEdit;
    Label4: TLabel;
    tdHoraFimSegunda: TcxTimeEdit;
    tdHoraIntervaloInicioSegunda: TcxTimeEdit;
    Label6: TLabel;
    tdHoraIntervaloFimSegunda: TcxTimeEdit;
    Label7: TLabel;
    tdHoraFimTerca: TcxTimeEdit;
    Label8: TLabel;
    tdHoraIntervaloFimTerca: TcxTimeEdit;
    Label9: TLabel;
    tdHoraIntervaloInicioTerca: TcxTimeEdit;
    Label10: TLabel;
    tdHoraFimQuarta: TcxTimeEdit;
    Label11: TLabel;
    tdHoraIntervaloFimQuarta: TcxTimeEdit;
    Label12: TLabel;
    tdHoraIntervaloInicioQuarta: TcxTimeEdit;
    Label13: TLabel;
    tdHoraFimQuinta: TcxTimeEdit;
    Label14: TLabel;
    tdHoraIntervaloFimQuinta: TcxTimeEdit;
    Label15: TLabel;
    tdHoraIntervaloInicioQuinta: TcxTimeEdit;
    Label16: TLabel;
    tdHoraFimSexta: TcxTimeEdit;
    Label17: TLabel;
    tdHoraIntervaloFimSexta: TcxTimeEdit;
    Label18: TLabel;
    tdHoraIntervaloInicioSexta: TcxTimeEdit;
    Label19: TLabel;
    tdHoraFimSabado: TcxTimeEdit;
    Label20: TLabel;
    tdHoraIntervaloFimSabado: TcxTimeEdit;
    Label21: TLabel;
    tdHoraIntervaloInicioSabado: TcxTimeEdit;
    Label22: TLabel;
    tdHoraFimDomingo: TcxTimeEdit;
    Label23: TLabel;
    tdHoraIntervaloFimDomingo: TcxTimeEdit;
    Label24: TLabel;
    tdHoraIntervaloInicioDomingo: TcxTimeEdit;
    Label25: TLabel;
    tsRespostasAutomaticas: TTabSheet;
    Label26: TLabel;
    mmForaHorario: TMemo;
    Label27: TLabel;
    mmForaDoAr: TMemo;
    Label28: TLabel;
    mmRecebimentoPausado: TMemo;
    chkPausarRecebimento: TCheckBox;
    edNomeEmpresa: TEdit;
    btnSalvarHorarios: TButton;
    btnSalvarRespostas: TButton;
    tmEnvioMensagens: TTimer;
    imgAuxiliar: TImage;
    Label29: TLabel;
    edTempoMonitorarMensagens: TEdit;
    mmMensagemEnviar: TMemo;
    Label30: TLabel;
    Label31: TLabel;
    edNumeroEnviar: TEdit;
    Label32: TLabel;
    btnEnviarMensagem: TButton;
    btnCarregarAquivo: TButton;
    edArquivoEnviar: TEdit;
    btnSalvarNoBanco: TButton;
    fdConexaoEnvio: TFDConnection;
    fdConexaoRecebimento: TFDConnection;
    fdConexaoAdmininstrativo: TFDConnection;
    pnlAlertaFinalizando: TPanel;
    chkInicioAutomatico: TCheckBox;
    chkNaoListarLog: TCheckBox;
    lbStatusLooping: TLabel;
    tmRestartApp: TTimer;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WhatsappWebDisconnected(Sender: TObject);
    procedure WhatsappWebDisconnectedBrute(Sender: TObject);
    procedure WhatsappWebErroAndWarning(Sender: TObject; const PError,
      PInfoAdc: string);
    procedure WhatsappWebGetCheckIsValidNumber(Sender: TObject; Number: string;
      IsValid: Boolean);
    procedure WhatsappWebGetIncomingCall(
      const incomingCall: TReturnIncomingCall);
    procedure WhatsappWebGetMe(const vMe: TGetMeClass);
    procedure WhatsappWebGetMyNumber(Sender: TObject);
    procedure WhatsappWebGetQrCode(const Sender: TObject;
      const QrCode: TResultQRCodeClass);
    procedure WhatsappWebGetStatus(Sender: TObject);
    procedure WhatsappWebGetStatusMessage(const Result: TResponseStatusMessage);
    procedure WhatsappWebIsConnected(Sender: TObject; Connected: Boolean);
    procedure WhatsappWebNewGetNumber(const vCheckNumber: TReturnCheckNumber);
    procedure WhatsappWebGetUnReadMessages(const Chats: TChatList);
    procedure btnConectarClick(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
    procedure btnSalvarHorariosClick(Sender: TObject);
    procedure tmEnvioMensagensTimer(Sender: TObject);
    procedure chkPausarRecebimentoClick(Sender: TObject);
    procedure chkPausarEnvioMensagemClick(Sender: TObject);
    procedure btnCarregarAquivoClick(Sender: TObject);
    procedure btnEnviarMensagemClick(Sender: TObject);
    procedure btnSalvarNoBancoClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure chkInicioAutomaticoClick(Sender: TObject);
    procedure chkNaoListarLogClick(Sender: TObject);
    procedure lbStatusLoopingDblClick(Sender: TObject);
    procedure tmRestartAppTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FPathIniSistema: string;
    FCaminhoArquivoIni: string;
    FMeuNumero: string;
    FStatusDoServico: integer;
    FEnvioAtivoAtivado: boolean;
    FMarcarMensagensRecebidasComoLidasAoPausar: boolean;
    function StrToBoolean(AString: string): boolean;
    function BooleanToStr(ABoolean: boolean): string;
    procedure RegistraLog(ADirecao: integer; ANumero, ANome, AMensagem, AInformacoes: string );
      //Manipulação de arquivos
    procedure GravarIni(ASecao, AIdent, AValor, AIniFile: string);
    function LerIni(ASecao, AIdent, AValorDefault, AIniFile: string): string;
    procedure GravaLog(ALog, AFileName: string);
    procedure MensagemRecebida(ANumeroCliente, ANomeCliente, AProtocolo, AMensagemTexto,
      AAnexoMensagem, AInformacoes: string);
    procedure SalvaMensagemRecebida(ANumeroCliente, ANomeCliente, AProtocolo, AMensagemTexto,
      AAnexoMensagem: string; AConexao: TFDConnection);
    function EnviaMensagem(ANumeroCliente, ANomeCliente, AMensagemTexto: string): boolean;
    function EnviaMensagemComAnexo(ANumeroCliente, ANomeCliente, AMensagemTexto, AAnexo: string): boolean;
    procedure ConsultarMensagensParaEnviar;
    function EncodeAnexo(AAquivo: string): string;
    procedure SalvarConfiguracoes;
    procedure CarregaConfiguracoes;
    function EstarNoHorario: boolean;
    function ConectarBancoEnvio: boolean;
    function ConectarBancoRecebimento: boolean;
    function ConectarBancoAdmininstrativo: boolean;
    procedure VerificaExpediente;
    function RecebimentoPausado: boolean;
    function ShowQuestion(const aMsg: string; aPreSelect: integer = 0): boolean;
    procedure PararEnvioDeMensagens;
    function GetNomeAtendente: string;
  public
    { Public declarations }
  end;

var
  fmMainWhatsapp: TfmMainWhatsapp;

implementation

{$R *.dfm}

function TfmMainWhatsapp.BooleanToStr(ABoolean: boolean): string;
begin
  Result := IfThen(ABoolean, 'S', 'N');
end;

procedure TfmMainWhatsapp.btnCarregarAquivoClick(Sender: TObject);
begin
  odArquivo.Filter := '';
  if odArquivo.Execute then
    edArquivoEnviar.Text := odArquivo.FileName;
end;

procedure TfmMainWhatsapp.btnConectarClick(Sender: TObject);
begin
  SalvarConfiguracoes;
  if not (WhatsappWeb.Auth(False)) then
  begin
    WhatsappWeb.FormQrCodeType := TFormQrCodeType(cbTipoConexao.ItemIndex);
    WhatsappWeb.FormQrCodeStart;
  end;

  if not (WhatsappWeb.FormQrCodeShowing) then
    WhatsappWeb.FormQrCodeShowing := True;
end;

procedure TfmMainWhatsapp.btnDesconectarClick(Sender: TObject);
begin
  if not (WhatsappWeb.Auth) then
    Exit;

  WhatsappWeb.Logtout;
  sleepNoFreeze(3000);
  WhatsappWeb.Disconnect;
end;

procedure TfmMainWhatsapp.btnEnviarMensagemClick(Sender: TObject);
begin
  if mmMensagemEnviar.Lines.Text = EmptyStr then
  begin
    if (edArquivoEnviar.Text = EmptyStr) then
    begin
      ShowMessage('Informe o conteúdo da mensagem');
      mmMensagemEnviar.SetFocus;
      Exit;
    end;
  end;
  if edNumeroEnviar.Text = EmptyStr then
  begin
    ShowMessage('Informe o número do destinatário');
    edNumeroEnviar.SetFocus;
    Exit;
  end;
  if not (edArquivoEnviar.Text = EmptyStr) then
    EnviaMensagemComAnexo(edNumeroEnviar.Text,
                          edNumeroEnviar.Text,
                          mmMensagemEnviar.Lines.Text,
                          edArquivoEnviar.Text)
  else
    EnviaMensagem(edNumeroEnviar.Text,
                          edNumeroEnviar.Text,
                          mmMensagemEnviar.Lines.Text);
  ShowMessage('Concluido');
end;

procedure TfmMainWhatsapp.btnSalvarHorariosClick(Sender: TObject);
begin
  SalvarConfiguracoes;
end;

procedure TfmMainWhatsapp.btnSalvarNoBancoClick(Sender: TObject);
var
  lErroInsert: string;
begin
  if mmMensagemEnviar.Lines.Text = EmptyStr then
  begin
    if (edArquivoEnviar.Text = EmptyStr) then
    begin
      ShowMessage('Informe o conteúdo da mensagem');
      mmMensagemEnviar.SetFocus;
      Exit;
    end;
  end;
  if edNumeroEnviar.Text = EmptyStr then
  begin
    ShowMessage('Informe o número do destinatário');
    edNumeroEnviar.SetFocus;
    Exit;
  end;
  if ConectarBancoAdmininstrativo then
  begin
    if not (edArquivoEnviar.Text = EmptyStr) then
    begin
      lErroInsert := TMensagemBruta.Novo(0,
                                        Now,
                                        FMeuNumero,
                                        edNumeroEnviar.Text,
                                        EmptyStr, //Ticket
                                        Now,
                                        EndOfTheDay(Now),
                                        STS_MENSAGEM_NAO_ENVIADA,
                                        TP_INTERACAO_A_PARTIR_DA_EMPRESA,
                                        TP_ENTREGA_TEXTO_ATIVO,
                                        TP_RECEBIDA_DESCONHECIDA,
                                        TP_OPCAO_ENTREGA_PARA_USUARIO,
                                        mmMensagemEnviar.Lines.Text,
                                        edArquivoEnviar.Text,
                                        STS_ATENDIMENTO_FINALIZADO,
                                        0, //Cliente id
                                        EmptyStr,
                                        EmptyStr)
                                   .RegistraMensagemArquivo(edArquivoEnviar.Text, fdConexaoAdmininstrativo);
      if not (lErroInsert.IsEmpty) then
        RegistraLog(TP_OPCAO_ENTREGA_PARA_EMPRESA, edNumeroEnviar.Text, edNumeroEnviar.Text, lErroInsert,
              Format('Numero empresa: %s; Numero cliente: %s; Protocolo: %s; Mensagem: %s; Arquivo: %s',
                [FMeuNumero, edNumeroEnviar.Text, FormatDateTime('ddmmyyhhnnsszzz', Now), mmMensagemEnviar.Lines.Text, edArquivoEnviar.Text]));
    end
    else
    begin
      lErroInsert := TMensagemBruta.Novo(0,
                                        Now,
                                        FMeuNumero,
                                        edNumeroEnviar.Text,
                                        EmptyStr, //Ticket
                                        Now,
                                        EndOfTheDay(Now),
                                        STS_MENSAGEM_NAO_ENVIADA,
                                        TP_INTERACAO_A_PARTIR_DA_EMPRESA,
                                        TP_ENTREGA_TEXTO_ATIVO,
                                        TP_RECEBIDA_DESCONHECIDA,
                                        TP_OPCAO_ENTREGA_PARA_USUARIO,
                                        mmMensagemEnviar.Lines.Text,
                                        EmptyStr,
                                        STS_ATENDIMENTO_EM_ABERTO,
                                        0, //Cliente id
                                        EmptyStr,
                                        EmptyStr)
                                   .RegistraMensagemTexto(fdConexaoAdmininstrativo);
      if not (lErroInsert.IsEmpty) then
        RegistraLog(TP_OPCAO_ENTREGA_PARA_EMPRESA, edNumeroEnviar.Text, edNumeroEnviar.Text, lErroInsert,
              Format('Numero empresa: %s; Numero cliente: %s; Protocolo: %s; Mensagem: %s;',
                [FMeuNumero, edNumeroEnviar.Text, FormatDateTime('ddmmyyhhnnsszzz', Now), mmMensagemEnviar.Lines.Text]));
    end;
    ShowMessage('Concluido');
  end;
  fdConexaoAdmininstrativo.Close;
end;

procedure TfmMainWhatsapp.CarregaConfiguracoes;
begin
  FCaminhoArquivoIni           := LerIni('GERAL', 'INI', '', FPathIniSistema);
  edArquivoIni.Text            := FCaminhoArquivoIni;
  chkInicioAutomatico.Checked  := StrToBoolean(LerIni('GERAL', 'INICIO_AUTOMATICO', 'N', FPathIniSistema));
  chkForcarNonoDigito.Checked  := StrToBoolean(LerIni('GERAL', 'USAR_NONO_DIGITO', 'N', FPathIniSistema));
  cbTipoConexao.ItemIndex      := cbTipoConexao.Items.IndexOf(LerIni('GERAL', 'TIPO_CONEXAO', 'Gerar QR Code', FPathIniSistema));
  edNomeEmpresa.Text           := LerIni('GERAL', 'EMPRESA', 'EMPRESA', FPathIniSistema);
  edTempoMonitorarMensagens.Text := LerIni('GERAL', 'TEMPO_MONITORAR', '5', FPathIniSistema);
  chkNaoListarLog.Checked         := StrToBoolean(LerIni('GERAL', 'LISTAR_LOG', 'S', FPathIniSistema ));


  // Segunda-feira
  chkMonitorarSegunda.Checked := StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_SEQUNDA', 'N', FPathIniSistema));
  tdHoraInicioSegunda.Time := StrToTime(LerIni('GERAL', 'SEQUNDA_INICIO', '00:00:00', FPathIniSistema));
  tdHoraFimSegunda.Time := StrToTime(LerIni('GERAL', 'SEQUNDA_FIM', '00:00:00', FPathIniSistema));
  tdHoraIntervaloInicioSegunda.Time := StrToTime(LerIni('GERAL', 'SEQUNDA_INTEVALO_INICIO', '00:00:00', FPathIniSistema));
  tdHoraIntervaloFimSegunda.Time := StrToTime(LerIni('GERAL', 'SEQUNDA_INTERVALO_FIM', '00:00:00', FPathIniSistema));

  // Terça-feira
  chkMonitorarTerca.Checked := StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_TERCA', 'N', FPathIniSistema));
  tdHoraInicioTerca.Time := StrToTime(LerIni('GERAL', 'TERCA_INICIO', '00:00:00', FPathIniSistema));
  tdHoraFimTerca.Time := StrToTime(LerIni('GERAL', 'TERCA_FIM', '00:00:00', FPathIniSistema));
  tdHoraIntervaloInicioTerca.Time := StrToTime(LerIni('GERAL', 'TERCA_INTEVALO_INICIO', '00:00:00', FPathIniSistema));
  tdHoraIntervaloFimTerca.Time := StrToTime(LerIni('GERAL', 'TERCA_INTERVALO_FIM', '00:00:00', FPathIniSistema));

  // Quarta-feira
  chkMonitorarQuarta.Checked := StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_QUARTA', 'N', FPathIniSistema));
  tdHoraInicioQuarta.Time := StrToTime(LerIni('GERAL', 'QUARTA_INICIO', '00:00:00', FPathIniSistema));
  tdHoraFimQuarta.Time := StrToTime(LerIni('GERAL', 'QUARTA_FIM', '00:00:00', FPathIniSistema));
  tdHoraIntervaloInicioQuarta.Time := StrToTime(LerIni('GERAL', 'QUARTA_INTEVALO_INICIO', '00:00:00', FPathIniSistema));
  tdHoraIntervaloFimQuarta.Time := StrToTime(LerIni('GERAL', 'QUARTA_INTERVALO_FIM', '00:00:00', FPathIniSistema));

  // Quinta-feira
  chkMonitorarQuinta.Checked := StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_QUINTA', 'N', FPathIniSistema));
  tdHoraInicioQuinta.Time := StrToTime(LerIni('GERAL', 'QUINTA_INICIO', '00:00:00', FPathIniSistema));
  tdHoraFimQuinta.Time := StrToTime(LerIni('GERAL', 'QUINTA_FIM', '00:00:00', FPathIniSistema));
  tdHoraIntervaloInicioQuinta.Time := StrToTime(LerIni('GERAL', 'QUINTA_INTEVALO_INICIO', '00:00:00', FPathIniSistema));
  tdHoraIntervaloFimQuinta.Time := StrToTime(LerIni('GERAL', 'QUINTA_INTERVALO_FIM', '00:00:00', FPathIniSistema));

  // Sexta-feira
  chkMonitorarSexta.Checked := StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_SEXTA', 'N', FPathIniSistema));
  tdHoraInicioSexta.Time := StrToTime(LerIni('GERAL', 'SEXTA_INICIO', '00:00:00', FPathIniSistema));
  tdHoraFimSexta.Time := StrToTime(LerIni('GERAL', 'SEXTA_FIM', '00:00:00', FPathIniSistema));
  tdHoraIntervaloInicioSexta.Time := StrToTime(LerIni('GERAL', 'SEXTA_INTEVALO_INICIO', '00:00:00', FPathIniSistema));
  tdHoraIntervaloFimSexta.Time := StrToTime(LerIni('GERAL', 'SEXTA_INTERVALO_FIM', '00:00:00', FPathIniSistema));

  // Sabado
  chkMonitorarSabado.Checked := StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_SABADO', 'N', FPathIniSistema));
  tdHoraInicioSabado.Time := StrToTime(LerIni('GERAL', 'SABADO_INICIO', '00:00:00', FPathIniSistema));
  tdHoraFimSabado.Time := StrToTime(LerIni('GERAL', 'SABADO_FIM', '00:00:00', FPathIniSistema));
  tdHoraIntervaloInicioSabado.Time := StrToTime(LerIni('GERAL', 'SABADO_INTEVALO_INICIO', '00:00:00', FPathIniSistema));
  tdHoraIntervaloFimSabado.Time := StrToTime(LerIni('GERAL', 'SABADO_INTERVALO_FIM', '00:00:00', FPathIniSistema));

  // Domingo
  chkMonitorarDomingo.Checked := StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_DOMINGO', 'N', FPathIniSistema));
  tdHoraInicioDomingo.Time := StrToTime(LerIni('GERAL', 'DOMINGO_INICIO', '00:00:00', FPathIniSistema));
  tdHoraFimDomingo.Time := StrToTime(LerIni('GERAL', 'DOMINGO_FIM', '00:00:00', FPathIniSistema));
  tdHoraIntervaloInicioDomingo.Time := StrToTime(LerIni('GERAL', 'DOMINGO_INTEVALO_INICIO', '00:00:00', FPathIniSistema));
  tdHoraIntervaloFimDomingo.Time := StrToTime(LerIni('GERAL', 'DOMINGO_INTERVALO_FIM', '00:00:00', FPathIniSistema));

  mmForaHorario.Lines.Text := LerIni('GERAL', 'TEXTO_FORA_HORARIO', '', FPathIniSistema);
  mmForaDoAr.Lines.Text := LerIni('GERAL', 'TEXTO_FORA_DO_AR', '', FPathIniSistema);
  mmRecebimentoPausado.Lines.Text := LerIni('GERAL', 'TEXTO_RECEBIMENTO_PAUSADO', '', FPathIniSistema);

  VerificaExpediente;
end;

procedure TfmMainWhatsapp.chkInicioAutomaticoClick(Sender: TObject);
begin
 if chkInicioAutomatico.Checked then
  GravarIni('GERAL','INICIO_AUTOMATICO','S', FPathIniSistema )
 ELSE
  GravarIni('GERAL','INICIO_AUTOMATICO','N', FPathIniSistema );

end;

procedure TfmMainWhatsapp.chkPausarEnvioMensagemClick(Sender: TObject);
begin
  tmEnvioMensagens.Enabled := not (chkPausarEnvioMensagem.Checked);
end;

procedure TfmMainWhatsapp.chkPausarRecebimentoClick(Sender: TObject);
begin
  FMarcarMensagensRecebidasComoLidasAoPausar := False;
  if chkPausarRecebimento.Checked then
  begin
    if ShowQuestion('Deseja marcar as mensagens recebidas como lidas?') then
      FMarcarMensagensRecebidasComoLidasAoPausar := True;
  end;
end;

procedure TfmMainWhatsapp.chkNaoListarLogClick(Sender: TObject);
begin
  if chkNaoListarLog.Checked then
    GravarIni('GERAL','LISTAR_LOG','S', FPathIniSistema )
  ELSE
    GravarIni('GERAL','LISTAR_LOG','N', FPathIniSistema );
end;

function TfmMainWhatsapp.ConectarBancoAdmininstrativo: boolean;
begin
  try
    fdConexaoAdmininstrativo.Params.Values['Server'] := LerIni('DB', 'SERVER', '', FCaminhoArquivoIni);
    fdConexaoAdmininstrativo.Params.Values['Database'] := LerIni('DB', 'DATABASE', '', FCaminhoArquivoIni);
    fdConexaoAdmininstrativo.Params.Values['Port'] := LerIni('DB', 'PORT', '', FCaminhoArquivoIni);
    fdConexaoAdmininstrativo.Params.Values['UserName'] := LerIni('DB', 'USER_NAME', '', FCaminhoArquivoIni);
    fdConexaoAdmininstrativo.Params.Values['Password'] := LerIni('DB', 'PASSWORD', '', FCaminhoArquivoIni);
    fdConexaoAdmininstrativo.Open;
    Result := fdConexaoAdmininstrativo.Connected;
  except
    on e: exception do
    begin
      RegistraLog(LOG_ERRO, FMeuNumero, edNomeEmpresa.Text, 'Erro ao se conectar ao banco: '+e.Message, '');
      Result := False;
    end;
  end;
end;

function TfmMainWhatsapp.ConectarBancoEnvio: boolean;
begin
  try
    fdConexaoEnvio.Params.Values['Server'] := LerIni('DB', 'SERVER', '', FCaminhoArquivoIni);
    fdConexaoEnvio.Params.Values['Database'] := LerIni('DB', 'DATABASE', '', FCaminhoArquivoIni);
    fdConexaoEnvio.Params.Values['Port'] := LerIni('DB', 'PORT', '', FCaminhoArquivoIni);
    fdConexaoEnvio.Params.Values['UserName'] := LerIni('DB', 'USER_NAME', '', FCaminhoArquivoIni);
    fdConexaoEnvio.Params.Values['Password'] := LerIni('DB', 'PASSWORD', '', FCaminhoArquivoIni);
    fdConexaoEnvio.Open;
    Result := fdConexaoEnvio.Connected;
  except
    on e: exception do
    begin
      RegistraLog(LOG_ERRO, FMeuNumero, edNomeEmpresa.Text, 'Erro ao se conectar ao banco: '+e.Message, '');
      Result := False;
    end;
  end;
end;

function TfmMainWhatsapp.ConectarBancoRecebimento: boolean;
begin
  try
    fdConexaoRecebimento.Params.Values['Server'] := LerIni('DB', 'SERVER', '', FCaminhoArquivoIni);
    fdConexaoRecebimento.Params.Values['Database'] := LerIni('DB', 'DATABASE', '', FCaminhoArquivoIni);
    fdConexaoRecebimento.Params.Values['Port'] := LerIni('DB', 'PORT', '', FCaminhoArquivoIni);
    fdConexaoRecebimento.Params.Values['UserName'] := LerIni('DB', 'USER_NAME', '', FCaminhoArquivoIni);
    fdConexaoRecebimento.Params.Values['Password'] := LerIni('DB', 'PASSWORD', '', FCaminhoArquivoIni);
    fdConexaoRecebimento.Open;
    Result := fdConexaoRecebimento.Connected;
  except
    on e: exception do
    begin
      RegistraLog(LOG_ERRO, FMeuNumero, edNomeEmpresa.Text, 'Erro ao se conectar ao banco: '+e.Message, '');
      Result := False;
    end;
  end;
end;

procedure TfmMainWhatsapp.ConsultarMensagensParaEnviar;
var
  lArquivoEncoded, lArquivoAnexo, lRespostaLida: string;
  lMensagensParaEnviar: TList<TMensagemEnviar>;
  I: Integer;
begin
  if ConectarBancoEnvio then
  begin
    lMensagensParaEnviar := TMensagemEnviar.RecuperaMensagens(FMeuNumero, fdConexaoEnvio);
    for I := 0 to lMensagensParaEnviar.Count - 1 do
    begin
      Sleep(5000);
      case lMensagensParaEnviar[I].OpcaoEntregue of
        TP_ENTREGA_ANEXO_IMAGEM:
          begin
            if not (lMensagensParaEnviar[I].GetAnexoImagem.IsEmpty) then
              if EnviaMensagemComAnexo(lMensagensParaEnviar[I].NumeroCliente,
                                    lMensagensParaEnviar[I].ClienteNome,
                                    lMensagensParaEnviar[I].GetMensagem(lMensagensParaEnviar[I].ClienteNome),
                                    lMensagensParaEnviar[I].GetAnexoImagem) then
                lRespostaLida := lMensagensParaEnviar[I].MarcarComoEnviada(fdConexaoEnvio)
              else
                lRespostaLida := 'Mensagem não enviada';
          end;
        TP_ENTREGA_ANEXO_PDF:
          begin
            if not (lMensagensParaEnviar[I].GetAnexoPDF.IsEmpty) then
              if EnviaMensagemComAnexo(lMensagensParaEnviar[I].NumeroCliente,
                                    lMensagensParaEnviar[I].ClienteNome,
                                    lMensagensParaEnviar[I].GetMensagem(lMensagensParaEnviar[I].ClienteNome),
                                    lMensagensParaEnviar[I].GetAnexoPDF) then
                lRespostaLida := lMensagensParaEnviar[I].MarcarComoEnviada(fdConexaoEnvio)
              else
                lRespostaLida := 'Mensagem não enviada';
          end;
        else
          begin
            if not (lMensagensParaEnviar[I].GetMensagem(lMensagensParaEnviar[I].ClienteNome).IsEmpty) then
              if EnviaMensagem(lMensagensParaEnviar[I].NumeroCliente,
                                      lMensagensParaEnviar[I].ClienteNome,
                                      lMensagensParaEnviar[I].GetMensagem(lMensagensParaEnviar[I].ClienteNome)) then
                lRespostaLida := lMensagensParaEnviar[I].MarcarComoEnviada(fdConexaoEnvio)
              else
                lRespostaLida := 'Mensagem não enviada';
          end;
      end;
      if not (lRespostaLida.IsEmpty) then
        RegistraLog(LOG_ERRO, lMensagensParaEnviar[I].NumeroCliente, lMensagensParaEnviar[I].ClienteNome, lRespostaLida, '');
      if lMensagensParaEnviar[I].OpcaoEntregue = TP_ENTREGA_TEXTO_ATIVO then
      begin
        lRespostaLida := lMensagensParaEnviar[I].MarcarComoFinalizada(fdConexaoEnvio);
        if not (lRespostaLida.IsEmpty) then
          RegistraLog(LOG_ERRO, lMensagensParaEnviar[I].NumeroCliente, lMensagensParaEnviar[I].ClienteNome, lRespostaLida, '');
      end;
    end;
  end;
  fdConexaoEnvio.Close;
end;

function TfmMainWhatsapp.EncodeAnexo(AAquivo: string): string;
begin
  Result := EmptyStr;
end;

function TfmMainWhatsapp.EnviaMensagemComAnexo(ANumeroCliente, ANomeCliente,
  AMensagemTexto, AAnexo: string): boolean;
begin
  Result := False;
  if not (AAnexo.IsEmpty) then
  begin
    try
      WhatsappWeb.SendFile(ANumeroCliente,
                           AAnexo,
                           IfThen(AMensagemTexto.IsEmpty, '', GetNomeAtendente+AMensagemTexto));
      Result := True;
      RegistraLog(TP_OPCAO_ENTREGA_PARA_USUARIO, ANumeroCliente, ANomeCliente, AMensagemTexto, '');
    except
      on e: exception do
      begin
        RegistraLog(LOG_ERRO, ANumeroCliente, ANomeCliente, AMensagemTexto, 'Erro: '+e.Message);
      end;
    end;
  end
  else
    Result := EnviaMensagem(ANumeroCliente, ANomeCliente, AMensagemTexto);
end;

function TfmMainWhatsapp.EnviaMensagem(ANumeroCliente, ANomeCliente, AMensagemTexto: string): boolean;
begin
  Result := False;
  if not (AMensagemTexto.IsEmpty) then
  begin
    try
      if not (FMarcarMensagensRecebidasComoLidasAoPausar) then
      begin
        WhatsappWeb.Send(ANumeroCliente, GetNomeAtendente+AMensagemTexto);
        Result := True;
        RegistraLog(TP_OPCAO_ENTREGA_PARA_USUARIO, ANumeroCliente, ANomeCliente, AMensagemTexto, '');
      end;
    except
      on e: exception do
      begin
        RegistraLog(LOG_ERRO, ANumeroCliente, ANomeCliente, AMensagemTexto, 'Erro: '+e.Message);
      end;
    end;
  end;
end;

procedure TfmMainWhatsapp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  case WhatsappWeb.status of
    Inject_Initialized:
      begin
        PararEnvioDeMensagens;
        while (FEnvioAtivoAtivado) do
          SleepNoFreeze(500);
        pnlAlertaFinalizando.Visible := True;
        pnlAlertaFinalizando.Align := alClient;
        WhatsappWeb.ShutDown(False);
      end;
    Inject_Destroy, Server_Disconnected:
      begin
        Action := caFree;
        Exit;
      end;
    else
    begin
      if tmRestartApp.Enabled then
        ShowMessage(TInject(WhatsappWeb).StatusToStr);
    end;
  end;
end;

procedure TfmMainWhatsapp.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if tmRestartApp.Enabled then
    CanClose := ShowQuestion('Deseja fechar o serviço de recebimento e envio de mensagens?')
  else
    CanClose := True;
end;

procedure TfmMainWhatsapp.FormCreate(Sender: TObject);
begin
  FPathIniSistema := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'ConfTInject.ini';
  FStatusDoServico := STS_SERVICO_INOPERANTE;
  chkPausarEnvioMensagem.Checked := False;
  chkPausarRecebimento.Checked := False;
  GlobalCEFApp.LogConsoleActive := True;
  FMarcarMensagensRecebidasComoLidasAoPausar := False;
  CarregaConfiguracoes;
  pcInformacoes.ActivePageIndex := 0;

  if chkInicioAutomatico.Checked then
  btnConectar.Click;

end;

procedure TfmMainWhatsapp.FormShow(Sender: TObject);
begin
  tmRestartApp.Enabled := True;
end;

function TfmMainWhatsapp.GetNomeAtendente: string;
begin
  if not (edNomeEmpresa.Text = EmptyStr) then
    Result := '[ *'+edNomeEmpresa.Text+'* ]\n';
end;

procedure TfmMainWhatsapp.GravaLog(ALog, AFileName: string);
var
  arq: TextFile;
  vDiretorio: string;
begin
  try
    vDiretorio := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))+'logs';
    if not DirectoryExists(vDiretorio) then
      ForceDirectories(vDiretorio);
    AssignFile(arq, IncludeTrailingPathDelimiter(vDiretorio)+AFileName+FormatDateTime('ddMMyyyy',Date)+'.txt');
    {$I-}
    Reset(arq);
    {$I+}
    if (IOResult <> 0)
       then Rewrite(arq) { arquivo não existe e será criado }
    else begin
           CloseFile(arq);
           Append(arq); { o arquivo existe e será aberto para saídas adicionais }
         end;
    WriteLn(Arq, Format('Data: %s -- Log: %s',
                        [FormatDateTime('dd/MM/yyyy hh:mm:ss', Now),
                        ALog]));
    CloseFile(Arq);
  except
  end;
end;

procedure TfmMainWhatsapp.GravarIni(ASecao, AIdent, AValor, AIniFile: string);
var
  vIni: TIniFile;
begin
  vIni := TIniFile.Create(AIniFile);
  try
    vIni.WriteString(ASecao, AIdent, AValor);
  finally
    vIni.Free;
  end;
end;

procedure TfmMainWhatsapp.lbStatusLoopingDblClick(Sender: TObject);
begin
  if tmEnvioMensagens.Enabled then
  begin
    if ShowQuestion('Deseja parar o looping?') then
    begin
      tmEnvioMensagens.Enabled := False;
    end;
  end
  else
  begin
    if ShowQuestion('Deseja iniciar o looping?') then
    begin
      tmEnvioMensagens.Enabled := True;
    end;
  end;
end;

function TfmMainWhatsapp.LerIni(ASecao, AIdent, AValorDefault,
  AIniFile: string): string;
var
  vIni: TIniFile;
begin
  vIni := TIniFile.Create(AIniFile);
  try
    Result := vIni.ReadString(ASecao, AIdent, AValorDefault);
  finally
    vIni.Free;
  end;
end;

procedure TfmMainWhatsapp.MensagemRecebida(ANumeroCliente, ANomeCliente, AProtocolo,
  AMensagemTexto, AAnexoMensagem, AInformacoes: string);
begin
  RegistraLog(TP_OPCAO_ENTREGA_PARA_EMPRESA, ANumeroCliente, ANomeCliente, AMensagemTexto, AInformacoes);
  if not (EstarNoHorario) then
  begin
    EnviaMensagem(ANumeroCliente, ANomeCliente, mmForaHorario.Lines.Text);
    Exit;
  end;
  if RecebimentoPausado then
  begin
    EnviaMensagem(ANumeroCliente, ANomeCliente, mmRecebimentoPausado.Lines.Text);
    Exit;
  end;

  if not (ConectarBancoRecebimento) then
  begin
    EnviaMensagem(ANumeroCliente, ANomeCliente, mmForaDoAr.Lines.Text);
    Exit;
  end else
    SalvaMensagemRecebida(ANumeroCliente, ANomeCliente, AProtocolo, AMensagemTexto,
      AAnexoMensagem, fdConexaoRecebimento);
  fdConexaoRecebimento.Close;
end;

procedure TfmMainWhatsapp.PararEnvioDeMensagens;
begin
  chkPausarEnvioMensagem.Checked := True;
  tmEnvioMensagens.Enabled := False;
end;

function TfmMainWhatsapp.RecebimentoPausado: boolean;
begin
  Result := False;
  if chkPausarRecebimento.Checked then
  begin
    Result := True;
    FStatusDoServico := STS_SERVICO_INOPERANTE;
  end;
end;

procedure TfmMainWhatsapp.RegistraLog(ADirecao: integer; ANumero, ANome, AMensagem, AInformacoes: string);
var
  lTexto: string;
begin
  if ADirecao = LOG_ERRO then
  begin
    lTexto := Format('######## [>>>> ERROR <<<<] - [%s - %s] - [%s] - %s',
          [ANumero, ANome, FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), AMensagem]);
    if not (AInformacoes.IsEmpty) then
      lTexto := lTexto + sLineBreak + AInformacoes;
    mmMensagens.Lines.Add(lTexto);
    GravaLog(lTexto, 'LOG_'+FMeuNumero+'_');
    mmMensagens.Lines.Add('----------------------------------------------------------------------------------------------------------------------------------');
  end;
  if not chkNaoListarLog.Checked then
    begin
      case ADirecao of
        LOG_ERRO: Exit;
        LOG_OPERACAO: lTexto := Format('######## [<<<< INFORMAÇÃO >>>>] - [%s - %s] - [%s] - %s',
          [ANumero, ANome, FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), AMensagem]);
        TP_OPCAO_ENTREGA_PARA_EMPRESA: lTexto := Format('>>>>>>>> [MENSAGEM RECEBIDA] - [%s - %s] - [%s] - %s',
          [ANumero, ANome, FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), AMensagem]);
        TP_OPCAO_ENTREGA_PARA_USUARIO: lTexto := Format('<<<<<<<< [MENSAGEM ENVIADA] - [%s - %s] - [%s] - %s',
          [ANumero, ANome, FormatDateTime('dd/mm/yyyy hh:nn:ss', Now), AMensagem]);
      end;
      if not (AInformacoes.IsEmpty) then
        lTexto := lTexto + sLineBreak + AInformacoes;
      mmMensagens.Lines.Add(lTexto);
      GravaLog(lTexto, 'LOG_'+FMeuNumero+'_');
      mmMensagens.Lines.Add('----------------------------------------------------------------------------------------------------------------------------------');
    end;
end;

procedure TfmMainWhatsapp.SalvaMensagemRecebida(ANumeroCliente, ANomeCliente, AProtocolo, AMensagemTexto,
  AAnexoMensagem: string; AConexao: TFDConnection);
var
  lErroInsert: string;
begin
  lErroInsert := TMensagemBruta.Novo(0,
                                    Now,
                                    FMeuNumero,
                                    ANumeroCliente,
                                    EmptyStr, //Ticket
                                    Now,
                                    EndOfTheDay(Now),
                                    STS_MENSAGEM_RECEBIDA,
                                    TP_INTERACAO_DESCONHECIDO,
                                    TP_ENTREGA_DESCONHECIDA,
                                    TP_RECEBIDA_DESCONHECIDA,
                                    TP_OPCAO_ENTREGA_PARA_EMPRESA,
                                    AMensagemTexto,
                                    EmptyStr,
                                    STS_ATENDIMENTO_EM_ABERTO,
                                    0, //Cliente id
                                    AProtocolo,
                                    EmptyStr)
                               .RegistraMensagemTexto(AConexao);
  if not (lErroInsert.IsEmpty) then
    RegistraLog(TP_OPCAO_ENTREGA_PARA_EMPRESA, ANumeroCliente, ANomeCliente, lErroInsert,
          Format('Numero empresa: %s; Numero cliente: %s; Protocolo: %s; Mensagem: %s',
            [FMeuNumero, ANumeroCliente, AProtocolo, AMensagemTexto]));
end;

procedure TfmMainWhatsapp.SalvarConfiguracoes;
begin
  GravarIni('GERAL', 'TIPO_CONEXAO', cbTipoConexao.Text, FPathIniSistema);
  GravarIni('GERAL', 'AUTO_INICIAR', BooleanToStr(chkInicioAutomatico.Checked), FPathIniSistema);
  GravarIni('GERAL', 'USAR_NONO_DIGITO', BooleanToStr(chkForcarNonoDigito.Checked), FPathIniSistema);
  GravarIni('GERAL', 'TIPO_CONEXAO', cbTipoConexao.Text, FPathIniSistema);
  GravarIni('GERAL', 'INI', edArquivoIni.Text, FPathIniSistema);
  GravarIni('GERAL', 'EMPRESA', edNomeEmpresa.Text, FPathIniSistema);
  GravarIni('GERAL', 'TEMPO_MONITORAR', edTempoMonitorarMensagens.Text, FPathIniSistema);

  // Segunda-feira
  GravarIni('GERAL', 'FUNCIONAMENTO_SEQUNDA', BooleanToStr(chkMonitorarSegunda.Checked), FPathIniSistema);
  GravarIni('GERAL', 'SEQUNDA_INICIO', TimeToStr(tdHoraInicioSegunda.Time), FPathIniSistema);
  GravarIni('GERAL', 'SEQUNDA_FIM', TimeToStr(tdHoraFimSegunda.Time), FPathIniSistema);
  GravarIni('GERAL', 'SEQUNDA_INTEVALO_INICIO', TimeToStr(tdHoraIntervaloInicioSegunda.Time), FPathIniSistema);
  GravarIni('GERAL', 'SEQUNDA_INTERVALO_FIM', TimeToStr(tdHoraIntervaloFimSegunda.Time), FPathIniSistema);

  // Terça-feira
  GravarIni('GERAL', 'FUNCIONAMENTO_TERCA', BooleanToStr(chkMonitorarTerca.Checked), FPathIniSistema);
  GravarIni('GERAL', 'TERCA_INICIO', TimeToStr(tdHoraInicioTerca.Time), FPathIniSistema);
  GravarIni('GERAL', 'TERCA_FIM', TimeToStr(tdHoraFimTerca.Time), FPathIniSistema);
  GravarIni('GERAL', 'TERCA_INTEVALO_INICIO', TimeToStr(tdHoraIntervaloInicioTerca.Time), FPathIniSistema);
  GravarIni('GERAL', 'TERCA_INTERVALO_FIM', TimeToStr(tdHoraIntervaloFimTerca.Time), FPathIniSistema);

  // Quarta-feira
  GravarIni('GERAL', 'FUNCIONAMENTO_QUARTA', BooleanToStr(chkMonitorarQuarta.Checked), FPathIniSistema);
  GravarIni('GERAL', 'QUARTA_INICIO', TimeToStr(tdHoraInicioQuarta.Time), FPathIniSistema);
  GravarIni('GERAL', 'QUARTA_FIM', TimeToStr(tdHoraFimQuarta.Time), FPathIniSistema);
  GravarIni('GERAL', 'QUARTA_INTEVALO_INICIO', TimeToStr(tdHoraIntervaloInicioQuarta.Time), FPathIniSistema);
  GravarIni('GERAL', 'QUARTA_INTERVALO_FIM', TimeToStr(tdHoraIntervaloFimQuarta.Time), FPathIniSistema);

  // Quinta-feira
  GravarIni('GERAL', 'FUNCIONAMENTO_QUINTA', BooleanToStr(chkMonitorarQuinta.Checked), FPathIniSistema);
  GravarIni('GERAL', 'QUINTA_INICIO', TimeToStr(tdHoraInicioQuinta.Time), FPathIniSistema);
  GravarIni('GERAL', 'QUINTA_FIM', TimeToStr(tdHoraFimQuinta.Time), FPathIniSistema);
  GravarIni('GERAL', 'QUINTA_INTEVALO_INICIO', TimeToStr(tdHoraIntervaloInicioQuinta.Time), FPathIniSistema);
  GravarIni('GERAL', 'QUINTA_INTERVALO_FIM', TimeToStr(tdHoraIntervaloFimQuinta.Time), FPathIniSistema);

  // Sexta-feira
  GravarIni('GERAL', 'FUNCIONAMENTO_SEXTA', BooleanToStr(chkMonitorarSexta.Checked), FPathIniSistema);
  GravarIni('GERAL', 'SEXTA_INICIO', TimeToStr(tdHoraInicioSexta.Time), FPathIniSistema);
  GravarIni('GERAL', 'SEXTA_FIM', TimeToStr(tdHoraFimSexta.Time), FPathIniSistema);
  GravarIni('GERAL', 'SEXTA_INTEVALO_INICIO', TimeToStr(tdHoraIntervaloInicioSexta.Time), FPathIniSistema);
  GravarIni('GERAL', 'SEXTA_INTERVALO_FIM', TimeToStr(tdHoraIntervaloFimSexta.Time), FPathIniSistema);

  // Sabado
  GravarIni('GERAL', 'FUNCIONAMENTO_SABADO', BooleanToStr(chkMonitorarSabado.Checked), FPathIniSistema);
  GravarIni('GERAL', 'SABADO_INICIO', TimeToStr(tdHoraInicioSabado.Time), FPathIniSistema);
  GravarIni('GERAL', 'SABADO_FIM', TimeToStr(tdHoraFimSabado.Time), FPathIniSistema);
  GravarIni('GERAL', 'SABADO_INTEVALO_INICIO', TimeToStr(tdHoraIntervaloInicioSabado.Time), FPathIniSistema);
  GravarIni('GERAL', 'SABADO_INTERVALO_FIM', TimeToStr(tdHoraIntervaloFimSabado.Time), FPathIniSistema);

  // Domingo
  GravarIni('GERAL', 'FUNCIONAMENTO_DOMINGO', BooleanToStr(chkMonitorarDomingo.Checked), FPathIniSistema);
  GravarIni('GERAL', 'DOMINGO_INICIO', TimeToStr(tdHoraInicioDomingo.Time), FPathIniSistema);
  GravarIni('GERAL', 'DOMINGO_FIM', TimeToStr(tdHoraFimDomingo.Time), FPathIniSistema);
  GravarIni('GERAL', 'DOMINGO_INTEVALO_INICIO', TimeToStr(tdHoraIntervaloInicioDomingo.Time), FPathIniSistema);
  GravarIni('GERAL', 'DOMINGO_INTERVALO_FIM', TimeToStr(tdHoraIntervaloFimDomingo.Time), FPathIniSistema);

  GravarIni('GERAL', 'TEXTO_FORA_HORARIO', mmForaHorario.Lines.Text, FPathIniSistema);
  GravarIni('GERAL', 'TEXTO_FORA_DO_AR', mmForaDoAr.Lines.Text, FPathIniSistema);
  GravarIni('GERAL', 'TEXTO_RECEBIMENTO_PAUSADO', mmRecebimentoPausado.Lines.Text, FPathIniSistema);

  CarregaConfiguracoes;
  VerificaExpediente;
end;

procedure TfmMainWhatsapp.SpeedButton1Click(Sender: TObject);
begin
  odArquivo.Filter := 'Arquivo de configuracao|*.ini';
  if odArquivo.Execute then
    edArquivoIni.Text := odArquivo.FileName;
end;

function TfmMainWhatsapp.StrToBoolean(AString: string): boolean;
begin
  Result := UpperCase(AString) = 'S';
end;

procedure TfmMainWhatsapp.tmEnvioMensagensTimer(Sender: TObject);
begin
  try
    tmEnvioMensagens.Enabled := False;
    lbStatusLooping.Caption := 'Ultima verificação: '+FormatDateTime('dd/mm/yyyy hh:nn:ss', now);
    if EstarNoHorario then
    begin
      FEnvioAtivoAtivado := True;
      tmEnvioMensagens.Interval := StrToIntDef(edTempoMonitorarMensagens.Text, 5) * 1000;
      if not (chkPausarEnvioMensagem.Checked) then
        ConsultarMensagensParaEnviar;
    end;
  finally
    FEnvioAtivoAtivado := False;
    tmEnvioMensagens.Enabled := True;
  end;
end;

procedure TfmMainWhatsapp.tmRestartAppTimer(Sender: TObject);
begin
  tmRestartApp.Enabled := False;
  Close;
end;

procedure TfmMainWhatsapp.VerificaExpediente;
begin
  FStatusDoServico := STS_SERVICO_ATIVADO;
  case DayOfTheWeek(Now) of
    DayMonday:
      begin
        if not chkMonitorarSegunda.Checked then
          FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE
        else
        begin
          if not (TimeInRange(Time, tdHoraInicioSegunda.Time, tdHoraFimSegunda.Time, True)) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
          if tdHoraIntervaloInicioSegunda.Time > 0 then
          if TimeInRange(Time, tdHoraIntervaloInicioSegunda.Time, tdHoraIntervaloFimSegunda.Time, True) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
        end;
      end;
    DayTuesday:
      begin
        if not chkMonitorarTerca.Checked then
          FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE
        else
        begin
          if not (TimeInRange(Time, tdHoraInicioTerca.Time, tdHoraFimTerca.Time, True)) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
          if tdHoraIntervaloInicioTerca.Time > 0 then
          if TimeInRange(Time, tdHoraIntervaloInicioTerca.Time, tdHoraIntervaloFimTerca.Time, True) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
        end;
      end;
    DayWednesday:
      begin
        if not chkMonitorarQuarta.Checked then
          FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE
        else
        begin
          if not (TimeInRange(Time, tdHoraInicioQuarta.Time, tdHoraFimQuarta.Time, True)) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
          if tdHoraIntervaloInicioQuarta.Time > 0 then
          if TimeInRange(Time, tdHoraIntervaloInicioQuarta.Time, tdHoraIntervaloFimQuarta.Time, True) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
        end;
      end;
    DayThursday:
      begin
        if not chkMonitorarQuinta.Checked then
          FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE
        else
        begin
          if not (TimeInRange(Time, tdHoraInicioQuinta.Time, tdHoraFimQuinta.Time, True)) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
          if tdHoraIntervaloInicioQuinta.Time > 0 then
          if TimeInRange(Time, tdHoraIntervaloInicioQuinta.Time, tdHoraIntervaloFimQuinta.Time, True) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
        end;
      end;
    DayFriday:
      begin
        if not chkMonitorarSexta.Checked then
          FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE
        else
        begin
          if not (TimeInRange(Time, tdHoraInicioSexta.Time, tdHoraFimSexta.Time, True)) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
          if tdHoraIntervaloInicioSexta.Time > 0 then
          if TimeInRange(Time, tdHoraIntervaloInicioSexta.Time, tdHoraIntervaloFimSexta.Time, True) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
        end;
      end;
    DaySaturday:
      begin
        if not chkMonitorarSabado.Checked then
          FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE
        else
        begin
          if not (TimeInRange(Time, tdHoraInicioSabado.Time, tdHoraFimSabado.Time, True)) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
          if tdHoraIntervaloInicioSabado.Time > 0 then
          if TimeInRange(Time, tdHoraIntervaloInicioSabado.Time, tdHoraIntervaloFimSabado.Time, True) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
        end;
      end;
    DaySunday:
      begin
        if not chkMonitorarDomingo.Checked then
          FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE
        else
        begin
          if not (TimeInRange(Time, tdHoraInicioDomingo.Time, tdHoraFimDomingo.Time, True)) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
          if tdHoraIntervaloInicioDomingo.Time > 0 then
          if TimeInRange(Time, tdHoraIntervaloInicioDomingo.Time, tdHoraIntervaloFimDomingo.Time, True) then
          begin
            FStatusDoServico := STS_SERVICO_FORA_EXPEDIENTE;
            Exit;
          end;
        end;
      end;
  end;
end;

function TfmMainWhatsapp.EstarNoHorario: boolean;
var
  lHoraAtual: TTime;
begin
  Result := True;
  VerificaExpediente;
  if FStatusDoServico = STS_SERVICO_FORA_EXPEDIENTE then
    Result := False;
end;

procedure TfmMainWhatsapp.WhatsappWebDisconnected(Sender: TObject);
begin
  PararEnvioDeMensagens;
end;

procedure TfmMainWhatsapp.WhatsappWebDisconnectedBrute(Sender: TObject);
begin
  PararEnvioDeMensagens;
end;

procedure TfmMainWhatsapp.WhatsappWebErroAndWarning(Sender: TObject;
  const PError, PInfoAdc: string);
begin
  RegistraLog(LOG_ERRO, FMeuNumero, edNomeEmpresa.Text, PError + ' -> ' + PInfoAdc, '');
end;

procedure TfmMainWhatsapp.WhatsappWebGetCheckIsValidNumber(Sender: TObject;
  Number: string; IsValid: Boolean);
begin
  if IsValid then
    RegistraLog(LOG_OPERACAO, Number, 'DESCONHECIDO', 'É um número válido', '')
  else
    RegistraLog(LOG_ERRO, Number, 'DESCONHECIDO', 'Não é um número válido', '');
end;

procedure TfmMainWhatsapp.WhatsappWebGetIncomingCall(
  const incomingCall: TReturnIncomingCall);
begin
  RegistraLog(LOG_OPERACAO, incomingCall.contact, incomingCall.Name, 'Recebendo ligação: ' + incomingCall.contact, '');
end;

procedure TfmMainWhatsapp.WhatsappWebGetMe(const vMe: TGetMeClass);
var
  aList: TStringList;
begin
  try
    aList := TStringList.Create();
    aList.Add('Bateria: ' + vMe.battery.ToString);
    aList.Add('LC: ' + vMe.lc);
    aList.Add('LG: ' + vMe.lg);
    aList.Add('Localização: ' + vMe.locate);
    if vMe.plugged then
      aList.Add('Conectado: Sim')
    else
      aList.Add('Conectado: Não');
    aList.Add('Nome: ' + vMe.pushname);
    aList.Add('Token do servidor: ' + vMe.serverToken);
    aList.Add('Status: ' + vMe.status.status);
    aList.Add('Eu: ' + vMe.me);
    aList.Add('Fabricante do celular:  ' + vMe.phone.device_manufacturer);
    aList.Add('Modelo do celular: ' + vMe.phone.device_model);
    aList.Add('Versão do OS do celular: ' + vMe.phone.os_version);
    if vMe.phone.InjectWorking then
      aList.Add('InjectWorkink: Sim')
    else
      aList.Add('InjectWorkin: Não');
    RegistraLog(LOG_OPERACAO, FMeuNumero, edNomeEmpresa.Text, aList.text, '');
  finally
    aList.Free;
  end;
end;

procedure TfmMainWhatsapp.WhatsappWebGetMyNumber(Sender: TObject);
begin
  lbMeuNumero.Caption := TInject(Sender).MyNumber;
  FMeuNumero := OnlyNumber(TInject(Sender).MyNumber);
end;

procedure TfmMainWhatsapp.WhatsappWebGetQrCode(const Sender: TObject;
  const QrCode: TResultQRCodeClass);
begin
  if WhatsappWeb.FormQrCodeType = TFormQrCodeType(Ft_none) then
    imgQRCode.Picture := QrCode.AQrCodeImage
  else
    imgQRCode.Picture := nil; // Limpa foto
end;

procedure TfmMainWhatsapp.WhatsappWebGetStatus(Sender: TObject);
var
  lIniciado: boolean;
begin
  if not Assigned(Sender) Then
    Exit;
  lIniciado := False;
  if (TInject(Sender).status = Inject_Initialized) and (WhatsappWeb.Auth) then
  begin
    lbStatus.Caption := 'Online';
    lbStatus.Font.Color := $0000AE11;
    lIniciado := True;
    btnDesconectar.Enabled := True;
    btnConectar.Enabled := False;
  end
  else
  begin
    btnDesconectar.Enabled := False;
    btnConectar.Enabled := True;
    lbStatus.Caption := 'Offline';
    lbStatus.Font.Color := $002894FF;
  end;
  lbStatusAtual.Visible := false;
  case TInject(Sender).status of
    Server_ConnectedDown:
      lbStatusAtual.Caption := TInject(Sender).StatusToStr;
    Server_Disconnected:
      lbStatusAtual.Caption := TInject(Sender).StatusToStr;
    Server_Disconnecting:
      lbStatusAtual.Caption := TInject(Sender).StatusToStr;
    Server_Connected:
      lbStatusAtual.Caption := '';
    Server_Connecting:
      lbStatusAtual.Caption := TInject(Sender).StatusToStr;
    Inject_Initializing:
      lbStatusAtual.Caption := TInject(Sender).StatusToStr;
    Inject_Initialized:
      lbStatusAtual.Caption := TInject(Sender).StatusToStr;
    Server_ConnectingNoPhone:
      lbStatusAtual.Caption := TInject(Sender).StatusToStr;
    Server_ConnectingReaderCode:
      lbStatusAtual.Caption := TInject(Sender).StatusToStr;
    Server_TimeOut:
      lbStatusAtual.Caption := TInject(Sender).StatusToStr;
    Inject_Destroying:
      lbStatusAtual.Caption := TInject(Sender).StatusToStr;
    Inject_Destroy:
      lbStatusAtual.Caption := TInject(Sender).StatusToStr;
  end;
  If lbStatusAtual.Caption <> '' Then
    lbStatusAtual.Visible := True;

  If TInject(Sender).Status in [Server_ConnectingNoPhone, Server_TimeOut] Then
  Begin
    if TInject(Sender).FormQrCodeType = Ft_Desktop then
    Begin
       if TInject(Sender).Status = Server_ConnectingNoPhone then
          WhatsappWeb.FormQrCodeStop;
    end else
    Begin
      if TInject(Sender).Status = Server_ConnectingNoPhone then
      Begin
        if not TInject(Sender).FormQrCodeShowing then
           TInject(Sender).FormQrCodeShowing := True;
      end else
      begin
        TInject(Sender).FormQrCodeReloader;
      end;
    end;
  end;
  if lIniciado then
  begin
    RegistraLog(LOG_OPERACAO, FMeuNumero, edNomeEmpresa.Text, 'Processo iniciado', '');
    tmEnvioMensagens.Interval := 20000;
    tmEnvioMensagens.Enabled := True;
  end;
end;

procedure TfmMainWhatsapp.WhatsappWebGetStatusMessage(
  const Result: TResponseStatusMessage);
begin
  ShowMessage(Result.id + ' - ' + Result.status);
end;

procedure TfmMainWhatsapp.WhatsappWebGetUnReadMessages(const Chats: TChatList);
var
  lNumeroCliente, lNomeContato, lProtocolo, lMensagemRecebida, lInformacoes: string;
  lChat: TChatClass;
  lMessage: TMessagesClass;
  lInjectDecrypt: TInjectDecryptFile;
begin
  for lChat in Chats.Result do
  begin
    for lMessage in lChat.Messages do
    begin
      if not lChat.isGroup then // Não exibe mensages de grupos
      begin
        if not (lMessage.fromMe) then // Não exibe mensages enviadas por mim
        begin
          if FEnvioAtivoAtivado then
            break;
          lNumeroCliente := Copy(lChat.id, 3, Pos('@', lChat.id) - 3);
          lNomeContato := lMessage.Sender.Pushname;
          lProtocolo := lMessage.t.ToString;

          // Tratando o tipo do arquivo recebido e faz' o download para pasta \BIN\temp
          case AnsiIndexStr(UpperCase(lMessage.&type),
            ['PTT', 'IMAGE', 'VIDEO', 'AUDIO', 'DOCUMENT', 'STICKER']) of
            0:
              begin
                //WhatsappWeb.send(lNumeroCliente, '*Mensagem automática*\n\nTipo de mensagem não suportado, envie somente texto');
                lInjectDecrypt.download(lMessage.deprecatedMms3Url,
                  lMessage.mediaKey, 'mp3', lChat.id);
              end;
            1:
              begin
                //WhatsappWeb.send(lNumeroCliente, '*Mensagem automática*\n\nTipo de mensagem não suportado, envie somente texto');
                lInjectDecrypt.download(lMessage.deprecatedMms3Url,
                  lMessage.mediaKey, 'jpg', lChat.id);
              end;
            2:
              begin
                //WhatsappWeb.send(lNumeroCliente, '*Mensagem automática*\n\nTipo de mensagem não suportado, envie somente texto');
                lInjectDecrypt.download(lMessage.deprecatedMms3Url,
                  lMessage.mediaKey, 'mp4', lChat.id);
              end;
            3:
              begin
                //WhatsappWeb.send(lNumeroCliente, '*Mensagem automática*\n\nTipo de mensagem não suportado, envie somente texto');
                lInjectDecrypt.download(lMessage.deprecatedMms3Url,
                  lMessage.mediaKey, 'mp3', lChat.id);
              end;
            4:
              begin
                //WhatsappWeb.send(lNumeroCliente, '*Mensagem automática*\n\nTipo de mensagem não suportado, envie somente texto');
                lInjectDecrypt.download(lMessage.deprecatedMms3Url,
                  lMessage.mediaKey, 'pdf', lChat.id);
              end;
            5:
              begin
                sleepNoFreeze(100); //Não fazer nada
              end
            else //Leitura das mensagens comuns de texto
            begin
              lMensagemRecebida := StringReplace(lMessage.body, #$A, #13#10, [rfReplaceAll, rfIgnoreCase]);
              lInformacoes := Format('-> Tipo da mensagem: %s'+sLineBreak+
                                     '-> Protocolo: %s',
                                     [lMessage.&type, lProtocolo]);
              MensagemRecebida(lNumeroCliente, lNomeContato, lProtocolo, lMensagemRecebida, EmptyStr, lInformacoes);
            end;
          end;
          WhatsappWeb.ReadMessages(lChat.id);
          sleepNoFreeze(100);
        end;
      end;
    end;
  end;
end;

procedure TfmMainWhatsapp.WhatsappWebIsConnected(Sender: TObject;
  Connected: Boolean);
begin
  if Connected = True then
    RegistraLog(LOG_OPERACAO, FMeuNumero, edNomeEmpresa.Text, 'Conectado', '')
  else
    RegistraLog(LOG_ERRO, FMeuNumero, edNomeEmpresa.Text, 'Não conectado', '');
end;

procedure TfmMainWhatsapp.WhatsappWebNewGetNumber(
  const vCheckNumber: TReturnCheckNumber);
begin
  if vCheckNumber.valid then
    RegistraLog(LOG_OPERACAO, vCheckNumber.id, vCheckNumber.Name, 'É um número válido', '')
  else
    RegistraLog(LOG_ERRO, vCheckNumber.id, vCheckNumber.Name, 'Não é um número válido', '');
end;

function TfmMainWhatsapp.ShowQuestion(const aMsg: string; aPreSelect: integer = 0): boolean;
begin
  Result := (Application.MessageBox(PWideChar(aMsg), PWideChar(Self.Caption),
  MB_ICONQUESTION + MB_YESNO + IfThen(aPreSelect = 0, MB_DEFBUTTON2, MB_DEFBUTTON1)) = IDYES);
end;

end.
