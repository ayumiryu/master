% *Run the training, please load "mablab_7.3.mat" first*
% ww1,ww2,bb1,bb2 are the trained values for best case
%Syntax: hit = testhit(ww1, ww2, bb1, bb2, TT);
%====####===change the tuple number to test each TSET
% tuple "f" will save the hit/miss status for each TSET test, 
% 1 is hit, 0 is miss

function hit = testhit(ww1, ww2, bb1, bb2, TT)
p1 = [-1 , -1, 1, 1, -1, 1, 1, -1, 1, -1, 1, -1, -1, 1, 1, -1, -1, -1, 1, 1];
p6 = [1 , 1, 1, 1, 1, -1, 1, 1, 1, -1, 1, 1, 1, -1, -1, 1, 1, -1, -1, 1];
p11 = [-1 , -1, -1, -1, 1, -1, -1, 1, 1, 1, 1, 1, 1, -1, -1, 1, -1, -1, -1, -1];
p16 = [1 , 1, 1, 1, 1, -1, -1, 1, 1, -1, -1, 1, 1, -1, -1, 1, 1, 1, 1, 1];
p21 = [1 , 1, 1, 1, -1, -1, -1, 1, -1, -1, -1, 1, -1, -1, -1, 1, 1, 1, 1, 1];

p102 = toggle(p1, 4, 1);
p103 = toggle(p1, 5, 3);
p104 = toggle(p1, 2, 4);
p105 = toggle(p1, 1, 2);

p107 = toggle(p6, 2, 4);
p108 = toggle(p6, 5, 2);
p109 = toggle(p6, 4, 3);
p110 = toggle(p6, 1, 3);

p112 = toggle(p11, 4, 4);
p113 = toggle(p11, 2, 4);
p114 = toggle(p11, 2, 2);
p115 = toggle(p11, 3, 4);

p117 = toggle(p16, 1, 3);
p118 = toggle(p16, 3, 2);
p119 = toggle(p16, 5, 4);
p120 = toggle(p16, 3, 3);

p122 = toggle(p21, 5, 3);
p123 = toggle(p21, 3, 4);
p124 = toggle(p21, 1, 4);
p125 = toggle(p21, 5, 4);
%------------------------
p202 = toggle(p102, 3, 2);
p203 = toggle(p103, 1, 3);
p204 = toggle(p104, 3, 3);
p205 = toggle(p105, 2, 1);

p207 = toggle(p107, 3, 2);
p208 = toggle(p108, 3, 3);
p209 = toggle(p109, 5, 4);
p210 = toggle(p110, 1, 2);

p212 = toggle(p112, 1, 3);
p213 = toggle(p113, 2, 2);
p214 = toggle(p114, 4, 3);
p215 = toggle(p115, 1, 4);

p217 = toggle(p117, 4, 3);
p218 = toggle(p118, 4, 3);
p219 = toggle(p119, 5, 1);
p220 = toggle(p120, 2, 4);

p222 = toggle(p122, 3, 3);
p223 = toggle(p123, 2, 2);
p224 = toggle(p124, 2, 1);
p225 = toggle(p125, 1, 3);
%------------------------
p301 = p1;
p302 = toggle(p202, 5, 2);
p303 = toggle(p203, 3, 3);
p304 = toggle(p204, 1, 3);
p305 = toggle(p205, 5, 1);

p306 = p6;
p307 = toggle(p207, 3, 4);
p308 = toggle(p208, 1, 4);
p309 = toggle(p209, 5, 2);
p310 = toggle(p210, 1, 3);

p311 = p11;
p312 = toggle(p212, 1, 1);
p313 = toggle(p213, 1, 2);
p314 = toggle(p214, 2, 4);
p315 = toggle(p215, 2, 1);

p316 = p16;
p317 = toggle(p217, 1, 2);
p318 = toggle(p218, 4, 2);
p319 = toggle(p219, 3, 3);
p320 = toggle(p220, 1, 4);

p321 = p21;
p322 = toggle(p222, 3, 2);
p323 = toggle(p223, 5, 2);
p324 = toggle(p224, 5, 4);
p325 = toggle(p225, 4, 2);
%execute
PATS1 = [p1;p102;p103;p104;p105;p6;p107;p108;p109;p110;p11;p112;p113;p114;p115;
    p16;p117;p118;p119;p120;p21;p122;p123;p124;p125]' ;
PATS2 = [p1;p202;p203;p204;p205;p6;p207;p208;p209;p210;p11;p212;p213;p214;p215;
    p16;p217;p218;p219;p220;p21;p222;p223;p224;p225]' ;
PATS3 = [p301;p302;p303;p304;p305;p306;p307;p308;p309;p310;p311;p312;p313;p314;p315;
    p316;p317;p318;p319;p320;p321;p322;p323;p324;p325]' ;

f = zeros(1, 25);
%change the tuple number below to test each TSET
[~,cpats] = size(PATS3);

        a = hardlims(tansig(ww2*tansig((ww1*PATS3) + bb1) + bb2))
    for patnum = 1: cpats
            if a(:,patnum) == TT(:,patnum)
                f(patnum) = 1;%save the miss positon
            end
    end
f
hit = patnum;
end
