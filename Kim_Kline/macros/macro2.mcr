#!MC 1410
$!VarSet |MFBD| = 'C:\Users\farshad\Desktop\TECPLOT_FILES\Kim_Moin'
$!EXTENDEDCOMMAND 
  COMMANDPROCESSORID = 'Extract Precise Line'
  COMMAND = 'XSTART = -10 YSTART = 1 ZSTART = 0 XEND = 0 YEND = 1 ZEND = 0 NUMPTS = 200 EXTRACTTHROUGHVOLUME = F EXTRACTTOFILE = T EXTRACTFILENAME = \'C:\Users\farshad\Desktop\TECPLOT_FILES\Kim_Moin\extract_data_files\k_e.dat\' '
$!RemoveVar |MFBD|
