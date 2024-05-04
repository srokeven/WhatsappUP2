unit whatsapp.funcoes;

interface

uses System.SysUtils, EncdDecd, System.Generics.Collections, System.Classes,
  System.NetEncoding, System.StrUtils, System.Hash, Vcl.Imaging.jpeg, Vcl.ExtCtrls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  whatsapp.constantes, udmConexao, MaskUtils, Vcl.Forms;


function SalvarPDFEncoded(aBase64: string): string;
function SalvarImagemEncoded(aBase64: string): string;
function EncodeFileBase64(aFile: string): string;
function GerarCaminhoArquivo(aNome, aExt: string; aUsaCaractereAleatorio, aApagaSeExistir: boolean): string;
function RemoverAcentos(const ATexto: string): string;
function StringsIguais(const AString1, AString2: string): Boolean;
function StrZero(cNumero: Integer; cDigitos: Integer): string;
function LoadLogoBase64: String;
function MascaraCPF(vCPF: string): string;
function MascaraCNPJ(vCNPJ: string): string;
function ListaUltimos3IDsPedidos(aClienteID: Integer): TStringlist;

// add depois do DataModulo do PDF
function GetConfigValueBoolean(aConfigCode: string): Boolean;
function QueryValueStr(aSQL: string; aDefaultValue: string = ''): string;
function GetConfigValue(aConfigCode: string): string;
function GetConfigValueInt(aConfigCode: string): Integer;
function QueryValueInt(aSQL: string; aDefaultValue: integer = -1): integer;
procedure CriaDiretorioTemporario;

function GetEmpresaCnpj(aUsarMascara: Boolean): String;
function GetEmpresaIE: String;
function GetEmpresaRazaoSocial: String;
function GetEmpresaNomeFatansia: String;
function GetEmpresaEndereco: String;
function GetEmpresaBairro: String;
function GetEmpresaCidade: String;
function GetEmpresaTelefone: String;
function GetEmpresaUF: String;
function GetEmpresaEmail: string;



implementation




function SalvarPDFEncoded(aBase64: string): string;
var
  StreamFile: TBytesStream;
  vCaminhoArquivo, lNomeArquivo: string;
begin
  Result := '';
  lNomeArquivo := 'PDF_'+THashMD5.GetHashString(aBase64);
  vCaminhoArquivo := GerarCaminhoArquivo(lNomeArquivo, 'pdf', False, False);
  if FileExists(vCaminhoArquivo) then
    Exit(vCaminhoArquivo);
  try
	  StreamFile := TBytesStream.Create(TNetEncoding.Base64.DecodeStringToBytes(aBase64));
    StreamFile.SaveToFile(vCaminhoArquivo);
    Result := vCaminhoArquivo;
  except
    Result := '';
  end;
end;

function SalvarImagemEncoded(aBase64: string): string;
var
  LInput: TMemoryStream;
  LOutput: TMemoryStream;
  outPutStream, inputStream: TStringStream;
  AStr: TStringList;
  vCaminhoArquivo, Base64ImageString, lNomeArquivo: string;
  jpg: TJPEGImage;
  imgAuxiliar: TImage;
begin
  Result := '';
  lNomeArquivo := 'IMG_'+THashMD5.GetHashString(aBase64);
  vCaminhoArquivo := GerarCaminhoArquivo(lNomeArquivo, 'jpg', False, False);
  if FileExists(vCaminhoArquivo) then
    Exit(vCaminhoArquivo);
  jpg := TJPEGImage.Create;
  imgAuxiliar := TImage.Create(nil);
  outPutStream := TStringStream.Create;
  try
    Base64ImageString := aBase64;
    inputStream := TStringStream.Create(Base64ImageString);
    TNetEncoding.Base64.Decode(inputStream, outPutStream);
    outPutStream.Position := 0;
    jpg.LoadFromStream(outPutStream);
    imgAuxiliar.Picture.Assign(nil);
    imgAuxiliar.Picture.Assign(jpg);
    imgAuxiliar.Picture.SaveToFile(vCaminhoArquivo);
    Result := vCaminhoArquivo;
  finally
    imgAuxiliar.Free;
    jpg.Free;
    inputStream.Free;
    outPutStream.Free;
  end;
end;

function EncodeFileBase64(aFile: string): string;
var
  StreamFile: TBytesStream;
