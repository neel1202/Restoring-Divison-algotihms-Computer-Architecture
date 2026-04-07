module restoring_division;

parameter N = 4;

reg [N-1:0] dividend;
reg [N-1:0] divisor;

reg [N:0] A;
reg [N-1:0] Q;
reg [N-1:0] M;

reg [N-1:0] quotient;
reg [N-1:0] remainder;

reg error;

integer i;

task run;
begin
    A = 0;
    Q = dividend;
    M = divisor;
    error = 0;

    if (M == 0) begin
        error = 1;
        quotient = 0;
        remainder = 0;
        $display("\nDivide by zero error\n");
    end
    else begin
        $display("\n===== NEW DIVISION =====");
        $display("Q=%b (%0d)  M=%b (%0d)", Q, Q, M, M);

        for (i = 0; i < N; i = i + 1) begin

            A = {A[N-1:0], Q[N-1]};
            Q = {Q[N-2:0], 1'b0};

            $display("Step %0d Shift   A=%b Q=%b", i+1, A, Q);

            A = A - M;
            $display("Step %0d A-M     A=%b (%0d)", i+1, A, A);

            if (A[N] == 1) begin
                A = A + M;
                Q[0] = 0;
                $display("Step %0d Restore", i+1);
            end
            else begin
                Q[0] = 1;
                $display("Step %0d Keep", i+1);
            end

            $display("Step %0d End     A=%b Q=%b\n", i+1, A, Q);
        end

        quotient = Q;
        remainder = A[N-1:0];

        if (quotient > dividend)
            $display("Overflow detected");

        $display("Final Q=%b (%0d)  R=%b (%0d)\n",
                  quotient, quotient, remainder, remainder);
    end
end
endtask

initial begin

    dividend = 4'b1110;
    divisor  = 4'b0011;
    run();

    dividend = 4'b1001;
    divisor  = 4'b0010;
    run();

    dividend = 4'b1010;
    divisor  = 4'b0000;
    run();

    dividend = 4'b0111;
    divisor  = 4'b0011;
    run();

    $finish;
end

endmodule