function idx = val2ind(x, v, varargin)
% VAL2IND Trova l'indice del valore più vicino nell'array x per ogni elemento di v.
% Sostituto in puro MATLAB per il file MEX obsoleto (val2ind.mexw64).

    if isempty(v)
        idx = [];
        return;
    end
    
    x_col = x(:);
    
    try
        % Tenta l'approccio super-ottimizzato tramite interpolazione nearest-neighbor
        % (Richiede che x_col sia strettamente monotono, cosa tipica per le griglie I3D)
        idx_raw = interp1(x_col, 1:numel(x_col), v(:), 'nearest', 'extrap');
        idx = reshape(max(1, min(numel(x_col), round(idx_raw))), size(v));
    catch
        % Fallback infallibile tramite matrice delle distanze assolute (broadcasting)
        v_flat = v(:)';
        [~, idx_flat] = min(abs(x_col - v_flat), [], 1);
        idx = reshape(idx_flat, size(v));
    end
end