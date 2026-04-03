program win98welcome;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, main, SysUtils
  { you can add units after this };

{$R *.res}

var
  I: Integer = 1;

begin
  while I <= ParamCount do
  begin
    case ParamStr(I) of
      '-s':
        begin
          Inc(I);
          WelcomeSnd := ParamStr(I);
        end;
      '-b':
        begin
          if FileExists(GetUserDir + '/.config/win98welcome') then
            Halt;
        end;
    end;
    Inc(I);
  end;
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  {$PUSH}{$WARN 5044 OFF}
  Application.MainFormOnTaskbar:=True;
  {$POP}
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

