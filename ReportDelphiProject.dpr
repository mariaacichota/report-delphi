program ReportDelphiProject;

uses
  Vcl.Forms,
  Principal.View in 'Principal\Principal.View.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
