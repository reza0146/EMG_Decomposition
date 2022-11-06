function ax = firing_strength_plot(ax, results, fs , mu_index)

peak_indices = results.MUPulses{mu_index};

duration = (size(results.x_flat_dis_fil_cr,2)-1)/fs;

strength = mean(results.x_flat_dis_fil_cr.^2,1);
strength = strength(peak_indices);

time = (peak_indices-1)/fs;

stem(ax, time, strength);
ylabel(ax,"Signal (A.U.)")
xlabel(ax,"Time (s)")
xlim(ax,[0 duration])

end