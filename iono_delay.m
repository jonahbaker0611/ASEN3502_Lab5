function I=iono_delay(el_deg,vtec)
%Function iono_delay, returns delay in meters 
%
%Use syntax:
%Meters=iono_delay(elevation angle (degrees), vertical electron content)
%
%Written by team 6 asen 3502

%define constants and functions:

%notes: 1 TECU= 10^16 electrons/m^2

K=(40.3*10^(16))/((1575.42*10^6)^2); %K is a conversion const units m/TECU
Re=6371; %Re is radius of earth in km
h=350; %h is the height of the ionosphere in km
F=@(el) 1./(sqrt(1-((Re*cosd(el) )./(Re+h)).^2 ) ); %F is a function that accounts for your elevation in degrees


%calculate I
I=K.*F(el_deg).*vtec;