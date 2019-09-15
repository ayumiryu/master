% *Run the training, please load "mablab_7.3.mat" first*
% W19,W29,b19,b2 is the initial worst case(19 hidden units)
% W1,W2,b1,b2 is the initial intermediate/best case(8hidden units)
% SYNTAX: epochs = tranepoch(W1,W2,b1,b2,alp,PP,TT)
function epochs = tranepoch(W1,W2,b1,b2,alp,PP,TT)
q = zeros(1, 100);%all tuples for doing plotting
pw1 = zeros(1, 100);
pw2 = zeros(1, 100);
pw3 = zeros(1, 100);
pb1 = zeros(1, 100);
pb2 = zeros(1, 100);
for t = 1:100
    [W1out, W2out, b1out, b2out, ave2] = bptans1e(W1,W2,b1,b2,alp,PP,TT);
    W1 = W1out; W2 = W2out; b1 = b1out;b2 = b2out;
    q(t) = ave2; pw1(t) = W1(3,5); pw2(t) = W1(6,2); 
    pw3(t) = W2(2,5); pb1(t) = b1(3,1); pb2(t) = b2(4,1);
%  stop at each epoch to check the weights bias and ave's value
%   pause;ave2,W1,W2

% ------- Stopping criterion---%%%%%----%%%%%-----
%     if hardlims(tansig(W2*tansig((W1*PP) + b1) + b2)) == TT
%         break 
%     end
%     if ave2 < 0.001
%         break
%     end
end

% W1,W2,b1,b2
ave2
plot(pb2);
% axis([0,400,-0.1,0.5]);
epochs=t;
% figure; chkbrd1 ( W2);
end

