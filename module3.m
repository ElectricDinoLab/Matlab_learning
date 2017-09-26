% module 3
% here we'll introduce for loops for subjects & specific ROIs 
% instead of working on just one subject's connectome, we'll look at multiple connectomes
% this means we have to import a list of subjects, assign a variable to that list, 
% and then loop over that variable so that each subject is looked at.

% We'll start with just 3 subjects to keep it simple
subjects = {'35014', '35106','35136'};


% we'll load a tract atlas we created which contains information on
% number of streamlines/region from two atlases
load tract_groups_mar17_471_atlas.mat
    
    % we're interested in 20 specific tract groups, so we loop over each one.
    for i = 1:20
        
        for j = 1:size(subjects,2)
                
            % load the connectome matrices. we will reference the directory where they are. 
            % the "%s" is basically a placeholder for the subject numbers.
            % after we type out the location, we type "subjects{j}" however many times "%s" was referenced so 
            % matlab knows what to put into the "%s" placeholder.
            subject_connectome_file = sprintf('/Volumes/Cabeza/MemEX.01/Data/SHIBA_INU/%s/DWI/Processing/connectome_%s_471_seed_image_NOACT.csv', subjects{j}, subjects{j});

            % ok, now we need to use 'dlmread' to actually get the connectome
            subject_connectome = dlmread(subject_connectome_file);

            % make connectome values occupy entire square
            subject_full_connectome = subject_connectome + subject_connectome.';
            % un-double diagonal values
            subject_full_connectome(1:size(subject_full_connectome,1)+1:end) = diag(subject_connectome);
            
            % create a new variable that includes all elements of x & y
            % positions, but only 1 through 20 of z elements (denoted by i
            % at the start of the for loop)
            tract_groups_filter = squeeze(tract_atlas471(:,:,i));
            
            % we multiply by .* to multiply the two arrays element by element
            filtered_connectome = tract_groups_filter .* subject_full_connectome;
            
            % create new variable by reshaping 'filtered_connectome' so we
            % can take mean of one vector. otherwise if we took the mean of
            % the matrix it would only sum by columns, but we want it by
            % rows and columns. could also do
            % mean(mean(filtered_connectome)). 
            
            a = reshape(filtered_connectome,(size(tract_groups_filter,1)*size(tract_groups_filter,1)),1);
            TG_DTI_471(j,i) = nanmean(a(a~=0));
        end

    fprintf('Finished with TG %d\n', i);
    
    end

    % generating info to be put into SEM analysis
   
% this is one part of a larger script which aims to pass structural and functional connectomes through a certain kind of filter (tract groups).
% then, we take mean of filtered connectograms so there's 1 value per tract per subject. this allows us to make inferences about specific tract groups 
% & how they relate to white matter/functional connectivity, which then can tell us how those two aspects relate to memory.

    
