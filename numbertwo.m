clc;
clear;

% Creating an empty structure array with the desired attributes
groupMembers = struct('name', {}, ...
                      'age', {}, ...
                      'homeDistrict', {}, ...
                      'village', {}, ...
                      'religion', {}, ...
                      'course', {}, ...
                      'tribe', {}, ...
                      'interests', {}, ...
                      'facialRepresentation', {});

disp('Step 1: Empty structure "groupMembers" created.');


% Step 2: Adding Information for Each Group Member

groupMembers(1).name = ' Lugunga Timothy';
groupMembers(1).age = 21;
groupMembers(1).homeDistrict = 'Eastern District';
groupMembers(1).village = 'Namutumba';
groupMembers(1).religion = 'Christianity';
groupMembers(1).course = 'AMI';
groupMembers(1).tribe = 'musoga';
groupMembers(1).interests = {'Programming , football'};
groupMembers(1).facialRepresentation = 'Has no beard';
groupMembers(2).name = 'NAMATA LILLIAN KIZZA';
groupMembers(2).age = 23;
groupMembers(2).homeDistrict = 'central District';
groupMembers(2).village = 'Pinecrest';
groupMembers(2).religion = 'Christianity';
groupMembers(2).course = 'MEB';
groupMembers(2).tribe = 'muntoro';
groupMembers(2).interests = { 'Robotics'};
groupMembers(2).facialRepresentation = 'Wears glasses';
groupMembers(3).name = 'KATUSIIME JOEL';
groupMembers(3).age = 22;
groupMembers(3).homeDistrict = 'Western District';
groupMembers(3).village = 'nyamitanga';
groupMembers(3).religion = 'none';
groupMembers(3).course = 'WAR';
groupMembers(3).tribe = 'mukiga';
groupMembers(3).interests = {'Cars'};
groupMembers(3).facialRepresentation = 'Has a scar on the left cheek';                  % Member 4
groupMembers(4).name ='NANDIJJA LAILA'; groupMembers(4).age=22
groupMembers(4).homeDistrict = 'Western District';
groupMembers(4).village = 'katete';
groupMembers(4).religion = 'muslim';
groupMembers(4).course = 'WAR';
groupMembers(4).tribe = 'muganda';
groupMembers(4).interests = { 'Hiking'};
groupMembers(4).facialRepresentation = 'Has big chicks';
groupMembers(5).name = 'SIDENYA KEVIN';
groupMembers(5).age = 23;
groupMembers(5).homeDistrict = 'Northern District';
groupMembers(5).village = 'kwegil';
groupMembers(5).religion = 'Buddhism';
groupMembers(5).course ='WAR';
groupMembers(5).tribe = 'acholi';
groupMembers(5).interests = {'Reading'};
groupMembers(5).facialRepresentation = 'Wears glasses';
groupMembers(6).name = 'NAZIWA PATRICIA';
groupMembers(6).age = 20;
groupMembers(6).homeDistrict = 'Western District';
groupMembers(6).village = 'kotiti';
groupMembers(6).religion = 'PENTACOSTAL';
groupMembers(6).course = 'PTI';
groupMembers(6).tribe = 'musoga';
groupMembers(6).interests = {'preaching'};
groupMembers(6).facialRepresentation = 'Has a dimple on the left cheek';              
groupMembers(7).name = 'NABUKWASI SHAKIRA';
groupMembers(7).age = 23;
groupMembers(7).homeDistrict = 'Eastern District';
groupMembers(7).village = 'waki';
groupMembers(7).religion = 'muslim';
groupMembers(7).course = 'WAR';
groupMembers(7).tribe = 'mugisu';
groupMembers(7).interests = {'listening to Music'};
groupMembers(7).facialRepresentation = 'has long hair and nose';
groupMembers(8).name = 'ODONG ERICK PERRY';
groupMembers(8).age = 23;
groupMembers(8).homeDistrict = 'Northern District';
groupMembers(8).village = 'uphill';
groupMembers(8).religion = 'Buddhism';
groupMembers(8).course = 'WAR';
groupMembers(8).tribe = 'Langi';
groupMembers(8).interests = {'Reading'};
groupMembers(8).facialRepresentation = 'has small nose';
groupMembers(9).name = 'BAHEMUKA GODWINS';
groupMembers(9).age = 31;
groupMembers(9).homeDistrict = 'central District';
groupMembers(9).village = 'viva';
groupMembers(9).religion = 'Christianity';
groupMembers(9).course = 'APE';
groupMembers(9).tribe = 'mugisu';
groupMembers(9).interests = {'driving'};
groupMembers(9).facialRepresentation = 'Has a bold head ';
groupMembers(10).name = 'BULUMA DANIEL';
groupMembers(10).age = 24;
groupMembers(10).homeDistrict = 'Eastern District';
groupMembers(10).village = 'bondokolo';
groupMembers(10).religion = 'Christianity';
groupMembers(10).course = 'AMI';
groupMembers(10).tribe = 'samya';
groupMembers(10).interests = ' riding';
groupMembers(10).facialRepresentation = 'Has a beard';
disp(' Information for members has been added to the variable.');
%  Display the Stored Information
disp('Displaying the contents of the "groupMembers" variable:');
disp(groupMembers);

