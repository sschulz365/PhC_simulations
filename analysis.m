%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                         %                                                                          %
% Code to analyse mpb bandstructures and calculate the predicted loss     %
% by Sebastian Schulz and Daryl Beggs                                     %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
clear all %empties the buffer associated with each variable
close all % closes all open image files

%%%%%%%%%%%%%%%%%%%%
%  User input      %
%%%%%%%%%%%%%%%%%%%%


%enter the filename without the ending (.dat)
filename = 'example';

%Enter the constant for out of plane loss
c1 = 4;

%Enter the constant for backscattering loss
c2 = 220;

%Enter the lattice period in nm
a = 410

%For delay calculation, enter group index of access waveguide (normally 5)
ng_norm = 5;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 End of User input, loading files                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% The code below creates the different filenames that will be loaded
fileToLoad_ng = [filename  '.ng.dat'];
fileToLoad_bs = [filename  '.bs.dat'];
fileToLoad_rho_first = [filename  '.rho.first-row.dat'];
fileToLoad_gamma_first = [filename  '.gamma.first-row.dat'];
fileToLoad_rho_second = [filename  '.rho.second-row.dat'];
fileToLoad_gamma_second = [filename  '.gamma.second-row.dat'];
fileToLoad_rho_third = [filename  '.rho.third-row.dat'];
fileToLoad_gamma_third = [filename  '.gamma.third-row.dat'];


%The code below creates the filenames used to save the pictures
fileToSave_ng = [filename '_ng.fig'];
fileToSave_ng_k = [filename '_ng_k.fig'];
fileToSave_bs = [filename '_bs.fig'];
fileToSave_loss = [filename '_loss.fig'];
fileToSave_loss_ns = [filename '_loss_ns.fig'];
fileToSave_loss_ns_nm = [filename '_loss_ns_vs_lambda.fig'];
fileToSave_rho_contributions = [filename '_rho_contributions'];
fileToSave_rho_contributions_k = [filename '_rho_contributions_k'];


% Imports the Group index file
visual_output = ['Loading file ' fileToLoad_ng]
rawData1 = importdata(fileToLoad_ng);

% For some simple files (such as a CSV or JPEG files), IMPORTDATA might
% return a simple array.  If so, generate a structure so that the output
% matches that from the Import Wizard.
[unused,name] = fileparts(fileToLoad_ng);
newData1.(genvarname(name)) = rawData1;

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
end


 k = rawData1(:,1);  %reads the wavevector from the input data
 freq = rawData1(:,2); %reads the frequency from the input data
 ng = rawData1(:,3); %reads the group index from the input data
 
 clear rawData1
 

 % Imports rho first
visual_output = ['Loading file ' fileToLoad_rho_first]
rawData1 = importdata(fileToLoad_rho_first);

% For some simple files (such as a CSV or JPEG files), IMPORTDATA might
% return a simple array.  If so, generate a structure so that the output
% matches that from the Import Wizard.
[unused,name] = fileparts(fileToLoad_rho_first);
newData1.(genvarname(name)) = rawData1;

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
end

rho_first = rawData1.data; % reads the rho values (backscatter loss)

 clear rawData1

 % Imports rho second
visual_output = ['Loading file ' fileToLoad_rho_second]
rawData1 = importdata(fileToLoad_rho_second);

% For some simple files (such as a CSV or JPEG files), IMPORTDATA might
% return a simple array.  If so, generate a structure so that the output
% matches that from the Import Wizard.
[unused,name] = fileparts(fileToLoad_rho_second);
newData1.(genvarname(name)) = rawData1;

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
end

rho_second = rawData1.data; % reads the rho values (backscatter loss)

 clear rawData1
 
% Imports rho third row
visual_output = ['Loading file ' fileToLoad_rho_third]
rawData1 = importdata(fileToLoad_rho_third);

% For some simple files (such as a CSV or JPEG files), IMPORTDATA might
% return a simple array.  If so, generate a structure so that the output
% matches that from the Import Wizard.
[unused,name] = fileparts(fileToLoad_rho_third);
newData1.(genvarname(name)) = rawData1;

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
end

rho_third = rawData1.data; % reads the rho values (backscatter loss)

 clear rawData1
  
% Imports gamma first row
visual_output = ['Loading file ' fileToLoad_gamma_first]
rawData1 = importdata(fileToLoad_gamma_first);

% For some simple files (such as a CSV or JPEG files), IMPORTDATA might
% return a simple array.  If so, generate a structure so that the output
% matches that from the Import Wizard.
[unused,name] = fileparts(fileToLoad_gamma_first);
newData1.(genvarname(name)) = rawData1;

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
end

gamma_first = rawData1.data; %reads the value for gamma (out of plane loss)

clear rawData1
 
% Imports gamma second row
visual_output = ['Loading file ' fileToLoad_gamma_second]
rawData1 = importdata(fileToLoad_gamma_second);

