unit Unit1;

{$mode objfpc}{$H+} 

interface

uses
  cmem, ray_headers, ray_application, ray_model, ray_math, math;

type
TGame = class(TRayApplication)
  private
  protected
  public
    Engine3D: T3DEngine;
    Test,test1:T3DModel;
    constructor Create; override;
    procedure Init; override;
    procedure Update; override;
    procedure Render; override;
    procedure Shutdown; override;
  end;

implementation

constructor TGame.Create;
begin
  inherited;


end;

procedure TGame.Init;
begin
  SetTargetFPS(60);
    SetConfigFlags(FLAG_MSAA_4X_HINT);
    Engine3D:=T3DEngine.Create;


  Test:=T3DModel.Create(Engine3D,'dwarf.obj','dwarf_diffuse.png');
  Test.X:=0;
  Test.Y:=0;
  Test.Z:=0;
  Test.DrawMode:=dmEx;

  Test1:=T3DModel.Create(Engine3D,'dwarf.obj','dwarf_diffuse.png');
  Test1.X:=1;
  Test1.Y:=1;
  Test1.Z:=0.1;

end;

procedure TGame.Update;
begin
  Engine3D.Move(1);
 if IsKeyDown(KEY_A) then test.X:=test.X+0.1;
 if IsKeyDown(KEY_D) then test.X:=test.X-0.1;
  if IsKeyDown(KEY_Z) then test.AngleY:=test.AngleY+0.1;
  if IsKeyDown(KEY_X) then
  begin

  test1.AxisY:=0.0;
  test1.AxisX:=test1.AxisX+0.1;
  test1.AxisZ:=0.0;

  test1.Angle:=test1.Angle+0.1;
 // test1.Angle:=test1.Angle+0.1;
 // test1.Angle:=test1.Angle+0.1;

  end;

end;

procedure TGame.Render;
begin
     //ClearBackground(RAYWHITE);

    Engine3d.Draw();

    DrawText('(c) Dwarf 3D model by David Moreno', 800 - 200, 600 - 20, 10, BLACK);
    DrawFPS(10, 10);


end;

procedure TGame.Shutdown;
begin
end;

end.
