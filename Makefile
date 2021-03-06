PARALLEL = true

ifeq ($(PARALLEL), true)
	PARFLAGS =  -fopenmp -Dusing_parallel
else
	PARFLAGS =
endif

CC = g++
DEBUG = -g
CFLAGS = -Wall $(DEBUG) -O3 $(PARFLAGS)
LFLAGS = $(CFLAGS)
PROGS = CNmoonmars CNmoonmarsCountPoints CNmoonmarsReassemble
SRCS = $(wildcard *.cpp)
INCL_OBJS = $(filter-out $(PROGS:%=%.o),$(SRCS:.cpp=.o))

.PHONY: all clean depend

all: $(PROGS)

$(PROGS): %: %.o $(INCL_OBJS)
	$(CC) $(LFLAGS) -o $@ $^

.cpp.o:
	$(CC) $(CFLAGS) -c $*.cpp

clean:
	rm -rf *.o *~ $(PROGS) Makefile.bak

depend:
	makedepend -Y -- $(SRCS)
# DO NOT DELETE

AbcdSpaceLimits.o: AbcdSpaceLimits.h Common.h HotspotCoordsWithDate.h
AbcdSpaceLimits.o: HotspotCoords.h Month.h ObservedHotspots.h
AbcdSpaceLimits.o: AbcdSpaceLimitsInt.h
AbcdSpaceLimitsInt.o: AbcdSpaceLimitsInt.h
AbcdSpaceProbabilityDistribution.o: AbcdSpaceProbabilityDistribution.h
AbcdSpaceProbabilityDistribution.o: Common.h HotspotCoordsWithDate.h
AbcdSpaceProbabilityDistribution.o: HotspotCoords.h Month.h
AbcdSpaceProbabilityDistribution.o: ObservedHotspots.h AbcdSpaceLimits.h
AbcdSpaceProbabilityDistribution.o: AbcdSpaceLimitsInt.h
CNmoonmars.o: ObservedHotspots.h HotspotCoordsWithDate.h HotspotCoords.h
CNmoonmars.o: Month.h Common.h AbcdSpaceLimits.h AbcdSpaceLimitsInt.h
CNmoonmars.o: AbcdSpaceProbabilityDistribution.h RegenerateMatrix.h
CNmoonmars.o: HotspotCoordsWithProbability.h PossibleHotspotsDistribution.h
CNmoonmarsCountPoints.o: Common.h HotspotCoordsWithDate.h HotspotCoords.h
CNmoonmarsCountPoints.o: Month.h ObservedHotspots.h AbcdSpaceLimits.h
CNmoonmarsCountPoints.o: AbcdSpaceLimitsInt.h
CNmoonmarsCountPoints.o: AbcdSpaceProbabilityDistribution.h
CNmoonmarsReassemble.o: Common.h HotspotCoordsWithDate.h HotspotCoords.h
CNmoonmarsReassemble.o: Month.h HotspotCoordsWithProbability.h
CNmoonmarsReassemble.o: PossibleHotspotsDistribution.h AbcdSpaceLimits.h
CNmoonmarsReassemble.o: ObservedHotspots.h AbcdSpaceLimitsInt.h
CNmoonmarsReassemble.o: AbcdSpaceProbabilityDistribution.h RegenerateMatrix.h
Common.o: Common.h HotspotCoordsWithDate.h HotspotCoords.h Month.h
HotspotCoords.o: HotspotCoords.h
HotspotCoordsWithDate.o: HotspotCoordsWithDate.h HotspotCoords.h Month.h
HotspotCoordsWithProbability.o: HotspotCoordsWithProbability.h Common.h
HotspotCoordsWithProbability.o: HotspotCoordsWithDate.h HotspotCoords.h
HotspotCoordsWithProbability.o: Month.h
Month.o: Month.h
ObservedHotspots.o: ObservedHotspots.h HotspotCoordsWithDate.h
ObservedHotspots.o: HotspotCoords.h Month.h
PossibleHotspotsDistribution.o: PossibleHotspotsDistribution.h
PossibleHotspotsDistribution.o: AbcdSpaceLimits.h Common.h
PossibleHotspotsDistribution.o: HotspotCoordsWithDate.h HotspotCoords.h
PossibleHotspotsDistribution.o: Month.h ObservedHotspots.h
PossibleHotspotsDistribution.o: AbcdSpaceLimitsInt.h
PossibleHotspotsDistribution.o: AbcdSpaceProbabilityDistribution.h
PossibleHotspotsDistribution.o: HotspotCoordsWithProbability.h
PossibleHotspotsDistribution.o: RegenerateMatrix.h
RegenerateMatrix.o: RegenerateMatrix.h HotspotCoords.h
RegenerateMatrix.o: HotspotCoordsWithProbability.h Common.h
RegenerateMatrix.o: HotspotCoordsWithDate.h Month.h
