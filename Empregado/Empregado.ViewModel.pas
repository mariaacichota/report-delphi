unit Empregado.ViewModel;

interface

uses
  SysUtils, Classes, FireDAC.Comp.Client, Empregado.Model, Data.DB,
  Vcl.Dialogs;

type
  TEmpregadoViewModel = class
  private
    FEmpregado: TEmpregado;
    FConn: TFDConnection;
    procedure LimparCampos;
  public
    constructor Create(mConn: TFDConnection);
    destructor Destroy; override;

    procedure BuscarPorId(mId: Integer);
    procedure Salvar;
    procedure Excluir(mId: Integer);

    property Empregado: TEmpregado read FEmpregado write FEmpregado;
  end;

implementation

{ TEmpregadoViewModel }

constructor TEmpregadoViewModel.Create(mConn: TFDConnection);
begin
  inherited Create;

  FConn := mConn;
  FEmpregado := TEmpregado.Create(0, 0, 0, '', '', 0, 0, 0);
end;

destructor TEmpregadoViewModel.Destroy;
begin
  FreeAndNil(FEmpregado);

  inherited;
end;

procedure TEmpregadoViewModel.BuscarPorId(mId: Integer);
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConn;
    mQuery.SQL.Text := 'SELECT * FROM empregados WHERE id_empregado = :mId';
    mQuery.ParamByName('mId').AsInteger := mId;
    mQuery.Open;

    if mQuery.IsEmpty then
      LimparCampos;

    if not mQuery.Eof then
    begin
      FEmpregado.IdEmpregado     := mQuery.FieldByName('id_empregado').AsInteger;
      FEmpregado.CodDepartamento := mQuery.FieldByName('cod_departamento').AsInteger;
      FEmpregado.CodEmpFuncao    := mQuery.FieldByName('cod_emp_funcao').AsInteger;
      FEmpregado.Nome            := mQuery.FieldByName('nm_empregado').AsString;
      FEmpregado.Funcao          := mQuery.FieldByName('nm_funcao').AsString;
      FEmpregado.DataAdmissao    := mQuery.FieldByName('data_admissao').AsDateTime;
      FEmpregado.Salario         := mQuery.FieldByName('salario').AsCurrency;
      FEmpregado.Comissao        := mQuery.FieldByName('comissao').AsCurrency;
    end;
  finally
    FreeAndNil(mQuery);
  end;
end;

procedure TEmpregadoViewModel.Salvar;
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConn;
    FConn.StartTransaction;
    try
      if FEmpregado.IdEmpregado = 0 then
      begin
        mQuery.SQL.Text :=
          'INSERT INTO empregados (cod_departamento, cod_emp_funcao, nm_empregado, nm_funcao, data_admissao, salario, comissao) ' +
          'VALUES (:mCodDepartamento, :mCodFuncao, :mNome, :mFuncao, :mDataAdmissao, :mSalario, :mComissao) RETURNING id_empregado';
        mQuery.ParamByName('mCodDepartamento').AsInteger := FEmpregado.CodDepartamento;
        mQuery.ParamByName('mCodFuncao').AsInteger       := FEmpregado.CodEmpFuncao;
        mQuery.ParamByName('mNome').AsString             := FEmpregado.Nome;
        mQuery.ParamByName('mFuncao').AsString           := FEmpregado.Funcao;
        mQuery.ParamByName('mDataAdmissao').AsDate       := FEmpregado.DataAdmissao;
        mQuery.ParamByName('mSalario').AsCurrency        := FEmpregado.Salario;
        mQuery.ParamByName('mComissao').AsCurrency       := FEmpregado.Comissao;
        mQuery.Open;

        FEmpregado.IdEmpregado := mQuery.Fields[0].AsInteger;
      end
      else
      begin
        mQuery.SQL.Text :=
          'UPDATE empregados SET cod_departamento = :mCodDepartamento, cod_emp_funcao = :mCodFuncao, nm_empregado = :mNome, ' +
          'nm_funcao = :mFuncao, data_admissao = :mDataAdmissao, salario = :mSalario, comissao = :mComissao ' +
          'WHERE id_empregado = :mId';
        mQuery.ParamByName('mCodDepartamento').AsInteger := FEmpregado.CodDepartamento;
        mQuery.ParamByName('mCodFuncao').AsInteger       := FEmpregado.CodEmpFuncao;
        mQuery.ParamByName('mNome').AsString             := FEmpregado.Nome;
        mQuery.ParamByName('mFuncao').AsString           := FEmpregado.Funcao;
        mQuery.ParamByName('mDataAdmissao').AsDate       := FEmpregado.DataAdmissao;
        mQuery.ParamByName('mSalario').AsCurrency        := FEmpregado.Salario;
        mQuery.ParamByName('mComissao').AsCurrency       := FEmpregado.Comissao;
        mQuery.ParamByName('mId').AsInteger              := FEmpregado.IdEmpregado;
        mQuery.ExecSQL;
      end;

      FConn.Commit;
    except
      on E: Exception do
      begin
        FConn.Rollback;
        raise Exception.Create('Erro ao salvar empregado: ' + E.Message);
      end;
    end;
  finally
    FreeAndNil(mQuery);
  end;
end;

procedure TEmpregadoViewModel.Excluir(mId: Integer);
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConn;
    FConn.StartTransaction;
    try
      mQuery.SQL.Text := 'DELETE FROM Empregados WHERE id_empregado = :mId';
      mQuery.ParamByName('mId').AsInteger := mId;
      mQuery.ExecSQL;

      FConn.Commit;

      ShowMessage('Empregado com ID ' + IntToStr(mId) + ' foi excluído.');
    except
      on E: Exception do
      begin
        FConn.Rollback;
        raise Exception.Create('Erro ao excluir empregado: ' + E.Message);
      end;
    end;
  finally
    FreeAndNil(mQuery);
  end;
end;

procedure TEmpregadoViewModel.LimparCampos;
begin
  FEmpregado.IdEmpregado     := 0;
  FEmpregado.CodDepartamento := 0;
  FEmpregado.CodEmpFuncao    := 0;
  FEmpregado.Nome            := EmptyStr;
  FEmpregado.Funcao          := EmptyStr;
  FEmpregado.DataAdmissao    := Now;
  FEmpregado.Salario         := 0.0;
  FEmpregado.Comissao        := 0.0;
end;

end.
