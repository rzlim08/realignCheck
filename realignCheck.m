function mv_table = realignCheck(plot, niftifs, filename, threshold_trans, threshold_rot)
if nargin < 4
    threshold_trans = 3;
    threshold_rot = 3;
end
if nargin < 3
    threshold_trans = 3;
    threshold_rot = 3;
    filename = 'realign_params';
end
runs = niftifs.subject_array.get_runs;
mv_arr = struct();


for i = 1:size(runs)
    run = runs{i};
    rp_file = run.get_associated_matrix('rp');
    mv_p = load(rp_file); % get movement parameters
    mv_p(:,4:6)=rad2deg(mv_p(:,4:6)); %converts radians to degrees    
    n_scans_trans = sum(any(abs(mv_p(:, 1:3))>threshold_trans, 2));
    n_scans_rot = sum(any(abs(mv_p(:, 4:6))>threshold_rot, 2));
    mv_arr(i).n_scans_trans = n_scans_trans;
    mv_arr(i).n_scans_rot = n_scans_rot;
    mv_arr(i).max_trans = max(abs(mv_p(:,1:3)));
    mv_arr(i).max_rot = max(abs(mv_p(:,4:6)));
    mv_arr(i).name = run.name;
    mv_arr(i).path = run.path;
    mv_arr(i).rp_file = rp_file;

end
if plot
   plotRealign(runs, filename, threshold_trans, threshold_rot)
end


mv_table = struct2table(mv_arr);

end