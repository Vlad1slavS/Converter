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
  JSONData: TJSONObject;
  ValuteData: TJSONObject;
  JArr: TJSONArray;
  CurrencyCode, response: string;
  CurrencyValue: real;


begin
  RequireDerivedFormResource:=True;
  Application.Title:='Конвертер валют';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;

  jArr := TJSONArray.Create;
  writeln('Отправляю запрос!');

  try
     response := TFPHTTPClient.SimpleGet('https://www.cbr-xml-daily.ru/daily_json.js');

     JSONData := TJSONObject(GetJSON(response));

     CurrencyCode := 'USD';  // Код валюты, которую нужно извлечь
     ValuteData := JSONData.Objects['Valute'].Find(CurrencyCode) as TJSONObject;

     if ValuteData <> Nil then
    begin
      CurrencyValue := ValuteData.Get('Value');
      writeln('Курс валюты: ', CurrencyValue:0:2);
    end
    else
    begin
      writeln('Указанная валюта не найдена в JSON!');
    end;

  finally
    jArr.Free;
  end;

end.

