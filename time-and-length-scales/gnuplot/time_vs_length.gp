#!/usr/bin/gnuplot
set term post eps enh "Helvetica" 32 linewidth 2.0
set out "time_vs_length.eps"
set border 3
set xtics nomirror
set ytics nomirror
set xr [1e-16:1e22]
set yr [1e-16:1e22]
set log x
set log y
unset key
set size 2.0
set xlabel "length (m)"
set ylabel "time (s)"
set format x "10^{%T}"
set format y "10^{%T}"
set xtics 1.e-15,1.e3,1.e21
set ytics 1.e-15,1.e3,1.e21

lx=1.e12
lxx=lx*2.5
a=35
set label 1 "cockroach" at lx,1.0/1.5*lxx font "Helvetica,16" rotate by a
set label 2 "Usain Bolt" at lx,1.0/12*lxx font "Helvetica,16" rotate by a
set label 3 "NASCAR" at lx,1.0/100.*lxx font "Helvetica,16" rotate by a
set label 4 "Ar15 bullet" at lx,1.0/1000.*lxx font "Helvetica,16" rotate by a
set label 5 "Atlas-V" at lx,1./18000*lxx font "Helvetica,16" rotate by a
set label 6 "Halley's comet" at lx,1./1e5*lxx font "Helvetica,16" rotate by a
set label 7 "fast neutrons" at lx,1./2e6*lxx font "Helvetica,16" rotate by a
set label 8 "LIGHT" at lx,1./3e9*lxx*2 font "Helvetica,24" rotate by a
set label 9 "plate tectonics" at lx/1000,1./8e-10*lxx/1000 font "Helvetica,16" rotate by a
set label 22 "amoeba" at lx,1./3e-6*lxx font "Helvetica,16" rotate by a
set label 23 "Some velocities:" at 1.e6,1.e17 font "Helvetica-Italics,28" rotate by a
xos=2.5
set label 10 "Millenium Falcon\nKessel run" at xos*4e17,1e5 font "Helvetica-Italics,16"
set label 11 "^{238}U Half-life" at xos*1e-13,1e17 font "Helvetica-Italics,16"
set label 12 "Bond vibration" at xos*1e-10,1e-14 font "Helvetica-Italics,28"
set label 13 "C-C trans-gauche isomerization" at xos*1.e-9,0.5e-11 font "Helvetica-Italics,28"
set label 14 "Small protein folding" at xos*5.e-9,3.e-6 font "Helvetica-Italics,28"
set label 15 "RuBisCo turnover" at xos*1.e-8,1.e1 font "Helvetica-Italics,28"
set label 16 "Myosin step" at xos*1.e-7, 1.e-1 font "Helvetica-Italics,28"
set label 17 "E. coli doubling time" at xos*1.e-6,1.e3 font "Helvetica-Italics,16"
set label 18 "Pitch drop" at xos*2e-2, 4e8 font "Helvetica-Italics,16"
set label 19 "Lecture duration/lecturer height" at xos*2,3000 font "Helvetica-Italics,16"
set label 20 "Redwood lifespan/height" at xos*1.e2,1.e9 font "Helvetica-Italics,16"
set label 21 "Distance\nsun travels\nin galactic\nyear" at xos*1e20,1e16 font "Helvetica-Italics,16"

p "time_vs_length.dat" w p pt 5 ps 2.0 linecolor rgbcolor "blue",\
   1.0/1.5*x not w l lt 0 lc rgbcolor "blue",\
   1.0/12*x  not w l lt 0 lc rgbcolor "blue",\
   1.0/100*x not w l lt 0 lc rgbcolor "purple",\
   1.0/1000*x not w l lt 0 lc rgbcolor "purple",\
   1.0/18000*x not w l lt 0 lc rgbcolor "violet",\
   1.0/1e5*x not w l lt 0 lc rgbcolor "violet",\
   1.0/2.e6*x not w l lt 0 lc rgbcolor "red",\
   1.0/3.e9*x not w l lt 1 lc rgbcolor "red",\
   1.0/8e-10*x not w l lt 0 lc rgbcolor "blue",\
   1.0/3e-6*x not w l lt 0 lc rgbcolor "blue"

# length(m) time(s)  process
#1.e-10 1.e-14 CovBondVib
#5.e-9  3.0e-6 foldingSmallProteins
#1.e-9  0.5e-11  CCCCgauche-transIsomerization 
#1.e-8  1.e1  rubiscoTurnover
#1.e-7  1.e-1  actinStep
#1.e-6  1.e3   ecolidouble
#1.e-13 1.e17  uranium238NucHalfLife
#2.0e-2 4e8    pitchDrop
#2.0    3000   myheightthistalk
#1.e2   1.e9   redwood
#3.7e17 1.e5   kesselRun
