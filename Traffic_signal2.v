//--------------------------------------------------------------------------------------------------
//
// Title       : Traffic_signal
// Design      : design5
// Author      : noraalsobuee11@gmail.com
// Company     : HP Inc.
//
//-------------------------------------------------------------------------------------------------
//
// File        : Traffic_signal.v
// Generated   : Fri Jul  1 15:05:27 2022
// From        : interface description file
// By          : Itf2Vhdl ver. 1.20
//
//-------------------------------------------------------------------------------------------------
//
// Description : 
//
//-------------------------------------------------------------------------------------------------
`timescale 1 ns / 1 ps
 
module Traffic_signal (North_signal,South_signal,East_signal,West_signal,clock,reset);
	   // The outputs:
	output reg [2:0] North_signal,South_signal,East_signal,West_signal; 

// The inputs:
input clock,reset;
//-----------------------

reg [2:0] state; 

reg [2:0] count;
//-----------------------

// green & yellow (North):
parameter [2:0] Ngreen=3'b000; 

parameter [2:0] Nyellow=3'b001; 

// green & yellow (South):
parameter [2:0] Sgreen=3'b010; 

parameter [2:0] Syellow=3'b011;

// green & yellow (East):
parameter [2:0] Egreen=3'b100; 

parameter [2:0] Eyellow=3'b101; 

// green & yellow (West):
parameter [2:0] Wgreen=3'b110;//west_green 

parameter [2:0] Wyellow=3'b111;//west_yellow 
//-----------------------
// Haneen Alenezi
// Noura Almutairi
// Noura Al-subaie
always @ (posedge clock, posedge reset) 

begin 

      if (reset==1)

     begin 

    #1 state=Ngreen;

      count=3'b000;

     end 

  else
 
         begin
         case (state)
// the North case:	
// the  -green-: ------ 1 ------
     Ngreen :
     begin
 
        if (count==3'b111)
 
    begin 
 
    count=3'b000;
 
     state=Nyellow; 

    end	 

        else
 
          begin
           count=count+3'b001;
 
             state=Ngreen;
 
          end

    end 
// end for the green
// the -yellow-: ------ 2 ------ 
    Nyellow : 

        begin

            if(count==3'b011) 

              begin 

              count=3'b000;

              state=Sgreen;
              end

        else
 
          begin 
  
            count=count+3'b001; 
  
            state=Nyellow;
 
          end

      end 
// the end for the yellow
//-----------------------------------------
// the south case:	
// the  -green-: ------ 3 ------
     Sgreen :
     begin
 
        if (count==3'b111)
 
    begin 
 
    count=3'b000;
 
     state=Syellow; 

    end	 

        else
 
          begin
           count=count+3'b001;
 
             state=Sgreen;
 
          end

    end 
// end for the green 
// the -yellow-: ------ 4 ------ 
   Syellow : 

        begin

            if(count==3'b011) 

              begin 

              count=3'b000;

              state=Egreen;
              end

        else
 
          begin 
  
            count=count+3'b001; 
  
            state=Syellow;
 
          end

      end 
// the end for the yellow
//----------------------------------------
// the east case:	
// the  -green-: ------ 5 ------
     Egreen :
     begin
 
        if (count==3'b111)
 
    begin 
 
    count=3'b000;
 
     state=Eyellow; 

    end	 

        else
 
          begin
           count=count+3'b001;
 
             state=Egreen;
 
          end

    end 
// end for the green 
// the -yellow-: ------ 6 ------ 
   Eyellow : 

        begin

            if(count==3'b011) 

              begin 

              count=3'b000;

              state=Wgreen;
              end

        else
 
          begin 
  
            count=count+3'b001; 
  
            state=Eyellow;
 
          end

      end 
// the end for the yellow
//----------------------------------------
// the west case:	
// the  -green-: ------ 7 ------
     Wgreen :
     begin
 
        if (count==3'b111)
 
    begin 
 
    count=3'b000;
 
     state=Wyellow; 

    end	 

        else
 
          begin
           count=count+3'b001;
 
             state=Wgreen;
 
          end

    end 
// end for the green 
// the -yellow-: ------ 8 ------ 
   Wyellow : 

        begin

            if(count==3'b011) 

              begin 

              count=3'b000;

              state=Ngreen;
              end

        else
 
          begin 
  
            count=count+3'b001; 
  
            state=Wyellow;
 
          end

      end 
// the end for the yellow
//----------------------------------------

      endcase 
  end 
  end 
//-----------------------------------------
//-----------------------------------------
// All group worked
// the north:
    always @(state)

    begin

      case (state)
      Ngreen:

      begin
              
      North_signal = 3'b001; 

       South_signal = 3'b100;
       East_signal= 3'b100;

       West_signal=3'b100;

end // end for north green

Nyellow:

begin

North_signal = 3'b010; 
South_signal = 3'b100;
East_signal= 3'b100;
West_signal=3'b100;

end // end for north yellow
//-----------------------------
// the south:
Sgreen:

begin 

North_signal = 3'b100;

South_signal = 3'b001;

East_signal  = 3'b100;

West_signal  = 3'b100;

end //end south green
Syellow:

begin

North_signal = 3'b100; 
South_signal = 3'b010;
East_signal= 3'b100;
West_signal=3'b100;

end // end for south yellow	
//----------------------------	
// the East:
Egreen:

begin 

North_signal = 3'b100;

South_signal = 3'b100;

East_signal  = 3'b001;

West_signal  = 3'b100;

end //end east green
Eyellow:

begin

North_signal = 3'b100; 
South_signal = 3'b100;
East_signal= 3'b010;
West_signal=3'b100;

end // end for east yellow	
//---------------------------- 
// the West:
Wgreen:

begin 

North_signal = 3'b100;

South_signal = 3'b100;

East_signal  = 3'b001;

West_signal  = 3'b100;

end //end West green
Wyellow:

begin

North_signal = 3'b100; 
South_signal = 3'b100;
East_signal= 3'b010;
West_signal=3'b100;

end // end for west yellow	
//----------------------------
 endcase // end the cases
end // end the state


endmodule// end the program


