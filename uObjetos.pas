unit uObjetos;

interface

uses
  Vcl.Dialogs;

type
  TBomba = class
  protected
    FID_Bomba: integer;
    FDescricao: string;
  private
    { Private declarations }
  public
    { Public declarations }
    property ID_Bomba: integer read FID_Bomba write FID_Bomba;
    property Descricao: string read FDescricao write FDescricao;
    function fcGravar(vBomba: TBomba): Boolean;
  end;

type
  TTanque = class
  protected
    FID_Tanque: integer;
    F_Combustivel: string;
    F_Valor: Real;
  private
    { Private declarations }
  public
    { Public declarations }
    property ID_Tanque: integer      read FID_Tanque      write FID_Tanque;
    property Combustivel: string     read F_Combustivel   write F_Combustivel;
    property Valor: Real             read F_Valor         write F_Valor;
    function fcGravar(vTanque: TTanque): Boolean;
  end;

type
  TAbastecimento = class
  protected
    FID_Abastecimento: integer;
    FID_Bomba: integer;
    FID_Tanque: integer;
    FQt_Litros: Real;
    FVl_Abastecido: Real;
    FVl_TaxaImposto: Real;
    FDt_Abastecimento: TDate;
  private
    { Private declarations }
  public
    { Public declarations }
    property ID_Abastecimento: integer      read FID_Abastecimento      write FID_Abastecimento;
    property ID_Bomba: integer              read FID_Bomba              write FID_Bomba;
    property ID_Tanque: integer             read FID_Tanque             write FID_Tanque;
    property Qt_Litros: Real                read FQt_Litros             write FQt_Litros;
    property Vl_Abastecido: Real            read FVl_Abastecido         write FVl_Abastecido;
    property Vl_TaxaImposto: Real           read FVl_TaxaImposto        write FVl_TaxaImposto;
    property Dt_Abastecimento: TDate        read FDt_Abastecimento      write FDt_Abastecimento;
    function fcGravar(vAbastecimento: TAbastecimento): Integer;
  end;
implementation

uses uDataModule;

function TBomba.fcGravar(vBomba: TBomba): Boolean;
begin
   with Dm.qrGenerica, Dm.qrGenerica.SQL do
   begin
      Clear;
      Add('SELECT GEN_ID(BOMBA_ID,1) AS ID FROM RDB$DATABASE;');
      Open;
      vBomba.ID_Bomba := FieldByName('ID').AsInteger;

      Clear;
      Add('INSERT INTO BOMBA (ID_BOMBA, DESCRICAO)');
      Add('           VALUES(:ID_BOMBA, :DESCRICAO)');
      Params.ParamByName('ID_BOMBA').AsInteger := vBomba.ID_Bomba;
      Params.ParamByName('DESCRICAO').AsString := vBomba.Descricao;

      Try
         ExecSQL;
         Result := True;
         ShowMessage('Registro gravado com sucesso.');
      except
         Result := False;
         ShowMessage('Erro ao gravar registro.');
      End;
   end;
   Dm.qrBomba.Close;
   Dm.qrBomba.Open;
end;

function TAbastecimento.fcGravar(vAbastecimento: TAbastecimento): Integer;
begin
   with Dm.qrGenerica, Dm.qrGenerica.SQL do
   begin
      Clear;
      Add('SELECT GEN_ID(ABASTECIMENTO_ID,1) AS ID FROM RDB$DATABASE;');
      Open;
      vAbastecimento.ID_Abastecimento := FieldByName('ID').AsInteger;

      Clear;
      Add('INSERT INTO ABASTECIMENTO (ID_ABASTECIMENTO, ' +
          '                           ID_BOMBA, ' +
          '                           ID_TANQUE, ' +
          '                           QT_LITROS, ' +
          '                           VL_ABASTECIDO, ' +
          '                           VL_TAXAIMPOSTO, ' +
          '                           DT_ABASTECIMENTO) ' +
          '                  VALUES (:ID_ABASTECIMENTO, ' +
          '                          :ID_BOMBA, ' +
          '                          :ID_TANQUE, ' +
          '                          :QT_LITROS, ' +
          '                          :VL_ABASTECIDO, ' +
          '                          :VL_TAXAIMPOSTO, ' +
          '                          :DT_ABASTECIMENTO)');
      Params.ParamByName('ID_ABASTECIMENTO').AsInteger := vAbastecimento.ID_Abastecimento;
      Params.ParamByName('ID_BOMBA').AsInteger         := vAbastecimento.ID_Bomba;
      Params.ParamByName('ID_TANQUE').AsInteger        := vAbastecimento.ID_Tanque;
      Params.ParamByName('QT_LITROS').AsFloat          := vAbastecimento.Qt_Litros;
      Params.ParamByName('VL_ABASTECIDO').AsFloat      := vAbastecimento.Vl_Abastecido;
      Params.ParamByName('VL_TAXAIMPOSTO').AsFloat     := vAbastecimento.Vl_TaxaImposto;
      Params.ParamByName('DT_ABASTECIMENTO').AsDate    := vAbastecimento.Dt_Abastecimento;

      Try
         ExecSQL;
         Result := vAbastecimento.ID_Abastecimento;
         ShowMessage('Registro gravado com sucesso.');
      except
         Result := 0;
         ShowMessage('Erro ao gravar registro.');
      End;
   end;
end;

function TTanque.fcGravar(vTanque: TTanque): Boolean;
begin
   with Dm.qrGenerica, Dm.qrGenerica.SQL do
   begin
      Clear;
      Add('SELECT GEN_ID(TANQUE_ID,1) AS ID FROM RDB$DATABASE;');
      Open;
      vTanque.ID_Tanque := FieldByName('ID').AsInteger;

      Clear;
      Add('INSERT INTO TANQUE (ID_TANQUE, COMBUSTIVEL, VALOR)');
      Add('            VALUES (:ID_TANQUE, :COMBUSTIVEL, :VALOR)');
      Params.ParamByName('ID_TANQUE').AsInteger  := vTanque.ID_Tanque;
      Params.ParamByName('COMBUSTIVEL').AsString := vTanque.Combustivel;
      Params.ParamByName('VALOR').AsFloat        := vTanque.Valor;

      Try
         ExecSQL;
         Result := True;
         ShowMessage('Registro gravado com sucesso.');
      except
         Result := False;
         ShowMessage('Erro ao gravar registro.');
      End;
   end;
end;

end.
