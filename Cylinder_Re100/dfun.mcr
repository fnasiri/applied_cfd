#!MC 1400
$!VarSet |MFBD| = '/home/seas/fnasiri'
 
$! LOOP 400
  $!VarSet |kk| = |LOOP|
  $!VarSet |kk| *= 2
  $!IF |kk|<10
  $!VarSet |fINDEX| = "000|kk|"
  $!ELSEIF |kk|<100
  $!VarSet |fINDEX| = "00|kk|"
  $!ELSEIF |kk|<1000
  $!VarSet |fINDEX| = "0|kk|"
  $!ELSEIF |kk| < 10000
  $!VarSet |fINDEX| = "|kk|"
  $!ENDIF

$!READDATASET  '"//groups/balarasgrp/fnasiri/for_profile_succession/Fr12/data.|fINDEX|.0000.plt" '
  READDATAOPTION = NEW
  RESETSTYLE = YES
  VARLOADMODE = BYNAME
  ASSIGNSTRANDIDS = YES

$! LOOP 1023
          $!VarSet |jj| = |loop|
          $!IF |jj|<10
          $!VarSet |ff| = "000|jj|"
          $!ELSEIF |jj|<100
          $!VarSet |ff| = "00|jj|"
          $!ELSEIF |jj|<1000
          $!VarSet |ff| = "0|jj|"
          $!ELSEIF |jj| < 10000
          $!VarSet |ff| = "|jj|"
          $!ENDIF
$!READDATASET  '"//groups/balarasgrp/fnasiri/for_profile_succession/Fr12/data.|fINDEX|.|ff|.plt" '
  READDATAOPTION = APPEND
  RESETSTYLE = YES
  VARLOADMODE = BYNAME
  ASSIGNSTRANDIDS = YES
$!ENDLOOP

$!READSTYLESHEET  "//lustre/groups/balarasgrp/fnasiri/post_process/temp/dfun_isosurface_small_movie3.sty"
  INCLUDEPLOTSTYLE = YES
  INCLUDETEXT = YES
  INCLUDEGEOM = YES
  INCLUDEAUXDATA = YES
  INCLUDESTREAMPOSITIONS = YES
  INCLUDECONTOURLEVELS = YES
  MERGE = NO
  INCLUDEFRAMESIZEANDPOSITION = NO

$!ATTACHTEXT
  ANCHORPOS
    {
    X = 6.87826277692476
    Y = 96.08510638297872
    }
  TEXTSHAPE
    {
    ISBOLD = NO
    }
  TEXT = 'File number: |fINDEX|'

$!EXPORTSETUP EXPORTFORMAT = JPEG
$!PRINTSETUP PALETTE = COLOR
$!EXPORTSETUP IMAGEWIDTH = 1295
$!EXPORTSETUP QUALITY = 100
$!EXPORTSETUP EXPORTFNAME = '//lustre/groups/balarasgrp/fnasiri/post_process/images/Fr12/image_|fINDEX|.jpeg'
$!EXPORT
  EXPORTREGION = CURRENTFRAME


 $!ENDLOOP

$!RemoveVar |MFBD|
