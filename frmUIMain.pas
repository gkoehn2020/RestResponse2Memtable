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
    rdgCreateColumnOrder: TRadioGroup;
    procedure btnCreateComponentsClick(Sender: TObject);
    procedure btnMakeRestRequestClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FDMemTable1BeforeGetRecords(DataSet: TFDDataSet);
    procedure FDMemTable1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    FRESTClient: TRESTClient;
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
    FRESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    procedure CreateDataFieldsOnDataSet;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.StrUtils
, System.TypInfo
  ;

procedure TForm1.CreateDataFieldsOnDataSet;
var
  lFielddef: TFieldDef;
  lNewField: TField;
begin
  if rdgCreateColumnOrder.ItemIndex = 0 then
    begin
      lFieldDef := FDMemTable1.FieldDefs.AddFieldDef;
      lFieldDef.Name := 'show';
      lFieldDef.DataType := ftWideString;
      lNewField := lFieldDef.CreateField(FDMemTable1);
      lNewField.FieldKind := fkData;
      lNewField.Size := 15;

      lFieldDef := FDMemTable1.FieldDefs.AddFieldDef;
      lFieldDef.Name := 'show.id';
      lFieldDef.DataType := ftWideString;
      lNewField := lFieldDef.CreateField(FDMemTable1);
      lNewField.FieldKind := fkData;
      lNewField.Size := 15;

      lFieldDef := FDMemTable1.FieldDefs.AddFieldDef;
      lFieldDef.Name := 'show.name';
      lFieldDef.DataType := ftWideString;
      lNewField := lFieldDef.CreateField(FDMemTable1);
      lNewField.FieldKind := fkData;
      lNewField.Size := 25;

      lFieldDef := FDMemTable1.FieldDefs.AddFieldDef;
      lFieldDef.Name := 'show.status';
      lFieldDef.DataType := ftWideString;
      lNewField := lFieldDef.CreateField(FDMemTable1);
      lNewField.FieldKind := fkData;
      lNewField.Size := 15;

      lFieldDef := FDMemTable1.FieldDefs.AddFieldDef;
      lFieldDef.Name := 'show.premiered';
      lFieldDef.DataType := ftWideString;
      lNewField := lFieldDef.CreateField(FDMemTable1);
      lNewField.FieldKind := fkData;
      lNewField.Size := 15;

      lFieldDef := FDMemTable1.FieldDefs.AddFieldDef;
      lFieldDef.Name := 'NewStatus';
      lFieldDef.DataType := ftWideString;
      lNewField := lFieldDef.CreateField(FDMemTable1);
      lNewField.FieldKind := fkCalculated;
      lNewField.Calculated := True;
      lNewField.Size := 15;
    end;
end;

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

  CreateDataFieldsOnDataSet;

  FRESTResponseDataSetAdapter := TRESTResponseDataSetAdapter.Create(Form1);
  FRESTResponseDataSetAdapter.Response := FRESTResponse;
  FRESTResponseDataSetAdapter.NestedElements := True;
  FRESTResponseDataSetAdapter.Dataset := FDMemTable1;

  btnCreateComponents.Enabled := false;
end;

procedure TForm1.btnMakeRestRequestClick(Sender: TObject);
begin
  FRESTRequest.Params.ParameterByName('title').Value := LabeledEdit1.Text;
  FRESTRequest.Execute;
  DataSource1.DataSet := FDMemTable1;
end;

procedure TForm1.FDMemTable1BeforeGetRecords(DataSet: TFDDataSet);
var
  lFielddef: TFieldDef;
  lNewField: TField;
  I: Integer;
begin
  if rdgCreateColumnOrder.ItemIndex = 1 then
    begin
      //This does not work! I wish it would...
      lFieldDef := FDMemTable1.FieldDefs.AddFieldDef;
      lFieldDef.Name := 'NewStatus';
      lFieldDef.DataType := ftWideString;
      lNewField := lFieldDef.CreateField(FDMemTable1);
      lNewField.FieldKind := fkCalculated;
      lNewField.Calculated := True;
      lNewField.Size := 15;
    end;

  //You can adjust field properties here.
  for I := 0 to FDMemTable1.Fields.Count-1 do
    begin
      FDMemTable1.Fields[i].DisplayWidth := 15;
      FDMemTable1.Fields[i].Visible := False;
    end;
  FDMemTable1.FieldByName('show.id').Visible := True;
  FDMemTable1.FieldByName('show.name').Visible := True;
  FDMemTable1.FieldByName('show.status').Visible := True;
  FDMemTable1.FieldByName('show.premiered').Visible := True;
  FDMemTable1.FieldByName('NewStatus').Visible := True;
end;

procedure TForm1.FDMemTable1CalcFields(DataSet: TDataSet);
var
  lNewValue: string;
begin
  lNewValue := IfThen(DataSet.FieldByName('show.status').AsString = 'Running', '!!!', '???');
  DataSet.FieldByName('NewStatus').AsString := lNewValue;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FRESTClient.Free;
end;

end.
