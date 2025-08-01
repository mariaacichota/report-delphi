unit Principal.View;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxSmartMemo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frCoreClasses, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask,
  Empregado.ViewModel, Departamento.ViewModel, Conexao.Model, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait;

type
  TfrmPrincipal = class(TForm)
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    qryEmpregados: TFDQuery;
    pgcGeral: TPageControl;
    pnlFooter: TPanel;
    btnGerarRelatorioEmpregados: TButton;
    tabEmpregados: TTabSheet;
    tabDepartamentos: TTabSheet;
    pnlGeral: TPanel;
    Panel1: TPanel;
    edtIdEmpregado: TLabeledEdit;
    edtNomeEmpregado: TLabeledEdit;
    edtEmpIdDepartamento: TLabeledEdit;
    btnBuscarEmpregado: TButton;
    btnEmpBuscarDepartamento: TButton;
    lblEmpNomeDepartamento: TLabel;
    edtIdFuncao: TLabeledEdit;
    edtNomeFuncao: TLabeledEdit;
    edtDataAdmissao: TDateTimePicker;
    edtSalario: TLabeledEdit;
    edtComissao: TLabeledEdit;
    Label1: TLabel;
    btnExcluir: TButton;
    btnSalvar: TButton;
    edtIdDepartamento: TLabeledEdit;
    btnBuscarDepartamento: TButton;
    edtNomeDepartamento: TLabeledEdit;
    edtLocal: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtEmpIdDepartamentoChange(Sender: TObject);
    procedure btnGerarRelatorioEmpregadosClick(Sender: TObject);
    procedure btnBuscarEmpregadoClick(Sender: TObject);
    procedure btnBuscarDepartamentoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnEmpBuscarDepartamentoClick(Sender: TObject);
  private
    FViewModelDepartamento: TDepartamentoViewModel;
    FViewModelEmpregado: TEmpregadoViewModel;
    var gConnection: TFDConnection;
    procedure BuscarDepartamento(mId: Integer);
    procedure LimparCamposForm;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnBuscarDepartamentoClick(Sender: TObject);
begin
  try
    BuscarDepartamento(StrToIntDef(edtIdDepartamento.Text, 0));

    if FViewModelDepartamento.Departamento.IdDepartamento = 0 then
      ShowMessage('Departamento n�o encontrado!');

    edtNomeDepartamento.Text  := FViewModelDepartamento.Departamento.Nome;
    edtLocal.Text             := FViewModelDepartamento.Departamento.Local;
  except
    on E: Exception do
      ShowMessage('Erro ao buscar departamento: ' + E.Message);
  end;
end;

procedure TfrmPrincipal.btnBuscarEmpregadoClick(Sender: TObject);
begin
  try
    FViewModelEmpregado.BuscarPorId(StrToIntDef(edtIdEmpregado.Text, 0));

    if FViewModelEmpregado.Empregado.IdEmpregado = 0 then
      ShowMessage('Empregado n�o encontrado!');

    edtNomeEmpregado.Text     := FViewModelEmpregado.Empregado.Nome;
    edtIdFuncao.Text          := FViewModelEmpregado.Empregado.CodEmpFuncao.ToString;
    edtNomeFuncao.Text        := FViewModelEmpregado.Empregado.Funcao;
    edtEmpIdDepartamento.Text := FViewModelEmpregado.Empregado.CodDepartamento.ToString;

    if (edtEmpIdDepartamento.Text <> EmptyStr) then
    begin
      BuscarDepartamento(StrToIntDef(edtEmpIdDepartamento.Text, 0));
      lblEmpNomeDepartamento.Caption := FViewModelDepartamento.Departamento.Nome.ToUpper;
    end;

    edtSalario.Text           := FormatFloat('0.00', FViewModelEmpregado.Empregado.Salario);
    edtComissao.Text          := FormatFloat('0.00', FViewModelEmpregado.Empregado.Comissao);
    edtDataAdmissao.Date      := FViewModelEmpregado.Empregado.DataAdmissao;

  except
    on E: Exception do
      ShowMessage('Erro ao buscar empregado: ' + E.Message);
  end;
end;

