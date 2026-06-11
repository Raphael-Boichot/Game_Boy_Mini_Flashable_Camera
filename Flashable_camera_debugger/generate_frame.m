function generate_frame(vec, label, filename, is_first)
    % Decode and map intensities
    output = decode(vec);
    C = unique(imread('upscaled.png')); C = C(:)';
    d = zeros(112, 128);
    d(output==0) = C(4); % White
    d(output==1) = C(3); % Lgray
    d(output==2) = C(2); % Dgray
    d(output==3) = C(1); % Black
    
    % Upscale and display
    d_resized = uint8(imresize(d, 8, 'nearest'));
    
    % --- Remove border ---
    imshow(d_resized, gray(256), 'Border', 'tight'); 
    % Setting axes to tight removes the default padding
    ax = gca;
    ax.Position = [0 0 1 1];
    ax.Visible = 'off';
    
    % Add Green Text Overlay
    text(20, 30, label, 'Color', 'g', 'FontSize', 30, 'FontWeight', 'bold');
    
    % Capture and save
    frame = getframe(gcf);
    imind = frame2im(frame);
    [imind, cm] = rgb2ind(imind, 256);
    
    if is_first, imwrite(imind, cm, filename, 'gif', 'Loopcount', inf, 'DelayTime', 1);
    else, imwrite(imind, cm, filename, 'gif', 'WriteMode', 'append', 'DelayTime', 1); end
end