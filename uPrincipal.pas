unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Mask, Vcl.Grids, Vcl.DBGrids, uObjetos, Vcl.Buttons, Data.DB;

type
  TfrmPrincipal = class(TForm)
    Pagina: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label5: TLabel;
    edIDBomba: TPanel;
    Label6: TLabel;
    edDescBomba: TEdit;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    Label8: TLabel;
    edTanqCombustivel: TEdit;
    BitBtn2: TBitBtn;
    DBGrid2: TDBGrid;
    Label9: TLabel;
    edValorCombustivel: TEdit;
    TabSheet4: TTabSheet;
    GroupBox3: TGroupBox;
    Label12: TLabel;
    edData1: TMaskEdit;
    Label13: TLabel;
    edData2: TMaskEdit;
    BitBtn3: TBitBtn;
    BtNovaVenda: TBitBtn;
    pnAbastec: TPanel;
    Label1: TLabel;
    edIDAbastec: TPanel;
    Label2: TLabel;
    edData: TMaskEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    cbBomba: TComboBox;
    cbCombustivel: TComboBox;
    edValor: TEdit;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    edQtLitros: TEdit;
    edValorTotal: TEdit;
    btConfirma: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure cbBombaEnter(Sender: TObject);
    procedure btConfirmaClick(Sender: TObject);
    procedure cbCombustivelEnter(Sender: TObject);
    procedure cbCombustivelClick(Sender: TObject);
    procedure BtNovaVendaClick(Sender: TObject);
    procedure edQtLitrosExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edData1Enter(Sender: TObject);
    procedure edData2Enter(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function fcValidaData: Boolean;
    function fcRetornaIDBomba(vDescBomba: string): Integer;
    function fcRetornaIDTanque(vCombustivel: string): TTanque;
    function fcComboBomba: Boolean;
    function fcComboCombustivel: Boolean;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses uDataModule, urpRelatorio;

{$R *.dfm}

procedure TfrmPrincipal.BitBtn1Click(Sender: TObject);
var
   vBomba: TBomba;
begin
   if edDescBomba.Text <> '' then
   begin
      if fcRetornaIDBomba(edDescBomba.Text) > 0 then
      begin
         ShowMessage('Bomba ja cadastrada.');
         Exit;
      end;

      vBomba := TBomba.Create;
      vBomba.Descricao := edDescBomba.Text;
      if vBomba.fcGravar(vBomba) = True then
      begin
         edDescBomba.Text := '';
         edDescBomba.SetFocus;
      end;
   end;
end;

procedure TfrmPrincipal.BitBtn2Click(Sender: TObject);
var
   vTanque: TTanque;
begin
   vTanque := TTanque.Create;
   vTanque := fcRetornaIDTanque(edTanqCombustivel.Text);
   if vTanque.ID_Tanque > 0 then
   begin
      ShowMessage('Combustivel ja cadastrado.');
      Exit;
   end;

   if (edTanqCombustivel.Text <> '') and (edValorCombustivel.Text <> '') then
   begin
      vTanque.Combustivel := edTanqCombustivel.Text;
      vTanque.Valor := StrToFloat(edValorCombustivel.Text);
      if vTanque.fcGravar(vTanque) = True then
      begin
         edTanqCombustivel.Text := '';
         edValorCombustivel.Text := '';
         edTanqCombustivel.SetFocus;
         Dm.qrTanque.Close;
         Dm.qrTanque.Open;
      end;
   end;
end;

procedure TfrmPrincipal.BitBtn3Click(Sender: TObject);
begin
  if (edData1.Text <> '  /  /    ') and (edData2.Text <> '  /  /    ') then
  begin
     with Dm.qrRelatorio, Dm.qrRelatorio.SQL do
     begin
        Clear;
        Add('SELECT A.DT_ABASTECIMENTO, ' +
            '       T.COMBUSTIVEL, ' +
            '       B.DESCRICAO, ' +
            '       SUM(A.VL_ABASTECIDO) AS TOTAL ' +
            '  FROM ABASTECIMENTO A ' +
            ' INNER JOIN BOMBA B ON A.ID_BOMBA = B.ID_BOMBA ' +
            ' INNER JOIN TANQUE T ON A.ID_TANQUE = T.ID_TANQUE ' +
            ' WHERE A.DT_ABASTECIMENTO BETWEEN :DATA1 AND :DATA2 ' +
            ' GROUP BY A.DT_ABASTECIMENTO, T.COMBUSTIVEL, B.DESCRICAO');
        Params.ParamByName('DATA1').AsDate := StrToDate(edData1.Text);
        Params.ParamByName('DATA2').AsDate := StrToDate(edData2.Text);

        try
            Open;
            Application.CreateForm(TrpRelatorio, rpRelatorio);
            rpRelatorio.Relat.Preview;
        except
            ShowMessage('Não foi possivel exibir relatório. Verifique as datas.');
        end;
     end;
  end;
end;

procedure TfrmPrincipal.btConfirmaClick(Sender: TObject);
var
   vAbastecimento: TAbastecimento;
   vTanque: TTanque;
begin
   vTanque := TTanque.Create;
   vAbastecimento := TAbastecimento.Create;
   fcValidaData;

   if cbBomba.Text <> '' then
      vAbastecimento.ID_Bomba := fcRetornaIDBomba(cbBomba.Text)
   else
   begin
      ShowMessage('Escolha a bomba.');
      cbBomba.SetFocus;
      Exit;
   end;

   if cbCombustivel.Text <> '' then
   begin
      vTanque := fcRetornaIDTanque(cbCombustivel.Text);
      vAbastecimento.ID_Tanque := vTanque.ID_Tanque;
      edValor.Text := FormatFloat('0.00', vTanque.Valor);
   end
   else
   begin
      ShowMessage('Escolha o combustivel.');
      cbCombustivel.SetFocus;
      Exit;
   end;

   if StrToFloat(edQtLitros.Text) > 0 then
      edValorTotal.Text := FormatFloat('0.00', StrToFloat(edQtLitros.Text) * StrToFloat(edValor.Text))
   else
   begin
      ShowMessage('Digite a quantidade de litros.');
      edQtLitros.SetFocus;
      Exit;
   end;

   vAbastecimento.Qt_Litros := StrToFloat(edQtLitros.Text);
   vAbastecimento.Vl_Abastecido := StrToFloat(edValorTotal.Text);
   vAbastecimento.Vl_TaxaImposto := StrToFloat(edValorTotal.Text) * 13 / 100;
   vAbastecimento.Dt_Abastecimento := StrToDate(edData.Text);

   edIDAbastec.Caption := IntToStr(vAbastecimento.fcGravar(vAbastecimento));

   if edIDAbastec.Caption <> '0' then
   begin
      pnAbastec.Enabled := False;
      BtNovaVenda.SetFocus;
   end;
end;

procedure TfrmPrincipal.BtNovaVendaClick(Sender: TObject);
begin
   edData.Text        := FormatDateTime('dd/mm/yyyy', Date);
   cbBomba.Text       := '';
   cbCombustivel.Text := '';
   edValor.Text       := '0,00';
   edQtLitros.Text    := '0';
   edValorTotal.Text  := '';
   pnAbastec.Enabled  := True;
   edData.SetFocus;
end;

procedure TfrmPrincipal.cbBombaEnter(Sender: TObject);
begin
   fcComboBomba;
end;

procedure TfrmPrincipal.cbCombustivelClick(Sender: TObject);
var
   vTanque: TTanque;
begin
   vTanque := fcRetornaIDTanque(cbCombustivel.Text);
   edValor.Text := FormatFloat('0.00', vTanque.Valor);
end;

procedure TfrmPrincipal.cbCombustivelEnter(Sender: TObject);
begin
   fcComboCombustivel;
end;

procedure TfrmPrincipal.edData1Enter(Sender: TObject);
begin
   if edData1.Text = '  /  /    ' then
      edData1.Text := FormatDateTime('dd/mm/yyyy', Date);
end;

procedure TfrmPrincipal.edData2Enter(Sender: TObject);
begin
   if edData2.Text = '  /  /    ' then
      edData2.Text := FormatDateTime('dd/mm/yyyy', Date);
end;

procedure TfrmPrincipal.edQtLitrosExit(Sender: TObject);
begin
   if edQtLitros.Text = '' then
      edQtLitros.Text := '0';
   edQtLitros.Text := FormatFloat('0.00', StrToFloat(edQtLitros.Text));

   if (StrToFloat(edQtLitros.Text) > 0) and (edValor.Text <> '') then
      edValorTotal.Text := FormatFloat('0.00', StrToFloat(edQtLitros.Text) * StrToFloat(edValor.Text))
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   Dm.FDBanco.Connected := False;
   Dm.FDPhysFBDriverLink1.Release;
   Dm.FDPhysFBDriverLink1.VendorLib := 'C:\ProjetoFortes\fbclient.dll';
   Dm.FDBanco.Connected := True;
end;

procedure TfrmPrincipal.TabSheet2Show(Sender: TObject);
begin
   if Dm.qrBomba.Active = False then
      Dm.qrBomba.Open;
end;

procedure TfrmPrincipal.TabSheet3Show(Sender: TObject);
begin
   if Dm.qrTanque.Active = False then
      Dm.qrTanque.Open;
end;

function TfrmPrincipal.fcValidaData: Boolean;
begin
   if edData.Text = '  /  /    ' then
      edData.Text := FormatDateTime('dd/mm/yyyy', Date);

   Try
      edData.Text := FormatDateTime('dd/mm/yyyy', StrToDate(edData.Text));
   except
      edData.Text := FormatDateTime('dd/mm/yyyy', Date);
   End;
end;

function TfrmPrincipal.fcRetornaIDBomba(vDescBomba: string): Integer;
begin
   with Dm.qrGenerica, Dm.qrGenerica.SQL do
   begin
      Clear;
      Add('SELECT ID_BOMBA FROM BOMBA');
      Add('WHERE DESCRICAO = :DESCRICAO');
      Params.ParamByName('DESCRICAO').AsString := vDescBomba;
      Open;
      Try
         result := FieldByName('ID_BOMBA').AsInteger;
      except
         ShowMessage('Bomba não encontrada');
         result := 0;
      End;
   end;
end;

function TfrmPrincipal.fcComboBomba: Boolean;
begin
   cbBomba.Items.Clear;
   if Dm.qrBomba.Active = False then
      Dm.qrBomba.Open;
   with Dm.qrBomba, Dm.qrBomba.SQL do
   begin
      First;
      while Not Eof do
      begin
         cbBomba.Items.Add(FieldByName('DESCRICAO').AsString);
         Next;
      end;
   end;
end;

function TfrmPrincipal.fcComboCombustivel: Boolean;
begin
   cbCombustivel.Items.Clear;
   if Dm.qrTanque.Active = False then
      Dm.qrTanque.Open;
   with Dm.qrTanque, Dm.qrTanque.SQL do
   begin
      First;
      while Not Eof do
      begin
         cbCombustivel.Items.Add(FieldByName('COMBUSTIVEL').AsString);
         Next;
      end;
   end;
end;

function TfrmPrincipal.fcRetornaIDTanque(vCombustivel: string): TTanque;
var
   vTanque: TTanque;
begin
   vTanque := TTanque.Create;
   with Dm.qrGenerica, Dm.qrGenerica.SQL do
   begin
      Clear;
      Add('SELECT ID_TANQUE, VALOR FROM TANQUE');
      Add('WHERE COMBUSTIVEL = :COMBUSTIVEL');
      Params.ParamByName('COMBUSTIVEL').AsString := vCombustivel;
      Try
         Open;
         vTanque.ID_Tanque   := FieldByName('ID_TANQUE').AsInteger;
         vTanque.Combustivel := vCombustivel;
         vTanque.Valor       := FieldByName('VALOR').AsFloat;
         Result := vTanque;
      except
         vTanque.ID_Tanque := 0;
         vTanque.Valor := 0;
         Result := vTanque;
         ShowMessage('Combustivel não encontrado');
      End;
   end;


end;

end.
