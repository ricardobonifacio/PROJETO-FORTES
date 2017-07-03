object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'frmPrincipal'
  ClientHeight = 234
  ClientWidth = 459
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Pagina: TPageControl
    Left = 0
    Top = 0
    Width = 459
    Height = 193
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Abastecimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      object pnAbastec: TPanel
        Left = 0
        Top = 1
        Width = 397
        Height = 126
        Alignment = taLeftJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 12
          Width = 16
          Height = 13
          Caption = 'ID:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 108
          Top = 13
          Width = 30
          Height = 13
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edIDAbastec: TPanel
          Left = 29
          Top = 8
          Width = 49
          Height = 21
          Alignment = taLeftJustify
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
        object edData: TMaskEdit
          Left = 144
          Top = 8
          Width = 90
          Height = 21
          EditMask = '##/##/####;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Text = '  /  /    '
        end
        object GroupBox1: TGroupBox
          Left = 8
          Top = 32
          Width = 228
          Height = 89
          Caption = 'Bomba'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object Label3: TLabel
            Left = 7
            Top = 43
            Width = 70
            Height = 13
            Caption = 'Combustivel'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 158
            Top = 43
            Width = 29
            Height = 13
            Caption = 'Valor'
          end
          object cbBomba: TComboBox
            Left = 8
            Top = 16
            Width = 145
            Height = 21
            TabOrder = 0
            OnEnter = cbBombaEnter
          end
          object cbCombustivel: TComboBox
            Left = 8
            Top = 59
            Width = 145
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = cbCombustivelClick
            OnEnter = cbCombustivelEnter
          end
          object edValor: TEdit
            Left = 156
            Top = 59
            Width = 65
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            Text = '0,00'
          end
        end
        object GroupBox2: TGroupBox
          Left = 240
          Top = 32
          Width = 151
          Height = 89
          Caption = 'Totaliza'#231#227'o'
          TabOrder = 3
          object Label10: TLabel
            Left = 8
            Top = 18
            Width = 61
            Height = 13
            Caption = 'Qtd. Litros:'
          end
          object Label11: TLabel
            Left = 8
            Top = 40
            Width = 64
            Height = 13
            Caption = 'Valor Total:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edQtLitros: TEdit
            Left = 76
            Top = 15
            Width = 65
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Text = '0,00'
            OnExit = edQtLitrosExit
          end
          object edValorTotal: TEdit
            Left = 76
            Top = 38
            Width = 65
            Height = 21
            Alignment = taRightJustify
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            Text = '0,00'
          end
          object btConfirma: TBitBtn
            Left = 4
            Top = 61
            Width = 68
            Height = 25
            Caption = 'Confirma'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = btConfirmaClick
          end
        end
      end
      object BtNovaVenda: TBitBtn
        Left = 314
        Top = 94
        Width = 73
        Height = 25
        Caption = 'Nova Venda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = BtNovaVendaClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Bomba'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 1
      ParentFont = False
      OnShow = TabSheet2Show
      object Label5: TLabel
        Left = 16
        Top = 20
        Width = 16
        Height = 13
        Caption = 'ID:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 96
        Top = 21
        Width = 58
        Height = 13
        Caption = 'Descri'#231#227'o:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edIDBomba: TPanel
        Left = 37
        Top = 16
        Width = 50
        Height = 21
        Alignment = taLeftJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
      end
      object edDescBomba: TEdit
        Left = 158
        Top = 17
        Width = 100
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 20
        ParentFont = False
        TabOrder = 1
      end
      object DBGrid1: TDBGrid
        Left = 8
        Top = 42
        Width = 308
        Height = 111
        DataSource = Dm.DSBomba
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_BOMBA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'ID Bomba'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Descri'#231#227'o'
            Width = 165
            Visible = True
          end>
      end
      object BitBtn1: TBitBtn
        Left = 264
        Top = 15
        Width = 52
        Height = 25
        Caption = 'Incluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BitBtn1Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Tamque'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ImageIndex = 2
      ParentFont = False
      OnShow = TabSheet3Show
      object Label8: TLabel
        Left = 8
        Top = 21
        Width = 73
        Height = 13
        Caption = 'Combustivel:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 194
        Top = 21
        Width = 32
        Height = 13
        Caption = 'Valor:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edTanqCombustivel: TEdit
        Left = 85
        Top = 17
        Width = 100
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        MaxLength = 20
        ParentFont = False
        TabOrder = 0
      end
      object BitBtn2: TBitBtn
        Left = 297
        Top = 15
        Width = 52
        Height = 25
        Caption = 'Incluir'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = BitBtn2Click
      end
      object DBGrid2: TDBGrid
        Left = 8
        Top = 42
        Width = 341
        Height = 87
        DataSource = Dm.DSTanque
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        Columns = <
          item
            Expanded = False
            FieldName = 'ID_TANQUE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMBUSTIVEL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Combust'#237'vel'
            Width = 143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VALOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            Title.Caption = 'Valor'
            Width = 76
            Visible = True
          end>
      end
      object edValorCombustivel: TEdit
        Left = 229
        Top = 17
        Width = 65
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Text = '0,00'
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Relat'#243'rio'
      ImageIndex = 3
      object GroupBox3: TGroupBox
        Left = 6
        Top = 5
        Width = 207
        Height = 103
        Caption = 'Periodo'
        TabOrder = 0
        object Label12: TLabel
          Left = 8
          Top = 17
          Width = 30
          Height = 13
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 57
          Width = 30
          Height = 13
          Caption = 'Data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edData1: TMaskEdit
          Left = 7
          Top = 33
          Width = 90
          Height = 21
          EditMask = '##/##/####;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 0
          Text = '  /  /    '
          OnEnter = edData1Enter
        end
        object edData2: TMaskEdit
          Left = 7
          Top = 73
          Width = 90
          Height = 21
          EditMask = '##/##/####;1; '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 1
          Text = '  /  /    '
          OnEnter = edData2Enter
        end
        object BitBtn3: TBitBtn
          Left = 100
          Top = 70
          Width = 101
          Height = 25
          Caption = 'Gerar Relat'#243'rio'
          TabOrder = 2
          OnClick = BitBtn3Click
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 193
    Width = 459
    Height = 41
    Align = alBottom
    TabOrder = 1
  end
end
