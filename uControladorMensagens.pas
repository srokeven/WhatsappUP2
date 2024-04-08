unit uControladorMensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Graphics,
  whatsapp.mensagens, cxGraphics, cxControls, cxLookAndFeels, System.Generics.Collections,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, Data.DB, FireDAC.Comp.Client, whatsapp.constantes,
  System.DateUtils;

type
  TfmControladorMensagens = class(TForm)
    Panel1: TPanel;
    mmLog: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel2: TPanel;
    NumeroEmpresa: TLabeledEdit;
    NumeroCliente: TLabeledEdit;
    DataHoraInicio: TcxDateEdit;
    Label1: TLabel;
    DataHoraFim: TcxDateEdit;
    Label2: TLabel;
    OpcaoEntregue: TLabeledEdit;
    OpcaoRecebida: TLabeledEdit;
    Mensagem: TLabeledEdit;
    AnexoMensagem: TLabeledEdit;
    Button4: TButton;
    Ticket: TLabeledEdit;
    fdConexao: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    Panel3: TPanel;
    NumeroClienteRecebido: TLabeledEdit;
    NumeroEmpresaRecebido: TLabeledEdit;
    mmMensagemCliente: TMemo;
    Label3: TLabel;
    Button5: TButton;
    StatusEnvio: TComboBox;
    Label4: TLabel;
    TipoInteracao: TComboBox;
    Label5: TLabel;
    TipoEntregaMensagem: TComboBox;
    Label6: TLabel;
    Situacao: TComboBox;
    Label7: TLabel;
    Button6: TButton;
    tmCiclos: TTimer;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure tmCiclosTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmControladorMensagens: TfmControladorMensagens;

implementation

{$R *.dfm}

procedure TfmControladorMensagens.Button1Click(Sender: TObject);
begin
  tmCiclos.Enabled := True;
end;

procedure TfmControladorMensagens.Button2Click(Sender: TObject);
begin
  tmCiclos.Enabled := False;
end;

procedure TfmControladorMensagens.Button3Click(Sender: TObject);
var
  lMensagens: TList<TMensagemBruta>;
  lMensagensRecebidas: TList<TMensagemBruta>;
  lMensagensRecebidasAnteriores: TList<TMensagemRecebida>;
  lMensagensEnviadasAnteriores: TList<TMensagemEnviar>;
  lUltimaOpcaoEntregueValida: TMensagemEnviar;
  lNovaMensagemRecebida: TMensagemRecebida;
  lMensagemResposta: TMensagemEnviar;
  lResposta: string;
  I: Integer;

  lProcessar: TProcessamentoMensagens;
begin

  lProcessar := TProcessamentoMensagens.Create;
  try
    lProcessar.ExecutarMensagensTodosCadastros;
  finally
    lProcessar.Free;
  end;

//  //Processando mensagens para enviar do sistema
//  lMensagens := TMensagemBruta.RecuperaMensagens(NumeroEmpresa.Text, STS_MENSAGEM_NAO_ENVIADA, fdConexao);
//  for I := 0 to lMensagens.Count - 1 do
//  begin
//    //Mandar mensagens do sistema para os clientes
//    if lMensagens[i].TipoInteracao = TP_INTERACAO_A_PARTIR_DA_EMPRESA then
//    begin
//      lResposta := TMensagemEnviar.Add(0,
//                                       Now,
//                                       lMensagens[I].NumeroEmpresa,
//                                       lMensagens[I].NumeroCliente,
//                                       lMensagens[I].Ticket,
//                                       lMensagens[I].DataEnvioInicio,
//                                       lMensagens[I].DataEnvioFinal,
//                                       STS_MENSAGEM_NAO_ENVIADA,
//                                       TP_INTERACAO_A_PARTIR_DA_EMPRESA,
//                                       lMensagens[I].OpcaoEntregue,
//                                       lMensagens[I].GetMensagemEncoded,
//                                       STS_ATENDIMENTO_FINALIZADO,
//                                       lMensagens[I].ClienteId,
//                                       lMensagens[I].vClienteNome,
//                                       lMensagens[I].GetAnexoMensagemEncoded)
//                                  .RegistraMensagem(fdConexao);
//      if lResposta.IsEmpty then
//      begin
//        mmLog.Lines.Add('Mensagem enviada a partir do sistema processada');
//        lMensagens[i].MarcarComoEnviada(fdConexao);
//      end
//      else
//        mmLog.Lines.Add('Mensagem enviada a partir do sistema com erro: '+lResposta);
//    end;
//  end;
end;

procedure TfmControladorMensagens.Button4Click(Sender: TObject);
var
  lMensagem: TMensagemBruta;
  lResposta: string;
