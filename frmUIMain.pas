unit frmUIMain;

//Inspiration from Holger Flick at https://flixengineering.com/archives/229

interface

uses
  REST.Client
, REST.Response.Adapter
, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TForm1 = class(TForm)
    btnCreateComponents: TButton;
    DBGrid1: TDBGrid;
    btnMakeRestRequest: TButton;
    LabeledEdit1: TLabeledEdit;
    DataSource1: TDataSource;
    FDMemTable1: TFDMemTable;
    FDMemTable2: TFDMemTable;
    FDMemTable2ShowName: TStringField;
    FDMemTable2ShowStatus: TStringField;
    FDMemTable2ShowPremiered: TStringField;
    FDMemTable2NewStatus: TStringField;
    procedure btnCreateComponentsClick(Sender: TObject);
    procedure btnMakeRestRequestClick(Sender: TObject);
  private
    { Private declarations }
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
    FRESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    FCalcField: TStringField;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.StrUtils
  ;

procedure TForm1.btnCreateComponentsClick(Sender: TObject);
begin
  FRESTClient := TRESTClient.Create(Form1);
  FRESTClient.Accept := 'application/json, text/plani; q=0.9, text/html;q=0.8';
  FRESTClient.AcceptCharset := 'UTF-8,*;q=0.8';
  FRESTClient.BaseURL := 'http://api.tvmaze.com';

  FRESTRequest := TRESTRequest.Create(Form1);
  FRESTRequest.Client := FRESTClient;
  FRESTRequest.Params.AddUrlSegment('title', LabeledEdit1.Text);
  FRESTRequest.Resource := 'search';
  FRESTRequest.ResourceSuffix := 'shows?q={title}';

  FRESTResponse := TRESTResponse.Create(Form1);
  FRESTResponse.ContentType := 'application/json';
  FRESTRequest.Response := FRESTResponse;

  FRESTResponseDataSetAdapter := TRESTResponseDataSetAdapter.Create(Form1);
  FRESTResponseDataSetAdapter.Response := FRESTResponse;
  FRESTResponseDataSetAdapter.NestedElements := True;
  FRESTResponseDataSetAdapter.Dataset := FDMemTable1;

  btnCreateComponents.Enabled := false;
end;

procedure TForm1.btnMakeRestRequestClick(Sender: TObject);
begin
  FRESTRequest.Execute;

  // fill table that is connected to grid
  FDMemTable2.Open;
  FDMemTable2.EmptyDataSet;
  FDMemTable1.First;
  while not FDMemTable1.Eof do begin
    FDMemTable2.Insert;
    FDMemTable2ShowName.AsString := FDMemTable1.FieldByName('show.name').AsString;
    FDMemTable2ShowStatus.AsString := FDMemTable1.FieldByName('show.status').AsString;
    FDMemTable2ShowPremiered.AsString := FDMemTable1.FieldByName('show.premiered').AsString;
    FDMemTable2NewStatus.AsString := IfThen(FDMemTable1.FieldByName('show.status').AsString = 'Running', '!!!', '???');
    FDMemTable2.Post;

    FDMemTable1.Next;
  end;
end;

end.
