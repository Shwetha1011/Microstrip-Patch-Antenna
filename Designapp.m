%Program to calculate the parameters to design a rectangular patch antenna
%the user have to feed the values of frequency, dielectric constant, and
%height of the dielectric.
%program will calculate automatically the width and length of the patch
%and the width and length of the transition and transmission feed line.
f = input( 'input frequency f in Ghz: ');
Er = input ( 'input dielectric constant of the substrate ');
h = input( 'input height of substrate h in mm: ');
h=h/1000;
f=f*1e9; % turn frequency to HZ
c = 3e8; % speed of light
% calculating Width and Length of the Patch
W = ( c / ( 2 * f ) ) * ( ( 2 / ( Er + 1 ) )^0.5);
Er_eff = (Er+1)/2 + (( Er -1 )/2)*(1/(sqrt(1+(12*(h/W)))));
L_eff = c/(2*f*sqrt(Er_eff));
a1 = ( Er_eff + 0.3 ) * ( ( W / h ) + 0.264 );
a2 = ( Er_eff - 0.258 ) * ( ( W / h ) + 0.8 );
delta_L = (0.412 * ( a1 / a2 )) * h;
L = L_eff - 2*delta_L;
str=['width of the patch = ', num2str(W*1000), ' mm']
str=['length of the patch = ', num2str(L*1000), ' mm']
% Calculating the input impedance of the patch
Zo = 90 * Er^2*(L/W)^2/(Er-1);
% Calculating the strip transmission line
Zt=sqrt(50*Zo);
a3=exp(Zt*sqrt(Er)/60); p=-4*h*a3; q=32*h^2;
Wt1=-(p/2) + sqrt((p/2)^2-q);
Wt2=-(p/2) - sqrt((p/2)^2-q); %width of the transmission line
Er_t= (Er+1)/2 + (( Er -1 )/2)*(1/(sqrt(1+(12*(h/Wt2)))));
L_t=(c/f)/(4*sqrt(Er_t)); %length of transmission line
str=['width of the transmission line = ', num2str(Wt2*1000), ' mm']
str=['length of transmission line = ', num2str(L_t*1000), ' mm']
% Calculating the 50 ohm transmission line
syms x;
Z0=50;
d=h*1000;
a = 1.393-(120*pi/(Z0*sqrt(Er)));
RR1=inline('x/d+0.667*log(x/d+1.44)+a');