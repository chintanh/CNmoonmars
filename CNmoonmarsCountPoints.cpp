#include <cstdio>
#include <cstdlib>
#include "ObservedHotspots.h"
#include "AbcdSpaceLimits.h"
#include "AbcdSpaceProbabilityDistribution.h"

void PrintCoord(HotspotCoordsWithDate coord, void* data) {
	printf("%5d, %5d, %5d, %5d, %5d, %5d\n", 
		   coord.month.value, 
		   coord.year,
		   coord.moonLat,
		   coord.moonLong,
		   coord.marsLat,
		   coord.marsLong);
}

int main(int argc, char* argv[]) {
	int gridRes = 5;
	int increment = 1;
	
	if (argc != 3) {
		printf("Usage: ./CNmoonmarsCountPoints gridRes increment\n");
		return EXIT_FAILURE;
	}
	
	gridRes = atoi(argv[1]);
	increment = atoi(argv[2]);
	
	printf("===============================================================\n");
	
	const char* inputFile = "data/input-observedhotspots.txt";
	
	printf("Point count is based on observed hotspots in file:\n");
	printf("%s\n\n", inputFile);
	
	ObservedHotspots observedHotspots(inputFile);
	//observedHotspots.Iterate(PrintCoord, NULL);
	//printf("\n");
	
	AbcdSpaceLimits limits(observedHotspots);
	limits.PrintToFile(stdout);
	printf("\n");
	
	long int count = AbcdSpaceProbabilityDistribution::CalculateNumberOfAbcdPoints(limits, gridRes, increment);
	printf("Point count with gridRes = %d, increment = %d:  %ld\n", gridRes, increment, count);
	
	return EXIT_SUCCESS;
}