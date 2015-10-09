unit uRotors;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, uMain;

procedure MoveRotorsForwards;
procedure MoveRotorsBackWards;

implementation

procedure MoveRotorsForwards;   {Encryption}
var
  LTemp, MTemp, RTemp : Char;
  i : Integer;
  LBeg, MBeg, RBeg : String;
begin
     if RotLeft[2,1] <> 'Z' then
        begin
          LTemp := RotLeft[2,1];
          for i := 1 to 25 do
          begin
            RotLeft[2,i] := RotLeft[2,i+1];
          end;
          RotLeft[2,26] := LTemp;
        end
     else
         if RotMid[2,1] <> 'Z' then
            begin
              LTemp := RotLeft[2,1];
              MTemp := RotMid[2,1];
              for i := 1 to 25 do
              begin
                RotLeft[2,i] := RotLeft[2,i+1];
                RotMid[2,i] := RotMid[2,i+1];
              end;
              RotLeft[2,26] := LTemp;
              RotMid[2,26] := MTemp;
            end
         else
             if RotRight[2,1] <> 'Z' then
                begin
                  LTemp := RotLeft[2,1];
                  MTemp := RotMid[2,1];
                  RTemp := RotRight[2,1];
                  for i := 1 to 25 do
                  begin
                    RotLeft[2,i] := RotLeft[2,i+1];
                    RotMid[2,i] := RotMid[2,i+1];
                    RotRight[2,i] := RotRight[2,i+1];
                  end;
                  RotLeft[2,26] := LTemp;
                  RotMid[2,26] := MTemp;
                  RotRight[2,26] := RTemp;
                end
             else
                 if RotRight[2,1] = 'Z' then
                    begin
                      for i := 1 to 26 do
                      begin
                        RotLeft[2,i] := chr(64+i);
                        RotMid[2,i] := chr(64+i);
                        RotRight[2,i] := chr(64+i);
                      end;
                    end;
end;

procedure MoveRotorsBackwards;      {Decryption}
var
  LTemp, MTemp, RTemp : Char;
  i, j : Integer;
  LBeg, MBeg, RBeg : String;
begin
     if RotLeft[2,26] <> 'A' then
        begin
          LTemp := RotLeft[2,26];
          for j := 1 to 25 do
          begin
            i := 27 - j;
            RotLeft[2,i] := RotLeft[2,i-1];
          end;
          RotLeft[2,1] := LTemp;
        end
     else
         if RotMid[2,26] <> 'A' then
            begin
              LTemp := RotLeft[2,26];
              MTemp := RotMid[2,26];
              for j := 1 to 25 do
              begin
                i := 27 - j;
                RotLeft[2,i] := RotLeft[2,i-1];
                RotMid[2,i] := RotMid[2,i-1];
              end;
              RotLeft[2,1] := LTemp;
              RotMid[2,1] := MTemp;
            end
         else
             if RotRight[1,25] <> 'A' then
                begin
                  LTemp := RotLeft[2,26];
                  MTemp := RotMid[2,26];
                  RTemp := RotRight[2,26];
                  for j := 1 to 25 do
                  begin
                    i := 27 - j;
                    RotLeft[2,i] := RotLeft[2,i-1];
                    RotMid[2,i] := RotMid[2,i-1];
                    RotRight[2,i] := RotRight[2,i-1];
                  end;
                  RotLeft[2,1] := LTemp;
                  RotMid[2,1] := MTemp;
                  RotRight[2,1] := RTemp;
                end
             else
                 if RotRight[2,26] = 'A' then
                    begin
                      for j := 1 to 25 do
                      begin
                        i := 27 - j;
                        RotLeft[2,i] := chr(91-i);
                        RotMid[2,i] := chr(91-i);
                        RotRight[2,i] := chr(91-i);
                      end;
                    end;
end;

end.

