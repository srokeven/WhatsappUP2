unit uMainControlador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.DateUtils, IniFiles,
  whatsapp.mensagens, uControladorMensagens, Winapi.TlHelp32, Winapi.ShellApi	;

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
    procedure FormCreate(Sender: TObject);
  private
    FPathIniSistema: string;
    procedure Log(ATexto: string);
    function StrToBoolean(const Value: string): boolean;
    function VerificaExpediente: boolean;
    function LerIni(ASecao, AIdent, AValorDefault, AIniFile: string): string;
    function ProcessRunning (sExeName: String) : Boolean;
    procedure BringApplicationToFront(aClassForm, aExeCall: string; aUseShellExecuter: boolean = false);
  public
    { Public declarations }
  end;

var
  frmMainControlador: TfrmMainControlador;

implementation

{$R *.dfm}

procedure TfrmMainControlador.BringApplicationToFront(aClassForm, aExeCall: string; aUseShellExecuter: boolean);
var
  Wnd : HWND;
  _ExeName, _ParamName: string;
begin
  Wnd := FindWindow(PWideChar(aClassForm), nil);
  if Wnd = 0 then
  begin
    if aExeCall.IsEmpty then
    begin
      Exit;
    end;
    _ExeName := Copy(aExeCall, 1, pos('.exe', aExeCall)+3);
    _ParamName := Copy(aExeCall, pos('.exe', aExeCall)+5, Length(aExeCall));
    if aUseShellExecuter then
      ShellExecute(Application.Handle, 'open', PWideChar(aExeCall), nil, PWideChar(ExtractFilePath(aExeCall)), SW_SHOWNORMAL);
  end
  else
    if IsIconic(Wnd) then
      ShowWindow(Wnd, SW_RESTORE)
    else
      SetForegroundWindow(Wnd);
end;

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

procedure TfrmMainControlador.FormCreate(Sender: TObject);
begin
  FPathIniSistema := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'ConfTInject.ini';
end;

procedure TfrmMainControlador.FormShow(Sender: TObject);
begin
  btnIniciarClick(btnIniciar);
end;

function TfrmMainControlador.LerIni(ASecao, AIdent, AValorDefault, AIniFile: string): string;
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

procedure TfrmMainControlador.Log(ATexto: string);
begin
  mmLog.Lines.Add(FormatDatetime('dd/mm/yyyy hh:nn:ss', Now)+' - '+ATexto);
end;

function TfrmMainControlador.ProcessRunning(sExeName: String): Boolean;
var
  hSnapShot : THandle;
  ProcessEntry32 : TProcessEntry32;
