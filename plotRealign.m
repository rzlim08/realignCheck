function plotRealign(runs, filename, threshold_trans, threshold_rot)
if nargin < 3
    threshold_trans = 3;
    threshold_rot = 3;
end


for i = 1:size(runs)
    % for each run
    run = runs{i};
    % get rp file, as set by get_rp.m or get_rp4D
    rp_file = run.get_associated_matrix('rp');

    % load motion file
    mv_p = load(rp_file);
    mv_p(:,4:6)=rad2deg(mv_p(:,4:6)); %converts radians to degrees
    
    % create figure, don't show
    f = figure('pos',[10 10 500 500]);set(gcf,'Visible', 'off');
    % create translation subplot
    subplot(2,1,1)
    plot(mv_p(:, 1:3));
    % title and labels

    title([run.path ' - translation'])
    xlabel('scan no');
    ylabel('mm')
    legend('x translation','y translation', 'z translation')
    
    % create rotation subplot
    subplot(2,1,2)
    plot(mv_p(:, 3:6));
    title([run.path ' - rotation'])
    xlabel('scan no');
    ylabel('mm')
    legend('pitch','roll', 'yaw')
    print(filename, '-dpsc', '-append');
    clf(f);
    
end


end
