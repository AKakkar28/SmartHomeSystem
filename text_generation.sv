module textGeneration(input clk, input reset,
                     input [6:0] ascii_In,
                     input [9:0] x_desired, y_desired,
                     input [9:0] x,y,
                     output reg [6:0] asciiData,
                     output reg displayContents);
    always @* begin
        // Buffer the ASCII input to the output
        asciiData = ascii_In;

        // Determine if the current position is within the desired X range
        if (x >= x_desired && x < (x_desired + 10'd16)) begin //16 bits out 
            // Determine if the current position is within the desired Y range
            if (y >= y_desired && y < (y_desired + 10'd32)) begin // 32 bits down
                // Set displayContents to 1 if both horizontal and vertical conditions are met
                displayContents <= 1;
            end else begin
                displayContents <= 0;
            end
        end else begin
            displayContents <= 0;
        end
    end
endmodule