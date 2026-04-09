import pydicom
import numpy as np
import os

def get_plane_type(dicom_path):
    ds = pydicom.dcmread(dicom_path, stop_before_pixels=True)
    
    desc = ds.get("SeriesDescription", "").lower()
    if "4ch" in desc or "hla" in desc: return "4CH"
    if "2ch" in desc or "vla" in desc: return "2CH"
    
    # Calcolo geometrico se la descrizione è ambigua
    if "ImageOrientationPatient" in ds:
        iop = np.array(ds.ImageOrientationPatient, dtype=float)
        # I primi 3 sono il vettore riga, gli ultimi 3 il vettore colonna
        row_vec = iop[:3]
        col_vec = iop[3:]
        
        # Prodotto vettoriale per ottenere la normale al piano
        normal_vec = np.cross(row_vec, col_vec)
        
        # Prendiamo il valore assoluto della componente Z (indice 2)
        abs_z = abs(normal_vec[2])
        
        # SOGLIA EMPIRICA: 
        # Le viste 4CH sono più "orizzontali" (tipo assiali), quindi hanno Z alto (>0.5).
        # Le viste 2CH sono "verticali", quindi hanno Z basso (<0.5).
        if abs_z > 0.5:
            return "Probabile 4CH (HLA)"
        else:
            return "Probabile 2CH (VLA)"
            
    return "Sconosciuto"

root_dir = os.path.join("..", "data", "sb301","DICOMS")
for root, dirs, files in os.walk(root_dir):
    for file in files:
        if file.endswith(".dcm"):
            path = os.path.join(root, file)
            tipo = get_plane_type(path)
            print(f"{os.path.basename(root)} -> {tipo}")
            break # Basta controllare un file per serie