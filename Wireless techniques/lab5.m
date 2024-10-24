clear all;
close all;
clearvars; clc;

AP=[100,0];
p_transmitted=5*10^-3;
c=3*10^8;
f=6*10^9;
lambda=c/f;
power=p_transmitted/2; %na dwa bo dwie anteny i na zmiane do uzywkowników
power2=p_transmitted/4;%na cztery bo dwie anteny do  dwóch użytkowników w tym samym czasie
p_db=10*log10(power);
p2_db=10*log10(power2);

antena_1=[100,-0.0125];
antena_2=[100,0.0125];
user_1=[50,70];
user_2=[160,50];
noise=-135; %dBw

%odległości:
a1u1=sqrt((antena_1(1)-user_1(1))^2+(antena_1(2)-user_1(2))^2);
a1u2=sqrt((antena_1(1)-user_2(1))^2+(antena_1(2)-user_2(2))^2);
a2u1=sqrt((antena_2(1)-user_1(1))^2+(antena_2(2)-user_1(2))^2);
a2u2=sqrt((antena_2(1)-user_2(1))^2+(antena_2(2)-user_2(2))^2);

%fazy na podstaiwie różnicy długości odcinków od anten do użytkownika zeby
%uniknąć interferencji
prop1=2*pi*(a1u1-a2u1)/lambda;
prop2=2*pi*(a1u2-a2u2)/lambda;

%scenariusz1:
display("Scenariusz 1");
H_a1u1=lambda/(4*pi*a1u1)*exp((-j*2*pi*a1u1)/lambda)*exp(prop1*j);%wzór wykład 2, transmitancja razy phase shift
H_a2u1=lambda/(4*pi*a2u1)*exp((-j*2*pi*a2u1)/lambda);
H_user1=H_a2u1 +H_a1u1;
p_received=p_db+20*log10(abs(H_user1));
SNR1=p_received-noise;
display("SNR dla uzytkownika 1 wynosi: "+SNR1);

H_a1u2=lambda/(4*pi*a1u2)*exp((-j*2*pi*a1u2)/lambda)*exp(prop2*j);
H_a2u2=lambda/(4*pi*a2u2)*exp((-j*2*pi*a2u2)/lambda);
H_user2=H_a2u2 +H_a1u2;
p_received2=p_db+20*log10(abs(H_user2));
SNR2=p_received2-noise;
display("SNR dla uzytkownika 2 wynosi: "+SNR2);

%Scenariusz 2:
display("scenariusz 2");
H_a1u1=lambda/(4*pi*a1u1)*exp((-j*2*pi*a1u1)/lambda)*exp(prop2*j)*exp(-j*pi);
H_a2u1=lambda/(4*pi*a2u1)*exp((-j*2*pi*a2u1)/lambda);
H_user1=H_a2u1 +H_a1u1;
p_received=p2_db+20*log10(abs(H_user1));
SNR1=p_received-noise;
display("SNR dla uzytkownika 1 wynosi: "+SNR1);

H_a1u2=lambda/(4*pi*a1u2)*exp((-j*2*pi*a1u2)/lambda)*exp(prop1*j)*exp(-j*pi);
H_a2u2=lambda/(4*pi*a2u2)*exp((-j*2*pi*a2u2)/lambda);
H_user2=H_a2u2 +H_a1u2;
p_received2=p2_db+20*log10(abs(H_user2));
SNR2=p_received2-noise;
display("SNR dla uzytkownika 2 wynosi: "+SNR2);

