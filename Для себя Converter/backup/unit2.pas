unit Unit2;

interface

uses
  Classes, fphttpclient, fpjson; // Библиотеки для работы с JSON

var
  JSONData: TJSONObject; // Объекты для хранения значения каждой валюты
  ValuteData: TJSONObject; // Объект нужной нам валюты, т.е доллара. Объект
  // содержит в себе пары {ключ: значение}
  JArr: TJSONArray; // массив
  CurrencyCode, response: string; // строка запроса и полученного ответа
  CurrencyValue: real; // Ответ

procedure qurCourse;


implementation
// Процедура для получения текущего курса валют
procedure qurCourse;
begin
     // Отправлеям запрос
     response := TFPHTTPClient.SimpleGet('https://www.cbr-xml-daily.ru/daily_json.js');
     // Формируем из строки JSON файл
     JSONData := TJSONObject(GetJSON(response));
     // Ищем в файле ключ "Valute", а в нем ищем ключ "USD" и сохраням как объект
     ValuteData := JSONData.Objects['Valute'].Find('USD') as TJSONObject;
     // Из объекта "название валюты": "значение" получает "значение", это и есть текущий курс
     CurrencyValue := ValuteData.Get('Value');
end;

end.



