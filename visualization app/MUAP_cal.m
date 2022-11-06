function MUAP_all = MUAP_cal(results, raw, l)

chan = size(raw, 1);

MUPulses = results.MUPulses; % cell array containing the motor unit indices for each identified MU

MUAP_all = cell(1, numel(MUPulses));

for mu_index = 1:numel(MUPulses)

    peak_indices = MUPulses{mu_index}; % array containing the firing indices for MU number mu_index

    MUAP_indices = zeros(length(peak_indices), 2*l+1);

    for i = 1:length(peak_indices)
        val = peak_indices(i);
        MUAP_indices(i,:) = (val-l):(val+l);
    end

    MUAP_indices = reshape(MUAP_indices, [1 length(peak_indices)*(2*l+1)]);

    if any(MUAP_indices < 0)
        MUAP_indices(MUAP_indices < 0) = 0;
        warning("Negative indice was found for MUAP indices!")
    end

    if any(MUAP_indices >  size(raw, 2))
        MUAP_indices(MUAP_indices > size(raw, 2)) = size(raw,2);
        warning("MUAP indices larger than the raw sample number were found!")
    end

    MAUPs = reshape(raw(:, MUAP_indices),[chan length(peak_indices) 2*l+1]);
    MUAPs = mean(MAUPs, 2);
    MUAPs = squeeze(MUAPs);
    MUAP_all{mu_index} = MUAPs;
end

end