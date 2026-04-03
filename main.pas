unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    Image1: TImage;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Shape1Click(Sender: TObject);
    procedure Shape2Click(Sender: TObject);
    procedure Shape3Click(Sender: TObject);
    procedure Shape4Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  WelcomeSnd: String;

implementation

{$R *.lfm}

uses
  Process, FileUtil, lclintf;

var
  AProcess: TProcess;

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  Halt;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
var
  F: THandle;
begin
  if not CheckBox1.Checked then
  begin
    F := FileCreate(GetUserDir + '/.config/win98welcome');
    FileClose(F);
  end else
    DeleteFile(GetUserDir + '/.config/win98welcome');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CheckBox1.Checked := not FileExists(GetUserDir + '/.config/win98welcome');
  AProcess := TProcess.Create(nil);
  AProcess.Executable := '/bin/playsound';
  AProcess.Parameters.Add(WelcomeSnd);
  AProcess.Options := [];
  AProcess.Execute;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin         
  AProcess.Terminate(0);
  AProcess.Free;
end;

procedure TForm1.Shape1Click(Sender: TObject);   
var
  A: TProcess;
begin
  A := TProcess.Create(nil);
  A.Executable := '/bin/mugshot';
  A.Options := [];
  A.Execute;
  A.Free;
end;

procedure TForm1.Shape2Click(Sender: TObject);
var
  A: TProcess;
begin
  A := TProcess.Create(nil);
  A.Executable := '/bin/nm-connection-editor';
  A.Options := [];
  A.Execute;
  A.Free;
end;

procedure TForm1.Shape3Click(Sender: TObject);
begin
  OpenURL('https://en.wikipedia.org/wiki/Windows_98');
end;

procedure TForm1.Shape4Click(Sender: TObject);
var
  A: TProcess;
begin
  A := TProcess.Create(nil);
  A.Executable := '/bin/xfce4-settings-manager';
  A.Options := [];
  A.Execute;
  A.Free;
end;

end.

