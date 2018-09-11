#!MC 1410
$!VarSet |MFBD| = 'C:\Users\farshad\Desktop\TECPLOT_FILES\Kim_Moin'
$!EXTENDEDCOMMAND 
  COMMANDPROCESSORID = 'Extract Precise Line'
  COMMAND = 'XSTART = 0 YSTART = 0 ZSTART = 0 XEND = 20 YEND = 0 ZEND = 0 NUMPTS = 400 EXTRACTTHROUGHVOLUME = F EXTRACTTOFILE = T EXTRACTFILENAME = \'C:\Users\farshad\Desktop\TECPLOT_FILES\Kim_Moin\extract_data_files\k_e.dat\' '
$!RemoveVar |MFBD|
