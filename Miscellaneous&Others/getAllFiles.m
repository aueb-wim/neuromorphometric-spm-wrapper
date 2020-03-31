function fileList = getAllFiles(dirName)

%% Vassilis Palassopoulos
% Converted into a MATLAB wrapper

% convert input to python type
py_dirName = py.str(dirName);
% run python
py_fileList = py.mymod.getAllFiles(py_dirName);
% convert output to matlab type
fileList = cellstr(cellfun(@string, cell(py_fileList)'));

end