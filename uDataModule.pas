unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TDm = class(TDataModule)
    FDBanco: TFDConnection;
    qrGenerica: TFDQuery;
    qrBomba: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    DSBomba: TDataSource;
    qrTanque: TFDQuery;
    DSTanque: TDataSource;
    DSAtendimento: TDataSource;
    qrAbastecimento: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    qrRelatorio: TFDQuery;
    DSRelatorio: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
