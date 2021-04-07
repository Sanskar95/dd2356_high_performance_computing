
#ifndef _REENTRANT
#define _REENTRANT
#endif

/* includes */
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <math.h>
#include <time.h>
#include <sys/times.h>
#include <sys/stat.h>
#include <sys/time.h>
#include <string.h> /* For memset */ 



/* defines */
#define MAX_BODIES 1000000
#define MAX_STEPS 500000
#define MAX_SIZE 1000000
#define MIN_DISTANCE_CAL 0.0001
#define G 6.67E-8
#define DT 1
#define X_Coordinate 0
#define Y_Coordinate 1

#define DIM 2
typedef double vect_t[DIM];

double mysecond(){
  struct timeval tp;
  struct timezone tzp;
  int i;

  i = gettimeofday(&tp,&tzp);
  return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}


vect_t *forces;
vect_t *positions;
vect_t *velocities;
double *masses;

int num_bodies;
int num_steps;
double delta_t= .05;

void calculateForces();
void calculateForcesReduced();
void calculatePositionAndVelocities();
void initializeBodies();
void printVelocitiesAndPositions();

int main(int argc, char *argv[]) {
    int i, j;/* for iterating */
    double ts, t;


    num_bodies = 2000;
    num_steps = 100;

    /* initialize bodies */
   
    initializeBodies();
    // printVelocities();


    ts = mysecond();;/* start time */
    for (i = 0; i < num_steps; i++) {
        calculateForces();
        // calculateForcesReduced();
        calculatePositionAndVelocities();
        // printVelocitiesAndPositions();
    }
     t = mysecond() - ts;/* end time */
     printf("Time for runnning %d cycles, T = %f\n", num_steps, t);

   
    return 0;
}

/* calculate forces on all bodies */
void calculateForces() {
    
    int i, j;/* for iteration */
    for (i = 0; i < num_bodies ; i++) {
        // printf("    i is %d\n", i);
        for (j = 0; j < num_bodies ; j++) {
            if(i!=j ){
            // printf("  j is %d\n", j);
           
            double x_diff = positions[i][X_Coordinate] - positions[j][X_Coordinate]; 
            double y_diff = positions[i][Y_Coordinate] - positions[j][Y_Coordinate]; 
            double dist = sqrt(x_diff*x_diff + y_diff*y_diff); 
            double dist_cubed = dist*dist*dist; 
            forces[i][X_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * x_diff; 
            forces[i][Y_Coordinate] -= G*masses[i]*masses[j]/dist_cubed * y_diff; 

        }
        }
    }
     

}

void calculateForcesReduced() {
    int i, j;/* for iteration */
    
    for (i = 0; i < num_bodies ; i++) {
        for (j = i + 1; j < num_bodies; j++) {
            double x_diff = positions[i][X_Coordinate] - positions[j][X_Coordinate]; 
            double y_diff = positions[i][Y_Coordinate] - positions[j][Y_Coordinate]; 
            double dist = sqrt(x_diff*x_diff + y_diff*y_diff); 
            double dist_cubed = dist*dist*dist; 

            double force_ij_X_Coordinate = G*masses[i]*masses[j]/dist_cubed * x_diff; 
            double force_ij_Y_Coordinate = G*masses[i]*masses[j]/dist_cubed * y_diff;
            forces[i][X_Coordinate] += force_ij_X_Coordinate; 
            forces[i][Y_Coordinate] += force_ij_Y_Coordinate;
            forces[j][X_Coordinate] -= force_ij_X_Coordinate; 
            forces[j][Y_Coordinate] -= force_ij_Y_Coordinate;
            
            
        }
    }
   

}




void calculatePositionAndVelocities(){
   
int j;
for(j=0; j<num_bodies;j++){
        positions[j][X_Coordinate] += delta_t * velocities[j][X_Coordinate]; 
        positions[j][Y_Coordinate] += delta_t * velocities[j][Y_Coordinate]; 
        velocities[j][X_Coordinate] += delta_t/masses[j]*forces[j][X_Coordinate]; 
        velocities[j][Y_Coordinate] += delta_t/masses[j]*forces[j][Y_Coordinate];
}

}

/* initialize the bodies */
void initializeBodies() {
    int i;/* for iteration */
    positions = malloc(sizeof(vect_t) * num_bodies);
    velocities = malloc(sizeof(vect_t) * num_bodies);
    forces = malloc(sizeof(vect_t) * num_bodies);
    masses = malloc(sizeof(double) * num_bodies);



    /* gererate */
    for (i = 0; i < num_bodies; i++) {
        positions[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
        positions[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;

        forces[i][X_Coordinate] = 0;
        forces[i][Y_Coordinate] = 0;

        velocities[i][X_Coordinate]=(rand() / (double)(RAND_MAX)) * 2 - 1;
        velocities[i][Y_Coordinate] = (rand() / (double)(RAND_MAX)) * 2 - 1;
        masses[i] = fabs((rand() / (double)(RAND_MAX)) * 2 - 1);        
    }
}


void printVelocitiesAndPositions() {
        int i;
        for (i = 0; i < num_bodies; i++) {
        printf("Y Velocity of body %d is %g \n", i, velocities[i][Y_Coordinate]);
        printf("X Velocity of body %d is %g \n", i, velocities[i][X_Coordinate]);

    }
    for (i = 0; i < num_bodies; i++) {
        printf("Y Position of body %d is %g \n", i, positions[i][Y_Coordinate]);
        printf("X Position of body %d is %g \n", i, positions[i][X_Coordinate]);

    }
    
}
