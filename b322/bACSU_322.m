function [A,P]=bACSU_322(x,k,HD,A,P)
%===============================================================
%	function [A,P]=bACSU_322(x,k,HD,A,P)
%           
%	Add-Compare-Select Unit for entire (3,2,2)trellis stage 
%  of backward label decoder
%
%  John O'Shea, jfoshea@gmail.com
%==============================================================

if nargin==0, 
   error('Not enough input arguments.'); 
end;

% Define Trellis State names
st0=0;st1=1;st2=2;st3=3;st4=4;st5=5;st6=6;st7=7;

% Generate copy of A for processing
A_copy = A;
%======================
%   State 0 ACS
%======================
[sel_out0, metric_out0]=bACS_322(HD(1,1),HD(1,5),HD(1,17),HD(1,21),A_copy(1,(st0+1)),A_copy(1,(st1+1)),A_copy(1,(st4+1)),A_copy(1,(st5+1)));

% Update State(000) Metrics and trellis history
A(1,st0+1) = metric_out0;
P(st0+1,k*(x-1)+1:(k*x)) = D2B((sel_out0-1),k);

%======================
%   State 1 ACS
%======================
[sel_out1, metric_out1]=bACS_322(HD(1,2),HD(1,6),HD(1,18),HD(1,22),A_copy(1,(st0+1)),A_copy(1,(st1+1)),A_copy(1,(st4+1)),A_copy(1,(st5+1)));

% Update State(001) Metrics and trellis history
A(1,st1+1)= metric_out1;
P(st1+1,k*(x-1)+1:(k*x)) = D2B((sel_out1-1),k);


%======================
%   State 2 ACS
%======================
[sel_out2, metric_out2]=bACS_322(HD(1,3),HD(1,7),HD(1,19),HD(1,23),A_copy(1,(st0+1)),A_copy(1,(st1+1)),A_copy(1,(st4+1)),A_copy(1,(st5+1)));

% Update State(010) Metrics
A(1,st2+1)= metric_out2;
P(st2+1,k*(x-1)+1:(k*x)) = D2B((sel_out2-1),k);

%======================
%   State 3 ACS
%======================
[sel_out3, metric_out3]=bACS_322(HD(1,4),HD(1,8),HD(1,20),HD(1,24),A_copy(1,(st0+1)),A_copy(1,(st1+1)),A_copy(1,(st4+1)),A_copy(1,(st5+1)));

% Update State(011) Aumulated Metrics
A(1,st3+1)= metric_out3;
P(st3+1,k*(x-1)+1:(k*x)) = D2B((sel_out3-1),k);

%======================
%   State 4 ACS
%======================
[sel_out4, metric_out4]=bACS_322(HD(1,9),HD(1,13),HD(1,25),HD(1,29),A_copy(1,(st2+1)),A_copy(1,(st3+1)),A_copy(1,(st6+1)),A_copy(1,(st7+1)));

% Update State (100) Metrics
A(1,st4+1)= metric_out4;
P(st4+1,k*(x-1)+1:(k*x)) = D2B((sel_out4-1),k);

%======================
%   State 5 ACS
%======================
[sel_out5, metric_out5]=bACS_322(HD(1,10),HD(1,14),HD(1,26),HD(1,30),A_copy(1,(st2+1)),A_copy(1,(st3+1)),A_copy(1,(st6+1)),A_copy(1,(st7+1)));

% Update State(101) Metrics
A(1,st5+1) = metric_out5;
P(st5+1,k*(x-1)+1:(k*x)) = D2B((sel_out5-1),k);

%======================
%   State 6 ACS
%======================
[sel_out6, metric_out6]=bACS_322(HD(1,11),HD(1,15),HD(1,27),HD(1,31),A_copy(1,(st2+1)),A_copy(1,(st3+1)),A_copy(1,(st6+1)),A_copy(1,(st7+1)));

% Update State(110) Metrics
A(1,st6+1) = metric_out6;
P(st6+1,k*(x-1)+1:(k*x)) = D2B((sel_out6-1),k);


%======================
%   State 7 ACS
%======================
[sel_out7, metric_out7]=bACS_322(HD(1,12),HD(1,16),HD(1,28),HD(1,32),A_copy(1,(st2+1)),A_copy(1,(st3+1)),A_copy(1,(st6+1)),A_copy(1,(st7+1)));

% Update State(111) Metrics
A(1,st7+1) = metric_out7;
P(st7+1,k*(x-1)+1:(k*x)) = D2B((sel_out7-1),k);
