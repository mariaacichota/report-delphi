object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Tela Principal'
  ClientHeight = 565
  ClientWidth = 1145
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  TextHeight = 15
  object pgcGeral: TPageControl
    Left = 0
    Top = 0
    Width = 1145
    Height = 524
    ActivePage = tabEmpregados
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1143
    ExplicitHeight = 516
    object tabEmpregados: TTabSheet
      Caption = 'Empregados'
      object pnlGeral: TPanel
        Left = 0
        Top = 0
        Width = 1137
        Height = 494
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 1135
        ExplicitHeight = 486
        object lblEmpNomeDepartamento: TLabel
          Left = 183
          Top = 83
          Width = 136
          Height = 15
          Caption = 'Nome do Departamento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clDarkblue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 4
          Top = 163
          Width = 95
          Height = 15
          Caption = 'Data de Admiss'#227'o'
        end
        object edtIdEmpregado: TLabeledEdit
          Left = 4
          Top = 32
          Width = 93
          Height = 23
          EditLabel.Width = 74
          EditLabel.Height = 15
          EditLabel.Caption = 'Id Empregado'
          TabOrder = 0
          Text = ''
        end
        object edtNomeEmpregado: TLabeledEdit
          Left = 204
          Top = 32
          Width = 693
          Height = 23
          EditLabel.Width = 97
          EditLabel.Height = 15
          EditLabel.Caption = 'Nome Empregado'
          TabOrder = 1
          Text = ''
        end
        object edtEmpIdDepartamento: TLabeledEdit
          Left = 4
          Top = 80
          Width = 93
          Height = 23
          EditLabel.Width = 89
          EditLabel.Height = 15
          EditLabel.Caption = 'Id Departamento'
          TabOrder = 2
          Text = ''
          OnChange = edtEmpIdDepartamentoChange
        end
        object btnBuscarEmpregado: TButton
          Left = 103
          Top = 31
          Width = 74
          Height = 25
          Caption = 'Buscar'
          TabOrder = 3
          OnClick = btnBuscarEmpregadoClick
        end
        object btnEmpBuscarDepartamento: TButton
          Left = 103
          Top = 79
          Width = 74
          Height = 25
          Caption = 'Buscar'
          TabOrder = 4
          OnClick = btnEmpBuscarDepartamentoClick
        end
        object edtIdFuncao: TLabeledEdit
          Left = 4
          Top = 128
          Width = 93
          Height = 23
          EditLabel.Width = 52
          EditLabel.Height = 15
          EditLabel.Caption = 'Id Fun'#231#227'o'
          TabOrder = 5
          Text = ''
          OnChange = edtEmpIdDepartamentoChange
        end
        object edtNomeFuncao: TLabeledEdit
          Left = 103
          Top = 128
          Width = 794
          Height = 23
          EditLabel.Width = 75
          EditLabel.Height = 15
          EditLabel.Caption = 'Nome Fun'#231#227'o'
          TabOrder = 6
          Text = ''
        end
        object edtDataAdmissao: TDateTimePicker
          Left = 4
          Top = 184
          Width = 125
          Height = 23
          Date = 45866.000000000000000000
          Time = 0.122463611114653800
          TabOrder = 7
        end
        object edtSalario: TLabeledEdit
          Left = 135
          Top = 184
          Width = 93
          Height = 23
          EditLabel.Width = 35
          EditLabel.Height = 15
          EditLabel.Caption = 'Sal'#225'rio'
          TabOrder = 8
          Text = ''
          OnChange = edtEmpIdDepartamentoChange
        end
        object edtComissao: TLabeledEdit
          Left = 234
          Top = 184
          Width = 93
          Height = 23
          EditLabel.Width = 52
          EditLabel.Height = 15
          EditLabel.Caption = 'Comiss'#227'o'
          TabOrder = 9
          Text = ''
          OnChange = edtEmpIdDepartamentoChange
        end
      end
    end
    object tabDepartamentos: TTabSheet
      Caption = 'Departamentos'
      ImageIndex = 1
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1137
        Height = 494
        Align = alClient
        TabOrder = 0
        object edtIdDepartamento: TLabeledEdit
          Left = 4
          Top = 40
          Width = 93
          Height = 23
          EditLabel.Width = 89
          EditLabel.Height = 15
          EditLabel.Caption = 'Id Departamento'
          TabOrder = 0
          Text = ''
        end
        object btnBuscarDepartamento: TButton
          Left = 103
          Top = 39
          Width = 74
          Height = 25
          Caption = 'Buscar'
          TabOrder = 1
          OnClick = btnBuscarDepartamentoClick
        end
        object edtNomeDepartamento: TLabeledEdit
          Left = 4
          Top = 88
          Width = 693
          Height = 23
          EditLabel.Width = 112
          EditLabel.Height = 15
          EditLabel.Caption = 'Nome Departamento'
          TabOrder = 2
          Text = ''
        end
        object edtLocal: TLabeledEdit
          Left = 4
          Top = 136
          Width = 693
          Height = 23
          EditLabel.Width = 28
          EditLabel.Height = 15
          EditLabel.Caption = 'Local'
          TabOrder = 3
          Text = ''
        end
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 524
    Width = 1145
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 516
    ExplicitWidth = 1143
    object btnGerarRelatorioEmpregados: TButton
      Left = 8
      Top = 6
      Width = 323
      Height = 25
      Caption = 'Gerar Relat'#243'rio de Empregados x Departamentos'
      TabOrder = 0
      OnClick = btnGerarRelatorioEmpregadosClick
    end
    object btnExcluir: TButton
      Left = 506
      Top = 6
      Width = 157
      Height = 25
      Caption = 'Excluir'
      TabOrder = 1
      OnClick = btnExcluirClick
    end
    object btnSalvar: TButton
      Left = 340
      Top = 6
      Width = 157
      Height = 25
      Caption = 'Salvar'
      TabOrder = 2
      OnClick = btnSalvarClick
    end
  end
  object frxReport1: TfrxReport
    Version = '2025.2.4'
    DataSetName = 'Empregados'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45866.098681192130000000
    ReportOptions.LastChange = 45866.543206712970000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 912
    Top = 416
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'Empregados'
      end>
    Variables = <>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 41.574829770000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000000050000000000
          Width = 718.110696440000000000
          Height = 34.015769770000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Empregados')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 83.149660000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 0.000000050000000000
          Top = 0.000001590000000003
          Width = 226.771796440000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Width = 151.181196440000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Fun'#231#227'o')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 94.488246440000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Admiss'#227'o')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 94.488246440000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Sal'#225'rio')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Width = 151.181196440000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Departamento')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'Empregados'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Width = 226.771796440000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Empregados."nm_empregado"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 226.771800000000000000
          Width = 151.181196440000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Empregados."nm_funcao"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 94.488246440000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Empregados."data_admissao"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 94.488246440000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Empregados."salario"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Width = 151.181196440000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Empregados."nm_departamento"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622450000000000000
          Width = 94.488246440000000000
          Height = 18.897651670000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Page [Page#] of [TotalPages#]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'Empregados'
    CloseDataSource = False
    DataSet = qryEmpregados
    BCDToCurrency = False
    DataSetOptions = []
    Left = 912
    Top = 464
  end
  object qryEmpregados: TFDQuery
    SQL.Strings = (
      
        'SELECT e.nm_empregado, e.nm_funcao, d.nm_departamento, e.salario' +
        ', e.data_admissao'
      'FROM empregados e'
      'JOIN departamentos d ON e.cod_departamento = d.id_departamento'
      'ORDER BY e.salario DESC')
    Left = 912
    Top = 520
  end
end
