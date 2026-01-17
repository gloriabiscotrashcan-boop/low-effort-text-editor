object frmMain: TfrmMain
  Left = 270
  Height = 240
  Top = 142
  Width = 320
  Caption = 'My low effort text editor'
  ClientHeight = 240
  ClientWidth = 320
  KeyPreview = True
  LCLVersion = '8.8'
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  object edtText: TMemo
    Left = 0
    Height = 90
    Top = 24
    Width = 150
    Font.Name = 'System'
    Lines.Strings = (
      'nyobak'
    )
    ParentFont = False
    ScrollBars = ssAutoBoth
    TabOrder = 0
    WordWrap = False
  end
  object lblFilename: TLabel
    Left = 0
    Height = 21
    Top = 0
    Width = 63
    Caption = 'noname'
    Font.Height = -16
    Font.Style = [fsBold]
    ParentFont = False
  end
end
