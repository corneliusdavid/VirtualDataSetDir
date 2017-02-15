object frmVirtDSDir: TfrmVirtDSDir
  Left = 0
  Top = 0
  Caption = 'VirtualDataSet from Directory Listing'
  ClientHeight = 299
  ClientWidth = 1037
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DirectoryListBox: TDirectoryListBox
    Left = 0
    Top = 0
    Width = 161
    Height = 299
    Align = alLeft
    TabOrder = 0
    OnChange = DirectoryListBoxChange
  end
  object DBGrid1: TDBGrid
    Left = 161
    Top = 0
    Width = 876
    Height = 299
    Align = alClient
    DataSource = srcVirtualFiles
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object VirtDSFiles: TVirtualDataSet
    OnGetRecordCount = VirtDSFilesGetRecordCount
    OnGetFieldValue = VirtDSFilesGetFieldValue
    Left = 328
    Top = 112
    object VirtDSFilesFileName: TStringField
      FieldName = 'FileName'
      Size = 100
    end
    object VirtDSFilesReadOnly: TBooleanField
      FieldName = 'ReadOnly'
    end
    object VirtDSFilesHidden: TBooleanField
      FieldName = 'Hidden'
    end
    object VirtDSFilesSystem: TBooleanField
      FieldName = 'System'
    end
    object VirtDSFilesDirectory: TBooleanField
      FieldName = 'Directory'
    end
    object VirtDSFilesCreateTime: TDateTimeField
      FieldName = 'CreateTime'
    end
    object VirtDSFilesLastAccessTime: TDateTimeField
      FieldName = 'LastAccessTime'
    end
    object VirtDSFilesLastWriteTime: TDateTimeField
      FieldName = 'LastWriteTime'
    end
  end
  object srcVirtualFiles: TDataSource
    DataSet = VirtDSFiles
    Left = 328
    Top = 168
  end
end
