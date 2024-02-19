program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, unit1,
  Classes, opensslsockets,
  fphttpclient, fpjson, jsonparser;

{$R *.res}


var
  jObj: TJSONObject;
  JArr: TJSONArray;
  jEnum: TJSONEnum;
  response: string;


begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

  jArr := TJSONArray.Create;
  writeln('Отправляю запрос!');

end.

