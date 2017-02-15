unit ufrmVirtDSDir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Types, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.FileCtrl, Data.DB, MemDS, VirtualDataSet,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmVirtDSDir = class(TForm)
    DirectoryListBox: TDirectoryListBox;
    VirtDSFiles: TVirtualDataSet;
    VirtDSFilesFileName: TStringField;
    VirtDSFilesReadOnly: TBooleanField;
    VirtDSFilesHidden: TBooleanField;
    VirtDSFilesSystem: TBooleanField;
    VirtDSFilesDirectory: TBooleanField;
    VirtDSFilesCreateTime: TDateTimeField;
    VirtDSFilesLastAccessTime: TDateTimeField;
    VirtDSFilesLastWriteTime: TDateTimeField;
    srcVirtualFiles: TDataSource;
    DBGrid1: TDBGrid;
    procedure DirectoryListBoxChange(Sender: TObject);
    procedure VirtDSFilesGetRecordCount(Sender: TObject; out Count: Integer);
    procedure VirtDSFilesGetFieldValue(Sender: TObject; Field: TField; RecNo: Integer;
      out Value: Variant);
  private
    FFileList: TStringDynArray;
    procedure RefreshFileList;
  end;

var
  frmVirtDSDir: TfrmVirtDSDir;

implementation

{$R *.dfm}

uses
  System.IOUtils;

procedure TfrmVirtDSDir.DirectoryListBoxChange(Sender: TObject);
begin
  RefreshFileList;
end;

procedure TfrmVirtDSDir.RefreshFileList;
begin
  VirtDSFiles.Close;

  SetLength(FFileList, 0);
  FFileList := TDirectory.GetFiles(DirectoryListBox.Directory);

  VirtDSFiles.Open;
end;

procedure TfrmVirtDSDir.VirtDSFilesGetFieldValue(Sender: TObject; Field: TField; RecNo: Integer; out Value: Variant);
var
  fileattrs: TFileAttributes;
begin
  if SameText(Field.FieldName, VirtDSFilesFileName.FieldName) then
    Value := ExtractFileName(FFileList[RecNo-1])
  else if SameText(Field.FieldName, VirtDSFilesCreateTime.FieldName) then
    Value := VarFromDateTime(TFile.GetCreationTime(FFileList[RecNo-1]))
  else if SameText(Field.FieldName, VirtDSFilesLastAccessTime.FieldName) then
    Value := VarFromDateTime(TFile.GetLastAccessTime(FFileList[RecNo-1]))
  else if SameText(Field.FieldName, VirtDSFilesLastWriteTime.FieldName) then
    Value := VarFromDateTime(TFile.GetLastWriteTime(FFileList[RecNo-1]))
  else begin
    fileattrs := TFile.GetAttributes(FFileList[RecNo-1]);

    if SameText(Field.FieldName, VirtDSFilesReadOnly.FieldName) then begin
      Value := TFileAttribute.faReadOnly in fileattrs
    end else if SameText(Field.FieldName, VirtDSFilesHidden.FieldName) then begin
      Value := TFileAttribute.faHidden in fileattrs
    end else if SameText(Field.FieldName, VirtDSFilesSystem.FieldName) then begin
      Value := TFileAttribute.faSystem in fileattrs
    end else if SameText(Field.FieldName, VirtDSFilesDirectory.FieldName) then begin
      Value := TFileAttribute.faDirectory in fileattrs
    end;
  end;
end;

procedure TfrmVirtDSDir.VirtDSFilesGetRecordCount(Sender: TObject; out Count: Integer);
begin
  Count := Length(FFileList);
end;

end.
