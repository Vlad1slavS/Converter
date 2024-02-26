unit Unit4;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm4 }

  TForm4 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure OnKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Form4: TForm4;

implementation

{$R *.lfm}

procedure TForm4.OnKeyPress(Sender: TObject; var Key: char);
begin
  // Проверяем, является ли введенный символ числом, точкой или Delete
  if not (Key in ['0'..'9', #8, '.']) then
    Key := #0; // Устанавливаем Key в #0 для блокировки ненужного нам символа
end;

procedure TForm4.Button1Click(Sender: TObject);
var
  S: real;
  p: real;
  h_1: real;
  h_2: real;
  h_3: real;
begin
     if (Length(Edit1.text)=0) or (Length(Edit2.text) = 0) or (Length(Edit5.text) = 0)  then // Если длина строки = 0
     begin
          MessageDlg ('Ошибка!','Введите значения во все поля', mtError, [mbOK], 0);
          exit;
     end;
     p := ((StrToInt(Edit1.text) + StrToInt(Edit2.text) + StrToInt(Edit5.text)) / 2);
     S := sqrt(p*(p-StrToInt(Edit1.text))*(p-StrToInt(Edit2.text))*(p-StrToInt(Edit5.text)));
     h_1:= 2*S/StrToInt(Edit1.text);
     h_2:= 2*S/StrToInt(Edit2.text);
     h_3:= 2*S/StrToInt(Edit5.text);
     Edit3.Text := FloatToStrF(h_1,ffFixed,4,2) + ' '  + '|' + ' ' + FloatToStrF(h_2,ffFixed,4,2) + ' '  + '|' + ' ' + FloatToStrF(h_3,ffFixed,4,2);
end;

end.

