function filesf = pickfiles(directory0,filtand,filtor,filtnot)

%% Vassilis Palassopoulos
% Converted into a MATLAB wrapper

% convert input to python type
py_directory0 = py.str(directory0);

if size(filtand,1) > 1
    filtand = filtand';
end
py_filtand = py.list(filtand);

if nargin > 2
    if size(filtor,1) > 1
        filtor = filtor';
    end
    py_filtor = py.list(filtor);
else
    py_filtor = py.list();
end

if nargin == 4
    if size(filtnot,1) > 1
        filtnot = filtnot';
    end
    py_filtnot = py.list(filtnot);
else
    py_filtnot = py.list();
end
% run python
py_filesf = py.mymod.pickfiles(py_directory0, py_filtand, py_filtor, py_filtnot);

% convert output to matlab type
if int64(py.len(py_filesf)) == 0
    filesf = char();
else
    filesf = char(deblank(cellstr(cellfun(@string, cell(py_filesf)'))));
end

%Not enough input arguments.

%Error in pickfiles (line 9)
%py_filtor = py.list(filtor');

%Error in save_vols_MPMs_globals2csv_plus_sigma (line 62)
%R2s_Image = pickfiles(MPMFolder(1:end-1),{'_R2s.nii'});

%Error in NeuroMorphometric_pipeline (line 96)
%            save_vols_MPMs_globals2csv_plus_sigma(OutputVolumeFile,OutputAtlasFile,SubjectWorkingFolder,OutputCSVFile,c1ImageFileName,c2ImageFileName,c3ImageFileName,TableFormat); 