begin
  lMensagem := TMensagemBruta.Novo(0,
                                  Now,
                                  NumeroEmpresa.Text,
                                  NumeroCliente.Text,
                                  Ticket.Text,
                                  DataHoraInicio.Date,
                                  DataHoraFim.Date,
                                  StatusEnvio.ItemIndex,
                                  TipoInteracao.ItemIndex,
                                  StrToInt(OpcaoEntregue.Text),
                                  StrToInt(OpcaoRecebida.Text),
                                  TipoEntregaMensagem.ItemIndex,
                                  Mensagem.Text,
                                  AnexoMensagem.text,
                                  Situacao.ItemIndex,
                                  0,
                                  FormatDateTime('ddmmyyyyhhnnsszzz', now),
                                  '');
  lResposta := lMensagem.RegistraMensagemTexto(fdConexao);
  if lResposta.IsEmpty then
    mmLog.lines.add('mensagem registrada')
  else
    mmLog.lines.add(lResposta);
end;

procedure TfmControladorMensagens.Button5Click(Sender: TObject);
var
  lErroInsert: string;
begin
  lErroInsert := TMensagemBruta.Novo(0,
                                    Now,
                                    NumeroEmpresaRecebido.Text,
                                    NumeroClienteRecebido.Text,
                                    EmptyStr, //Ticket
                                    Now,
                                    EndOfTheDay(Now),
                                    STS_MENSAGEM_RECEBIDA,
                                    TP_INTERACAO_DESCONHECIDO,
                                    TP_ENTREGA_DESCONHECIDA,
                                    TP_RECEBIDA_DESCONHECIDA,
                                    TP_OPCAO_ENTREGA_PARA_EMPRESA,
                                    mmMensagemCliente.Lines.Text,
                                    EmptyStr,
                                    STS_ATENDIMENTO_EM_ABERTO,
                                    0, //Cliente id
                                    FormatDateTime('ddmmyyyyhhnnsszzz', Now),
                                    'Manual')
                               .RegistraMensagemTexto(fdConexao);
  if (lErroInsert.IsEmpty) then
    mmLog.Lines.Add('Mensagem recebida')
  else
    mmLog.Lines.Add('Erro ao receber mensagem: '+lErroInsert);
end;

procedure TfmControladorMensagens.Button6Click(Sender: TObject);
var
  lArquivoEncoded, lArquivoAnexo, lRespostaLida: string;
  lMensagensParaEnviar: TList<TMensagemEnviar>;
  I: Integer;
begin
  lMensagensParaEnviar := TMensagemEnviar.RecuperaMensagens(NumeroEmpresa.Text, fdConexao);
  for I := 0 to lMensagensParaEnviar.Count - 1 do
  begin
    case lMensagensParaEnviar[I].OpcaoEntregue of
      TP_ENTREGA_ANEXO_IMAGEM:
        begin
          if not (lMensagensParaEnviar[I].GetAnexoImagem.IsEmpty) then
            mmLog.Lines.Add(Format('Numero cliente: %s; Nome cliente: %s; Mensagem: %s; Anexo: %s', [lMensagensParaEnviar[I].NumeroCliente,
                                  lMensagensParaEnviar[I].ClienteNome,
                                  lMensagensParaEnviar[I].GetMensagem,
                                  lMensagensParaEnviar[I].GetAnexoImagem]));
        end;
      TP_ENTREGA_ANEXO_PDF:
        begin
          if not (lMensagensParaEnviar[I].GetAnexoImagem.IsEmpty) then
            mmLog.Lines.Add(Format('Numero cliente: %s; Nome cliente: %s; Mensagem: %s; Anexo: %s', [lMensagensParaEnviar[I].NumeroCliente,
                                  lMensagensParaEnviar[I].ClienteNome,
                                  lMensagensParaEnviar[I].GetMensagem,
                                  lMensagensParaEnviar[I].GetAnexoPDF]));
        end;
      else
        begin
          if not (lMensagensParaEnviar[I].GetMensagem.IsEmpty) then
              mmLog.Lines.Add(Format('Numero cliente: %s; Nome cliente: %s; Mensagem: %s', [lMensagensParaEnviar[I].NumeroCliente,
                                    lMensagensParaEnviar[I].ClienteNome,
                                    lMensagensParaEnviar[I].GetMensagem]));
        end;
    end;
    lRespostaLida := lMensagensParaEnviar[I].MarcarComoEnviada(fdConexao);
    if not (lRespostaLida.IsEmpty) then
      mmLog.Lines.Add(lRespostaLida);
    if lMensagensParaEnviar[I].OpcaoEntregue = TP_ENTREGA_TEXTO_ATIVO then
    begin
      lRespostaLida := lMensagensParaEnviar[I].MarcarComoFinalizada(fdConexao);
      if not (lRespostaLida.IsEmpty) then
        mmLog.Lines.Add(lRespostaLida);
    end;
  end;
end;

procedure TfmControladorMensagens.FormShow(Sender: TObject);
begin
  fdConexao.Open();
end;

procedure TfmControladorMensagens.tmCiclosTimer(Sender: TObject);
var
  lProcessar: TProcessamentoMensagens;
begin
  tmCiclos.Enabled := False;
  lProcessar := TProcessamentoMensagens.Create;
  try
    lProcessar.ExecutarMensagensTodosCadastros;
  finally
    tmCiclos.Enabled := True;
    lProcessar.Free;
  end;
end;

end.
