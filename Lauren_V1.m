%% Homework 5 - Lauren Saunders & Meredith Bache-Wiig

%% Problem 1

% a
NMfull = readtable('Neonatal_mortality.xlsx', 'ReadVariableNames', true,...
     'ReadRowNames', true);

years = xlsread('Neonatal_mortality.xlsx', 'ObservationData', 'BB1:CA1')

%%
NMnew = NMfull(1:225, :);
NMdata = NMnew(:, 53:end);

units = transpose(table2cell(NMnew(:,52)));
NMdata.Properties.VariableUnits = units(1,1:26);

% there are 194 countries (out of 225 evaluated regions)
% units are "per 1,000 live births"

%% 

fields = fieldnames(NMfull); 

yearfields = find(strncmp(fields, 'x', 1));

years = zeros(size(yearfields));

for i = 1:numel(years),
    varname = fields{yearfields(i)};
    years(i) = str2double(varname(2:5));
    %fills the vector wth the 2nd thru 5th values of the string
end;
display(years);