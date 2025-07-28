unit Departamento.ViewModel;

interface

uses
  Departamento.Model, FireDAC.Comp.Client, FireDAC.Stan.Param, System.SysUtils,
  Vcl.Dialogs;

type
  TDepartamentoViewModel = class
  private
    FDepartamento: TDepartamento;
    FConn: TFDConnection;
    procedure LimparCampos;
  public
    constructor Create(mConn: TFDConnection);
    destructor Destroy; override;

    property Departamento: TDepartamento read FDepartamento write FDepartamento;

    procedure BuscarPorId(mId: Integer);
    procedure Salvar;
    procedure Excluir(mId: Integer);
  end;

implementation

{ TDepartamentoViewModel }

constructor TDepartamentoViewModel.Create(mConn: TFDConnection);
begin
  inherited Create;

  FConn := mConn;
  FDepartamento := TDepartamento.Create(0, '', '');
end;

destructor TDepartamentoViewModel.Destroy;
begin
  FDepartamento.Free;
  inherited;
end;

procedure TDepartamentoViewModel.BuscarPorId(mId: Integer);
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConn;
    mQuery.SQL.Text := 'SELECT * FROM departamentos WHERE id_departamento = :mId';
    mQuery.ParamByName('mId').AsInteger := mId;
    mQuery.Open;

    if mQuery.IsEmpty then
      LimparCampos;

    if not mQuery.Eof then
    begin
      FDepartamento.IdDepartamento := mQuery.FieldByName('id_departamento').AsInteger;
      FDepartamento.Nome           := mQuery.FieldByName('nm_departamento').AsString;
      FDepartamento.Local          := mQuery.FieldByName('local').AsString;
    end;
  finally
    mQuery.Free;
  end;
end;

procedure TDepartamentoViewModel.Salvar;
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConn;
    FConn.StartTransaction;
    try
      if FDepartamento.IdDepartamento = 0 then
      begin
        mQuery.SQL.Text :=
          'INSERT INTO departamentos (nm_departamento, local) VALUES (:mNome, :mLocal) RETURNING id_departamento';
        mQuery.ParamByName('mNome').AsString  := FDepartamento.Nome;
        mQuery.ParamByName('mLocal').AsString := FDepartamento.Local;
        mQuery.Open;
        FDepartamento.IdDepartamento := mQuery.Fields[0].AsInteger;
      end
      else
      begin
        mQuery.SQL.Text :=
          'UPDATE departamentos SET nm_departamento = :mNome, local = :mLocal WHERE id_departamento = :mId';
        mQuery.ParamByName('mNome').AsString  := FDepartamento.Nome;
        mQuery.ParamByName('mLocal').AsString := FDepartamento.Local;
        mQuery.ParamByName('mId').AsInteger   := FDepartamento.IdDepartamento;
        mQuery.ExecSQL;
      end;

      FConn.Commit;
    except
      on E: Exception do
      begin
        FConn.Rollback;
        raise Exception.Create('Erro ao salvar departamento: ' + E.Message);
      end;
    end;
  finally
    mQuery.Free;
  end;
end;

procedure TDepartamentoViewModel.Excluir(mId: Integer);
begin
  var mQuery := TFDQuery.Create(nil);
  try
    mQuery.Connection := FConn;
    FConn.StartTransaction;
    try
      mQuery.SQL.Text := 'DELETE FROM departamentos WHERE id_departamento = :mId';
      mQuery.ParamByName('mId').AsInteger := mId;
      mQuery.ExecSQL;
      FConn.Commit;
      ShowMessage('Departamento com ID ' + mId.ToString + ' foi excluído.');
    except
      on E: Exception do
      begin
        FConn.Rollback;
        raise Exception.Create('Erro ao excluir departamento: ' + E.Message);
      end;
    end;
  finally
    mQuery.Free;
  end;
end;

procedure TDepartamentoViewModel.LimparCampos;
begin
  FDepartamento.IdDepartamento := 0;
  FDepartamento.Nome           := EmptyStr;
  FDepartamento.Local          := EmptyStr;
end;

end.

