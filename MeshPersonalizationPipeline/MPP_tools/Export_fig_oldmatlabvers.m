function Export_fig( hf , fn , varargin )



  fprintf('exporting picture (figure)...\n' );

  if mppBranch('ct')
%     wNaN = [];
%     for h = findall(hf)'
%       try
%         if any( isnan( get(h,'XData') ) ), wNaN(end+1) = h; continue; end
%         if any( isnan( get(h,'YData') ) ), wNaN(end+1) = h; continue; end
%         if any( isnan( get(h,'ZData') ) ), wNaN(end+1) = h; continue; end
%       end
%     end
    
    delete( findall( hf ,'Visible','off','-not','Type','axes') );
%     set( findall(hf,'Type','line'),'LineWidth',1)

    delete(findall(hf,'Marker','o'));
    delete(findall(hf,'Marker','x'));
%     delete(findall(hf,'LineStyle',':'));
%     delete(findall(hf,'LineStyle','--'));
    set(findall(hf,'Marker','o'),'Marker','x');
  end
  
  
  export_fig( hf , fn , varargin{:} );
  try
      % Nelle versioni recenti di MATLAB (R2020a+), exportgraphics e' la funzione standard
      exportgraphics(hf, fn, 'Resolution', 300);
  catch
      try
          export_fig( hf , fn , varargin{:} );
      catch
          % Fallback di sicurezza infallibile se la figura contiene controlli UI incompatibili
          imwrite(getframe(hf).cdata, fn);
      end
  end
  
  fprintf('Picture (figure) saved in "%s"\n', fn );
end

