object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 663
  ClientWidth = 1126
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 26
    Top = 293
    Width = 24
    Height = 13
    Caption = 'Valor'
  end
  object gridDados: TDBGrid
    Left = 0
    Top = 0
    Width = 1126
    Height = 209
    Align = alTop
    DataSource = dsDados
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btCampo: TButton
    Left = 224
    Top = 254
    Width = 75
    Height = 25
    Caption = 'Campo'
    TabOrder = 1
    OnClick = btCampoClick
  end
  object cbbCampos: TComboBox
    Left = 26
    Top = 256
    Width = 183
    Height = 21
    TabOrder = 2
  end
  object edtValor: TEdit
    Left = 26
    Top = 312
    Width = 183
    Height = 21
    TabOrder = 3
  end
  object btBuscar: TButton
    Left = 224
    Top = 310
    Width = 75
    Height = 25
    Caption = 'Buscar'
    TabOrder = 4
    OnClick = btBuscarClick
  end
  object BtFiltrar: TButton
    Left = 311
    Top = 310
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 5
    OnClick = BtFiltrarClick
  end
  object BtLocalizar: TButton
    Left = 392
    Top = 310
    Width = 75
    Height = 25
    Caption = 'Localizar'
    TabOrder = 6
    OnClick = BtLocalizarClick
  end
  object mmSql: TMemo
    Left = 536
    Top = 232
    Width = 497
    Height = 281
    Lines.Strings = (
      'select * from Funcionarios')
    TabOrder = 7
    OnChange = mmSqlChange
  end
  object mmBuscar: TMemo
    Left = 536
    Top = 519
    Width = 497
    Height = 281
    TabOrder = 8
  end
  object cbbTipo: TComboBox
    Left = 26
    Top = 376
    Width = 183
    Height = 21
    TabOrder = 9
  end
  object Button1: TButton
    Left = 328
    Top = 254
    Width = 139
    Height = 25
    Caption = 'Trazer todos registros'
    TabOrder = 10
    OnClick = Button1Click
  end
  object qrDados: TADOQuery
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=@m0r @g@pe;Persist Security Info=Tr' +
      'ue;User ID=koinonia;Initial Catalog=unifandatabase;Data Source=s' +
      'erver_teste'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Funcionarios')
    Left = 448
    Top = 392
  end
  object dsDados: TDataSource
    DataSet = qrDados
    Left = 392
    Top = 392
  end
  object tbDados: TADOTable
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=@m0r @g@pe;Persist Security Info=Tr' +
      'ue;User ID=koinonia;Initial Catalog=unifandatabase;Data Source=s' +
      'erver_teste'
    CursorType = ctStatic
    TableName = 'Funcionarios'
    Left = 328
    Top = 392
  end
end
