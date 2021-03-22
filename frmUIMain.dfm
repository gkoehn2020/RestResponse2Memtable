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
  object DBGrid1: TDBGrid
    Left = 8
    Top = 64
    Width = 773
    Height = 327
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object btnMakeRestRequest: TButton
    Left = 150
    Top = 33
    Width = 185
    Height = 25
    Caption = 'Make Rest Request Call'
    TabOrder = 1
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
    TabOrder = 2
    Text = 'Trek'
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable2
    Left = 112
    Top = 232
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'score'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.id'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.url'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.name'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.type'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.language'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.genres'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.status'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.runtime'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.premiered'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.officialSite'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.schedule'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.schedule.time'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.schedule.days'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.rating'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.rating.average'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.weight'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.network'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.network.id'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.network.name'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.network.country'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.network.country.name'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.network.country.code'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.network.country.timezone'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.webChannel'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.dvdCountry'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.externals'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.externals.tvrage'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.externals.thetvdb'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.externals.imdb'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.image'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.image.medium'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.image.original'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.summary'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show.updated'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show._links'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show._links.self'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show._links.self.href'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show._links.previousepisode'
        DataType = ftWideString
        Size = 255
      end
      item
        Name = 'show._links.previousepisode.href'
        DataType = ftWideString
        Size = 255
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 272
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
    Left = 112
    Top = 184
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
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plani; q=0.9, text/html;q=0.8'
    AcceptCharset = 'UTF-8,*;q=0.8'
    BaseURL = 'http://api.tvmaze.com'
    Params = <>
    Left = 432
    Top = 152
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Resource = 'search'
    ResourceSuffix = 'shows?q=Trek'
    Response = RESTResponse
    Left = 432
    Top = 200
  end
  object RESTResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 432
    Top = 248
  end
  object RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter
    Active = True
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse
    NestedElements = True
    Left = 432
    Top = 296
  end
end
