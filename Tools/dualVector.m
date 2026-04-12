function dv = dualVector(x)
% DUALVECTOR Calcola i vettori duali (i bordi delle celle) per un vettore di coordinate 1D.
% Restituisce un vettore di lunghezza N+1 contenente i punti medi.
% Sostituto in puro MATLAB per il file MEX obsoleto (dualVector.mexw64).

    if isempty(x)
        dv = [];
        return;
    end
    
    if isscalar(x)
        dv = [x - 0.5, x + 0.5];
    else
        x_col = x(:);
        midpoints = (x_col(1:end-1) + x_col(2:end)) / 2;
        first_edge = x_col(1) - (x_col(2) - x_col(1)) / 2;
        last_edge = x_col(end) + (x_col(end) - x_col(end-1)) / 2;
        dv = [first_edge; midpoints; last_edge];
    end
    
    % Ripristina l'orientamento originale (riga o colonna)
    if isrow(x)
        dv = dv.';
    end
end
