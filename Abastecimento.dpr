program Abastecimento;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uObjetos in 'uObjetos.pas',
  uDataModule in 'uDataModule.pas' {Dm: TDataModule},
  urpRelatorio in 'urpRelatorio.pas' {rpRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
