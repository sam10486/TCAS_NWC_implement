`include "../include/define.svh"


module ModSub(
	input [`D_width-1:0] in_1,
	input [`D_width-1:0] in_2,
	input [`D_width-1:0] modulus,
	output logic [`D_width-1:0] out
);


logic signed [`D_width:0] ans;
logic signed [`D_width:0] ans_tmp;
always_comb begin
	ans = in_1 - in_2;
	ans_tmp = ans + modulus;
	out = (ans[`D_width] == 1'b1) ? ans_tmp : ans;
end

endmodule