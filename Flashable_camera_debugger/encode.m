function GB_tile = encode(img)
    % Encodes image to Game Boy tile format
    GB_tile = zeros(1, 3584);
    pos = 1;
    C = unique(img);
    Black = C(1); Dgray = C(2); Lgray = C(3); White = C(4);
    for y = 1:14
        for x = 1:16
            block = img(((y-1)*8+1:y*8), ((x-1)*8+1:x*8));
            for i = 1:8
                V1 = zeros(1,8); V2 = zeros(1,8);
                for j = 1:8
                    if block(i,j) == Black;  val = 3;
                    elseif block(i,j) == Dgray; val = 2;
                    elseif block(i,j) == Lgray; val = 1;
                    else val = 0; end 
                    V1(j) = bitget(val, 1);
                    V2(j) = bitget(val, 2);
                end
                GB_tile(pos) = bin2dec(num2str(V1)); pos = pos + 1;
                GB_tile(pos) = bin2dec(num2str(V2)); pos = pos + 1;
            end
        end
    end
end