begin
  if aFile.IsEmpty then
  begin
    Result := '';
    Exit;
  end;
  if FileExists(aFile) then
  begin
    try
      StreamFile := TBytesStream.Create;
      StreamFile.LoadFromFile(aFile);
      Result := TNetEncoding.Base64.EncodeBytesToString(StreamFile.Bytes);
    except
      Result := '';
    end;
  end;
end;

function GerarCaminhoArquivo(aNome, aExt: string; aUsaCaractereAleatorio, aApagaSeExistir: boolean): string;
var
  vNomeArquivo: string;
begin
  if not (DirectoryExists(ExtractFilePath(ParamStr(0))+'temp\'+aExt+'\')) then
    ForceDirectories(ExtractFilePath(ParamStr(0))+'temp\'+aExt+'\');

  vNomeArquivo := ExtractFilePath(ParamStr(0))+'temp\'+aExt+'\';
  vNomeArquivo := vNomeArquivo + aNome +'_'+ IfThen(aUsaCaractereAleatorio, FormatDateTime('ddmmyyyyhhnnss', now), '')+ '.'+aExt;
  if aApagaSeExistir then
    if FileExists(vNomeArquivo) then
      DeleteFile(vNomeArquivo);
  Result := vNomeArquivo;
end;

function RemoverAcentos(const ATexto: string): string;
var
  I: Integer;
begin
  Result := Trim(LowerCase(ATexto));
  for I := 1 to Length(Result) do
    if Result[I] in ['á','à','ã','â','ä'] then
      Result[I] := 'a'
    else if Result[I] in ['é','è','ê','ë'] then
      Result[I] := 'e'
    else if Result[I] in ['í','ì','î','ï'] then
      Result[I] := 'i'
    else if Result[I] in ['ó','ò','õ','ô','ö'] then
      Result[I] := 'o'
    else if Result[I] in ['ú','ù','û','ü'] then
      Result[I] := 'u'
    else if Result[I] = 'ç' then
      Result[I] := 'c';
end;

function StringsIguais(const AString1, AString2: string): Boolean;
begin
  Result := RemoverAcentos(AString1) = RemoverAcentos(AString2);
end;

function StrZero(cNumero: Integer; cDigitos: Integer): string;
var
  i: Integer;
  Texto: String;
begin
  Texto := InttoStr(cNumero);
  for i := 1 to (cDigitos - Length(Texto)) do
    Texto := '0' + Texto;
  Result := Texto;
end;

function GetConfigValueBoolean(aConfigCode: string): Boolean;
Begin
  try
    Result := QueryValueStr(' select first 1 VALOR from CONFIGURACOES where CODIGO = ' + QuotedStr(aConfigCode)) = 'True';
  except
   // ShowError('O parametro informado para a função ''GetConfigValueBoolean'', é inválido!')
  end;
End;

function GetEmpresaCnpj(aUsarMascara: Boolean): String;
var
_Query: TFDQuery;
_FdmConexao: TdmConexao;
begin
  _Query := TFDQuery.Create(nil);
  _FdmConexao := TdmConexao.Create(nil);

  if _FdmConexao.ConectarBanco then
    begin
      try
        _Query.Connection :=  _FdmConexao.fdConexao;
        _Query.open('select cnpj_cpf from empresa');
        if aUsarMascara then
          Result := FormatMaskText('00\.000\.000\/0000\-00;0;',_query.fieldbyname('cnpj_cpf').asstring)
        else
          Result := _query.fieldbyname('cnpj_cpf').asstring;
      finally
        _Query.free;
        _FdmConexao.Free;
      end;
    end;
  
end;

function GetEmpresaIE: String;
var
_Query: TFDQuery;
_FdmConexao: TdmConexao;
begin
  _Query := TFDQuery.Create(nil);
  try
    _Query.Connection := _FdmConexao.fdConexao;
    _Query.open('select INSCRICAO_ESTADUAL from empresa');
    Result := _query.fieldbyname('INSCRICAO_ESTADUAL').asstring;
  finally
    _Query.free;
  end;
end;

Function GetEmpresaRazaoSocial: String;
var
_Query: TFDQuery;
_FdmConexao: TdmConexao;
begin
  _Query := TFDQuery.Create(nil);
  try
    _Query.Connection := _FdmConexao.fdConexao;
    _Query.open('select RAZAO_SOCIAL from empresa');
    Result := _query.fieldbyname('RAZAO_SOCIAL').asstring;
  finally
    _Query.free;
    _FdmConexao.Free;
  end;
end;

Function GetEmpresaNomeFatansia: String;
var
_Query: TFDQuery;
_FdmConexao: TdmConexao;
begin
  _Query := TFDQuery.Create(nil);
  _FdmConexao := TdmConexao.Create(nil);

  if _FdmConexao.ConectarBanco then
    begin
       try
          _Query.Connection := _FdmConexao.fdConexao;
          _Query.open('select NOME_FANTASIA from empresa');
          Result := _query.fieldbyname('NOME_FANTASIA').asstring;
        finally
          _Query.free;
          _FdmConexao.Free;
        end;
    end;
 
end;

Function GetEmpresaEndereco: String;
var
_Query: TFDQuery;
_FdmConexao: TdmConexao;
begin
  _Query := TFDQuery.Create(nil);
  _FdmConexao := TdmConexao.Create(nil);

  if _FdmConexao.ConectarBanco then
    begin
      try
        _Query.Connection :=  _FdmConexao.fdConexao;
        _Query.open('select ENDERECO from empresa');
        Result := _query.fieldbyname('ENDERECO').asstring;
      finally
        _Query.free;
        _FdmConexao.Free;
      end;
    end;
  
end;

Function GetEmpresaBairro: String;
var
_Query: TFDQuery;
_FdmConexao: TdmConexao;
begin
  _Query := TFDQuery.Create(nil);
   _FdmConexao := TdmConexao.Create(nil);

  if _FdmConexao.ConectarBanco then
    begin
      try
        _Query.Connection := _FdmConexao.fdConexao;
        _Query.open('select BAIRRO from empresa');
        Result := _query.fieldbyname('BAIRRO').asstring;
      finally
        _Query.free;
        _FdmConexao.Free
      end;
    end;
end;

Function GetEmpresaCidade: String;
var
_Query: TFDQuery;
_FdmConexao: TdmConexao;
begin
  _Query := TFDQuery.Create(nil);
  _FdmConexao := TdmConexao.Create(nil);

  if _FdmConexao.ConectarBanco then
  begin
    try
      _Query.Connection := _FdmConexao.fdConexao;
      _Query.open('select CIDADE from empresa');
      Result := _query.fieldbyname('CIDADE').asstring;
    finally
      _Query.free;
    end;
  end;
end;

Function GetEmpresaTelefone: String;
var
_Query: TFDQuery;
_FdmConexao: TdmConexao;
begin
  _Query := TFDQuery.Create(nil);
   _FdmConexao := TdmConexao.Create(nil);

  if _FdmConexao.ConectarBanco then
  begin
    try
      _Query.Connection := _FdmConexao.fdConexao;
      _Query.open('select TELEFONE from empresa');
      Result := _query.fieldbyname('TELEFONE').asstring;
    finally
      _Query.free;
      _FdmConexao.Free;
    end;
  end;
end;

Function GetEmpresaUF: String;
var
_Query: TFDQuery;
_FdmConexao: TdmConexao;
begin
  try
    _Query := TFDQuery.Create(nil);
    _Query.Connection := _FdmConexao.fdConexao;
    _Query.open('select UF from empresa');
    Result := _query.fieldbyname('UF').asstring;
  finally
    _Query.free;
  end;
end;

function GetEmpresaEmail: string;
var
_Query: TFDQuery;
_FdmConexao: TdmConexao;
begin
  try
    _Query := TFDQuery.Create(nil);
    _Query.Connection := _FdmConexao.fdConexao;
    _Query.open('select EMAIL from empresa');
    Result := _query.fieldbyname('EMAIL').AsString;
  finally
    _Query.free;
  end;
end;

function QueryValueStr(aSQL: string; aDefaultValue: string = ''): string;
var
  query: TFDQuery;
  _FdmConexao: TdmConexao;
  I: Integer;
begin
  _FdmConexao := TdmConexao.Create(nil);
  _FdmConexao.ConectarBanco;
  query := TFDQuery.Create(nil);
  try
    if aSQL.IsEmpty then
    begin
     // ShowWarning(MSG_CANT_EMPTY);
      Abort;
    end;
    query.Connection := _FdmConexao.fdConexao;
    query.SQL.Text := aSQL;
    try
      query.Open;
      if not (query.IsEmpty) then
      begin
        query.First;
        if query.RecordCount > 1 then
        begin
          while not (query.Eof) do
          begin
            Result := Result + IfThen(Result.IsEmpty, query.Fields[0].AsString, ', ' + query.Fields[0].AsString);
            query.Next;
          end;
        end
        else
          Result := query.Fields[0].AsString;
      end else Result := aDefaultValue;
    except
      on E: exception do
      begin
        Result := aDefaultValue;
        //   RegistraAuditoriaErros(MODULO_UTILITARIO_BANCO_DADOS,
        //                  'Erro: '+E.Message+#13#10+
        //                 'SQL usado: '+aSQL,
        //   IdUsuarioLogado);
      end;
    end;
  finally
    _FdmConexao.Free;
    query.Free;
  end;
end;

procedure CriaDiretorioTemporario;
var
  diretorioTemporario: String;
begin
  diretorioTemporario := ExtractFilePath(Application.ExeName) + '\Temp';
  if not DirectoryExists(diretorioTemporario) then
    MkDir(diretorioTemporario);

end;

function GetConfigValue(aConfigCode: string): string;
begin
  Result := QueryValueStr(' select first 1 VALOR from CONFIGURACOES where CODIGO = ' + QuotedStr(aConfigCode));
end;

function GetConfigValueInt(aConfigCode: string): Integer;
begin
  try
    Result := QueryValueInt(' select first 1 VALOR from CONFIGURACOES where CODIGO = ' + QuotedStr(aConfigCode),0);
  except
  //  ShowError('O parametro informado para a função ''GetConfigValueInt'', é inválido!');
  end;
end;

function QueryValueInt(aSQL: string; aDefaultValue: integer = -1): integer;
var
  query: TFDQuery;
  _FdmConexao: TdmConexao;
begin
  _FdmConexao.fdConexao.Open;
  query := TFDQuery.Create(nil);
  try
    query.Connection := _FdmConexao.fdConexao;
    query.SQL.Text := aSQL;
    try
      query.Open;
      if not (query.IsEmpty) then
      begin
        try
          Result := query.Fields[0].AsInteger;
        except
          Result := aDefaultValue;
        end;
      end
      else Result := aDefaultValue;
    except
      on E: exception do
      begin
        Result := aDefaultValue;
   //     RegistraAuditoriaErros(MODULO_UTILITARIO_BANCO_DADOS,
   //                   'Erro: '+E.Message+#13#10+
   //                   'SQL usado: '+aSQL,
   //     IdUsuarioLogado);
      end;
    end;
  finally
    _FdmConexao.fdConexao.Close;
    query.Free;
  end;


end;

function LoadLogoBase64: String;
  begin
    QueryValueStr('select '
                  + 'img.imagem '
                  + 'from '
                  + 'repositorio_imagens img '
                  + 'join '
                  + 'repositorio_item item on item.imagem_id = img.id '
                  + 'where item.referencia = ' + quotedStr('LOGOIMPRESSAO') );
  end;

function MascaraCPF(vCPF: string): string;
begin
  if vCPF.IsEmpty then
    vCPF := '00000000000';
  Result := FormatMaskText('999.999.999-99;0',vCPF);
end;

function MascaraCNPJ(vCNPJ: string): string;
begin
  if vCNPJ.IsEmpty then
    vCNPJ := '00000000000000';
  Result := FormatMaskText('99.999.999/9999-99;0',vCNPJ);
end;

function ListaUltimos3IDsPedidos(aClienteID: Integer): TStringlist;
var
  _Query: TFDQuery;
  _FdmConexao: TdmConexao;
  list: TStringList;
begin
  try
    list := TStringList.Create;;
    _Query := TFDQuery.Create(nil);
    _FdmConexao := TdmConexao.Create(nil);

    if _FdmConexao.ConectarBanco then
      begin
        _Query.Connection := _FdmConexao.fdConexao;
        _Query.SQL.Text := (SQL_CONSULTA_ULTIMOS_3_PEDIDOS);
        _Query.ParamByName('cliente_ID').AsInteger := aClienteID;
        _Query.Open;
        _Query.First;

        while not _Query.Eof do
          begin
            list.Add(_Query.FieldByName('ID').AsString);
            _Query.Next;
          end;
      end;

    Result := list;
  finally
    _Query.free;
    _FdmConexao.Free
  end;
end;

end.
