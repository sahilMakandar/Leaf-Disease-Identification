T=[ 1 10;2 20;3 30;4 40;5 50;6 66;3 30;4.1 42]; 
test=[3 34; 1 14; 2.2 25; 6.2 63]; 
C=[1;1;2;2;3;3;2;2]; 
results = multisvm(T, C, test); 
disp('multi class problem'); 
disp(results);