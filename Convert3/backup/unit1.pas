unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure OnKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  Res : real;
begin
   Res := StrToFloat(Edit1.Text) * 92.55;
   Edit2.Text := '₽' + ' ' + FloatToStr(Res);
end;

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

// Процедура проверяет введено ли именно число?
procedure TForm1.OnKeyPress(Sender: TObject; var Key: char);
begin
  // Проверяем, является ли введенный символ числом
  if not (Key in ['0'..'9', #8, '.']) then
    Key := #0; // Устанавливаем Key в #0 для блокировки недопустимого символа
end;

end.

