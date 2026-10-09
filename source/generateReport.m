function generateReport()
%GENERATEREPORT Generate a summary report file from dayofyear calculations.

dates = ["01/01/2021", "06/15/2021", "12/31/2021", ...
         "01/01/2020", "06/15/2020", "12/31/2020"];

results = strings(numel(dates), 1);
for i = 1:numel(dates)
    doy = dayofyear(dates(i));
    results(i) = dates(i) + " -> day " + doy;
end

pause(10);

writelines(results, fullfile("output", "report.txt"));
end
