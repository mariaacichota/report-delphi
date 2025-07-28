unit Empregado.Model;

interface

uses
  SysUtils, Classes, FireDAC.Comp.Client;

type
  TEmpregado = class
  private
    FIdEmpregado: Integer;
    FCodDepartamento: Integer;
    FCodEmpFuncao: Integer;
    FNome: string;
    FFuncao: string;
    FDataAdmissao: TDate;
    FSalario: Currency;
    FComissao: Currency;
  public
    constructor Create(mIdEmpregado, mCodDepartamento, mCodEmpFuncao: Integer;
      mNome, mFuncao: string; mDataAdmissao: TDate; mSalario, mComissao: Currency);

    property IdEmpregado: Integer read FIdEmpregado write FIdEmpregado;
    property CodDepartamento: Integer read FCodDepartamento write FCodDepartamento;
    property CodEmpFuncao: Integer read FCodEmpFuncao write FCodEmpFuncao;
    property Nome: string read FNome write FNome;
    property Funcao: string read FFuncao write FFuncao;
    property DataAdmissao: TDate read FDataAdmissao write FDataAdmissao;
    property Salario: Currency read FSalario write FSalario;
    property Comissao: Currency read FComissao write FComissao;
  end;

implementation

{ TEmpregado }

constructor TEmpregado.Create(mIdEmpregado, mCodDepartamento, mCodEmpFuncao: Integer;
  mNome, mFuncao: string; mDataAdmissao: TDate; mSalario, mComissao: Currency);
begin
  FIdEmpregado     := mIdEmpregado;
  FCodDepartamento := mCodDepartamento;
  FCodEmpFuncao    := mCodEmpFuncao;
  FNome            := mNome;
  FFuncao          := mFuncao;
  FDataAdmissao    := mDataAdmissao;
  FSalario         := mSalario;
  FComissao        := mComissao;
end;

end.
