function ax = firing_rate_plot(ax, results, fs , mu_index)

peak_indices = results.MUPulses{mu_index};

duration = (size(results.x_flat_dis_fil_cr,2)-1)/fs;

hz = [0 (1./diff(peak_indices)*fs)];
time = (peak_indices-1)/fs;

plot(ax, time, hz, '*');
ylabel(ax,"Firing Rate (Hz)")
xlabel(ax,"Time (s)")
xlim(ax,[0 duration])

end

