function get_rp_files(runs)
for i = 1:size(runs)
    % for each run
    run = runs{i};
    % get rp file name
    rp = dir([run.path filesep 'rp*.txt']);
    % if no rp file, skip
    if isempty(rp)
       warning(['no rp file found in ', run.path]);
       continue;
    end
    % add the rp matrix to the run 
    run.add_associated_matrix('rp', [run.path filesep rp.name]);
end
end
