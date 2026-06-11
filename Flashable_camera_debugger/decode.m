function GB_pixels = decode(GB_tile)
    % Decodes Game Boy tile format
    PACKET_image_width = 128;
    PACKET_image_height = 112;
    PACKET_image = zeros(PACKET_image_height, PACKET_image_width);    
    pos = 1;
    tile_count = 0;
    row_offset = 1;
    col_offset = 1;
    while tile_count < 224
        tile = zeros(8,8);
        for i = 1:8
            byte1 = dec2bin(GB_tile(pos), 8);
            pos = pos + 1;
            byte2 = dec2bin(GB_tile(pos), 8);
            pos = pos + 1;
            for j = 1:8
                tile(i,j) = bin2dec([byte2(j), byte1(j)]);
            end
        end
        PACKET_image(row_offset:(row_offset+7), col_offset:(col_offset+7)) = tile;
        tile_count = tile_count + 1;
        col_offset = col_offset + 8;
        if col_offset > PACKET_image_width
            col_offset = 1;
            row_offset = row_offset + 8;     
        end
    end
    GB_pixels = PACKET_image;
end