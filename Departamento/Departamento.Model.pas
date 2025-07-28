unit Departamento.Model;

interface

uses
  SysUtils, Classes;

type
  TDepartamento = class
  private
    FIdDepartamento: Integer;
    FNome: string;
    FLocal: string;
  public
    constructor Create(mIdDepartamento: Integer; mNome, mLocal: string);

    property IdDepartamento: Integer read FIdDepartamento write FIdDepartamento;
    property Nome: string read FNome write FNome;
    property Local: string read FLocal write FLocal;
  end;

implementation

{ TDepartamento }

constructor TDepartamento.Create(mIdDepartamento: Integer; mNome, mLocal: string);
begin
  FIdDepartamento := mIdDepartamento;
  FNome           := mNome;
  FLocal          := mLocal;
end;

end.
