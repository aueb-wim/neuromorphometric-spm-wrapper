function FolderNames = getListofFolders(InputFolder,sortflag)

%% Vassilis Palassopoulos
% Converted into a MATLAB wrapper

% convert input to python type
py_InputFolder = py.str(InputFolder);
% run python
py_FolderNames = py.mymod.getListofFolders(py_InputFolder);
% convert output to matlab type
FolderNames = cellstr(cellfun(@string, cell(py_FolderNames)'));

end