procedure TfrmPrincipal.btnEmpBuscarDepartamentoClick(Sender: TObject);
begin
  if (edtEmpIdDepartamento.Text <> EmptyStr) then
  begin
    BuscarDepartamento(StrToIntDef(edtEmpIdDepartamento.Text, 0));
    lblEmpNomeDepartamento.Caption := FViewModelDepartamento.Departamento.Nome.ToUpper;
  end;
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
  if pgcGeral.TabIndex = 0 then
  begin
    if MessageDlg('Deseja realmente excluir este empregado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        FViewModelEmpregado.Excluir(StrToIntDef(edtIdEmpregado.Text, 0));
        ShowMessage('Empregado exclu�do com sucesso!');
      except
        on E: Exception do
          ShowMessage('Erro ao excluir: ' + E.Message);
      end;
    end;
  end
  else
  begin
    if MessageDlg('Deseja realmente excluir este departamento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        FViewModelDepartamento.Excluir(StrToIntDef(edtIdDepartamento.Text, 0));
        ShowMessage('Departamento exclu�do com sucesso!');
      except
        on E: Exception do
          ShowMessage('Erro ao excluir: ' + E.Message);
      end;
    end;
  end;

  LimparCamposForm;
end;

procedure TfrmPrincipal.btnGerarRelatorioEmpregadosClick(Sender: TObject);
begin
  qryEmpregados.Close;
  qryEmpregados.Open;

  frxReport1.ShowReport;
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
begin
  if pgcGeral.TabIndex = 0 then
  begin
    try
      with FViewModelEmpregado.Empregado do
      begin
        IdEmpregado     := StrToIntDef(edtIdEmpregado.Text, 0);
        Nome            := edtNomeEmpregado.Text;
        Funcao          := edtNomeFuncao.Text;
        CodDepartamento := StrToIntDef(edtEmpIdDepartamento.Text, 0);
        CodEmpFuncao    := StrToIntDef(edtIdFuncao.Text, 0);
        DataAdmissao    := edtDataAdmissao.Date;
        Salario         := StrToCurr(edtSalario.Text);
        Comissao        := StrToCurr(edtComissao.Text);
      end;

      FViewModelEmpregado.Salvar;

      ShowMessage('Empregado salvo com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao salvar empregado: ' + E.Message);
    end;
  end
  else
  begin
    try
      with FViewModelDepartamento.Departamento do
      begin
        IdDepartamento := StrToIntDef(edtIdDepartamento.Text, 0);
        Nome           := edtNomeDepartamento.Text;
        Local          := edtLocal.Text;
      end;

      FViewModelDepartamento.Salvar;

      ShowMessage('Departamento salvo com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao salvar: ' + E.Message);
    end;
  end;

end;

procedure TfrmPrincipal.BuscarDepartamento(mId: Integer);
begin
  FViewModelDepartamento.BuscarPorId(mId);
end;

procedure TfrmPrincipal.edtEmpIdDepartamentoChange(Sender: TObject);
begin
  lblEmpNomeDepartamento.Caption := EmptyStr;
end;
 
procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  pgcGeral.TabIndex := 0;
  lblEmpNomeDepartamento.Caption := EmptyStr;

  gConnection := Conexao.Model.Connect;
  qryEmpregados.Connection := gConnection;
  FViewModelDepartamento   := TDepartamentoViewModel.Create(gConnection);
  FViewModelEmpregado      := TEmpregadoViewModel.Create(gConnection);
end;

procedure TfrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FViewModelDepartamento);
  FreeAndNil(FViewModelEmpregado);
end;

procedure TfrmPrincipal.LimparCamposForm;
begin
  if pgcGeral.TabIndex = 0 then
  begin
    edtIdEmpregado.Text       := EmptyStr;
    edtNomeEmpregado.Text     := EmptyStr;
    edtIdFuncao.Text          := EmptyStr;
    edtNomeFuncao.Text        := EmptyStr;
    edtEmpIdDepartamento.Text := EmptyStr;
    lblEmpNomeDepartamento.Caption := EmptyStr;
    edtSalario.Text           := EmptyStr;
    edtComissao.Text          := EmptyStr;
    edtDataAdmissao.Date      := Now;
  end
  else
  begin
    edtIdDepartamento.Text    := EmptyStr;
    edtNomeDepartamento.Text  := EmptyStr;
    edtLocal.Text             := EmptyStr;
  end;
end;

end.
