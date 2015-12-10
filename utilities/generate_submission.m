function generate_submission(labels, name)
%% Default name is empty
if nargin<2
    name = '';
else
    name = ['_', name];
end

%% Make cell
firstcol_ids = arrayfun(@num2str, (1001:1400).', 'UniformOutput', false);
firstcol = cellfun(@(x) ['ID', x], firstcol_ids, 'UniformOutput', false);
secondcol = arrayfun(@num2str, labels, 'UniformOutput', false);
csv_cell = [firstcol, secondcol];
csv_cell = cat(1, {'ID', 'TARGET'}, csv_cell);

%% Write to path
date_str = datestr(now(),'yy-mm-dd');
file_path = ['submissions/', date_str, name, '.csv'];
delimiter = ';';
cell2csv(file_path, csv_cell, delimiter);
end

