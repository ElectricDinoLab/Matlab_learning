% devi's training: module 2
% this will import connectomes & show how to manipulate them to show only specific portions based on location or thresholding.



% import a specific connectome
connectome_import = sprintf('/Volumes/Cabeza/MemEX.01/Data/SHIBA_INU/35014/DWI/Processing/connectome_35014_471_seed_image_NOACT.csv');

% create a variable for the connectome & use dlmread to read the csv file
connectome_471 = dlmread(connectome_import);

% visualize the connectome without altering anything about it. colorbar
% provies info on the range of values in the image
imagesc(connectome_471);colorbar

% make it so connectome values occupy entire square (upper triangle is mirrored, rather than by itself)
full_connectome_471 = connectome_471 + connectome_471.';

% diagnoal values in full_connectome have doubled, need to bring them back to original values
full_connectome_471(1:size(full_connectome_471,1)+1:end) = diag(connectome_471);

% visualize new connectome
imagesc(full_connectome_471);colorbar


% sort connectome based on highest number of streamlines
streamline_sort_descend = sort(full_connectome_471, 'descend');
streamline_sort_ascend = sort(full_connectome_471, 'ascend');

% visualize them
imagesc(streamline_sort_descend);colorbar
imagesc(streamline_sort_ascend);colorbar

% we wouldn't actually sort connectomes like this, but it's good to
% practice playing with them.

% thresholding values of full_connectome
threshold_1 = full_connectome_471;
threshold_1(threshold_1<100) = 0;

imagesc(threshold_1);colorbar

% not much of a difference between the original & thresholded one, let's make another
threshold_2 = full_connectome_471;
threshold_2(threshold_2<500) = 0;

imagesc(threshold_2);colorbar

% a few more values in the matrix dropped off, adjust the values as you like & see what happens when you change them

% let's visualize only the diagonal slice of the connectome
imagesc(diag(full_connectome_471));colorbar

% pretty neat! this is showing how many streamlines are in each specific region of interest (ROI) based on a specific atlas we used in our analyses

% now let's import the HOA_100 connectome and make it mirrored like the 471
connectome_import2 = sprintf('/Volumes/Cabeza/MemEX.01/Data/SHIBA_INU/35014/DWI/Processing/connectome_35014_100_seed_image_NOACT.csv');
connectome_100 = dlmread(connectome_import2);
% visualize hoa100 connectome
imagesc(connectome_100);colorbar
% make it so connectome values occupy entire square (upper triangle is mirrored, rather than by itself)
full_connectome_100 = connectome_100 + connectome_100.';

% visualize it again
imagesc(full_connectome_100);colorbar

% diagnoal values in full_connectome have doubled, need to bring them back to original values
full_connectome_100(1:size(full_connectome_100,1)+1:end) = diag(connectome_100);

% and one more visualization
imagesc(full_connectome_100);colorbar

ok, 

