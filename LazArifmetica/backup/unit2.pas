unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OnKeyPress(Sender: TObject; var Key: char);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.OnKeyPress(Sender: TObject; var Key: char);
begin
  // Проверяем, является ли введенный символ числом, точкой или Delete
  if not (Key in ['0'..'9', #8, '.']) then
    Key := #0; // Устанавливаем Key в #0 для блокировки ненужного нам символа
end;

procedure TForm2.Button1Click(Sender: TObject);
var
  alg: real;
  geom: real;
begin
     if (Length(Edit1.text)=0) or (Length(Edit2.text) = 0)  then // Если длина строки = 0
     begin
          MessageDlg ('Ошибка!','Введите значения во все поля', mtError, [mbOK], 0);
          exit;
     end;
     alg:= (StrToInt(Edit1.Text) + StrToInt(Edit2.Text)) / 2;
     geom:= sqrt(abs(StrToInt(Edit1.Text)) * abs(StrToInt(Edit2.Text)));
     Edit5.Text := FloatToStrF(alg, ffFixed,4,1);
     Edit4.Text := FloatToStrF(geom, ffFixed,4,2);
end;

end.