% Save the Variable to a File
fileName = 'groupData.mat';
save(fileName, 'groupMembers');

disp([' The variable "groupMembers" has been successfully saved to the file "' fileName '".']);
disp('You can load it back anytime using the command: load("groupData.mat")');
%  Creating a Detailed and Expanded Database for Statistical Analysis
clc;
clear;

% -Define possible attributes for random generation ---
names = ["Lugunga Timothy", "NAMATA LILLIAN KIZZA","NANDIJJA LAILA", "KATUSIIME JOEL", "BULUMA DANIEL", "ODONG ERICK PERRY", "BAHEMUKA GODWINS", "NAZIWA PATRICIA", "SIDENYA KEVIN", "NABUKWASI SHAKIRA"];
districts = ["Central District", "Northern District", "Western District", "Southern District", "Eastern District"];
religions = ["Christianity", "Buddhism", "Islam", "None", "Judaism","PENTACOSTAL"];
courses = ["AMI","MEB","PTI","WAR","APE"];
tribes = ["Musoga", "mutoro", "mugisu","langi","acholi","munyankole", "mukiga"];

% Creating the structure 
groupMembers = struct('name', {}, 'age', {}, 'homeDistrict', {}, 'religion', {}, 'course', {}, 'tribe', {});

%  Generating 10 members with random data 
numMembers = 10;
for i = 1:numMembers
    groupMembers(i).name = names(randi(length(names)));
    groupMembers(i).age = randi([18, 32]); 
    groupMembers(i).homeDistrict = districts(randi(length(districts)));
    groupMembers(i).religion = religions(randi(length(religions)));
    groupMembers(i).course = courses(randi(length(courses)));
    groupMembers(i).tribe = tribes(randi(length(tribes)));
end
% saving the detailed dataset
save('groupData.mat', 'groupMembers');

disp(['A detailed database with ', num2str(numMembers), ' members has been created and saved as "groupData.mat".']);
disp('Ready for statistical analysis.');
% Analyze and Visualize Statistical Characteristics 
clc;
clear;
close all;

% Data Loading and Preparation 
disp('Loading and Preparing Data ');
if exist('groupData.mat', 'file')
    load('groupData.mat');
    disp(['Successfully loaded data for ', num2str(length(groupMembers)), ' members.']);
else
    error('"groupData.mat" not found. Please run "create_detailed_database.m" first.');
end
ages = [groupMembers.age];
districts = categorical([groupMembers.homeDistrict]);
religions = categorical([groupMembers.religion]);
courses = categorical([groupMembers.course]);
tribes = categorical([groupMembers.tribe]);
disp('Data has been extracted into individual variables.');

% Descriptive Statistics for Numerical Data (Age) 
disp(' Descriptive Statistics for Age ');

%  Analysing Categorical Data 
disp(' Analysis of Categorical Data ');

% Analysis 1: Home Districts
disp('Home District Distribution ');
[district_counts, district_names] = histcounts(districts);
district_table = table(district_names', district_counts', 'VariableNames', {'District', 'Count'});
disp(district_table);

% Analysis 2: Course Enrollment
disp(' Course Enrollment Distribution ');
[course_counts, course_names] = histcounts(courses);
course_table = table(course_names', course_counts', 'VariableNames', {'Course', 'Count'});
disp(course_table);

% Analysis 3: Tribe Membership
disp('Tribe Membership Distribution ');
[tribe_counts, tribe_names] = histcounts(tribes);
tribe_table = table(tribe_names', tribe_counts', 'VariableNames', {'Tribe', 'Count'});
disp(tribe_table);
disp(' ');

%  Visualize Categorical Data (CORRECTED SECTION) 
disp(' Generating bar and pie charts for categorical data.');
% Bar Chart for Course Enrollment
figure('Name', 'Categorical Data Analysis');
subplot(2, 1, 1);
bar(course_names, course_counts); 
title('Number of Members per Academic Course');
xlabel('Course');
ylabel('Number of Members');
grid on;
% Pie Chart for Tribe Distribution
subplot(2, 1, 2);

pie(tribes);
title('Proportional Distribution of Tribes');
legend(tribe_names, 'Location', 'eastoutside');

% A separate figure for District distribution
figure('Name', 'Geographic Analysis');
barh(district_names, district_counts); 
title('Geographic Distribution of Members by Home District');
xlabel('Number of Members');
ylabel('District');
grid on;

disp('All analyses and visualizations are complete.');
