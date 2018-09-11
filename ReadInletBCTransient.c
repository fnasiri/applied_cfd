#include "udf.h"
DEFINE_PROFILE(inlet_u, thread, position)
{
	face_t f;
	real t = CURRENT_TIME;
	int nstep = N_TIME;
	//int niter = N_ITER;  ONLY usable in Compiled UDF
	//float x[3];
	real x[ND_ND];
	float r_in[100]; 	// Data has 101 elements
	float u_in[100];	// Data has 101 elements
	float dum1;
	float dum2;
	int count, i , k, itr;
	float temp_r;
	FILE * profile;
	FILE * fnames;
	char Filename[71]; 	// Check the Filename length in "allfilenames.txt"
	
	/*if (nstep<=3) {			// If not working. It closes the opened file at each itteration.
		fnames = fopen("Z:\allfilenames.txt","r");
		printf("it is opened\n");
	}*/
	
	//   ---  ****   IMPORTANT:::::  In this script the address directory is defined by " / " like Linux  AND NOT "\" like in windows 
	fnames = fopen("C:/Users/LocalAdmin/Desktop/FluentCurvedpipe2/allfilenames.txt","r");
	//printf("Time(s)= %f and timeStep=%d\n", t,nstep);
	
	for(itr=0 ; itr <=nstep ; itr=itr+1) {			// this is for reading through files name at each time step to reach to the correct time file name. Since the filename bank is opened new at each iteration
		fscanf(fnames,"%s",Filename);
	}
	
	//------------------- TESTINGS -------------------------------
	//Filename="Z:\vprofile0002.txt";
	//printf("Z:\vprofile%04d.txt",2);		\\Only Prints
	//printf("Z:\\vprofile%04d.txt",2);		\\Only Prints
	//-------------------------------------------------------
	
	//printf("%s  Tstep%d  \n", Filename,nstep);
	profile = fopen(Filename, "r");
	
	
	//profile=fopen("Z:\vprofile0002.txt", "r");
	//if (profile == NULL){
	//	exit(EXIT_FAILURE);
	//}

	
	count=0;
	for(k=0 ; k <=100 ; k=k+1) {
			fscanf(profile,"%f %f",&r_in[count],&u_in[count]);
			//printf("%d %e  %e \n", count, r_in[count],u_in[count]);
		count++;
	}
	
	fclose(profile);
	fclose(fnames);
	
	begin_f_loop(f,thread)	{
		F_CENTROID (x,f, thread);

		temp_r=sqrt(pow(x[0]-0.04445,2)+pow(x[2],2));
		//printf("%e , %e, %e\n", x[0],x[1],x[2]);

		for (i = 0; i <= 100; ++i) {
			if ( ( temp_r >= r_in[i]) && ( temp_r < r_in[i+1])) {
			   //F_PROFILE(f, thread, position) = u_in[i];				// Zero weight function function
			   F_PROFILE(f, thread, position) = u_in[i] + (temp_r-r_in[i])*( (u_in[i+1]-u_in[i])/(r_in[i+1]-r_in[i]) );		// linear interpolation function
			}
		}

		/*
		 if (  temp_r < 10 ) {
		F_PROFILE(f, thread, position) = 0.5-(0.00635-temp_r)*(0.00635-temp_r); //u_in[i];
		
			}
		*/

	}
	end_f_loop(f, thread)
}

