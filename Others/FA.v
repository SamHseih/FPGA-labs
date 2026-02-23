module FA(a,b,sum,cin,cout);
input a,b,cin;
output cout,sum;

HA M1(.a(a),.b(b),.sum(w1),.cout(w2));
HA M2(.a(w1),.b(cin),.sum(sum),.cout(w3));
assign cout = w3 | w2;

endmodule