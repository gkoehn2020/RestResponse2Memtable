object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 399
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    789
    399)
  PixelsPerInch = 96
  TextHeight = 13
  object btnCreateComponents: TButton
    Left = 135
    Top = 33
    Width = 185
    Height = 25
    Caption = '1) Create Restfull Components'
    TabOrder = 0
    OnClick = btnCreateComponentsClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 773
    Height = 327
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
    Left = 326
    Top = 33
    Width = 185
    Height = 25
    Caption = '2) Make Rest Request Call'
    TabOrder = 2
    OnClick = btnMakeRestRequestClick
  end
  object LabeledEdit1: TLabeledEdit
    Left = 8
    Top = 33
    Width = 121
    Height = 21
    EditLabel.Width = 58
    EditLabel.Height = 13
    EditLabel.Caption = 'Search Text'
    TabOrder = 3
    Text = 'Trek'
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable2
    Left = 272
    Top = 256
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 144
    Top = 224
  end
  object FDMemTable2: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 280
    Top = 192
    object FDMemTable2ShowName: TStringField
      FieldName = 'ShowName'
      Size = 15
    end
    object FDMemTable2ShowStatus: TStringField
      FieldName = 'ShowStatus'
      Size = 15
    end
    object FDMemTable2ShowPremiered: TStringField
      FieldName = 'ShowPremiered'
      Size = 15
    end
    object FDMemTable2NewStatus: TStringField
      FieldName = 'NewStatus'
      Size = 15
    end
  end
end
