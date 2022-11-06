function t = MUAP_plot(t, MUAP_all, mu_index)
%{
This function recieves calculates the motor unit shapes on each channel.
%}



chan = size(MUAP_all{1}, 1);
MUAPs = MUAP_all{mu_index};

t.Padding = "compact";
t.TileSpacing = "compact";
t.GridSize = [ceil(sqrt(chan)) ceil(sqrt(chan))];
ylims = [];
for i = 1:chan
    ax = nexttile(t);
    plot(ax,MUAPs(i,:));
    ax.Box = "off";
    ax.XAxis.Visible = "off";
    ax.Title.String = "Channel " + string(i);
    ylims = [ylims ax.YLim];
end
ylim_max = max(ylims);
ylim_min = min(ylims);
for i = 1:chan
    ax = nexttile(t,i);
    ax.YLim = [ylim_min ylim_max];
end

end