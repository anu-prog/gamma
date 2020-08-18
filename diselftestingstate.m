%DI self-testing of the state or ZZ
%using A, B operators
%using NPA level 3
%FINAL VERSION

clear all

%ideal case
i = eye(2);
a0 = [1 0 ; 0 -1];
b0 = a0;
a1 = [0 1 ; 1 0 ];
b1 = a1;
state = 1/sqrt(2) * [cos(pi/8) ; sin(pi/8) ; sin(pi/8) ; -cos(pi/8) ] ;

n = 19;

%CHSH constraint
N = zeros(n);
N(2,4) = 1/2;
N(2,5) = 1/2;
N(3,4) = 1/2;
N(3,5) = -1/2;
for i = 1:1:n
    for j = 1:1:n
        N(j,i) = transpose(N(i,j));
    end
end

%fidelity expression 
M = zeros(n);
M(1,1) = 1/2;
M(2,4) = 1/(4*sqrt(2));
M(2,5) = 1/(8*sqrt(2));
M(2,19) = -1/(8*sqrt(2));
M(3,4) = 1/(8*sqrt(2));
M(3,5) = -1/(16*sqrt(2));
M(3,19) = 1/(16*sqrt(2));
M(4,18) = -1/(8*sqrt(2));
M(5,18) = 1/(16*sqrt(2));
M(6,11) = 1/8;
M(7,10) = -1/8;
M(18,19) = -1/(16*sqrt(2));
for i = 1:1:n
    for j = 1:1:n
        M(j,i) = transpose(M(i,j));
    end
end
M = 1/2 * M;
    
