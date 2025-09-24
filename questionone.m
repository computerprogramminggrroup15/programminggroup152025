% loading the dataset file to matlab
filePath = "C:\Users\LUGUNGA TIMOTHY\Desktop\semester 1\coffee sales.xlsx";
group15 = readtable(filePath);

% find year column if it exists and extract Year if Date column exists
if ~ismember('Year', group15.Properties.VariableNames)
    if ismember('Date', group15.Properties.VariableNames)
        group15.Date = datetime(group15.Date);   
        group15.Year = year(group15.Date);       
    else
        error('The dataset must have a Year or Date column.');
    end
end
% finds all the years in the group15 dataset
years = unique(group15.Year);
%  Creating tables and structure arrays for each year
yearlyTables = struct();
yearlyStructs = struct();
for i = 1:length(years)
    yr = years(i);

    % Table for this year
    tbl = group15(group15.Year == yr, :);
    yearlyTables.(sprintf('Y%d', yr)) = tbl;

    % Converting table to struct array
    yearlyStructs.(sprintf('Y%d', yr)) = table2struct(tbl);
end
%saving all yearly tables to one Excell workbook
outputFile = 'Yearly_Data.xlsx';
for i = 1:length(years)
    yr = years(i);
    tbl = yearlyTables.(sprintf('Y%d', yr));
    writetable(tbl, outputFile, 'Sheet', num2str(yr));
end
disp('✅ Yearly data saved to Excel');
% Data visualisation showing all the parameters, patterns ...
%trends and relationships 
for i = 1:length(years)
    yr = years(i);
    tbl = yearlyTables.(sprintf('Y%d', yr));

    % Getting the  numeric columns in group15 dataset
    numericCols = varfun(@isnumeric, tbl, 'OutputFormat', 'uniform');
    numVars = tbl.Properties.VariableNames(numericCols);
    % --- Line plot of first numeric variable ---
    if ~isempty(numVars)
        figure;
        plot(tbl.(numVars{1}), 'k-s',LineWidth=0.5);
        title(['Year ' num2str(yr) ' - Trend of ' numVars{1}]);
        xlabel('Record number');
        ylabel(numVars{1});
        grid on;
        saveas(gcf, ['line_' num2str(yr) '.png']);
        close;
    end
 % --- Bar chart of averages ---
    if ~isempty(numVars)
        figure;
        bar(mean(tbl{:, numericCols}, 'omitnan'));
        set(gca,'XTickLabel', numVars);
        title(['Year ' num2str(yr) ' - Average Values']);
        ylabel('Average');
        grid on;
        saveas(gcf, ['bar_' num2str(yr) '.png']);
        close;
    end
     % --- Scatter plot between first two numeric variables ---
    if numel(numVars) >= 2
        figure;
        scatter(tbl.(numVars{1}), tbl.(numVars{2}), 'filled');
        title(['Year ' num2str(yr) ' - Scatter: ' numVars{1} ' vs ' numVars{2}]);
        xlabel(numVars{1});
        ylabel(numVars{2});
        grid on;
        saveas(gcf, ['scatter_' num2str(yr) '.png']);
        close;
    end
    % --- Histogram of first numeric variable ---
    if ~isempty(numVars)
        figure;
        histogram(tbl.(numVars{1}));
        title(['Year ' num2str(yr) ' - Histogram of ' numVars{1}]);
        xlabel(numVars{1});
        ylabel('Frequency');
        grid on;
        saveas(gcf, ['hist_' num2str(yr) '.png']);
        close;
    end
end
disp('✅ Plots created and saved as images');
