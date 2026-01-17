unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Windows, IniFiles;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    edtText: TMemo;
    lblFilename: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
  private
    aLabelHeight     : Integer;
    aDefaultFilename : String;
    aConfig          : TIniFile;
    procedure GetThatDamnConfig;
    procedure SetThatDamnConfig;
  public

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.frm}

{ TfrmMain }


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  aLabelHeight := 24;
  aDefaultFilename := 'noname';
  edtText.Left := 1;
  edtText.Top := aLabelHeight;
  edtText.Width := frmMain.Width;
  edtText.Height := frmMain.Height - aLabelHeight;
  if ParamCount = 0 then
     begin
     edtText.Lines.Clear;
     lblFileName.Caption := aDefaultFilename;
     end
  else
     begin
     lblFileName.Caption := ParamStr(1);
     if FileExists(lblFileName.Caption) then
        begin
        edtText.Lines.LoadFromFile(lblFileName.Caption);
        end
     else
        begin
        if FileExists(lblFileName.Caption) then
           begin
           edtText.Lines.LoadFromFile(lblFileName.Caption + '.txt');
           lblFileName.Caption := lblFileName.Caption + '.txt';
           end;
        end;
     end;
  aConfig := TIniFile.Create(extractfilepath(paramstr(0)) + 'config.ini');
  GetThatDamnConfig;
end;

procedure TfrmMain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  SetThatDamnConfig;
end;

procedure TfrmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
       vk_Escape : begin
                   Close;
                   end;
       vk_S      : begin
                   if (ssCtrl in Shift) and not(ssAlt in Shift) and not (ssShift in Shift) then
                      begin
                      if lblFileName.Caption = aDefaultFilename then
                         begin
                         lblFileName.Caption := FormatDateTime('yyyymmddhhnnss', Now) + '.txt';
                         edtText.Lines.SaveToFile(lblFileName.Caption);
                         end
                      else
                         begin
                         edtText.Lines.SaveToFile(lblFileName.Caption);
                         end;
                      end;
                   end;
       vk_W      : begin
                   if (ssCtrl in Shift) and not(ssAlt in Shift) and not (ssShift in Shift) then
                      begin
                      edtText.WordWrap := not edtText.WordWrap;
                      end;
                   end;
       end;
end;

procedure TfrmMain.FormResize(Sender: TObject);
begin
  edtText.Width := frmMain.Width;
  edtText.Height := frmMain.Height - aLabelHeight;
end;

procedure TfrmMain.GetThatDamnConfig;
begin
  frmMain.Left := aConfig.ReadInteger('position', 'left', 0);
  frmMain.Top := aConfig.ReadInteger('position', 'top', 0);
  frmMain.Height := aConfig.ReadInteger('position', 'height', 300);
  frmMain.Width := aConfig.ReadInteger('position', 'width', 400);
end;

procedure TfrmMain.SetThatDamnConfig;
begin
  aConfig.WriteInteger('position', 'left', frmMain.Left);
  aConfig.WriteInteger('position', 'top', frmMain.Top);
  aConfig.WriteInteger('position', 'height', frmMain.Height);
  aConfig.WriteInteger('position', 'width', frmMain.Width);
end;

end.

