unit udmConexao;

interface

uses
  System.SysUtils, System.Classes, IniFiles,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.IBBase,
  Data.DB, FireDAC.Comp.Client;

type
  TdmConexao = class(TDataModule)
    fdConexao: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FCaminhoArquivoIni, FPathIniSistema: string;
    procedure GravarLog(ALog, AFileName: string);
  public
    function ConectarBanco: boolean;
    procedure DesconectarBanco;
    procedure GravarIni(ASecao, AIdent, AValor, AIniFile: string);
    function LerIni(ASecao, AIdent, AValorDefault, AIniFile: string): string;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConexao }

function TdmConexao.ConectarBanco: boolean;
begin
  Result := False;
  try
    fdConexao.Params.Values['Server'] := LerIni('DB', 'SERVER', '', FCaminhoArquivoIni);
    fdConexao.Params.Values['Database'] := LerIni('DB', 'DATABASE', '', FCaminhoArquivoIni);
    fdConexao.Params.Values['Port'] := LerIni('DB', 'PORT', '', FCaminhoArquivoIni);
    fdConexao.Params.Values['UserName'] := LerIni('DB', 'USER_NAME', '', FCaminhoArquivoIni);
    fdConexao.Params.Values['Password'] := LerIni('DB', 'PASSWORD', '', FCaminhoArquivoIni);
    fdConexao.Open;
    Result := fdConexao.Connected;
  except
    on e: exception do
    begin
      GravarLog('Erro ao se conectar ao banco: '+e.Message, 'log_');
      Result := False;
    end;
  end;
end;

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  FPathIniSistema := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'ConfTInject.ini';
  FCaminhoArquivoIni := LerIni('GERAL', 'INI', '', FPathIniSistema);
end;

procedure TdmConexao.DataModuleDestroy(Sender: TObject);
begin
  DesconectarBanco;
end;

procedure TdmConexao.DesconectarBanco;
begin
  fdConexao.Close;
end;

procedure TdmConexao.GravarIni(ASecao, AIdent, AValor, AIniFile: string);
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

function TdmConexao.LerIni(ASecao, AIdent, AValorDefault,
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

procedure TdmConexao.GravarLog(ALog, AFileName: string);
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

end.
