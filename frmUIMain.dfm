object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 300
  ClientWidth = 919
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnDestroy = FormDestroy
  DesignSize = (
    919
    300)
  PixelsPerInch = 96
  TextHeight = 13
  object btnCreateComponents: TButton
    Left = 8
    Top = 143
    Width = 204
    Height = 25
    Caption = '1) Create Restfull Components'
    TabOrder = 0
    OnClick = btnCreateComponentsClick
  end
  object DBGrid1: TDBGrid
    Left = 218
    Top = 33
    Width = 693
    Height = 259
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnMakeRestRequest: TButton
    Left = 8
    Top = 174
    Width = 204
    Height = 25
    Caption = '2) Make Rest Request Call'
    TabOrder = 2
    OnClick = btnMakeRestRequestClick
  end
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 33
    Width = 204
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Search Text'
    TabOrder = 3
    Text = 'Trek'
  end
  object rdgCreateColumnOrder: TRadioGroup
    Left = 8
    Top = 64
    Width = 204
    Height = 73
    Caption = 'Options'
    ItemIndex = 0
    Items.Strings = (
      'Create Calculated Column first.'
      'Create Calculated Column in Event.')
    TabOrder = 4
  end
  object DataSource1: TDataSource
    Left = 824
    Top = 112
  end
  object FDMemTable1: TFDMemTable
    OnCalcFields = FDMemTable1CalcFields
    FieldDefs = <
      item
        Name = 'GKStatus'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    BeforeGetRecords = FDMemTable1BeforeGetRecords
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 824
    Top = 32
  end
end
