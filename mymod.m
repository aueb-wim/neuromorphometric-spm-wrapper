%% Vassilis Palassopoulos
% Helper function for running Python (mymod.py) within MATLAB

function mymod()

mymod = py.importlib.import_module('mymod');
py.importlib.reload(mymod);

end

%clear classes
%if count(py.sys.path,'') == 0
%    insert(py.sys.path,int32(0),'');
%end
