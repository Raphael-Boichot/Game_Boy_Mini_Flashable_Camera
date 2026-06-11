clc; clear; close all;

% Load image
a = imread('upscaled.png');
a = a(:,:,1); 
encoded_data = encode(a);
filename = 'Glitch_Simulation.gif';
fig = figure('Visible', 'off'); 

% --- 1. Data Line Faults (D0-D7) ---
for bit_index = 0:7
    % Force the specific data line bit to 0
    glitchy_vector = bitand(uint8(encoded_data), bitcmp(uint8(bitshift(1, bit_index)), 'uint8'));
    generate_frame(glitchy_vector, sprintf('Cold solder on RAM-D%d', bit_index), filename, bit_index == 0);
end

% --- 2. Address Line Faults (A16-A05) ---
% covers the range required for 3584 bytes (2^12 = 4096)
for addr_bit = 0:11
    faulty_vector = zeros(1, 3584, 'uint8');
    % Create fault map: force bit addr_bit of the address to 0
    mask = bitcmp(uint16(bitshift(1, addr_bit)), 'uint16');
    for i = 0:3583
        faulty_addr = bitand(i, mask);
        faulty_vector(i+1) = encoded_data(faulty_addr + 1);
    end
    generate_frame(faulty_vector, sprintf('Cold solder on RAM-A%d', 16-addr_bit), filename, false);
end

close(fig);
disp('Animation generated: Glitch_Simulation.gif');

