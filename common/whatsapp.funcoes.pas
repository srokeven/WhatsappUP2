unit whatsapp.funcoes;

interface

uses System.SysUtils, EncdDecd, System.Generics.Collections, System.Classes,
  System.NetEncoding, System.StrUtils, System.Hash, Vcl.Imaging.jpeg, Vcl.ExtCtrls,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  whatsapp.constantes;


function SalvarPDFEncoded(aBase64: string): string;
function SalvarImagemEncoded(aBase64: string): string;
function EncodeFileBase64(aFile: string): string;
function GerarCaminhoArquivo(aNome, aExt: string; aUsaCaractereAleatorio, aApagaSeExistir: boolean): string;
function RemoverAcentos(const ATexto: string): string;
function StringsIguais(const AString1, AString2: string): Boolean;
function StrZero(cNumero: Integer; cDigitos: Integer): string;

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

end.
