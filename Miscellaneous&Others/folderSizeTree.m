function sizeTree = folderSizeTree(directory)

%FOLDERSIZETREE - Calculate total size of sub-folders recursively
%
%	usage:	sizeTree = folderSizeTree(directory)
%	The function scans all subfolders of given "directory", and returns
%	a list of all subfolders and their size.
%	The size of a folder is the sum of all its files size + sum of all its
%	subfolders size.
%
%	returned value is a struct of 3 coordinated cells:
%		sizeTree.name => list of all subfolders.
%		sizeTree.size => size of each subfolder.
%		sizeTree.level => level of each subfolder. 0 is given folder.
%								1 is one level deep etc.
%
%	Copyright: Yanai Ankri, November 2010 from MATLAB Central Webpage ...

%% Vassilis Palassopoulos
% Converted into a MATLAB wrapper

% convert input to python type
py_directory = py.str(directory);
% run python
py_res = py.mymod.folderSizeTree(py_directory);
% convert output to matlab type
py_name = py_res{1};
py_size = py_res{2};
py_level = py_res{3};
name = cellstr(cellfun(@string, cell(py_name)));
size = num2cell(cellfun(@int64, cell(py_size)));
level = num2cell(cellfun(@int64, cell(py_level)));
sizeTree.name = name;
sizeTree.size = size;
sizeTree.level = level;

end
