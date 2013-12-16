d = imread('e18data.jpg');
m_red = mean(mean(d(:,:,1))) / 255 * 100;
m_green = mean(mean(d(:,:,2))) / 255 * 100;
m_blue = mean(mean(d(:,:,3))) / 255 * 100;