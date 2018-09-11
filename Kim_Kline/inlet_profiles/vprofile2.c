/***********************************************************************
   vprofile.c                                                          
   UDF for specifying steady-state velocity profile boundary condition 
************************************************************************/
#include "udf.h"

DEFINE_PROFILE(inlet_x_velocity, thread, position) 
{
  real x[ND_ND];		/* this will hold the position vector */
  real y;
  face_t f;

  begin_f_loop(f, thread)
    {
      F_CENTROID(x,f,thread);
      y = x[1];


	if ( (y-1) <= 2) {

      F_PROFILE(f, thread, position) = (22.59*y*y*y*y*y-20.79*y*y*y*y+7.515*y*y*y-1.432*y*y+0.1227*y)/(y*y*y*y*y-0.9333*y*y*y*y+0.3484*y*y*y-0.0685*y*y+0.005583*y);
} else {

F_PROFILE(f, thread, position) = 1.0;
}



    }
  end_f_loop(f, thread)
}
