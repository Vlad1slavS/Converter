unit Unit3;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure OnKeyPress(Sender: TObject; var Key: char);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

{$R *.lfm}

procedure TForm3.OnKeyPress(Sender: TObject; var Key: char);
begin
  // Проверяем, является ли введенный символ числом, точкой или Delete
  if not (Key in ['0'..'9', #8, '.']) then
    Key := #0; // Устанавливаем Key в #0 для блокировки ненужного нам символа
end;

procedure TForm3.Button1Click(Sender: TObject);
var
  a: real;
  b: real;
begin
     if (Length(Edit1.text)=0) or (Length(Edit2.text) = 0) or (Length(Edit5.text) = 0)  then // Если длина строки = 0
     begin
          MessageDlg ('Ошибка!','Введите значения во все поля', mtError, [mbOK], 0);
          exit;
     end;
     a:= (2*cos((StrToInt(Edit1.Text)-(pi/6)))) / (1/2 + power(sin(StrToInt(Edit2.Text)),2));
     b:= 1 + (power((StrToInt(Edit5.Text)),2)) / (3 +  (power(StrToInt(Edit2.Text),2)) / 5 );
     Edit3.Text := FloatToStrF(a, ffFixed,4,1);
     Edit4.Text := FloatToStrF(b, ffFixed,4,2);
end;

end.

