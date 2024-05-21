unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    But1: TButton;
    ButMultiplication: TButton;
    But6: TButton;
    But5: TButton;
    But4: TButton;
    But7: TButton;
    But8: TButton;
    But9: TButton;
    ButDivision: TButton;
    ButSquare: TButton;
    ButRoot: TButton;
    But2: TButton;
    ButC: TButton;
    ButCe: TButton;
    ButBack: TButton;
    But3: TButton;
    ButMinus: TButton;
    ButZero: TButton;
    ButComma: TButton;
    ButPlus: TButton;
    ButEvenly: TButton;
    ButFraction: TButton;
    Edit1: TEdit;
    procedure ButSquareClick(Sender: TObject);
    procedure ButRootClick(Sender: TObject);
    procedure ButCClick(Sender: TObject);
    procedure ButCeClick(Sender: TObject);
    procedure ButBackClick(Sender: TObject);
    procedure ButEvenlyClick(Sender: TObject);
    procedure ButFractionClick(Sender: TObject);
    procedure ClickBut(Sender: TObject);
    procedure ClickZnak(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  a, b, c : Real;
  znak : String;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ClickZnak(Sender: TObject);
begin
  if Edit1.Text = '' then
     ShowMessage('Введите число')
  else
  begin
  a:= StrToFloat(Edit1.Text);
  Edit1.Clear;

  znak := (Sender as TButton).Caption;
    end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.ClickBut(Sender: TObject);
  begin
    // Обработка нажатий кнопок цифрами и запятой
    if ((Sender as TButton).Caption = ',') and (Edit1.text = '') then begin
      Edit1.text := '0,';
      exit;
    end;
    if ((Sender as TButton).Caption = ',') and (pos(',', Edit1.Text) = 0) then begin
      Edit1.Text := Edit1.Text + ',';
      exit;
      end
    else if ((Sender as TButton).Caption = ',') and (pos(',', Edit1.Text) <> 0) then exit;
    Edit1.Text := Edit1.Text + (Sender as TButton).Caption;
  end;

procedure TForm1.ButBackClick(Sender: TObject);
var
  str : string;
begin
  str := Edit1.Text;
  if str <> '' then
  Delete(str, Length(str),1);
  Edit1.Text:= str;
end;

procedure TForm1.ButEvenlyClick(Sender: TObject);
begin
  if Edit1.Text = '' then
     ShowMessage('Введите число')
  else
  begin
  b := StrToFloat(Edit1.Text);
  Edit1.Clear;
  case znak of
  '+' : c := a+b;
  '-' : c := a-b;
  '*' : c := a*b;
  '/' : c := a/b;
  end;

  Edit1.Text:=FloatToStr(c);
  end;

end;

procedure TForm1.ButFractionClick(Sender: TObject);
begin
  if Edit1.Text = '' then
     ShowMessage('Введите число')
  else
  begin
  a := StrToFloat(Edit1.Text);
  if Edit1.Text = '0' then
     ShowMessage('На ноль делить нельзя')
  else
  begin
  a := 1/(a);
  Edit1.Text:=FloatToStr(a);
  a := 0;
  end;
  end;
end;

procedure TForm1.ButCeClick(Sender: TObject);
begin
  Edit1.Clear;
end;

procedure TForm1.ButCClick(Sender: TObject);
begin
  Edit1.Clear;
  a:=0;
  b:=0;
  c:=0;

end;

procedure TForm1.ButRootClick(Sender: TObject);
begin
  if Edit1.Text = '' then
     ShowMessage('Введите число')
  else
     begin
  a := StrToFloat(Edit1.Text);
  if a>0 then
     begin
  a := sqrt(a);
  Edit1.Text:=FloatToStr(a);
  a := 0;
  end
  else
  ShowMessage('Корня из отрицательного числа не существует')
  end;
end;

procedure TForm1.ButSquareClick(Sender: TObject);
begin
  if Edit1.Text = '' then
     ShowMessage('Введите число')
  else
  begin
  a := StrToFloat(Edit1.Text);
  a := sqr(a);
  Edit1.Text:=FloatToStr(a);
  a := 0;
    end;
  end;




end.

