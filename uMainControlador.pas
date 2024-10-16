unit uMainControlador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, whatsapp.mensagens, uControladorMensagens;

type
  TfrmMainControlador = class(TForm)
    pnlSideBar: TPanel;
    btnIniciar: TButton;
    btnParar: TButton;
    mmLog: TMemo;
    btnOpcoesAvancadas: TButton;
    tmCiclos: TTimer;
    procedure tmCiclosTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnIniciarClick(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
    procedure btnOpcoesAvancadasClick(Sender: TObject);
  private
    procedure Log(ATexto: string);
  public
    { Public declarations }
  end;

var
  frmMainControlador: TfrmMainControlador;

implementation

{$R *.dfm}

procedure TfrmMainControlador.btnIniciarClick(Sender: TObject);
begin
  Log('Iniciando processo');
  tmCiclos.Enabled := True;
  btnIniciar.Enabled := not (btnIniciar.Enabled);
  btnParar.Enabled := not (btnParar.Enabled);
end;

procedure TfrmMainControlador.btnOpcoesAvancadasClick(Sender: TObject);
begin
  if tmCiclos.Enabled then
  begin
    raise Exception.Create('Pare o processo antes de prosseguir');
  end;
  fmControladorMensagens := TfmControladorMensagens.Create(nil);
  try
    fmControladorMensagens.ShowModal;
  finally
    fmControladorMensagens.Free;
  end;
end;

procedure TfrmMainControlador.btnPararClick(Sender: TObject);
begin
  Log('Processo parado');
  tmCiclos.Enabled := False;
  btnIniciar.Enabled := not (btnIniciar.Enabled);
  btnParar.Enabled := not (btnParar.Enabled);
end;

procedure TfrmMainControlador.FormShow(Sender: TObject);
begin
  btnIniciarClick(btnIniciar);
end;

procedure TfrmMainControlador.Log(ATexto: string);
begin
  mmLog.Lines.Add(FormatDatetime('dd/mm/yyyy hh:nn:ss', Now)+' - '+ATexto);
end;

procedure TfrmMainControlador.tmCiclosTimer(Sender: TObject);
var
  lProcessar: TProcessamentoMensagens;
begin
  tmCiclos.Enabled := False;
  mmLog.Lines.Clear;
  Log('Processo iniciado');
  lProcessar := TProcessamentoMensagens.Create;
  try
    Log('Processando mensagens recebidas e a enviar');
    lProcessar.ExecutarMensagensTodosCadastros;
    Log('Concluido. Processando mensagens de aniversario');
    lProcessar.NotificaAniversariantes;
    Log('Concluido. Processando mensagens de vencimento de boletos');
    lProcessar.NotificaBoletosAntesDoVencimento;
    Log('Concluido. Processando mensagens de boletos vencidos');
    lProcessar.NotificaBoletosUmdiaAposVencimento;
    Log('Concluido. Processando mensagens de aviso de boletos após 3 dias');
    lProcessar.NotificaBoletosAcadaTresDias;
    Log('Concluido.');
  finally
    tmCiclos.Enabled := True;
    lProcessar.Free;
  end;
end;

end.
