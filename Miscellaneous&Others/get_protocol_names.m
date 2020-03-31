function protocol_names = get_protocol_names(ProtocolsFile,ProcessingSTep,MRIModality)

%% Vassilis Palassopoulos
% Converted into a MATLAB wrapper

% convert input to python type
py_ProtocolsFile = py.str(ProtocolsFile);
py_ProcessingSTep = py.str(ProcessingSTep);
py_MRIModality = py.str(MRIModality);
% run python
py_protocol_names = py.mymod.get_protocol_names(py_ProtocolsFile, py_ProcessingSTep, py_MRIModality);
% convert output to matlab type
protocol_names = char(cellstr(cellfun(@string, cell(py_protocol_names))));

end