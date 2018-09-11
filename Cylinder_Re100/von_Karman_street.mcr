#!MC 1410
$!VarSet |MFBD| = '/home/seas/fnasiri'
 
$! LOOP 80
  $!VarSet |kk| = |LOOP|
  $!VarSet |kk| *= 10
  $!IF |kk|<10
  $!VarSet |fINDEX| = "000|kk|"
  $!ELSEIF |kk|<100
  $!VarSet |fINDEX| = "00|kk|"
  $!ELSEIF |kk|<1000
  $!VarSet |fINDEX| = "0|kk|"
  $!ELSEIF |kk| < 10000
  $!VarSet |fINDEX| = "|kk|"
  $!ENDIF

$!READDATASET  '"/Users/fnasiri/Desktop/Re100/tec_out-|fINDEX|.plt" '
  READDATAOPTION = NEW
  RESETSTYLE = YES
  VARLOADMODE = BYNAME
  ASSIGNSTRANDIDS = YES


$!READSTYLESHEET  "/Users/fnasiri/Desktop/Re100/streetStyle.sty"
  INCLUDEPLOTSTYLE = YES
  INCLUDETEXT = YES
  INCLUDEGEOM = YES
  INCLUDEAUXDATA = YES
  INCLUDESTREAMPOSITIONS = YES
  INCLUDECONTOURLEVELS = YES
  MERGE = NO
  INCLUDEFRAMESIZEANDPOSITION = NO


$!EXPORTSETUP EXPORTFORMAT = JPEG
$!PRINTSETUP PALETTE = COLOR
$!EXPORTSETUP IMAGEWIDTH = 1295
$!EXPORTSETUP QUALITY = 100
$!EXPORTSETUP EXPORTFNAME = '/Users/fnasiri/Desktop/images/image_|fINDEX|.jpeg'
$!EXPORT
  EXPORTREGION = CURRENTFRAME


 $!ENDLOOP

$!RemoveVar |MFBD|
