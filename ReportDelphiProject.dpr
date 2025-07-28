program ReportDelphiProject;

uses
  Vcl.Forms,
  Principal.View in 'Principal\Principal.View.pas' {Form1},
  Empregado.Model in 'Empregado\Empregado.Model.pas',
  Empregado.ViewModel in 'Empregado\Empregado.ViewModel.pas',
  Departamento.Model in 'Departamento\Departamento.Model.pas',
  Departamento.ViewModel in 'Departamento\Departamento.ViewModel.pas',
  Conexao.Model in 'Conexão\Conexao.Model.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
