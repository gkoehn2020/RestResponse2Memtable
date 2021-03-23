program RestResponse2Memtable;

uses
  Vcl.Forms,
  frmUIMain in 'frmUIMain.pas' {Form1};

{$R *.res}

begin
{IFDEF DEBUG} ReportMemoryLeaksOnShutdown := true; {ENDIF}
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
