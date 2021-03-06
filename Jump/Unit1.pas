unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer2Timer(Sender: TObject);
  private
  public
    { Public declarations }
  end;

const
 leftt:array [0..1] of double=(3.86491,51.59374);
 rightt:array [0..1] of double=(4.02766,27.14266);

var
  Form1: TForm1;
  b:Tbitmap;
  index,x1,x2:integer;
  result:integer;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
var c:Tcanvas;
begin
 timer1.Enabled:=false;
 b:=Tbitmap.Create;
 b.Width:=screen.Width;
 b.Height:=screen.Height;
 image1.Width:=b.Width;
 image1.Height:=b.Height;
 index:=0;
 form1.Visible:=false;
 sleep(500);
 c:=Tcanvas.Create;
 c.Handle:=getdc(0);
 b.Canvas.CopyRect(b.Canvas.ClipRect,c,c.ClipRect);
 form1.WindowState:=wsMaximized;
 form1.BorderStyle:=bsNone;
 image1.Visible:=true;
 image1.Picture.Assign(b);
 form1.Visible:=true;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var p:Tpoint;
begin
 GetCursorPos(p);
 if index=0 then
  x1:=p.X
  else
   begin
    x2:=p.X;
    result:=x2-x1;
    form1.WindowState:=wsminimized;
    timer2.Enabled:=true;
   end;
 inc(index);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var s:integer;
begin
 if result<0 then
  s:=round(leftt[1]-result*leftt[0])
  else
   s:=round(rightt[1]+result*rightt[0]);
 setcursorpos(400,400);
 mouse_event(mouseeventf_leftdown,0,0,0,0);
 sleep(s);
 setcursorpos(400,400);
 mouse_event(mouseeventf_leftup,0,0,0,0);
 sleep(s*4 div 5);
 winexec('Jump.exe',0);
 close;
end;

end.
