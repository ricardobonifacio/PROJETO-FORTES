unit urpRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport;

type
  TrpRelatorio = class(TForm)
    Relat: TRLReport;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLBand6: TRLBand;
    RLDBText6: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLDBResult1: TRLDBResult;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  rpRelatorio: TrpRelatorio;

implementation

uses uDataModule;

{$R *.dfm}

end.
