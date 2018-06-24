
function get_rp_files4D(runs)

for i = 1:size(runs)
    % For each run 
    run = runs{i};
    run_path = fileparts(run.path);
    % Find RP file, assumes that it's in the run path    
    rp = dir([run_path filesep 'rp*.txt']);
    % If the rp file is not in the run path
    if isempty(rp)
       warning(['no rp file found in ', run_path]);
       continue;
    end
    % use the add associated matrix property to add RP to run. 
    run.add_associated_matrix('rp', [run_path filesep rp.name]);
end
end
