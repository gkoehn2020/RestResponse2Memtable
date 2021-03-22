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
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids,
  REST.Types, Data.Bind.Components, Data.Bind.ObjectScope;

type
  TForm1 = class(TForm)
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
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    RESTResponseDataSetAdapter: TRESTResponseDataSetAdapter;
    procedure btnMakeRestRequestClick(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  System.StrUtils
  ;

procedure TForm1.btnMakeRestRequestClick(Sender: TObject);
begin
  RESTRequest.ResourceSuffix := IfThen(Length(LabeledEdit1.Text) > 0,
                                       'shows?q=' + Trim(LabeledEdit1.Text), '');
  RESTRequest.Execute;

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