begin
  Result := false;
  hSnapShot := CreateToolhelp32Snapshot (TH32CS_SNAPPROCESS, 0);
  Win32Check (hSnapShot <> INVALID_HANDLE_VALUE);
  sExeName := LowerCase (sExeName);
  FillChar (ProcessEntry32, SizeOf (TProcessEntry32), #0);
  ProcessEntry32.dwSize := SizeOf (TProcessEntry32);
  if (Process32First (hSnapShot, ProcessEntry32)) then
    repeat
      if (Pos (sExeName, LowerCase (ProcessEntry32.szExeFile)) = 1) then
      begin
        Result := true;
        Break;
      end;
    until (Process32Next (hSnapShot, ProcessEntry32) = false);
  CloseHandle (hSnapShot);
end;

function TfrmMainControlador.StrToBoolean(const Value: string): boolean;
begin
  Result := SameText(Value, 'S');
end;

procedure TfrmMainControlador.tmCiclosTimer(Sender: TObject);
var
  lProcessar: TProcessamentoMensagens;
begin
  if not (VerificaExpediente) then
    Exit;
  tmCiclos.Enabled := False;
  mmLog.Lines.Clear;
  Log('Processo iniciado');
  if not (ProcessRunning('WhatsAppUP2.exe')) then
    BringApplicationToFront('TfmMainWhatsapp', ExtractFilePath(ParamStr(0))+'WhatsAppUP2.exe', True);
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

function TfrmMainControlador.VerificaExpediente: boolean;
begin
  Result := True;
  case DayOfTheWeek(Now) of
    DayMonday:
      begin
        if not (StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_SEQUNDA', 'N', FPathIniSistema))) then
          Exit(False)
        else
        begin
          if not (TimeInRange(Time, StrToTime(LerIni('GERAL', 'SEQUNDA_INICIO', '00:00:00', FPathIniSistema)),
                                    StrToTime(LerIni('GERAL', 'SEQUNDA_FIM', '00:00:00', FPathIniSistema)), True)) then
          begin
            Exit(False);
          end;
          if StrToTime(LerIni('GERAL', 'SEQUNDA_INTEVALO_INICIO', '00:00:00', FPathIniSistema)) > 0 then
          if TimeInRange(Time, StrToTime(LerIni('GERAL', 'SEQUNDA_INTEVALO_INICIO', '00:00:00', FPathIniSistema)),
                               StrToTime(LerIni('GERAL', 'SEQUNDA_INTERVALO_FIM', '00:00:00', FPathIniSistema)), True) then
          begin
            Exit(False);
          end;
        end;
      end;
    DayTuesday:
      begin
        if not (StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_TERCA', 'N', FPathIniSistema))) then
          Exit(False)
        else
        begin
          if not (TimeInRange(Time, StrToTime(LerIni('GERAL', 'TERCA_INICIO', '00:00:00', FPathIniSistema)),
                                    StrToTime(LerIni('GERAL', 'TERCA_FIM', '00:00:00', FPathIniSistema)), True)) then
          begin
            Exit(False);
          end;
          if StrToTime(LerIni('GERAL', 'TERCA_INTEVALO_INICIO', '00:00:00', FPathIniSistema)) > 0 then
          if TimeInRange(Time, StrToTime(LerIni('GERAL', 'TERCA_INTEVALO_INICIO', '00:00:00', FPathIniSistema)),
                               StrToTime(LerIni('GERAL', 'TERCA_INTERVALO_FIM', '00:00:00', FPathIniSistema)), True) then
          begin
            Exit(False);
          end;
        end;
      end;
    DayWednesday:
      begin
        if not (StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_QUARTA', 'N', FPathIniSistema))) then
          Exit(False)
        else
        begin
          if not (TimeInRange(Time, StrToTime(LerIni('GERAL', 'QUARTA_INICIO', '00:00:00', FPathIniSistema)),
                                    StrToTime(LerIni('GERAL', 'QUARTA_FIM', '00:00:00', FPathIniSistema)), True)) then
          begin
            Exit(False);
          end;
          if StrToTime(LerIni('GERAL', 'QUARTA_INTEVALO_INICIO', '00:00:00', FPathIniSistema)) > 0 then
          if TimeInRange(Time, StrToTime(LerIni('GERAL', 'QUARTA_INTEVALO_INICIO', '00:00:00', FPathIniSistema)),
                               StrToTime(LerIni('GERAL', 'QUARTA_INTERVALO_FIM', '00:00:00', FPathIniSistema)), True) then
          begin
            Exit(False);
          end;
        end;
      end;
    DayThursday:
      begin
        if not (StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_QUINTA', 'N', FPathIniSistema))) then
          Exit(False)
        else
        begin
          if not (TimeInRange(Time, StrToTime(LerIni('GERAL', 'QUINTA_INICIO', '00:00:00', FPathIniSistema)),
                                    StrToTime(LerIni('GERAL', 'QUINTA_FIM', '00:00:00', FPathIniSistema)), True)) then
          begin
            Exit(False);
          end;
          if StrToTime(LerIni('GERAL', 'QUINTA_INTEVALO_INICIO', '00:00:00', FPathIniSistema)) > 0 then
          if TimeInRange(Time, StrToTime(LerIni('GERAL', 'QUINTA_INTEVALO_INICIO', '00:00:00', FPathIniSistema)),
                               StrToTime(LerIni('GERAL', 'QUINTA_INTERVALO_FIM', '00:00:00', FPathIniSistema)), True) then
          begin
            Exit(False);
          end;
        end;
      end;
    DayFriday:
      begin
        if not (StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_SEXTA', 'N', FPathIniSistema))) then
          Exit(False)
        else
        begin
          if not (TimeInRange(Time, StrToTime(LerIni('GERAL', 'SEXTA_INICIO', '00:00:00', FPathIniSistema)),
                                    StrToTime(LerIni('GERAL', 'SEXTA_FIM', '00:00:00', FPathIniSistema)), True)) then
          begin
            Exit(False);
          end;
          if StrToTime(LerIni('GERAL', 'SEXTA_INTEVALO_INICIO', '00:00:00', FPathIniSistema)) > 0 then
          if TimeInRange(Time, StrToTime(LerIni('GERAL', 'SEXTA_INTEVALO_INICIO', '00:00:00', FPathIniSistema)),
                               StrToTime(LerIni('GERAL', 'SEXTA_INTERVALO_FIM', '00:00:00', FPathIniSistema)), True) then
          begin
            Exit(False);
          end;
        end;
      end;
    DaySaturday:
      begin
        if not (StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_SABADO', 'N', FPathIniSistema))) then
          Exit(False)
        else
        begin
          if not (TimeInRange(Time, StrToTime(LerIni('GERAL', 'SABADO_INICIO', '00:00:00', FPathIniSistema)),
                                    StrToTime(LerIni('GERAL', 'SABADO_FIM', '00:00:00', FPathIniSistema)), True)) then
          begin
            Exit(False);
          end;
          if StrToTime(LerIni('GERAL', 'SABADO_INTEVALO_INICIO', '00:00:00', FPathIniSistema)) > 0 then
          if TimeInRange(Time, StrToTime(LerIni('GERAL', 'SABADO_INTEVALO_INICIO', '00:00:00', FPathIniSistema)),
                               StrToTime(LerIni('GERAL', 'SABADO_INTERVALO_FIM', '00:00:00', FPathIniSistema)), True) then
          begin
            Exit(False);
          end;
        end;
      end;
    DaySunday:
      begin
        if not (StrToBoolean(LerIni('GERAL', 'FUNCIONAMENTO_DOMINGO', 'N', FPathIniSistema))) then
          Exit(False)
        else
        begin
          if not (TimeInRange(Time, StrToTime(LerIni('GERAL', 'DOMINGO_INICIO', '00:00:00', FPathIniSistema)),
                                    StrToTime(LerIni('GERAL', 'DOMINGO_FIM', '00:00:00', FPathIniSistema)), True)) then
          begin
            Exit(False);
          end;
          if StrToTime(LerIni('GERAL', 'DOMINGO_INTEVALO_INICIO', '00:00:00', FPathIniSistema)) > 0 then
          if TimeInRange(Time, StrToTime(LerIni('GERAL', 'DOMINGO_INTEVALO_INICIO', '00:00:00', FPathIniSistema)),
                               StrToTime(LerIni('GERAL', 'DOMINGO_INTERVALO_FIM', '00:00:00', FPathIniSistema)), True) then
          begin
            Exit(False);
          end;
        end;
      end;
  end;
end;

end.
