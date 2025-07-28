# report-delphi
Aplicação Delphi desenvolvida utilizando o padrão arquitetural MVVM (Model-View-ViewModel) para cadastro e manutenção de empregados e departamentos, persistindo os dados em um banco PostgreSQL.

A aplicação é dividida em camadas bem definidas: Model, ViewModel e View, e utiliza FireDAC para acesso ao banco, com transações, rollback automático, e componentes visuais com eventos conectados à lógica de negócio. O projeto também permite emissão de relatórios utilizando FastReport.

## Organização do Projeto

```bash
src/
├── Conexão/
|    └── Conexao.Model.pas            # Classe de conexão global via FireDAC e PostgreSQL
│
├── Departamento/
│   ├── Departamento.Model.pas       # Classe de domínio Departamento
│   └── Departamento.ViewModel.pas   # ViewModel com CRUD e transações
│
├── Empregado/
│   ├── Empregado.Model.pas          # Classe de domínio Empregado
│   └── Empregado.ViewModel.pas      # ViewModel com CRUD, rollback e transações
│
├── Principal/
│   └── Principal.View.pas           # Formulário principal contendo as telas de cadastro e botão para geração do relatório
│
├── Relatorios/
│   └── REL_EMPREGADOS.fr3           # Relatório FastReport de empregados por departamento
│
└── SQL/                             # Pasta para organizar os scripts SQL + BKP
```

## Dependências Utilizadas
* FireDAC: biblioteca nativa da Embarcadero para acesso a banco de dados
* PostgreSQL: banco de dados relacional
* FastReport: geração de relatórios a partir de datasets vinculados
* Delphi 12 Alexandria: desenvolvimento FMX com suporte MVVM

## Camadas e Responsabilidades
* `Model`: contém classes POCO com propriedades dos domínios Empregado e Departamento
* `ViewModel`: implementa lógica de negócio com uso de TFDQuery, controle de transações (StartTransaction, Commit, Rollback) e validações
* `View`: interface visual com FMX; botões Buscar, Salvar e Excluir integrados aos métodos da ViewModel
* `Conexao.Model`: função Connect centraliza configuração da conexão com PostgreSQL

## Design Patterns e Práticas
* `MVVM`: separação clara entre lógica (ViewModel) e visual (View)
* `Rollback transacional`: integridade garantida em operações de banco
* `Injeção de conexão`: desacoplamento entre FireDAC e as camadas
* `DTO-like Models`: transporte seguro de dados entre camadas

## Melhorias Futuras 
* Inclusão de testes unitários com DUnitX
* Criação de um componente de serviço REST para acesso externo
* Tela de login com controle de permissões por usuário

## Colaboradores  
<table>
  <tr>
    <td align="center"><a href="https://github.com/mariaacichota"><img src="https://avatars.githubusercontent.com/mariaacichota" width="80px;" alt="Maria Cichota"/><br /><sub><b>Maria Cichota</b></sub></a><br /><a href="#" title="Code">💻🛠️</a></td>
  </tr>
</table>
