T=[1 2 3 4;2 3 4 5;3 4 5 6;4 5 6 7] 
C=[1 2 3 4] 
tst=[3 4 5 6] 
results = multisvm(T, C, tst); 
disp('multi class problem'); 
disp(results);