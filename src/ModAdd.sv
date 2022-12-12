`include "../include/define.svh"

module ModAdd(
	input [`D_width-1:0] in_1,
	input [`D_width-1:0] in_2,
	input [`D_width-1:0] modulus,
	output logic [`D_width-1:0] out
);

logic [`D_width:0] ans;
logic [`D_width:0] ans_tmp;



always_comb begin
	ans = in_1 + in_2;
	ans_tmp = ans - modulus;
	out = (ans >= modulus) ? ans_tmp : ans;
end

endmodule