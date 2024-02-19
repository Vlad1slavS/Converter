unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton; // Кнопка отвечающая за выволнение перевода
    Edit1: TEdit; // Поле для ввода начального значения долларов
    Edit2: TEdit; // Поле (edit) для вывода ответа в рублях
    Image1: TImage; // Картинка
    Label1: TLabel; // Заголовок (Что делает программа?)
    Label2: TLabel; // Текст-подсказка что нужно вводить ("долларов")
    Label3: TLabel; // Текст-подсказка что мы получаем ("рублей")
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
end;

// Процедура - обраточка клика на кпонпку
procedure TForm1.Button1Click(Sender: TObject);
begin
   // Переводим считанное в Edit1 начение и переводим в число, умножаем на курс
   Res := StrToFloat(Edit1.Text) * CurrencyValue;
   // Выводим в Edit2 символ '₽' и переведенынй в строку Res
   Edit2.Text := '₽' + ' ' + FloatToStr(Res);
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

