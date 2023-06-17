/* CSED273 lab6 experiments */
/* lab6_tb.v */

`timescale 1ps / 1fs

module lab6_tb();

    integer Passed;
    integer Failed;

    /* Define input, output and instantiate module */
    ////////////////////////
    reg reset_1;
    reg clk_1;
    wire [3:0] out_1;
    
    reg reset_2;
    reg clk_2;
    wire [7:0] out_2;
    
    reg reset_3;
    reg clk_3;
    wire [3:0] out_3;

    decade_counter lab1(
        .reset_n(reset_1),
        .clk(clk_1),
        .count(out_1)
    );
    
    decade_counter_2digits lab2(
        .reset_n(reset_2),
        .clk(clk_2),
        .count(out_2)
    );
    
    counter_369 lab3(
        .reset_n(reset_3),
        .clk(clk_3),
        .count(out_3)
    );
    ////////////////////////

    initial begin
        Passed = 0;
        Failed = 0;

        lab6_1_test;
        lab6_2_test;
        lab6_3_test;

        $display("Lab6 Passed = %0d, Failed = %0d", Passed, Failed);
        $finish;
    end

    /* Implement test task for lab6_1 */
    task lab6_1_test;
        ////////////////////////
        integer i;
        reg [3:0] out_expected;
        begin
            $display("lab6_1_test");
            clk_1 = 1'b1;
            reset_1 = 1'b0;
            #5 clk_1 = 1'b0;
            
            #5 clk_1 = 1;
            out_expected = 4'h0;
            reset_1 = 1'b1;
            for (i=0; i < 10; i = i + 1) begin
                if(out_expected == 9)
                    out_expected = 0;
                else
                    out_expected = i+1;
                
                #5 clk_1 = 1'b0;
                
                #1;
                if (out_1 == out_expected) begin
                   Passed = Passed + 1;
                end
                else begin
                   Failed = Failed + 1;
                end

                #4 clk_1 = 1'b1;
                
            end
        end
        ////////////////////////
    endtask

    /* Implement test task for lab6_2 */
    task lab6_2_test;
        ////////////////////////
        integer i;
        reg [7:0] out_expected;
        begin
            $display("lab6_2_test");
            clk_2 = 1'b1;
            reset_2 = 1'b0;
            #5 clk_2 = 1'b0;
            
            clk_2=1;
            reset_2=1;
            for (i=0; i < 10; i = i + 1) begin
                if(i==9)
                    reset_2=0;
                #1 clk_2 = 0;
                #1 clk_2 = 1;
            end
            
            #5 clk_2 = 1;
            out_expected = 8'h00;
            reset_2 = 1;
            for (i=0; i < 100; i = i + 1) begin
                if(out_expected==99)
                    out_expected=0;
                else
                    out_expected = i + 1;
                    
                #5 clk_2 = 1'b0;
                
                #1;
                if((out_2[7:4]*10 +out_2[3:0])==out_expected) begin
                   Passed = Passed + 1;
                end
                else begin
                   Failed = Failed + 1;
                end
                #4 clk_2 = 1'b1;

            end
        end
        ////////////////////////
    endtask
    
    /* Implement test task for lab6_3 */
    task lab6_3_test;
        ////////////////////////
        integer i,num;
        reg [3:0] out_expected;
        begin
            $display("lab6_3_test");
            clk_3 = 1'b1;
            reset_3 = 1'b0;
            #5 clk_3 = 1'b0;
            
            #5 clk_3 = 1;
            out_expected = 4'h0;
            reset_3 = 1'b1;
            
            i=0;
            num=0;
            while(num<8) begin
                if(out_expected == 13)
                    i = 6;
                else if(out_expected == 9)
                    i = 13;
                else
                    i = i+3;
                out_expected = i; 
                #5 clk_3 = 1'b0;
                
                #1;
                if (out_3 == out_expected) begin
                   Passed = Passed + 1;
                end
                else begin
                   Failed = Failed + 1;
                end
                
                #4 clk_3 = 1'b1;
                
                num = num+1;
            end
        end
        ////////////////////////
    endtask

endmodule