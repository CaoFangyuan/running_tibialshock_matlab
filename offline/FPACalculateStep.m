function FPAStep = FPACalculateStep(FPAStride, state)
state_STANCE = 1;
for i =1:length(state)
    if state(i) == state_STANCE;
        flag_heelStride = i;
        break
    end
end
L = length(FPAStride);
L_stance = L-flag_heelStride;
L20 = round(flag_heelStride+L_stance*0.2);
L80 = round(flag_heelStride+L_stance*0.8);
FPAStep = mean(FPAStride(L20:L80));
end
