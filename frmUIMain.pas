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
    procedure btnCreateComponentsClick(Sender: TObject);
    procedure btnMakeRestRequestClick(Sender: TObject);
    procedure FDMemTable1BeforeGetRecords(DataSet: TFDDataSet);
    procedure FDMemTable1CalcFields(DataSet: TDataSet);
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
  FRESTClient := TRESTClient.Create('http://api.tvmaze.com');
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
  DataSource1.DataSet := FDMemTable1;
end;

procedure ModifyFieldVisibility(aDataset: TFDDataSet);
var
  lField: TField;
  I: Integer;
  lFieldToAnalyze: TField;
  lFieldDef: TFieldDef;
  lTFieldAttributes: TFieldAttributes;
begin
  //Set visibility of all fields to False.
  for I := 0 to aDataset.Fields.Count-1 do
    aDataset.Fields[I].Visible := False;

  //Show fields I am interested in
  aDataset.FieldByName('show.name').Visible := True;
  aDataset.FieldByName('show.name').DisplayWidth := 15;
  aDataset.FieldByName('show.status').Visible := True;
  aDataset.FieldByName('show.status').DisplayWidth := 15;
  aDataset.FieldByName('show.premiered').Visible := True;
  aDataset.FieldByName('show.premiered').DisplayWidth := 15;
end;

procedure TForm1.FDMemTable1BeforeGetRecords(DataSet: TFDDataSet);
begin
  //Showmessage(IfThen(DataSet.Active, 'Active', 'Not Active'));

  ModifyFieldVisibility(DataSet);

  if not assigned(FCalcField) then
    begin
      FCalcField := TStringField.Create(DataSet);
      FCalcField.FieldName := 'NewStatus';
      FCalcField.DataSet := DataSet;
      FCalcField.FieldKind := fkCalculated;
      FCalcField.Calculated := True;
      FCalcField.Size := 15;
      DataSet.CreateDataSet();
    end;
  //DataSet.Active := False;
  //Showmessage(IfThen(DataSet.Active, 'Active', 'Not Active'));
end;

procedure TForm1.FDMemTable1CalcFields(DataSet: TDataSet);
var
  lNewValue: string;
begin
  lNewValue := IfThen(DataSet.FieldByName('show.status').AsString = 'Running', '!!!', '???');
  DataSet.FieldByName('NewStatus').AsString := lNewValue;
end;

end.
