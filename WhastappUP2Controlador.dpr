program WhastappUP2Controlador;

uses
  Vcl.Forms,
  uControladorMensagens in 'uControladorMensagens.pas' {fmControladorMensagens},
  udmConexao in 'common\udmConexao.pas' {dmConexao: TDataModule},
  whatsapp.constantes in 'common\whatsapp.constantes.pas',
  whatsapp.funcoes in 'common\whatsapp.funcoes.pas',
  whatsapp.mensagens in 'common\whatsapp.mensagens.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmControladorMensagens, fmControladorMensagens);
  Application.Run;
end.
