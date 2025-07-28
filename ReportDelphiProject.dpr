program ReportDelphiProject;

uses
  Vcl.Forms,
  Principal.View in 'Principal\Principal.View.pas' {frmPrincipal},
  Empregado.Model in 'Empregado\Empregado.Model.pas',
  Empregado.ViewModel in 'Empregado\Empregado.ViewModel.pas',
  Departamento.Model in 'Departamento\Departamento.Model.pas',
  Departamento.ViewModel in 'Departamento\Departamento.ViewModel.pas',
  Conexao.Model in 'Conexão\Conexao.Model.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