% For some simple files (such as a CSV or JPEG files), IMPORTDATA might
% return a simple array.  If so, generate a structure so that the output
% matches that from the Import Wizard.
[unused,name] = fileparts(fileToLoad_gamma_second);
newData1.(genvarname(name)) = rawData1;

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
end

gamma_second = rawData1.data; %reads the value for gamma (out of plane loss)

clear rawData1
 
% Imports gamma third row
visual_output = ['Loading file ' fileToLoad_gamma_third]
rawData1 = importdata(fileToLoad_gamma_third);

% For some simple files (such as a CSV or JPEG files), IMPORTDATA might
% return a simple array.  If so, generate a structure so that the output
% matches that from the Import Wizard.
[unused,name] = fileparts(fileToLoad_gamma_third);
newData1.(genvarname(name)) = rawData1;

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
end

gamma_third = rawData1.data; %reads the value for gamma (out of plane loss)

clear rawData1

% Imports the bandstructure
visual_output = ['Loading file ' fileToLoad_bs]
rawData1 = importdata(fileToLoad_bs);

% For some simple files (such as a CSV or JPEG files), IMPORTDATA might
% return a simple array.  If so, generate a structure so that the output
% matches that from the Import Wizard.
[unused,name] = fileparts(fileToLoad_bs);
newData1.(genvarname(name)) = rawData1;

% Create new variables in the base workspace from those fields.
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
end

%reading in the bandstrucutre matrix (column 1 is k values, other columns
%are frequency values)
bandstructure = rawData1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               end of input, start of calculations                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% converting frequency to wavelength
lambda = a./freq;

%incoherent addition of gamma and rho
rho = rho_first + rho_second + rho_third;
gamma = gamma_first + gamma_second + gamma_third;

%Calculating the predicted loss per unit length 
loss = c1*ng.*gamma + c2*(ng.^2).*rho; 

%Calculating the predicted loss per unit time 
loss_time = 30*loss./(abs(ng)-ng_norm);
% The 30 comes from c = 3e8m/s, i.e  3e10cm/s which is 30cm/ns

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      end of caclulations, start of plotting and saving files            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Plotting (and saving) the group index curve
figure(1)
plot(lambda(1:19), ng(1:19), '-x'), hold on
plot(lambda(1:19), abs(ng(1:19)), '-xr')
xlabel('wavelength in nm');
ylabel('Group index');
legend('ng', '|ng|')
title(filename);
saveas(1, fileToSave_ng);

%Plotting (and saving) the bandstructure
figure(2)
plot(k, bandstructure), hold on
xlabel('k in 2\pi/a');
ylabel('frequency');
title(filename);
saveas(2, fileToSave_bs);

%Plotting (and saving) the loss against group index
figure(3)
plot(abs(ng(1:19)), loss(1:19), '-x'), hold on
xlabel('modulus of Group index');
ylabel('loss in dB/cm');
title(filename);
saveas(3, fileToSave_loss);

%Plotting (and saving) the loss per unit time against group index
figure(4)
plot(abs(ng(1:19)), loss_time(1:19), '-x'), hold on
xlabel('modulus of Group index');
ylabel('loss in dB/ns');
title(filename);
saveas(4, fileToSave_loss_ns)

%Plotting (and saving) the loss  against wavelength
figure(5)
plot(lambda(1:19), loss(1:19), '-x'), hold on
xlabel('Wavelength in nm');
ylabel('loss in dB/ns');
title(filename);
saveas(5, fileToSave_loss_ns_nm)

%Plotting (and saving) the contribution of different rows
figure(6)
plot(abs(ng(1:19)), rho(1:19), 'r'), hold on
plot(abs(ng(1:19)), rho_first(1:19), 'b');
plot(abs(ng(1:19)), rho_second(1:19), 'g');
plot(abs(ng(1:19)), rho_third(1:19), 'k');
xlabel('modulus of Group index');
ylabel('rho a.u.')
title(filename)
legend('sum', 'first', 'second', 'third')
saveas(6, fileToSave_rho_contributions)

%Plotting (and saving) the contribution of different rows against k figure(6)
figure(7)
plot(k, rho, 'r'), hold on
plot(k, rho_first, 'b');
plot(k, rho_second, 'g');
plot(k, rho_third, 'k');
xlabel('k in 2\pi/a');
ylabel('rho a.u.')
title(filename)
legend('sum', 'first', 'second', 'third')
saveas(7, fileToSave_rho_contributions_k)

%Plotting (and saving) the group index curve
figure(8)
plot(k(1:19), ng(1:19), '-x'), hold on
plot(k(1:19), abs(ng(1:19)), '-xr')
xlabel('k in 2\pi/a');
ylabel('Group index');
legend('ng', '|ng|')
title(filename);
saveas(8, fileToSave_ng_k);

