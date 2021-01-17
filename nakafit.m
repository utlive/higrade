function param = nakafit(data)
param(1) = mean(data(:));
param(2) = (mean(data(:))./std(data(:))).^2;
end