program VirtualDataSetDir;

uses
  Vcl.Forms,
  ufrmVirtDSDir in 'ufrmVirtDSDir.pas' {frmVirtDSDir};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmVirtDSDir, frmVirtDSDir);
  Application.Run;
end.
