r.x=60
r.y=0;
r.pow=10;
r.freq=3*10^9;
r.lambda=3*10^8/r.freq;
%antena 1
r.a1.x=60
r.a1.y=-0.025;

r.a2.x=60;
r.a2.y=0.025;

u1.x=20;
u1.y=-50;
u2.x=110;
u2.y=50;
noise=-120;

r.pow=r.pow-3 %zmneijszenie mocy dwukrotnie (dB)

a1u1=d(r.a1,u1)
a2u1=d(r.a2,u1)
phil=phase(a1u1-a2u1,r.freq)

a1u2=d(r.a1,u2)
a2u2=d(r.a1,u2);
phi2=phase(a1u2-a2u2,r.freq);

H1=transm(a1u1,r.lambda,0)+transm(a2u1,r.lambda,phil-pi)
P1=r.pow+20*log10(abs(H1))

H2=transm(a1u2,r.lambda,0)+transm(a2u2,r.lambda,phil2-pi)
P2=r.pow+20*log10(abs(H2))

snr1w=SNR(P1,-90);
snr2w=SNR(P2,-90);

H2=transm(a1u1,r.lambda,0)+transm(a2u1,r.lambda,phi2-pi)
P2=r.pow+20*log10(abs(H2))

H1=transm(a1u2,r.lambda,0)+transm(a2u2,r.lambda,phil-pi)
P1=r.pow+20*log10(abs(H1))
snr1=SNR(P1,-90)
snr2=SNR(P2,-90)

function [dist]=d(a,b)
    dist=sqrt((b.x-a.x)^2+(b.y-a.y)^2);
end
function H=transm(d,lambda,phi)
    H=lambda/4/pi/d*exp(-j*2*pi*d/lambda)*exp(-j*phi);
end
function [phi]=phase(dist,freq)
    lambda=3*10^8/freq;
    phi=rem(dist,lambda)/lambda*2*pi;
end
function [snr]=SNR(signal_dB,noise_dB)
    snr=signal_dB-noise_dB;
end




