unit main_unit;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, unit2;

type

  { TForm1 }

  // Тип переменной для отображения главного окна
  TForm1 = class(TForm)
    Button1: TButton; // Кнопка отвечающая за выволнение перевода
    Edit1: TEdit; // Поле для ввода начального значения долларов
    Edit2: TEdit; // Поле (edit) для вывода ответа в рублях
    Image1: TImage; // Картинка
    Label1: TLabel; // Заголовок (Что делает программа?)
    Label2: TLabel; // Текст-подсказка что нужно вводить ("долларов")
    Label3: TLabel; // Текст-подсказка что мы получаем ("рублей")
    Label4: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject); // процедура обрабатывающая нажатие на кнопку
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    // Процедура проверяющая нажатие только цифр и Delete
    procedure OnKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Form1: TForm1;
  Res : real; // Переменная рекультата для вывода (рублей)

implementation

{$R *.lfm}

{ TForm1 }

// Процедура создания формы и то, какие процедуры/функции выполняются при ее создании
procedure TForm1.FormCreate(Sender: TObject);
begin
   QurCourse; // Процедура получения текущего курса (см Unit2)
   Memo1.Text := '';
end;

// Процедура - обраточка клика на кпонпку
procedure TForm1.Button1Click(Sender: TObject);
begin
   if Length(Edit1.text)=0 then // Если длина строки = 0
     begin
          Memo1.Text := Memo1.Text + 'Вы не ввели значение в нужное поле!' + #13#10;
          Label4.Caption:='Введите значение в поле "долларов"!!!';
          Label4.Visible:=true; // Делаем Label видимым
          Application.HandleMessage; // показываем содержимое переменной
          sleep(1500); // время до исчезновения мсек
          Label4.Visible:=false; // Убираем сообщение
          exit;
     end;
   // Переводим считанное в Edit1 начение и переводим в число, умножаем на курс
   Res := StrToFloat(Edit1.Text) * CurrencyValue;
   // Выводим в Edit2 символ '₽' и переведенынй в строку Res
   Edit2.Text := '₽' + ' ' + FloatToStrF(Res, ffFixed,4,2);
   Memo1.Text := Memo1.Text + 'Из ' + Edit1.text + ' '  + 'dollars ' + #13#10 + '→ ' + 'Получается ' + FloatToStrF(Res, ffFixed,4,2) + ' ' + 'рублей' + #13#10;



end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

// Процедура проверяет введено ли именно число?
procedure TForm1.OnKeyPress(Sender: TObject; var Key: char);
begin
  // Проверяем, является ли введенный символ числом, точкой или Delete
  if not (Key in ['0'..'9', #8, '.']) then
    Key := #0; // Устанавливаем Key в #0 для блокировки ненужного нам символа
end;

end.

