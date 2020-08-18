%1sDI self-testing of X
%using E, F projectors
%using 2-measurement steering inequality
%FINAL VERSION

clear all

n = 12;

%fidelity expression
M = 1/2*[1 0 0 0 0 0 2 0 0 0 0 0 ; 
    0 0 0 0 0 0 -2 -2 0 0 0 0 ; 
    0 0 -1 0 0 0 0 0 0 0 0 4 ; 
    0 0 0 1 0 0 0 0 0 0 4 0 ; 
    0 0 0 0 0 0 0 0 0 0 0 0 ; 
    0 0 0 0 0 0 0 0 0 0 0 0 ; 
    2 -2 0 0 0 0 -4 4 0 0 0 0 ; 
    0 -2 0 0 0 0 4 4 0 0 0 0 ; 
    0 0 0 0 0 0 0 0 0 -2 0 0 ; 
    0 0 0 0 0 0 0 0 -2 0 0 0 ; 
    0 0 0 4 0 0 0 0 0 0 0 -8 ; 
    0 0 4 0 0 0 0 0 0 0 -8 0 ];
          
%steering constraint
N = 2*[-1/2 -1/2 0 0 0 0 0 0 0 0 0 0 ;
    -1/2 1/2 0 0 0 0 0 0 0 0 0 0;
    0 0 1 0 0 0 0 0 0 0 0 0 ;
    0 0 0 -1 0 0 0 0 0 0 0 0 ;
    0 0 0 0 0 1 0 0 0 0 0 0 ;
    0 0 0 0 1 0 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 0 0 0 0 0 ;
    0 0 0 0 0 0 0 0 0 0 0 0 ; 
    0 0 0 0 0 0 0 0 0 0 0 0 ];

counter = 1;

for eta=0:0.1:0.5858
    error(counter) = eta;
    
    cvx_begin sdp
    
        variable Gamma(n,n) hermitian semidefinite
        minimise( trace(transpose(M)*Gamma) )
        
        subject to
        Gamma >= 0 %positive semidefinite, Gramian matrix
        trace(transpose(N)*Gamma) == 2 - eta
        
        %constraints
        Gamma(1,1) + Gamma(2,2) == 1 
        Gamma(3:4,3:4) == Gamma(3:4,1:2)
        Gamma(5:6,5:6) == Gamma(5:6,1:2)
        Gamma(7:8,7:8) == Gamma(1:2,11:12)
        Gamma(9:10,9:10) == Gamma(9:10,3:4)
        Gamma(11:12,11:12) == Gamma(7:8,11:12)
        Gamma(3:4,5:6) == Gamma(1:2,7:8)
        Gamma(3:4,7:8) == Gamma(1:2,7:8)
        Gamma(3:4,11:12) == Gamma(9:10,11:12)
        Gamma(5:6,11:12) == Gamma(1:2,11:12)
        Gamma(5:6,7:8) == Gamma(1:2,11:12)
        Gamma(7:8,9:10) == Gamma(11:12,3:4)
        Gamma(9:10,1:2) == Gamma(1:2,7:8)
        Gamma(9:10,5:6) == Gamma(1:2,7:8)
        Gamma(9:10,11:12) == Gamma(9:10,7:8)
        
    cvx_end
 
    G = cvx_optval;
    minfid(counter) = cvx_optval;
    counter = counter + 1;
    
end


fitcounter = 1;
for t = 0:0.1:0.5858
    thisfit(fitcounter) = 1 - 3.1*t;
    fiterror(fitcounter) = t;
    fitcounter = fitcounter + 1;
end


Fit = polyfit(error,minfid,3)

figure
plot(error,minfid,'DisplayName','self-testing bound for G')
%hold on
%plot(fiterror,thisfit,'DisplayName','fit: G \geq 1 - 3.1\eta')
%hold off
xlabel('error (\eta)')
ylabel('minimum singlet fidelity (G)')
legend('show')

