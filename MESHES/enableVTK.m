function enableVTK

  try
    evalc( 'vtkPolyDataReader()' );
    return;
  catch
    switch computer
      case 'PCWIN64'

        Ds = { ...
               fullfile( fileparts(which('enableVTK')) , 'vtk' , 'w64' )    ...
               fullfile( fileparts(which('enableVTK')) , 'vtk' , 'w64_mt' ) ...
             };
             
        for d = 1:numel(Ds)
          if isdir( Ds{d} )
            setenv( 'path' , [ getenv('path') , ';' , Ds{d} ] ); 
          end
          try
            evalc( 'vtkPolyDataReader()' );
            break;
          end
        end
      
      case 'PCWIN32'
        setenv( 'path' , [ getenv('path') , ';' , fullfile( fileparts(which('enableVTK')) , 'vtk' , 'w32' ) ] );

       case 'MACI64'
        setenv( 'path' , [ getenv('path') , ';' , fullfile( fileparts(which('enableVTK')) , 'vtk' , 'maci64' ) ] );
        
      case 'GLNXA64'
          fprintf('linux system recognized')
        vtkPath = '/home/federico/vtk/install/lib';

        % Append to LD_LIBRARY_PATH and PATH if we found candidates
          existing = getenv('LD_LIBRARY_PATH');
          fprintf(existing)
          if isempty(existing)
            setenv('LD_LIBRARY_PATH', vtkPath);
          else
            setenv('LD_LIBRARY_PATH', [vtkPath pathsep existing]);
          end
       
        % if ~isempty(binPaths)
        %   existingp = getenv('PATH');
        %   newp = strjoin(binPaths,pathsep);
        %   setenv('PATH', [newp pathsep existingp]);
        % end

        % Try to initialize VTK; fall back to a helpful error if it fails
        try
          evalc( 'vtkPolyDataReader()' );
        catch
         %continue to the final check below which will throw a clear error
        end

        otherwise
          error('cannot enable VTK within a matlab runtime. Ensure VTK is installed and its libraries are on LD_LIBRARY_PATH.')
    end
  end

  try
    evalc( 'vtkPolyDataReader()' );
  catch
    error('VTK couldn''t be enabled.');
  end

end