counter = 1;
for eta = 0:0.1:0.8284
    
    etaarr(counter) = eta;

    cvx_begin sdp
        variable Gamma(n,n) hermitian semidefinite
        minimise( trace(transpose(M)*Gamma) )
        subject to
        Gamma >= 0 %positive semidefinite, Gramian matrix
        trace(transpose(N)*Gamma) == 2*sqrt(2) - eta
        
        %constraints
		for i=1:1:n
			Gamma(i,i) == 1;
		end

		Gamma(2,1) == Gamma(6,3);
		Gamma(2,1) == Gamma(7,4);
		Gamma(2,1) == Gamma(8,5);
		Gamma(2,1) == Gamma(12,9);
		Gamma(2,1) == Gamma(13,10);
		Gamma(2,1) == Gamma(14,11);
		Gamma(2,1) == Gamma(16,15);
		Gamma(3,1) == Gamma(9,4);
		Gamma(3,1) == Gamma(10,5);
		Gamma(3,1) == Gamma(15,11);
		Gamma(3,2) == Gamma(9,7);
		Gamma(3,2) == Gamma(10,8);
		Gamma(3,2) == Gamma(15,14);
		Gamma(4,1) == Gamma(7,2);
		Gamma(4,1) == Gamma(9,3);
		Gamma(4,1) == Gamma(11,5);
		Gamma(4,1) == Gamma(12,6);
		Gamma(4,1) == Gamma(14,8);
		Gamma(4,1) == Gamma(15,10);
		Gamma(4,1) == Gamma(16,13);
		Gamma(4,2) == Gamma(7,1);
		Gamma(4,2) == Gamma(9,6);
		Gamma(4,2) == Gamma(11,8);
		Gamma(4,2) == Gamma(12,3);
		Gamma(4,2) == Gamma(14,5);
		Gamma(4,2) == Gamma(15,13);
		Gamma(4,2) == Gamma(16,10);
		Gamma(4,3) == Gamma(9,1);
		Gamma(4,3) == Gamma(11,10);
		Gamma(4,3) == Gamma(15,5);
		Gamma(5,1) == Gamma(8,2);
		Gamma(5,1) == Gamma(10,3);
		Gamma(5,1) == Gamma(13,6);
		Gamma(5,1) == Gamma(17,12);
		Gamma(5,2) == Gamma(8,1);
		Gamma(5,2) == Gamma(10,6);
		Gamma(5,2) == Gamma(13,3);
		Gamma(5,2) == Gamma(17,9);
		Gamma(5,3) == Gamma(10,1);
		Gamma(5,4) == Gamma(8,7);
		Gamma(5,4) == Gamma(10,9);
		Gamma(5,4) == Gamma(13,12);
		Gamma(5,4) == Gamma(17,6);
		Gamma(6,1) == Gamma(12,4);
		Gamma(6,1) == Gamma(13,5);
		Gamma(6,1) == Gamma(16,11);
		Gamma(6,1) == Gamma(18,2);
		Gamma(6,2) == Gamma(12,7);
		Gamma(6,2) == Gamma(13,8);
		Gamma(6,2) == Gamma(16,14);
		Gamma(6,2) == Gamma(18,1);
		Gamma(6,3) == Gamma(7,4);
		Gamma(6,3) == Gamma(8,5);
		Gamma(6,3) == Gamma(12,9);
		Gamma(6,3) == Gamma(13,10);
		Gamma(6,3) == Gamma(14,11);
		Gamma(6,3) == Gamma(16,15);
		Gamma(6,4) == Gamma(7,3);
		Gamma(6,4) == Gamma(12,1);
		Gamma(6,4) == Gamma(13,11);
		Gamma(6,4) == Gamma(14,10);
		Gamma(6,4) == Gamma(16,5);
		Gamma(6,4) == Gamma(18,7);
		Gamma(6,5) == Gamma(8,3);
		Gamma(6,5) == Gamma(13,1);
		Gamma(6,5) == Gamma(17,4);
		Gamma(6,5) == Gamma(18,8);
		Gamma(7,1) == Gamma(9,6);
		Gamma(7,1) == Gamma(11,8);
		Gamma(7,1) == Gamma(12,3);
		Gamma(7,1) == Gamma(14,5);
		Gamma(7,1) == Gamma(15,13);
		Gamma(7,1) == Gamma(16,10);
		Gamma(7,2) == Gamma(9,3);
		Gamma(7,2) == Gamma(11,5);
		Gamma(7,2) == Gamma(12,6);
		Gamma(7,2) == Gamma(14,8);
		Gamma(7,2) == Gamma(15,10);
		Gamma(7,2) == Gamma(16,13);
		Gamma(7,3) == Gamma(12,1);
		Gamma(7,3) == Gamma(13,11);
		Gamma(7,3) == Gamma(14,10);
		Gamma(7,3) == Gamma(16,5);
		Gamma(7,3) == Gamma(18,7);
		Gamma(7,4) == Gamma(8,5);
		Gamma(7,4) == Gamma(12,9);
		Gamma(7,4) == Gamma(13,10);
		Gamma(7,4) == Gamma(14,11);
		Gamma(7,4) == Gamma(16,15);
		Gamma(7,5) == Gamma(11,2);
		Gamma(7,5) == Gamma(12,10);
		Gamma(7,5) == Gamma(14,1);
		Gamma(7,5) == Gamma(15,6);
		Gamma(7,5) == Gamma(16,3);
		Gamma(7,5) == Gamma(19,7);
		Gamma(7,6) == Gamma(12,2);
		Gamma(7,6) == Gamma(14,13);
		Gamma(7,6) == Gamma(16,8);
		Gamma(7,6) == Gamma(18,4);
		Gamma(8,1) == Gamma(10,6);
		Gamma(8,1) == Gamma(13,3);
		Gamma(8,1) == Gamma(17,9);
		Gamma(8,2) == Gamma(10,3);
		Gamma(8,2) == Gamma(13,6);
		Gamma(8,2) == Gamma(17,12);
		Gamma(8,3) == Gamma(13,1);
		Gamma(8,3) == Gamma(17,4);
		Gamma(8,3) == Gamma(18,8);
		Gamma(8,4) == Gamma(13,9);
		Gamma(8,4) == Gamma(17,3);
		Gamma(8,5) == Gamma(12,9);
		Gamma(8,5) == Gamma(13,10);
		Gamma(8,5) == Gamma(14,11);
		Gamma(8,5) == Gamma(16,15);
		Gamma(8,6) == Gamma(13,2);
		Gamma(8,6) == Gamma(17,7);
		Gamma(8,6) == Gamma(18,5);
		Gamma(8,7) == Gamma(10,9);
		Gamma(8,7) == Gamma(13,12);
		Gamma(8,7) == Gamma(17,6);
		Gamma(9,1) == Gamma(11,10);
		Gamma(9,1) == Gamma(15,5);
		Gamma(9,2) == Gamma(15,8);
		Gamma(9,2) == Gamma(19,17);
		Gamma(9,3) == Gamma(11,5);
		Gamma(9,3) == Gamma(12,6);
		Gamma(9,3) == Gamma(14,8);
		Gamma(9,3) == Gamma(15,10);
		Gamma(9,3) == Gamma(16,13);
		Gamma(9,4) == Gamma(10,5);
		Gamma(9,4) == Gamma(15,11);
		Gamma(9,5) == Gamma(11,3);
		Gamma(9,5) == Gamma(15,1);
		Gamma(9,5) == Gamma(19,9);
		Gamma(9,6) == Gamma(11,8);
		Gamma(9,6) == Gamma(12,3);
		Gamma(9,6) == Gamma(14,5);
		Gamma(9,6) == Gamma(15,13);
		Gamma(9,6) == Gamma(16,10);
		Gamma(9,7) == Gamma(10,8);
		Gamma(9,7) == Gamma(15,14);
		Gamma(9,8) == Gamma(11,6);
		Gamma(9,8) == Gamma(15,2);
		Gamma(9,8) == Gamma(19,12);
		Gamma(10,3) == Gamma(13,6);
		Gamma(10,3) == Gamma(17,12);
		Gamma(10,5) == Gamma(15,11);
		Gamma(10,6) == Gamma(13,3);
		Gamma(10,6) == Gamma(17,9);
		Gamma(10,8) == Gamma(15,14);
		Gamma(10,9) == Gamma(13,12);
		Gamma(10,9) == Gamma(17,6);
		Gamma(11,1) == Gamma(14,2);
		Gamma(11,1) == Gamma(15,3);
		Gamma(11,1) == Gamma(16,6);
		Gamma(11,1) == Gamma(19,4);
		Gamma(11,2) == Gamma(12,10);
		Gamma(11,2) == Gamma(14,1);
		Gamma(11,2) == Gamma(15,6);
		Gamma(11,2) == Gamma(16,3);
		Gamma(11,2) == Gamma(19,7);
		Gamma(11,3) == Gamma(15,1);
		Gamma(11,3) == Gamma(19,9);
		Gamma(11,4) == Gamma(14,7);
		Gamma(11,4) == Gamma(15,9);
		Gamma(11,4) == Gamma(16,12);
		Gamma(11,4) == Gamma(19,1);
		Gamma(11,5) == Gamma(12,6);
		Gamma(11,5) == Gamma(14,8);
		Gamma(11,5) == Gamma(15,10);
		Gamma(11,5) == Gamma(16,13);
		Gamma(11,6) == Gamma(15,2);
		Gamma(11,6) == Gamma(19,12);
		Gamma(11,7) == Gamma(14,4);
		Gamma(11,7) == Gamma(15,12);
		Gamma(11,7) == Gamma(16,9);
		Gamma(11,7) == Gamma(19,2);
		Gamma(11,8) == Gamma(12,3);
		Gamma(11,8) == Gamma(14,5);
		Gamma(11,8) == Gamma(15,13);
		Gamma(11,8) == Gamma(16,10);
		Gamma(11,9) == Gamma(15,4);
		Gamma(11,9) == Gamma(19,3);
		Gamma(11,10) == Gamma(15,5);
		Gamma(12,1) == Gamma(13,11);
		Gamma(12,1) == Gamma(14,10);
		Gamma(12,1) == Gamma(16,5);
		Gamma(12,1) == Gamma(18,7);
		Gamma(12,2) == Gamma(14,13);
		Gamma(12,2) == Gamma(16,8);
		Gamma(12,2) == Gamma(18,4);
		Gamma(12,3) == Gamma(14,5);
		Gamma(12,3) == Gamma(15,13);
		Gamma(12,3) == Gamma(16,10);
		Gamma(12,4) == Gamma(13,5);
		Gamma(12,4) == Gamma(16,11);
		Gamma(12,4) == Gamma(18,2);
		Gamma(12,5) == Gamma(14,3);
		Gamma(12,5) == Gamma(16,1);
		Gamma(12,6) == Gamma(14,8);
		Gamma(12,6) == Gamma(15,10);
		Gamma(12,6) == Gamma(16,13);
		Gamma(12,7) == Gamma(13,8);
		Gamma(12,7) == Gamma(16,14);
		Gamma(12,7) == Gamma(18,1);
		Gamma(12,8) == Gamma(14,6);
		Gamma(12,8) == Gamma(16,2);
		Gamma(12,9) == Gamma(13,10);
		Gamma(12,9) == Gamma(14,11);
		Gamma(12,9) == Gamma(16,15);
		Gamma(12,10) == Gamma(14,1);
		Gamma(12,10) == Gamma(15,6);
		Gamma(12,10) == Gamma(16,3);
		Gamma(12,10) == Gamma(19,7);
		Gamma(12,11) == Gamma(14,9);
		Gamma(12,11) == Gamma(16,4);
		Gamma(13,1) == Gamma(17,4);
		Gamma(13,1) == Gamma(18,8);
		Gamma(13,2) == Gamma(17,7);
		Gamma(13,2) == Gamma(18,5);
		Gamma(13,3) == Gamma(17,9);
		Gamma(13,4) == Gamma(17,1);
		Gamma(13,4) == Gamma(18,14);
		Gamma(13,5) == Gamma(16,11);
		Gamma(13,5) == Gamma(18,2);
		Gamma(13,6) == Gamma(17,12);
		Gamma(13,7) == Gamma(17,2);
		Gamma(13,7) == Gamma(18,11);
		Gamma(13,8) == Gamma(16,14);
		Gamma(13,8) == Gamma(18,1);
		Gamma(13,9) == Gamma(17,3);
		Gamma(13,10) == Gamma(14,11);
		Gamma(13,10) == Gamma(16,15);
		Gamma(13,11) == Gamma(14,10);
		Gamma(13,11) == Gamma(16,5);
		Gamma(13,11) == Gamma(18,7);
		Gamma(13,12) == Gamma(17,6);
		Gamma(14,1) == Gamma(15,6);
		Gamma(14,1) == Gamma(16,3);
		Gamma(14,1) == Gamma(19,7);
		Gamma(14,2) == Gamma(15,3);
		Gamma(14,2) == Gamma(16,6);
		Gamma(14,2) == Gamma(19,4);
		Gamma(14,3) == Gamma(16,1);
		Gamma(14,4) == Gamma(15,12);
		Gamma(14,4) == Gamma(16,9);
		Gamma(14,4) == Gamma(19,2);
		Gamma(14,5) == Gamma(15,13);
		Gamma(14,5) == Gamma(16,10);
		Gamma(14,6) == Gamma(16,2);
		Gamma(14,7) == Gamma(15,9);
		Gamma(14,7) == Gamma(16,12);
		Gamma(14,7) == Gamma(19,1);
		Gamma(14,8) == Gamma(15,10);
		Gamma(14,8) == Gamma(16,13);
		Gamma(14,9) == Gamma(16,4);
		Gamma(14,10) == Gamma(16,5);
		Gamma(14,10) == Gamma(18,7);
		Gamma(14,11) == Gamma(16,15);
		Gamma(14,12) == Gamma(16,7);
		Gamma(14,12) == Gamma(19,18);
		Gamma(14,13) == Gamma(16,8);
		Gamma(14,13) == Gamma(18,4);
		Gamma(15,1) == Gamma(19,9);
		Gamma(15,2) == Gamma(19,12);
		Gamma(15,3) == Gamma(16,6);
		Gamma(15,3) == Gamma(19,4);
		Gamma(15,4) == Gamma(19,3);
		Gamma(15,6) == Gamma(16,3);
		Gamma(15,6) == Gamma(19,7);
		Gamma(15,7) == Gamma(19,6);
		Gamma(15,8) == Gamma(19,17);
		Gamma(15,9) == Gamma(16,12);
		Gamma(15,9) == Gamma(19,1);
		Gamma(15,10) == Gamma(16,13);
		Gamma(15,12) == Gamma(16,9);
		Gamma(15,12) == Gamma(19,2);
		Gamma(15,13) == Gamma(16,10);
		Gamma(16,3) == Gamma(19,7);
		Gamma(16,5) == Gamma(18,7);
		Gamma(16,6) == Gamma(19,4);
		Gamma(16,7) == Gamma(19,18);
		Gamma(16,8) == Gamma(18,4);
		Gamma(16,9) == Gamma(19,2);
		Gamma(16,11) == Gamma(18,2);
		Gamma(16,12) == Gamma(19,1);
		Gamma(16,14) == Gamma(18,1);
		Gamma(17,1) == Gamma(18,14);
		Gamma(17,2) == Gamma(18,11);
		Gamma(17,4) == Gamma(18,8);
		Gamma(17,7) == Gamma(18,5);


    cvx_end
    
    fidarr(counter) = cvx_optval;
    counter = counter + 1;
end

ctr = 1;
for i = 0:0.1:0.8284
    %fitfid(ctr) = 1 - 1.1 * i; %Bancal's fit
    fitfid(ctr) = 1 - 1.18 * i; %actual fit fit
    fiteta(ctr) = i;
    ctr = ctr + 1;
end

Fit = polyfit(etaarr,fidarr,3) %accurate fit

figure
plot(etaarr,fidarr,'DisplayName','self-testing bound for G')
hold on
plot(fiteta,fitfid,'DisplayName','fit: G \geq 1 - 1.18\epsilon')
%plot(etaarr,polyval(Fit,etaarr),'DisplayName','actual fit')
hold off
xlabel('error (\epsilon)')
ylabel('minimum singlet fidelity (G)')
legend('show')
